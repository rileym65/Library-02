#include      ../macros.inc

; ******************************************************
; ***** Square root                                *****
; ***** RF - Pointer to floating point number x    *****
; *****       R2+1     - x                         *****
; *****       R2+5     - s                         *****
; *****       R2+9     - p                         *****
; *****       R2+13    - arg                       *****
; ******************************************************
              proc     fpsqrt

              extrn    addfpi
              extrn    addtows
              extrn    divfpi
              extrn    fp_dot5
              extrn    fpcopy
              extrn    getargs
              extrn    mulfpi

              ghi      r7           ; argument is on expr stack
              phi      rf
              glo      r7
              plo      rf
              inc      rf
              ghi      rf           ; arg = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              ghi      rf           ; p = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              ghi      rf           ; s = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              ghi      rf           ; x = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows
              ldi      255          ; set max iteration count
              plo      rc
fpsqrtlp:     call     getargs      ; x = arg
              db       1,13
              call     fpcopy
              glo      rc           ; save iteration count
              stxd
              call     getargs      ; x = x / s
              db       2,6
              call     divfpi
              call     getargs      ; s = s + x
              db       6,2
              call     addfpi
              glo      r2           ; s = s * 0.5
              adi      6
              plo      rf
              ghi      r2
              adci     0
              phi      rf
              ldi      fp_dot5.1
              phi      rd
              ldi      fp_dot5.0
              plo      rd
              call     mulfpi
              irx                   ; recover iteration count
              ldx
              plo      rc
              call     getargs      ; check p=s
              db       9,5
              lda      rf
              ani      0fch
              str      r2
              lda      rd
              ani      0fch
              sm
              lbnz     fpsqrtn
              lda      rf
              str      r2
              lda      rd
              sm
              lbnz     fpsqrtn
              lda      rf
              str      r2
              lda      rd
              sm
              lbnz     fpsqrtn
              lda      rf
              str      r2
              lda      rd
              sm
              lbz      fpsqrtd
fpsqrtn:      dec      rc           ; decrement iteration count
              glo      rc
              lbz      fpsqrtd      ; jump if reached
              call     getargs      ; p = s
              db       9,5
              call     fpcopy
              lbr      fpsqrtlp     ; loop until convergence
fpsqrtd:      irx                   ; retrieve answer
              irx
              irx
              irx
              irx
              ldxa
              plo      r8
              ldxa
              phi      r8
              ldxa
              plo      r9
              ldx
              phi      r9
              glo      r2           ; remove remaining workspace
              adi      8
              plo      r2
              ghi      r2
              adci     0
              phi      r2
              inc      r7
              glo      r8           ; store answer
              str      r7
              inc      r7
              ghi      r8
              str      r7
              inc      r7
              glo      r9
              str      r7
              inc      r7
              ghi      r9
              str      r7
              dec      r7
              dec      r7
              dec      r7
              dec      r7
              rtn                   ; and return to caller

              endp


