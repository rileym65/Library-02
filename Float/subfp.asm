#include      ../macros.inc

; **************************************************
; ***** Subtract top two numbers on expr stack *****
; ***** R7 - points to expr stack              *****
; **************************************************
              proc    subfp

              extrn   subfpi

              glo     r7           ; Setup registers for call
              plo     rf
              plo     rd
              ghi     r7
              phi     rf
              phi     rd
              inc     rd
              inc     rf
              inc     rf
              inc     rf
              inc     rf
              inc     rf
              call    subfpi       ; Call addition
              inc     r7           ; Adjust expr stack
              inc     r7
              inc     r7
              inc     r7
              rtn                  ; And return

              endp

; ********************************************
; ***** Floating point subtraction       *****
; ***** RF - pointer to first fp number  *****
; ***** RD - pointer to second fp number *****
; ***** Uses: R7:R8 - first number (aa)  *****
; *****       RA:RB - second number (bb) *****
; *****       R9.0  - exponent           *****
; *****       R9.1  - sign               *****
; ********************************************
              proc    subfpi

              extrn   fpargs
              extrn   fpsub_1

              ghi     r7           ; save expr stack
              stxd
              glo     r7
              stxd
              ghi     rf           ; save destination address
              stxd
              glo     rf
              stxd
              call    fpargs       ; retrieve arguments
              ghi     ra           ; invert number
              xri     080h
              phi     ra           ; save inverted sign
              ghi     r9
              lbr     fpsub_1      ; now process with add

              endp

