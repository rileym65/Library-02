#include      ../macros.inc

              proc    round45

              ghi     rf                 ; save rf
              stxd
              glo     rf
              stxd
              ldi     0                  ; set character count
              plo     rc
              phi     rc                 ; also flag no decimal point
              ldn     rf                 ; get character from input
              smi     '-'                ; check for minus sign
              lbnz    round45_1          ; jump if not
              inc     rf                 ; otherwise move past it
round45_1:    lda     rf                 ; get next character
              plo     re                 ; keep a copy
              lbz     round45_2          ; jump if end of number reached
              smi     'E'                ; check for E
              lbz     round45_2          ; jump if end of number
              smi     32                 ; check for e
              lbz     round45_2          ; jump if so
              inc     rc                 ; otherwise increment count
              glo     re                 ; recover character
              smi     '.'                ; check for decimal point
              lbnz    round45_1          ; loop back if not
              ldi     1                  ; indicate decimal point found
              phi     rc
              lbr     round45_1          ; and keep looking
round45_2:    ghi     rc                 ; was a decimal encountered
              lbnz    round45_3          ; jump if so
round45_rt:   irx                        ; recover rf
              ldxa
              plo     rf
              ldx
              phi     rf
              rtn                        ; otherwise return to caller
round45_3:    glo     rc                 ; check digit count
              smi     6                  ; need at least 6 to do rouding
              lbnf    round45_rt         ; return if no rounding
              dec     rf                 ; move back last digit
              dec     rf
              ldn     rf                 ; retrieve it
              smi     '.'                ; see if it was the decimal
              lbz     round45_rt         ; nothing to do if so
              ldn     rf                 ; recover last character
              adi     5                  ; round it
              smi     '9'+1              ; is it still a number
              lbnf    round45_rt         ; nothing to do if so
              ldi     '0'                ; replace with a zero
round45_lp:   str     rf
round45_l1:   dec     rf                 ; point to prior character
              dec     rc                 ; decrement count
              glo     rc                 ; get count
              lbz     round45_e          ; done if zero
              ldn     rf                 ; get next digit
              smi     '.'                ; is it the decimal
              lbz     round45_l1         ; jump if so
              ldn     rf                 ; recover character
              adi     1                  ; add 1 to it
              str     rf                 ; and put it back
              smi     '9'+1              ; is result still a numeral
              lbnf    round45_rt         ; done if so
              ldn     rf                 ; recover character
              smi     10                 ; subtract 10
              lbr     round45_lp         ; and loop back
round45_e:    inc     rf                 ; move back to first byte
              ldn     rf                 ; get current byte
              str     r2                 ; set aside
              ldi     '1'                ; need a 1
              str     rf                 ; write it
round45_e1:   inc     rf
              ldn     rf                 ; get next byte
              plo     re                 ; set aside
              ldx                        ; get last byte
              str     rf                 ; store it
              lbz     round45_rt         ; done if stored a null
              glo     re                 ; otherwise get current character
              str     r2                 ; and save it
              lbr     round45_e1         ; loop for next character

              endp

