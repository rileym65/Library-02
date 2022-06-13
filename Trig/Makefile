PROJECT=trig.lib
OBJS=\
	addtows.prg \
	fpacos.prg \
	fpasin.prg \
	fpatan.prg \
	fpcopy.prg \
	fpcos.prg \
	fpexp.prg \
	fpln.prg \
	fppow.prg \
	fpsin.prg \
	fpsqrt.prg \
	fptan.prg \
	getargs.prg \
	trigdata.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > $(PROJECT)

.asm.prg:
	asm02 -l -L $<

clearn:
	-rm *.prg
	-rm $(PROJECT)

