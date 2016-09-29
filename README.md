CompSys 2016 Assembly Explorer
==============================

Assembly files are here: `asm/*.S`.

To compile them all, just type

~~~
  $ make
~~~

For each, we generate an object file (ending in `.o`) and an executable binary
(ending in `.bin`).

## Disassembling

Disassembling lets you inspect exactly the instructions that your assembly code
was assembled into.

You can use the `make` to quickly dump things as well.

For instance, see `asm/3.27.S`.

We can disassemble the object file as follows:

~~~
  $ make dump-3.27.o
~~~

And disassemble the binary:

~~~
  $ make dump-3.27.bin
~~~

## GDB

Disassembling doesn't give you insight into the run-time behaviour of your code.

You can use `make` to quickly run your code through GDB.

~~~
  $ make gdb-3.27.bin
~~~

This will set a breakpoint at `main` and run the program, stopping at the first
line.

To validate how the stack behaves proceed as follows:

~~~
  (gdb) p $rsp
  $1 = (void *) 0x7fffffffdaf0
  (gdb) s
  top () at asm/3.27.S:8
  8   sub $0x5, %rdi
  (gdb) p $rsp
  $2 = (void *) 0x7fffffffdae8
~~~
