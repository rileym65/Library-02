PROJECT=int16.lib
OBJS=\
	abs16.prg \
	add16.prg \
	and16.prg \
	atoi16.prg \
	div16.prg \
	eq16.prg \
	false16.prg \
	gt16.prg \
	gte16.prg \
	itoa16.prg \
	lfsrshift.prg \
	lt16.prg \
	lte16.prg \
	mdnorm16.prg \
	mod16.prg \
	mul16.prg \
	ne16.prg \
	neg16.prg \
	or16.prg \
	rnd16.prg \
	sgn16.prg \
	sub16.prg \
	tobcd16.prg \
	true16.prg \
	xor16.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > $(PROJECT)

.asm.prg:
	asm02 -l -L $<

clearn:
	-rm *.prg
	-rm $(PROJECT)

