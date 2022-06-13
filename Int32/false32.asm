#include      ../macros.inc

; **************************************
; ***** Push .false. to expr stack *****
; ***** R7 - pointer to expr stack *****
; **************************************
              proc    false32

              ldi     000h
              sex     r7
              stxd
              stxd
              stxd
              stxd
              sex     r2
              rtn

              endp

