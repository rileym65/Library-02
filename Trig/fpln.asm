#include      ../macros.inc

; ******************************************************
; ***** Natural logarithm                          *****
; ***** RF - Pointer to floating point number      *****
; ***** RD - Pointer to floating point destination *****
; ***** internal:                                  *****
; *****       R2+1     - sum                       *****
; *****       R2+5     - last                      *****
; *****       R2+9     - k                         *****
; *****       R2+13    - pwr                       *****
; *****       R2+17    - tmp                       *****
; *****       R2+21    - n                         *****
; ******************************************************
              proc     fpln

.link .requires fpdata

              extrn    addfpi
              extrn    addtows
              extrn    divfpi
              extrn    fp_1
              extrn    fp_2
              extrn    getargs
              extrn    mulfpi
              extrn    subfpi

              ghi      r7           ; save expr stack
              stxd
              glo      r7
              stxd
              ghi      r7           ; source is expr stack
              phi      rf
              glo      r7
              plo      rf
              inc      rf
              ghi      rf           ; n = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              ghi      rf           ; tmp = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              stxd                  ; reserve space for pwr
              stxd
              stxd
              stxd
              ldi      fp_1.1       ; k = 1.0
              phi      rd
              ldi      fp_1.0
              plo      rd
              call     addtows      ; add to workspace
              ldi      fp_1.1       ; last = 1.0
              phi      rd
              ldi      fp_1.0
              plo      rd
              call     addtows      ; add to workspace
              ldi      0            ; sum = 0
              stxd
              stxd
              stxd
              stxd
              glo      r2           ; point to tmp
              adi      17
              plo      rf
              ghi      r2
              adci     0
              phi      rf
              ldi      fp_1.1       ; point to 1.0
              phi      rd
              ldi      fp_1.0
              plo      rd
              call     addfpi       ; compute n+1
              glo      r2           ; point to n
              adi      21
              plo      rf
              ghi      r2
              adci     0
              phi      rf
              ldi      fp_1.1       ; point to 1.0
              phi      rd
              ldi      fp_1.0
              plo      rd
              call     subfpi       ; compute n-1
              call     getargs      ; compute (n-1)/(n+1)
              db       21,17
              call     divfpi
              call     getargs      ; pwr = n
              db       13,21
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              call     getargs      ; n = n * n
              db       21,21
              call     mulfpi
fplog_l:      call     getargs      ; need to see if sum == last
              db       5,1
              ldi      4            ; 4 bytes to check
              plo      rc
              ldi      0            ; clear comparison flag
              plo      re
fplog_1:      ldn      rd           ; get byte from sum
              str      r2           ; save for comparison
              ldn      rf           ; get point from last
              sm                    ; compare them
              str      r2           ; store to combine with comparison flag
              glo      re           ; get comparison flag
              or                    ; combine
              plo      re           ; put back into comparison
              ldn      rd           ; get byte from sum
              str      rf           ; store into last
              inc      rd           ; increment pointers
              inc      rf
              dec      rc           ; decrement count
              glo      rc           ; see if done
              lbnz     fplog_1      ; jump if not
              glo      re           ; get comparison flag
              lbz      fplog_d      ; jump if done
              call     getargs      ; tmp = pwr
              db       17,13
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              inc      rf
              lda      rd
              str      rf
              call     getargs      ; tmp = tmp / k
              db       17,9
              call     divfpi
              call     getargs      ; sum = sum + tmp
              db       1,17
              call     addfpi
              call     getargs      ; pwr = pwr * n
              db       13,21
              call     mulfpi
              glo      r2           ; k = k + 2
              adi      9
              plo      rf
              ghi      r2
              adci     0
              phi      rf
              ldi      fp_2.1       ; point to 2.0
              phi      rd
              ldi      fp_2.0
              plo      rd
              call     addfpi
              lbr      fplog_l      ; loop until done
fplog_d:      call     getargs      ; sum = sum + sum
              db       1,1
              call     addfpi
              irx                   ; recover answer
              ldxa   
              plo      r8
              ldxa
              phi      r8
              ldxa
              plo      ra
              ldx
              phi      ra
              glo      r2           ; clean up the stack
              adi      20
              plo      r2
              ghi      r2
              adci     0
              phi      r2
              irx                   ; recover expr stack
              ldxa
              plo      r7
              ldx
              phi      r7
              inc      r7
              glo      r8           ; store answer
              str      r7
              inc      r7
              ghi      r8
              str      r7
              inc      r7
              glo      ra
              str      r7
              inc      r7
              ghi      ra
              str      r7
              dec      r7
              dec      r7
              dec      r7
              dec      r7
              rtn                   ; and return to caller

              endp

