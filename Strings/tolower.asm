#include       ../macros.inc

; ************************************************
; ***** Convert string to lower case         *****
; ***** RF - pointer to string               *****
; ************************************************
               proc    tolower

               extrn   chartolower

loop:          ldn     rf               ; get byte from string
               lbz     done             ; jump if terminator
               call    chartolower      ; make sure it is lowercase
               str     rf               ; write it back
               inc     rf               ; point to next character
               lbr     loop             ; loop until terminator found
done:          rtn                      ; return to caller

               endp
