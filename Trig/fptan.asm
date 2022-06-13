#include      ../macros.inc

; ******************************************************
; ***** tan                                        *****
; ***** RF - Pointer to floating point number      *****
; ***** RD - Pointer to floating point destination *****
; ***** internal:                                  *****
; *****       R2+1     - s                         *****
; *****       R2+5     - c                         *****
; ******************************************************
              proc     fptan

              extrn    addtows
              extrn    divfpi
              extrn    fpcos
              extrn    fpsin
              extrn    getargs

              ghi      r7           ; save expr stack
              stxd
              glo      r7
              stxd
              ghi      r7           ; source is expr stack
              phi      rf
              glo      r7
              plo      rf
              inc      rf
              ghi      rf           ; s = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows      ; add to workspace
              ghi      rf           ; c = argument
              phi      rd
              glo      rf
              plo      rd
              call     addtows      ; add to workspace
              glo      r2           ; setup for computing sin
              plo      r7
              ghi      r2
              phi      r7
              call     fpsin        ; compute sin
              glo      r2           ; setup to compute cos
              adi      4
              plo      r7
              ghi      r2
              adci     0
              phi      r7
              call     fpcos        ; compute cos
              call     getargs      ; get arguments for division
              db       1,5
              call     divfpi       ; s = s / c
              irx                   ; recover answer
              ldxa
              plo      r8
              ldxa
              phi      r8
              ldxa
              plo      ra
              ldxa
              phi      ra
              irx                   ; move past c
              irx
              irx
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

