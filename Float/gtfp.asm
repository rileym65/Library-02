#include      ../macros.inc

; ***********************************************
; ***** Compare top 2 numbers on expr stack *****
; ***** R7 - points to expr stack           *****
; ***********************************************
              proc    gtfp

              extrn   subfp
              extrn   false32
              extrn   true32

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
              lbz     false32
              ldn     r7
              shl
              lbnf    true32
              lbr     false32

              endp

