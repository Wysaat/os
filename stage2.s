bits   16
org    0x7e00

jmp    start

msg db "Welcome to stage 2!", 0


gdt_data:
    ; null descriptor:
    dd 0
    dd 0

    ; code descriptor:
    dw 0xffff     ; limit 0:15
    dw 0          ; base 0:15
    db 0          ; base 16:23
    db 0b10011110 ; access bytes
    db 0b11001111
    db 0          ; base 24:31

    ; data descriptor:
    dw 0xffff
    dw 0
    db 0
    db 0b10010110
    db 0b11001111
    db 0
end_of_gdt:

gdtr:
    dw end_of_gdt - gdt_data - 1
    dd gdt_data


print16:
    lodsb
    or     al, al
    jz     .end
    mov    ah, 0x0e
    int    0x10
    jmp    print16
  .end:
    ret

start:
    xor    ax, ax
    mov    ds, ax
    mov    es, ax

    mov    si, msg
    call   print16

    cli
    lgdt   [gdtr]
    mov    eax, cr0
    or     al, 1
    mov    cr0, eax
    jmp    0x8:stage3

stage3:

bits   32

    jmp    stage3_start

    %define video_mem 0xb8000

;; --------------------------------------------------------------------- ;;

idt_entries_begin:
idt_entry_0:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_1:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_2:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_3:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_4:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_5:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_6:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_7:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_8:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_9:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_10:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_11:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_12:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_13:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_14:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_15:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_16:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_17:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_18:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_19:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_20:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_21:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_22:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_23:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_24:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_25:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_26:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_27:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_28:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_29:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_30:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_31:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_32:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_33:
    dw isr_keyboard ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_34:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_35:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_36:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_37:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_38:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_39:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_40:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_41:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_42:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_43:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_44:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_45:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_46:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper

idt_entry_47:
    dw isr_default ; base lower
    dw 0x8         ; kernel segment selector, use a code selector
    db 0           ; always 0
    db 0b10001110  ; flags
    dw 0           ; base upper
idt_entries_end:
;; ----------------------------------------------------------------------- ;;

idtr:
    dw idt_entries_end-idt_entries_begin-1
    dd idt_entries_begin

    string2     db "Hello, newline", 10, "Hello, again!", 0
    default_han db "Handling an interrupt using isr_default", 0
    GotIt    db "Got a tick..", 0
    halt_ban db "Halting..", 0
    tick_ban db "tick: ", 0

    tick_num dd 0
    tick_num_ascii times 10 db 0

    kb_byte dw 0  ; the last 0 terminates it

    video_pos dd video_mem

isr_default:
    cli
    push   ax
    mov    al, 0x20
    out    0x20, al
    pop    ax
    sti
    iret

isr_keyboard:
    cli
    pusha

    xor    eax, eax
    in     al, 0x60
    mov byte [kb_byte], al
    mov    esi, kb_byte
    call   write

    mov    al, 0x20
    out    0x20, al
    popa
    sti
    iret

write:
    pusha
  .start:
    lodsb
    test   al, al
    jz     .end
    mov    ebx, [video_pos]
    mov byte [ebx], al
    inc dword [video_pos]
    mov byte [ebx+1], 7
    inc dword [video_pos]
    jmp    .start
  .end:
    popa
    ret

stage3_start:
    cli
    lidt   [idtr]

    mov    ax, 0x10
    mov    ds, ax
    mov    ss, ax
    mov    es, ax
    mov    esp, 0x70000

pic_init:
    ; icw 1
    mov    al, 0x11
    out    0x20, al
    out    0xa0, al
    ; icw 2
    mov    al, 0x20
    out    0x21, al
    mov    al, 0x28
    out    0xa1, al
    ; icw 3
    mov    al, 0x4
    out    0x21, al
    mov    al, 0x2
    out    0xa1, al
    ; icw 4
    mov    al, 1
    out    0x21, al
    out    0xa1, al

; The oscillator used by the PIT chip runs at (roughly) 1.193182 MHz
pit_init:
    mov    al, 0b00110110
    out    0x43, al

    ; each counter register holds the count value used by the PIT to count down from
    ; they are all 16 bit registers
    ; set to be 100 Hz
    mov    ax, 11932
    out    0x40, al
    mov    al, ah
    out    0x40, al

    sti

loop_at_the_end:
    xor    esi, esi
    jmp    loop_at_the_end
