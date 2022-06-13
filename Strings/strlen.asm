#include       ../macros.inc

; ************************************************
; ***** Find length of string                *****
; ***** RF - pointer to string               *****
; ***** Returns: RC - length of string       *****
; ************************************************
               proc    strlen

               ldi     0                ; clear count 
               phi     rc
               plo     rc
loop:          lda     rf               ; get byte from string
               lbz     done             ; jump if terminator found
               inc     rc               ; increment count
               lbr     loop             ; and keep looking for terminator
done:          rtn                      ; return to caller

               endp
