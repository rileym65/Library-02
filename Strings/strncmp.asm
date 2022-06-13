#include       ../macros.inc

; ***********************************************
; ***** Compare two strings for equality    *****
; ***** RF - pointer to string 1            *****
; ***** RD - pointer to string 2            *****
; ***** RC - Characters to compare          *****
; ***** Returns: DF=1 - Strings are equal   *****
; *****          DF=0 - Strings are unequal *****
; *****          RF   - After match         *****
; *****          RD   - After match         *****
; ***********************************************
               proc     strncmp

loop:          lda      rf             ; get byte from first string
               str      r2             ; store for compare
               lda      rd             ; get byte from second string
               sm                      ; compare
               lbnz     bad            ; jump if no match
               dec      rc             ; decrement characters to compare
               glo      rc             ; see if done
               lbnz     loop           ; loop if not done
               ghi      rc             ; check high byte
               lbnz     loop   
               smi      0              ; set DF
               rtn                     ; and return
bad:           adi      0              ; clear DF
               rtn                     ; and return
               endp

