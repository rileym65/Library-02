#include    ../macros.inc

; ************************************************
; ***** Decrement value on top of expr stack *****
; ***** R7 - pointer to expr stack           *****
; ************************************************
            proc     dec32

            inc      r7                ; move to lsb
            ldn      r7                ; retrieve it
            smi      1                 ; add 1
            str      r7                ; and put it back
            inc      r7                ; point to next byte
            ldn      r7                ; retrieve it
            smbi     0                 ; propagate carry
            str      r7                ; and put it back
            inc      r7                ; point to next byte
            ldn      r7                ; retrieve it
            smbi     0                 ; propagate carry
            str      r7                ; and put it back
            inc      r7                ; point to next byte
            ldn      r7                ; retrieve it
            smbi     0                 ; propagate carry
            str      r7                ; and put it back
            dec      r7                ; move expr pointer back
            dec      r7
            dec      r7
            dec      r7
            rtn                        ; and return to caller

            endp

