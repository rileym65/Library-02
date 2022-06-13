PROJECT=float.lib
OBJS=\
	absfp.prg \
	addfp.prg \
	atof.prg \
	divfp.prg \
	eqfp.prg \
	fpargs.prg \
	fpcomp2.prg \
	fpdata.prg \
	fpnorm.prg \
	fpret0.prg \
	fpreta.prg \
	fpretb.prg \
	fromsci.prg \
	ftoa.prg \
	ftoi.prg \
	gtfp.prg \
	gtefp.prg \
	itof.prg \
	ltfp.prg \
	ltefp.prg \
	mulfp.prg \
	nefp.prg \
	round45.prg \
	sgnfp.prg \
	subfp.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > $(PROJECT)

.asm.prg:
	asm02 -l -L $<

clearn:
	-rm *.prg
	-rm $(PROJECT)

