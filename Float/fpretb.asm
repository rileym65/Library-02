#include      ../macros.inc

; **********************************************
; ***** Strore FP register B on expr stack *****
; ***** R7 - points to expr stack          *****
; **********************************************
              proc    fpret_b

              irx                  ; recover destination address
              ldxa
              plo     rf
              ldx
              phi     rf
              glo     rb           ; store a as answer
              str     rf
              inc     rf
              ghi     rb
              str     rf
              inc     rf
              glo     ra
              str     rf
              inc     rf
              ghi     ra
              str     rf
              irx
              ldxa
              plo     r7
              ldx
              phi     r7
              rtn                  ; and return to caller

              endp
