section .data

section .text
    global _start

_start:
    xor    eax, eax
    mov    al, 4
    lea    esi, al
    mov    ebx, 0xff