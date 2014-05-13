bits   16
org    0x0

jmp    start

msg db "Hello, BIOS!", 13, 10, 0
fatal db "[FATAL] Can't read sectors", 13, 10, 0
succ db "Successfully read sectors", 13, 10, 0

print:
    lodsb
    or     al, al
    jz     .end
    mov    ah, 0x0e
    int    0x10
    jmp    print
  .end:
    ret

start:
    mov    ax, 0x7c0
    mov    es, ax
    mov    ds, ax

    mov    si, msg
    call   print

    ; read  10 sectors (0, 0, 2)
    mov    ch, 0
    mov    cl, 2
    mov    dh, 0
    mov    dl, 0x80
    mov    bx, 0x200
    mov    ah, 0x2
    mov    al, 10
    int    0x13

    jc     failure
    cmp    al, 10
    jnz    failure

suceess:
    mov    si, succ
    call   print
    jmp    end

failure:
    mov    si, fatal
    call   print
    cli
    hlt

end:
    jmp    0x200

times 510-($-$$) db 0
dw 0xaa55