#include      ../macros.inc

; *****************************************
; ***** Get sign of top of expr stack *****
; ***** R7 - points to expr stack     *****
; *****************************************
              proc    sgnfp

              inc     r7
              lda     r7
              str     r2
              lda     r7
              or
              str     r2
              lda     r7
              or
              str     r2
              ldn     r7
              shl
              lbdf    sgnmfp
              ldn     r7
              or
              lbz     sgn0fp
              ldi     0
              str     r7
              dec     r7
              str     r7
              dec     r7
              str     r7
              dec     r7
              ldi     1
              str     r7
              dec     r7
              rtn
sgnmfp:       ldi     0ffh
              str     r7
              dec     r7
              str     r7
              dec     r7
              str     r7
              dec     r7
              str     r7
              dec     r7
              rtn
sgn0fp:       dec     r7
              dec     r7
              dec     r7
              dec     r7
              rtn

              endp

