#include      ../macros.inc

; *************************************
; ***** Push 0 to expr stack      *****
; ***** R7 - points to expr stack *****
; *************************************
              proc    fpret_0

              irx                  ; recover destination address
              ldxa
              plo     rf
              ldx
              phi     rf
              ldi     0            ; write 0
              str     rf
              inc     rf
              str     rf
              inc     rf
              str     rf
              inc     rf
              str     rf
              irx
              ldxa
              plo     r7
              ldx
              phi     r7
              rtn                  ; and return

              endp

