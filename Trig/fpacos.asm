#include      ../macros.inc

; ******************************************************
; ***** Compute arcsin                             *****
; ******************************************************
              proc    fpacos

              extrn   addfp
              extrn   divfp
              extrn   fpatan
              extrn   fpsqrt
              extrn   mulfp
              extrn   subfp

              inc     r7           ; retrieve x
              lda     r7
              plo     r8
              lda     r7
              phi     r8
              lda     r7
              plo     r9
              ldn     r7
              phi     r9
              sex     r7           ; now place 1.0
              ldi     03fh
              stxd
              ldi     080h
              stxd
              ldi     000h
              stxd
              stxd
              ghi     r9           ; Put x back on the stack twice
              stxd
              glo     r9
              stxd
              ghi     r8
              stxd
              glo     r8
              stxd
              ghi     r9
              stxd
              glo     r9
              stxd
              ghi     r8
              stxd
              glo     r8
              stxd
              ldi     03fh         ; now place 1.0
              stxd
              ldi     080h
              stxd
              ldi     000h
              stxd
              stxd
              ghi     r9           ; and 1 more x
              stxd
              glo     r9
              stxd
              ghi     r8
              stxd
              glo     r8
              stxd
              sex     r2
              call    addfp        ; add 1 to x
              inc     r7           ; transfer 1+x to stack for safe keeping
              lda     r7
              stxd
              lda     r7
              stxd
              lda     r7
              stxd
              ldn     r7
              stxd
              call    mulfp        ; multiply the two xs
              call    subfp        ; subtract from 1.0
              call    fpsqrt       ; take the square root
              irx                  ; transfer 1+x back to expr stack
              ldxa
              str     r7
              dec     r7
              ldxa
              str     r7
              dec     r7
              ldxa
              str     r7
              dec     r7
              ldx
              str     r7
              dec     r7
              call    divfp        ; now divide
              call    fpatan       ; and then atan
              sex     r7           ; multiply result by 2.0
              ldi     040h
              stxd
              ldi     000h
              stxd
              stxd
              stxd
              sex     r2
              call    mulfp
              rtn

              endp

