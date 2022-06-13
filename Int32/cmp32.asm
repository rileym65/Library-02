#include      ../macros.inc

; ***********************************************
; ***** Compare top 2 numbers on expr stack *****
; ***** R7 - pointer to expr stack          *****
; ***********************************************
              proc     cmp32

              extrn    comp32

              glo      r7                ; copy expr stack to rd
              plo      rd
              plo      rf
              ghi      r7
              phi      rd
              phi      rf
              inc      rd                ; point to lsb of second number
              inc      rf                ; point to lsb of first number
              inc      rf                ; point to lsb of first number
              inc      rf                ; point to lsb of first number
              inc      rf                ; point to lsb of first number
              inc      rf                ; point to lsb of first number
              call     comp32            ; compare numbers
              inc      r7                ; Remove numbers from stack
              inc      r7
              inc      r7
              inc      r7
              inc      r7
              inc      r7
              inc      r7
              inc      r7
              rtn                        ; Return to caller

              endp

