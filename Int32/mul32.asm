#include      ../macros.inc

; **************************************************
; ***** Multiply top two numbers of expr stack *****
; ***** R7 - pointer to expr stack             *****
; **************************************************
              proc     mul32

              extrn    mul32i

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
              call     mul32i            ; Perform multiply
              inc      r7                ; Remove 2nd number from stack
              inc      r7
              inc      r7
              inc      r7
              rtn                        ; Return to caller

              endp


; ************************************************
; ***** 32-bit multiply. M[RF]=M[RF]*M[RD]   *****
; ***** Numbers in memory stored LSB first   *****
; ***** In routine:                          *****
; *****    R9 - points to first number       *****
; *****    RD - points to second number      *****
; *****    RF - points to answer             *****
; ************************************************
              proc     mul32i

              extrn    add32i
              extrn    shl32
              extrn    shr32
              extrn    zero32

              ldi      0                 ; need to zero answer
              stxd
              stxd
              stxd
              stxd
              glo      rf                ; r9 will point to first number
              plo      r9
              ghi      rf
              phi      r9
              glo      r2                ; rf will point to where the answer is
              plo      rf
              ghi      r2
              phi      rf
              inc      rf                ; point to LSB of answer
scmul2:       glo      rd                ; need second number
              plo      ra
              ghi      rd
              phi      ra
              call     zero32            ; check for zero
              lbnf     scmul4            ; jump if number was not zero
              inc      r2                ; now pointing at lsb of answer
              lda      r2                ; get number from stack
              str      r9                ; store into destination
              inc      r9                ; point to 2nd byte
              lda      r2                ; get number from stack
              str      r9                ; store into destination
              inc      r9                ; point to 3rd byte
              lda      r2                ; get number from stack
              str      r9                ; store into destination
              inc      r9                ; point to msb
              ldn      r2                ; get number from stack
              str      r9                ; store into destination
              rtn                        ; return to caller
scmul4:       ldn      rd                ; get lsb of second number
              shr                        ; shift low bit into df
              lbnf     scmulno           ; no add needed
              ghi      rd                ; save position of second number
              stxd
              glo      rd
              stxd
              glo      r9                ; rd needs to be first number
              plo      rd
              ghi      r9
              phi      rd
              call     add32i            ; call add routine
              irx                        ; recover rd
              ldxa
              plo      rd
              ldx
              phi      rd
scmulno:      glo      r9                ; point to first number
              plo      ra
              ghi      r9
              phi      ra
              call     shl32             ; shift left
              glo      rd                ; now need pointer to second number
              plo      ra
              ghi      rd
              phi      ra
              call     shr32             ; shift right
              lbr      scmul2            ; loop until done

              endp

