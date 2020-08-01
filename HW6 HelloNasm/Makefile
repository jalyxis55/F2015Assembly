# 64-bit hello.asm (tested on Mac/Linux)

TARGET	= hello
ASRCS	= hello.asm
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
