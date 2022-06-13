#include      ../macros.inc
; ***********************************************************
; ***** Compute modulo of top two numbers on expr stack *****
; ***** R7 - pointer to expr stack                      *****
; ***********************************************************
              proc    mod32

              extrn   div32

              call    div32
              inc     r7
              inc     r7
              inc     r7
              inc     r7
              ghi     ra
              str     r7
              dec     r7
              glo     ra
              str     r7
              dec     r7
              ghi     rb
              str     r7
              dec     r7
              glo     rb
              str     r7
              dec     r7
              rtn

              endp

