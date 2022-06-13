#include      ../macros.inc

; ******************************************************
; ***** Power x^y                                  *****
; ***** RF - Pointer to floating point number x    *****
; ***** RC - Pointer to floating point number y    *****
; ***** RD - Pointer to floating point destination *****
; ***** internal:                                  *****
; *****       R2+1     - x                         *****
; *****       R2+5     - y                         *****
; ******************************************************
              proc     fppow

              extrn    fpexp
              extrn    fpln
              extrn    mulfp

              inc      r7           ; x = log(x)
              inc      r7
              inc      r7
              inc      r7
              call     fpln
              dec      r7           ; now x = x * y
              dec      r7
              dec      r7
              dec      r7
              call     mulfp
              call     fpexp        ; x = exp(x)
              rtn                   ; and return to caller

              endp

