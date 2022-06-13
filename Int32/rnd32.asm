#include      ../macros.inc

; ************************************************************************
; ***** Generate 32-bit random number, range is on top of expr stack *****
; ************************************************************************
              proc    rnd32

              extrn   LFSR_
              extrn   lfsr_shift
              extrn   mod32

              ldi     32            ; 32 shifts of the LFSR
              plo     rc
              call    lfsr_shift    ; Shift the register
              ldi     LFSR_.1       ; point to LFSR data
              phi     r9
              ldi     LFSR_.0
              plo     r9

              inc     r7            ; Retrieve range
              lda     r7
              plo     rb
              lda     r7
              phi     rb
              lda     r7
              plo     ra
              ldn     r7
              phi     ra

              lda     r9            ; Transfer random number
              ani     07fh          ; no negative numbers
              str     r7
              dec     r7
              lda     r9
              str     r7
              dec     r7
              lda     r9
              str     r7
              dec     r7
              lda     r9
              str     r7
              dec     r7

              ghi     ra            ; Put range on expr stack
              str     r7
              dec     r7
              glo     ra
              str     r7
              dec     r7
              ghi     rb
              str     r7
              dec     r7
              glo     rb
              str     r7
              dec     r7
              lbr     mod32          ; and perform modulo

              endp

