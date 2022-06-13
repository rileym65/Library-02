#include      ../macros.inc

              proc     fpcopy

              lda      rd           ; copy source to destination
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
              rtn                   ; return to caller

              endp

