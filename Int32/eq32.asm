#include      ../macros.inc

; ***********************************************
; ***** Compare top 2 numbers of expr stack *****
; ***** R7 - pointer to expr stack          *****
; ***********************************************
              proc     eq32

              extrn    cmp32
              extrn    false32
              extrn    true32

              call     cmp32             ; compare numbers
              lbnz     false32           ; fails if numbers were unequal
              lbr      true32            ; true if A=B

              endp

