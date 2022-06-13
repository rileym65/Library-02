#include       ../macros.inc

; ***********************************
; ***** Convert D to upper case *****
; ***********************************
               proc     chartolower

               plo      re             ; keep a copy
               smi      'A'            ; check if below uc
               lbnf     keep           ; if so, keep original value
               smi      26             ; check if in range of uc
               lbdf     keep           ; if not, keep original value
               adi      'a'+26         ; convert to lowercase
               rtn                     ; and return to caller
keep:          glo      re             ; recover character
               rtn                     ; and return

               endp

