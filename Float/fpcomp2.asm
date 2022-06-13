#include      ../macros.inc

; ******************************************
; ***** 2's compliment number in R7:R8 *****
; ******************************************
              proc    fpcomp2

              glo     r8         ; perform 2s compliment on input
              xri     0ffh
              adi     1
              plo     r8
              ghi     r8
              xri     0ffh
              adci    0
              phi     r8
              glo     r7
              xri     0ffh
              adci    0
              plo     r7
              ghi     r7
              xri     0ffh
              adci    0
              phi     r7
              rtn

              endp

