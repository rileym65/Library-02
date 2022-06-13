#include       ../macros.inc

; ************************************************
; ***** Convert string to upper case         *****
; ***** RF - pointer to string               *****
; ************************************************
               proc    toupper

               extrn   chartoupper

loop:          ldn     rf               ; get byte from string
               lbz     done             ; jump if terminator
               call    chartoupper      ; make sure it is uppercase
               str     rf               ; write it back
               inc     rf               ; point to next character
               lbr     loop             ; loop until terminator found
done:          rtn                      ; return to caller

               endp
