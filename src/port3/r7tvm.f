      SUBROUTINE  R7TVM(N, P, Y, D, U, X)
C
C  ***  SET Y TO R*X, WHERE R IS THE UPPER TRIANGULAR MATRIX WHOSE
C  ***  DIAGONAL IS IN D AND WHOSE STRICT UPPER TRIANGLE IS IN U.
C
C  ***  X AND Y MAY SHARE STORAGE.
C
      INTEGER N, P
      REAL Y(P), D(P), U(N,P), X(P)
C
      REAL  D7TPR
      EXTERNAL  D7TPR
C
C  ***  LOCAL VARIABLES  ***
C
      INTEGER I, II, PL, PP1
      REAL T
C
C  ***  BODY  ***
C
      PL = MIN0(N, P)
      PP1 = PL + 1
      DO 10 II = 1, PL
         I = PP1 - II
         T = X(I) * D(I)
         IF (I .GT. 1) T = T +  D7TPR(I-1, U(1,I), X)
         Y(I) = T
 10      CONTINUE
 999  RETURN
C  ***  LAST LINE OF  R7TVM FOLLOWS  ***
      END
