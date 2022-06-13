#include      ../macros.inc

; ************************************************
; ***** Divide top two numbers on expr stack *****
; ***** R7 - pointer to expr stack           *****
; ************************************************
              proc     div32

              extrn    div32i

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
              call     div32i            ; Perform division
              inc      r7                ; Remove 2nd number from stack
              inc      r7
              inc      r7
              inc      r7
              rtn                        ; Return to caller

              endp

; ************************************************
; ***** 32-bit division. M[RF]=M[RF]/M[RD]   *****
; ***** Numbers in memory stored LSB first   *****
; ***** In routine:                          *****
; *****    RF=a                              *****
; *****    RD=b                              *****
; *****    RC=result                         *****
; *****    RB=shift                          *****
; ************************************************
              proc     div32i

              extrn    comp32
              extrn    icomp32
              extrn    neg32
              extrn    shl32
              extrn    shr32
              extrn    sub32i
              extrn    zero32

              ldi      0                 ; set sign flag as positive
              str      r2                ; place on the stack
              inc      rf                ; point to msb of first number
              inc      rf
              inc      rf
              ldn      rf                ; retrieve it
              dec      rf                ; restore position
              dec      rf
              dec      rf
              ani      080h              ; is number negative
              lbz      div32_1           ; jump if not
              ldi      1                 ; set sign flag
              xor
              stxd                       ; save flag
              glo      rf                ; 2s compliment number
              plo      ra
              ghi      rf
              phi      ra
              call     neg32
              irx                        ; point back to sign flag
div32_1:      inc      rd                ; point to msb of second number
              inc      rd
              inc      rd
              ldn      rd                ; retrieve it
              dec      rd                ; restore position
              dec      rd
              dec      rd
              ani      080h              ; is number negative
              lbz      div32_2           ; jump if not
              ldi      1                 ; adjust sign flag
              xor
              stxd                       ; save sign flag
              glo      rd                ; 2s compliment second number
              plo      ra
              ghi      rd
              phi      ra
              call     neg32
              irx
div32_2:      dec      r2                ; preserve sign flag
              ldi      0                 ; zero answer on stack
              stxd
              stxd
              stxd
              stxd
              glo      r2                ; set RC here
              plo      rc
              ghi      r2
              phi      rc
              inc      rc                ; point rc to lsb of answer
              ldi      1                 ; set shift to 1
              plo      rb
scdiv1:       call     icomp32           ; compare a to b
              lbnf     scdiv4            ; jump if b>=a
              glo      rd                ; need to shift b
              plo      ra
              ghi      rd
              phi      ra
              call     shl32
              inc      rb                ; increment shift
              lbr      scdiv1            ; loop until b>=a
scdiv4:       glo      rf                ; point to a
              plo      ra
              ghi      rf
              phi      ra
              call     zero32            ; is a zero
              lbdf     scdivd1           ; jump if it was zero
              glo      rd                ; point to b
              plo      ra
              ghi      rd
              phi      ra
              call     zero32            ; is b zero
              lbdf     scdivd1           ; jump if so
              glo      rc                ; point to result
              plo      ra
              ghi      rc
              phi      ra
              call     shl32             ; need to shift result left
              call     comp32            ; compare a to b
              lbdf     scdiv6            ; jump if a < b
              ldn      rc                ; get LSB of result
              ori      1                 ; set low bit
              str      rc                ; and but it back
              call     sub32i            ; subtrcct a from b
scdiv6:       ldn      rd                ; get lsb of b
              shr                        ; see if low bit is set
              lbnf     scdiv5            ; jump if not
              dec      rb                ; mark final shift
              lbr      scdivd1           ; and then done
scdiv5:       glo      rd                ; point to b
              plo      ra
              ghi      rd
              phi      ra
              call     shr32             ; need to shift b right
              dec      rb                ; decrement shift
              glo      rb                ; see if run out of shifts
              lbz      scdivd1           ; done if so
              lbr      scdiv4            ; loop back until done
scdivd1:      glo      rb                ; get shift
              shl                        ; shift sign into df
              lbdf     scdivd2           ; jump if so
scdivd3:      glo      rb                ; get shift
              lbz      scdivdn           ; jump if zero
              glo      rc                ; point to result
              plo      ra
              ghi      rc
              phi      ra
              call     shl32             ; shift it left
              dec      rb                ; decrement shift
              lbr      scdivd3           ; loop back
scdivd2:      glo      rb                ; get shift
              lbz      scdivdn           ; jump if zero
              glo      rc                ; point to result
              plo      ra
              ghi      rc
              phi      ra
              call     shr32             ; shift it right
              inc      rb                ; increment shift
              lbr      scdivd2
scdivdn:      lda      rf                ; recover remainder
              plo      rb
              lda      rf
              phi      rb
              lda      rf                ; recover remainder
              plo      ra
              ldn      rf
              phi      ra
              dec      rf
              dec      rf
              dec      rf
              ldi      4                 ; 4 bytes to trcnsfer
              plo      r9
scdivd5:      lda      rc                ; get result byte
              str      rf                ; store into answer
              inc      rf
              dec      r9                ; decrement count
              glo      r9                ; see if done
              lbnz     scdivd5           ; jump if not
              dec      rf                ; recover answer
              dec      rf
              dec      rf
              dec      rf
              glo      rc                ; need to clean up the stack
              plo      r2
              ghi      rc
              phi      r2
              ldn      r2                ; retrieve sign
              shr                        ; shift into df
              lbnf     scdivrt           ; jump if signs were the same
              glo      rf                ; otherwise negate number
              plo      ra
              ghi      rf
              phi      ra
              call     neg32
scdivrt:      rtn                        ; return to caller

              endp

