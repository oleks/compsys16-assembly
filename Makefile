.PHONY: all clean diso diself

SRC=$(patsubst %.S,%.elf,$(wildcard *.S))

OBJS=$(wildcard *.o)
ELFS=$(wildcard *.elf)

all: $(SRC)

%.elf: %.S
	as -o $*.o --fatal-warnings $*.S
	ld -o $*.elf --entry=main $*.o

diso:
	objdump -d $(OBJS)

diself:
	objdump -d $(ELFS)

clean:
	rm -f *.o
	rm -f *.elf
