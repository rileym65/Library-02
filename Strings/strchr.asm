#include       ../macros.inc

; ************************************************
; ***** Find character in string             *****
; ***** RF - pointer to string               *****
; *****  D - character to find               *****
; ***** Returns: DF=1 - character was found  *****
; *****          DF=0 - character not found  *****
; *****          RF   - pointer to character *****
; ************************************************
               proc    strchr

               str     r2               ; store character for comparisons
loop:          lda     rf               ; get byte from string
               lbz     notfound         ; jump if end of string
               sm                       ; compare to requested character
               lbnz    loop             ; loop until found or terminator
               dec     rf               ; move RF back to found character
               smi     0                ; set DF
               rtn                      ; and return to caller
notfound:      adi     0                ; clear DF
               rtn                      ; and return to caller

               endp
