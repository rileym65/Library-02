#include      ../macros.inc

; ********************************************
; ***** Push .true. to expression stack  *****
; ***** R7 - Pointer to expression stack *****
; ********************************************
              proc    true16

              ldi     0ffh             ; true is -1
              sex     r7               ; point X to expression stack
              stxd                     ; push -1 to expression stack
              stxd
              sex     r2               ; point X back to stack
              rtn                      ; return to caller

              endp

