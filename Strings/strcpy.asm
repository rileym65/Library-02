#include       ../macros.inc

; **********************************************
; ***** Copy string                        *****
; ***** RF - pointer to source string      *****
; ***** RD - pointer to destination string *****
; **********************************************
               proc    strcpy

loop:          lda     rf               ; read byte from source string
               str     rd               ; store into destination
               inc     rd               ; move to next position
               lbnz    loop             ; loop until terminator copied
               rtn                      ; then return to caller

               endp
