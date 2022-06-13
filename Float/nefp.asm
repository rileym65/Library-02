#include      ../macros.inc

; *************************************************
; ***** Compare top two numbers on expr stack *****
; ***** R7 - points to expr stack             *****
; *************************************************
              proc    nefp

              extrn   subfp
              extrn   true32
              extrn   false32

              call    subfp
              sex     r7
              irx
              ldxa
              or
              ldxa
              or
              ldxa
              or
              ldx
              or
              sex     r2
              lbnz    true32
              lbr     false32

              endp

