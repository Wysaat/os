section .data
  hi db "aaaaaaaaaa", 0

section .text
    global _start

_start:
    xor    eax, eax
    mov    al, 4
    mov    esi, 4
    mov    ebx, 0xff