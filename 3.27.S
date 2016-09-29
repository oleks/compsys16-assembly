.globl main

leaf:
  lea 0x2(%rdi), %rax
  retq

top:
  sub $0x5, %rdi
  call leaf
  add %rax, %rax
  retq

main:
  callq top
  mov %rax, %rax
