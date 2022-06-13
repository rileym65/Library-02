#include       ../macros.inc

; **********************************************
; ***** Copy inline string                 *****
; ***** RD - pointer to destination string *****
; **********************************************
               proc    strincpy

loop:          lda     r6               ; read byte from source string
               str     rd               ; store into destination
               inc     rd               ; move to next position
               lbnz    loop             ; loop until terminator copied
               rtn                      ; then return to caller

               endp
