#include      ../macros.inc

; *****************************************************
; ***** 32-bit Add, top two numbers on expr stack *****
; ***** R7 - pointer to expr stack                *****
; *****************************************************
              proc     add32

              extrn    add32i

              glo      r7                ; setup pointers
              plo      rd
              plo      rf
              ghi      r7                ; setup pointers
              phi      rd
              phi      rf
              inc      rd
              inc      rf
              inc      rf
              inc      rf
              inc      rf
              inc      rf
              call     add32i            ; Perform addition
              inc      r7                ; Remove 2nd number from stack
              inc      r7
              inc      r7
              inc      r7
              rtn                        ; Return to caller

              endp

; ************************************************
; ***** 32-bit Add.    M[RF]=M[RF]+M[RD]     *****
; ***** Numbers in memory stored LSB first   *****
; ************************************************
              proc     add32i

              sex      rd                ; point x to second number
              ldn      rf                ; get lsb
              add                        ; add second lsb of second number
              str      rf                ; store it
              inc      rf                ; point to 2nd byte
              inc      rd
              ldn      rf                ; get second byte
              adc                        ; add second byte of second number
              str      rf                ; store it
              inc      rf                ; point to 3rd byte
              inc      rd
              ldn      rf                ; get third byte
              adc                        ; add third byte of second number
              str      rf                ; store it
              inc      rf                ; point to msb
              inc      rd
              ldn      rf                ; get msb byte
              adc                        ; add msb byte of second number
              str      rf                ; store it
              sex      r2                ; restore stack
              dec      rf                ; restore registers to original values
              dec      rf
              dec      rf
              dec      rd
              dec      rd
              dec      rd
              rtn                        ; return to caller

              endp

