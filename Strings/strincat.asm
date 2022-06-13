#include       ../macros.inc

; *****************************************************
; ***** Copy inline string to end of destination  *****
; ***** RD - pointer to destination string        *****
; *****************************************************
               proc    strincat

               extrn   strincpy

loop:          lda     rd               ; read byte from destination string
               lbnz    loop             ; loop until terminator found
               dec     rd               ; backup to terminator
               lbr     strincpy         ; now copy string

               endp
