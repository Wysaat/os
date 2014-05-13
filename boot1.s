bits    16
org    0x7c00

jmp    start

msg db "Hello, world!", 10, 0
line1 db "The amount of system memory is: ", 0
mem_size times 11 db 0

print:
    lodsb
    or     al, al
    jz     .end
    mov    ah, 0x0e
    int    0x10
    jmp    print
  .end:
    ret

; bx: input word
; si: buffer address
word_to_string:
    pusha
    xor    di, di
.loop:
    mov    ax, bx
    mov    cx, 10
    xor    dx, dx
    div    cx      ; ax quotient, dx remainder
    push word dx
    inc    di
    mov    bx, ax
    or     bx, bx
    jnz    .loop
.store:
    pop word dx
    add    dl, '0'
    mov    [si], dl
    inc    si
    dec    di
    jnz    .store
.end:
    popa
    ret

start:
    xor    ax, ax
    mov    es, ax
    mov    ds, ax
    mov    si, line1
    call   print

    ; query system memory and print
    mov    ah, 0x12
    int    0x10
    mov    bx, ax
    mov    si, mem_size
    call   word_to_string
    mov    si, mem_size
    call   print

	cli
	hlt

times 510-($-$$) db 0
dw 0xaa55