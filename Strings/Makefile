PROJECT=strings.lib
OBJS=\
	chartolower.prg \
	chartoupper.prg \
	left.prg \
	mid.prg \
	right.prg \
	strcasecmp.prg \
	strcat.prg \
	strchr.prg \
	strcmp.prg \
	strcpy.prg \
	strincat.prg \
	strincpy.prg \
	strlen.prg \
	strncasecmp.prg \
	strncmp.prg \
	tolower.prg \
	toupper.prg \
	trim.prg

.SUFFIXES: .asm .prg

$(PROJECT): $(OBJS)
	cat $(OBJS) > strings.lib

.asm.prg:
	asm02 -l -L $<
