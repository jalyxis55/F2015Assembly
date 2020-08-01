# 64-bit hello.asm (tested on Mac/Linux)

TARGET	= lab6_fib
ASRCS	= lab6_fib.asm
OBJS	= $(ASRCS:.asm=.o)
NFLAGS	= -f elf64

.PHONY:
all:	$(TARGET)

$(TARGET):	$(OBJS)
	gcc -o $(TARGET) $(OBJS)

%.o:	%.asm
	nasm $(NFLAGS) $< -o $@


.PHONY:
clean:
	rm $(TARGET) $(OBJS)
