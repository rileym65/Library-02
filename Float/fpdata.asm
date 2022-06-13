              proc    fpdata

fpdot1:       db      0cdh, 0cch, 0cch, 03dh
fp_0:         db      00,00,00,00
fp_1:         db      00,00,080h,03fh
fp_2:         db      00,00,000h,040h
fp_10:        db      00,00,020h,041h
fp_100:       db      00,00,0c8h,042h
fp_1000:      db      00,00,07ah,044h
fp_e:         db      054h, 0f8h, 02dh, 040h
fp_pi:        db      0dbh, 00fh, 049h, 040h
fp_3:         db      00,00,040h,040h
fp_dot5:      db      000h, 000h, 000h, 03fh
fp_halfpi:    db      0dbh, 00fh, 0c9h, 03fh

              public  fpdot1
              public  fp_0
              public  fp_1
              public  fp_2
              public  fp_10
              public  fp_100
              public  fp_1000
              public  fp_e
              public  fp_pi
              public  fp_3
              public  fp_dot5
              public  fp_halfpi

              endp

