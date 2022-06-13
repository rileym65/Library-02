#include       ../macros.inc
; ***********************************
; ***** Convert D to upper case *****
; ***********************************
               proc     chartoupper

               plo      re             ; keep a copy
               smi      'a'            ; check if below lc
               lbnf     keep           ; if so, keep original value
               smi      26             ; check if in range of lc
               lbdf     keep           ; if not, keep original value
               adi      'A'+26         ; convert to uppercase
               rtn                     ; and return to caller
keep:          glo      re             ; recover character
               rtn                     ; and return

               endp

