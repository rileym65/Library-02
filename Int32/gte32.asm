#include      ../macros.inc

; ***********************************************
; ***** Compare top 2 numbers of expr stack *****
; ***** R7 - pointer to expr stack          *****
; ***********************************************
              proc     gte32

              extrn    cmp32
              extrn    false32
              extrn    true32

              call     cmp32             ; compare numbers
              lbz      true32            ; true if numbers were equal
              lbnf     true32            ; true if A>B
              lbr      false32           ; otherwise false

              endp

