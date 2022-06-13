#include      ../macros.inc

; ********************************************
; ***** Convert from scientific notation *****
; ***** RF - Pointer to ASCII number     *****
; ***** RD - Where to put result         *****
; ***** Uses:   RC.0-exponent            *****
; *****       RC.1-decimal count         *****
; ********************************************
              proc    fromsci

              extrn   round45

              ghi     rf                 ; safe RF for now
              stxd
              glo     rf
              stxd
              call    round45
fromsci_1:    lda     rf                 ; get byte from input
              lbz     fromsci_no         ; jump if end reached
              smi     'E'                ; check for E character
              lbz     fromsci_y          ; jump if in scientific notation
              smi     32                 ; check for e character
              lbz     fromsci_y          ; jump if in scientific notation
              lbr     fromsci_1          ; loop until either E or end
fromsci_no:   irx                        ; recover source
              ldxa
              plo     rf
              ldx
              phi     rf
fromsci_x1:   lda     rf                 ; copy input to output
              str     rd
              inc     rd
              lbnz    fromsci_x1         ; loop until terminator copied
              rtn                        ; return to caller
fromsci_y:    ldn     rf                 ; get byte following E
              smi     '+'                ; is it plus
              lbz     fromsci_p          ; jump if so
              ldn     rf                 ; recover byte
              smi     '-'                ; check for minus
              lbz     fromsci_n
              dec     rf                 ; compensate for later increment
fromsci_p:    ldi     0                  ; signal negative exponent
              lskp
fromsci_n:    ldi     1                  ; signal positive exponent
              phi     rc
              inc     rf                 ; point to exponent field
              ldi     0                  ; start exponent at zero
              plo     rc
fromsci_l1:   lda     rf                 ; get byte from exponent field
              smi     '0'                ; check if below numbers
              plo     re                 ; keep a copy
              lbnf    fromsci_2          ; jump if done reading exponent
              smi     10                 ; check if above numbers
              lbdf    fromsci_2          ; jump if done reading exponent
              glo     rc                 ; multiply rc.0 by 10
              shl
              str     r2
              shl
              shl
              add
              str     r2                 ; now add in new digit
              glo     re
              add
              plo     rc                 ; put result back
              lbr     fromsci_l1         ; loop until done
fromsci_2:    irx                        ; recover source
              ldxa
              plo     rf
              ldx
              phi     rf
              ldn     rf                 ; get first byte of source
              smi     '-'                ; check for negative sign
              lbnz    fromsci_3          ; jump if not
              ldi     '-'                ; write negative sign to output
              str     rd
              inc     rd
              inc     rf                 ; move past negative sign
; Need to look for negative exponents here
fromsci_3:    ghi     rc                 ; check for negative exponent
              shr
              lbnf    fromsci_4          ; jump if not
              ghi     rf                 ; save source
              stxd
              glo     rf
              stxd
              ldi     0                  ; clear count
              phi     rc
fromsci_n1:   lda     rf                 ; get byte from input
              plo     re                 ; keep a copy
              smi     '.'                ; check for period
              lbz     fromsci_n2         ; jump if decimal found
              ghi     re                 ; recover character
              smi     'E'                ; check for E
              lbz     fromsci_n2         ; jump if E
              smi     32                 ; check for e
              lbz     fromsci_n2         ; jump if so
              ghi     rc                 ; increment count
              adi     1
              phi     rc
              lbr     fromsci_n1         ; loop until . or E found
fromsci_n2:   irx                        ; recover source address
              ldxa
              plo     rf
              ldx
              phi     rf
              glo     rc                 ; subtract exponent from count
              str     r2
              ghi     rc
              sm
              phi     rc
              lbnf    fromsci_n3         ; jump if negative result
              lbz     fromsci_n3         ; or zero
fromsci_n7:   lda     rf                 ; read from source
              str     rd                 ; write to destination
              inc     rd
              ghi     rc                 ; get count
              smi     1                  ; and decrement
              phi     rc                 ; put it back
              lbnz    fromsci_n7         ; loop until correct number copied
              lbr     fromsci_n8         ; add a dot and remaining chars
fromsci_n3:   ldi     '0'                ; need to write a zero
              str     rd                 ; write to output
              inc     rd
fromsci_n8:   ldi     '.'                ; next a period
fromsci_n6:   str     rd                 ; write to output
              inc     rd
fromsci_n4:   ghi     rc                 ; see if done with leading zeros
              lbz     fromsci_n5         ; jump if so
              adi     1                  ; increment count
              phi     rc                 ; put it back
              ldi     '0'                ; write a 0 to the output
              lbr     fromsci_n6
fromsci_n5:   lda     rf                 ; get byte from input
              lbz     fromsci_4d         ; jump if end found
              plo     re                 ; save a copy
              smi     '.'                ; check for period
              lbz     fromsci_n5         ; ignore it
              glo     re                 ; check for E
              smi     'E'
              lbz     fromsci_4d         ; done if E
              smi     32                 ; check for e
              lbz     fromsci_4d         ; done if so
              glo     re                 ; recover character
              str     rd                 ; otherwise write to output
              inc     rd
              lbr     fromsci_n5         ; loop until done
; code following is for positive exponents
; first part, copy until decimal point is found
fromsci_4:    lda     rf                 ; get byte from input
              plo     re                 ; keep a copy
              smi     '.'                ; is it decimal point
              lbz     fromsci_4a         ; jump if so
              glo     re                 ; get character
              smi     'E'                ; check for E
              lbz     fromsci_4b
              smi     32                 ; check for e
              lbz     fromsci_4b
              glo     re                 ; recover character
              str     rd                 ; and output it
              inc     rd
              lbr     fromsci_4          ; loop back for more
; now after decimal point through E
fromsci_4a:   lda     rf                 ; get next digit
              plo     re                 ; keep a copy
              smi     'E'                ; check for end
              lbz     fromsci_4b
              smi     32
              lbz     fromsci_4b
              glo     re                 ; copy character to output
              str     rd
              inc     rd
              dec     rc                 ; increment count
              glo     rc                 ; get current count
              lbnz    fromsci_4a         ; jump if not zero
              ldi     '.'                ; output a decimal point
              str     rd
              inc     rd
              lbr     fromsci_4a         ; loop until done
fromsci_4b:   glo     rc                 ; get count remaining
              lbz     fromsci_4d         ; jump if no more decimals
              shl                        ; see if negative
              lbdf    fromsci_4d         ; jump if done
fromsci_4c:   ldi     '0'                ; write zero to output
              str     rd
              inc     rd
              dec     rc                 ; decrement count
              glo     rc                 ; see if done
              lbnz    fromsci_4c         ; loop back if not
              ldi     '.'                ; output a decimal point
              str     rd
              inc     rd
fromsci_4d:   ldi     0                  ; terminate result
              str     rd
              rtn                        ; and return to caller

              endp

