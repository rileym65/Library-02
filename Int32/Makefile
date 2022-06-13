PROJECT=int32.lib
OBJS=\
	abs32.prg \
	add32.prg \
	and32.prg \
	atoi32.prg \
	cmp32.prg \
	comp32.prg \
	dec32.prg \
	div32.prg \
	eq32.prg \
	false32.prg \
	gt32.prg \
	gte32.prg \
	icomp32.prg \
	itoa32.prg \
	lt32.prg \
	lte32.prg \
	mod32.prg \
	mul32.prg \
	ne32.prg \
	neg32.prg \
	null32.prg \
	or32.prg \
	rnd32.prg \
	sgn32.prg \
	shl32.prg \
	shr32.prg \
	sub32.prg \
	tobcd32.prg \
	true32.prg \
	xor32.prg \
	zero32.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > $(PROJECT)

.asm.prg:
	asm02 -l -L $<

clearn:
	-rm *.prg
	-rm $(PROJECT)

