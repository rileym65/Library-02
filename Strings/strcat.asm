#include       ../macros.inc

; **********************************************
; ***** Copy string to end of destination  *****
; ***** RF - pointer to source string      *****
; ***** RD - pointer to destination string *****
; **********************************************
               proc    strcat

               extrn   strcpy

loop:          lda     rd               ; read byte from destination string
               lbnz    loop             ; loop until terminator found
               dec     rd               ; backup to terminator
               lbr     strcpy           ; now copy string

               endp
