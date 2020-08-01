CTARGET		= ctest
ATARGET		= atest

CAPP		= driver.c
CSORT		= csort.c
ASORT		= asort.asm

CC		= gcc
RM		= rm -f
ASM		= nasm

APP_OBJS	= $(CAPP:.c=.o)
CSORT_OBJ	= $(CSORT:.c=.o)
ASORT_OBJ	= $(ASORT:.asm=.o)

csort:		$(CTARGET) 
	
asort:		$(ATARGET)	

%.o:		%.c
	$(CC) -c $< -o $@

%.o:		%.asm
	$(ASM) -f elf64 -o $@ $<

$(CTARGET):	$(APP_OBJS) $(CSORT_OBJ)
	$(CC) -o $@ $^

$(ATARGET):	$(APP_OBJS) $(ASORT_OBJ)
	$(CC) -o $@ $^

%.s:		%.c
	$(CC) -S -masm=intel $< -o $@

clean:
	$(RM) $(APP_OBJS) $(CSORT_OBJ) $(ASORT_OBJ)
	$(RM) $(CTARGET) $(ATARGET)
	$(RM) *.s
