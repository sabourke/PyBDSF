      SUBROUTINE  C7VFN(IV, L, LH, LIV, LV, N, P, V)
C
C  ***  FINISH COVARIANCE COMPUTATION FOR   RN2G,   RNSG  ***
C
      INTEGER LH, LIV, LV, N, P
      INTEGER IV(LIV)
      REAL L(LH), V(LV)
C
      EXTERNAL  L7NVR,  L7TSQ,  V7SCL
C
C  ***  LOCAL VARIABLES  ***
C
      INTEGER COV, I
      REAL HALF
C
C  ***  SUBSCRIPTS FOR IV AND V  ***
C
      INTEGER CNVCOD, COVMAT, F, FDH, H, MODE, RDREQ, REGD
C
C/6
C     DATA CNVCOD/55/, COVMAT/26/, F/10/, FDH/74/, H/56/, MODE/35/,
C    1     RDREQ/57/, REGD/67/
C/7
      PARAMETER (CNVCOD=55, COVMAT=26, F=10, FDH=74, H=56, MODE=35,
     1           RDREQ=57, REGD=67)
C/
      DATA HALF/0.5E+0/
C
C  ***  BODY  ***
C
      IV(1) = IV(CNVCOD)
      I = IV(MODE) - P
      IV(MODE) = 0
      IV(CNVCOD) = 0
      IF (IV(FDH) .LE. 0) GO TO 999
      IF ((I-2)**2 .EQ. 1) IV(REGD) = 1
      IF (MOD(IV(RDREQ),2) .NE. 1) GO TO 999
C
C     ***  FINISH COMPUTING COVARIANCE MATRIX = INVERSE OF F.D. HESSIAN.
C
      COV = IABS(IV(H))
      IV(FDH) = 0
C
      IF (IV(COVMAT) .NE. 0) GO TO 999
      IF (I .GE. 2) GO TO 10
         CALL  L7NVR(P, V(COV), L)
         CALL  L7TSQ(P, V(COV), V(COV))
C
 10   CALL  V7SCL(LH, V(COV), V(F)/(HALF * FLOAT(MAX0(1,N-P))), V(COV))
      IV(COVMAT) = COV
C
 999  RETURN
C  ***  LAST LINE OF  C7VFN FOLLOWS  ***
      END
