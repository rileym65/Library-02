#include      ../macros.inc

; *****************************************
; ***** Middle portion of string      *****
; ***** RF - pointer to source string *****
; ***** RD - pointer to destination   *****
; ***** RB - Starting point           *****
; ***** RC - Count of characters      *****
; *****************************************
              proc    mid

              extrn   left

loop:         glo     rb           ; see if starting position found
              str     r2
              ghi     rc
              or
              lbz     left         ; use left to copy characters
              dec     rb           ; decrement count
              lda     rf           ; get byte from source string
              lbnz    loop         ; loop until count=0 or terminator found
              ldi     0            ; write terminator to destination
              str     rd
              rtn                  ; and return

              endp

