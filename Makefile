.PHONY: all clean

SRC=$(patsubst %.S,%.bin,$(wildcard asm/*.S))

all: $(SRC)

%.bin: %.S Makefile
	as -o $*.o --fatal-warnings -g $*.S
	ld -o $*.bin --entry=main $*.o

dump-%.o: asm/%.S Makefile
	objdump -d asm/$*.o

dump-%.bin: asm/%.S Makefile
	objdump -d asm/$*.bin

clean:
	rm -f asm/*.o
	rm -f asm/*.bin
