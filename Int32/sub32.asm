#include      ../macros.inc

; ************************************************
; ***** Subtract top 2 numbers on expr stack *****
; ***** R7 - pointer to expr stack           *****
; ************************************************
              proc     sub32

              extrn    sub32i

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
              call     sub32i            ; Perform subtraction
              inc      r7                ; Remove 2nd number from stack
              inc      r7
              inc      r7
              inc      r7
              rtn                        ; Return to caller

              endp

; ************************************************
; ***** 32-bit subtract.  M[RF]=M[RF]-M[RD]  *****
; ***** Numbers in memory stored LSB first   *****
; ************************************************
              proc     sub32i

              sex      rd                ; point x to second number
              ldn      rf                ; get lsb
              sm                         ; subtract second lsb of second number
              str      rf                ; store it
              inc      rf                ; point to 2nd byte
              inc      rd
              ldn      rf                ; get second byte
              smb                        ; subtract second byte of second number
              str      rf                ; store it
              inc      rf                ; point to 3rd byte
              inc      rd
              ldn      rf                ; get third byte
              smb                        ; subtract third byte of second number
              str      rf                ; store it
              inc      rf                ; point to msb
              inc      rd
              ldn      rf                ; get msb byte
              smb                        ; subtract msb byte of second number
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

