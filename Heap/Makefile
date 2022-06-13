PROJECT=heap.lib
OBJS=\
	alloc.prg \
	checkeom.prg \
	dealloc.prg \
	hfree.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > $(PROJECT)

.asm.prg:
	asm02 -l -L $<

clearn:
	-rm *.prg
	-rm $(PROJECT)

