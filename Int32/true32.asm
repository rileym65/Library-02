#include      ../macros.inc

; **************************************
; ***** Push .true. to expr stack  *****
; ***** R7 - pointer to expr stack *****
; **************************************
              proc    true32

              ldi     0ffh
              sex     r7
              stxd
              stxd
              stxd
              stxd
              sex     r2
              rtn

              endp

