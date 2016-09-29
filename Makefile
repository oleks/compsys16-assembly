.PHONY: all clean diso diself

SRC=$(patsubst %.S,%.elf,$(wildcard asm/*.S))

OBJS=$(wildcard asm/*.o)
ELFS=$(wildcard asm/*.elf)

all: $(SRC)

%.elf: %.S Makefile
	as -o $*.o --fatal-warnings -g $*.S
	ld -o $*.elf --entry=main $*.o

diso:
	objdump -d $(OBJS)

diself:
	objdump -d $(ELFS)

clean:
	rm -f $(OBJS)
	rm -f $(ELFS)
