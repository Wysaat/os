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

GLOBAL_VARIABLES:

    string2     db "Hello, newline", 10, "Hello, again!", 0
    default_han db "Handling an interrupt using isr_default", 0
    GotIt    db "Got a tick..", 0
    halt_ban db "Halting..", 0
    tick_ban db "tick: ", 0

    tick_num dd 0
    tick_num_ascii times 10 db 0

    kb_byte dw 0  ; the last 0 terminates it

    video_pos dd video_mem

    capslocked db 0
    is_break_code db 0

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
    cmp    al, 0xf0
    jz     .got_break_code
    mov    ebx, look_up_table
    add    ebx, eax
    mov    al, byte [ebx]
    mov byte [kb_byte], al
    mov    esi, kb_byte
    call   write

    mov    al, 0x20
    out    0x20, al
    popa
    sti
    iret

; scan code look-up table for scan code set 2
look_up_table:
    db    0      ; 0x0    nothing
    db    0      ; 0x1    f9
    db    0      ; 0x2    nothing
    db    0      ; 0x3    f5
    db    0      ; 0x4    f3
    db    0      ; 0x5    f1
    db    0      ; 0x6    f2
    db    0      ; 0x7    f12
    db    0      ; 0x8    nothing
    db    0      ; 0x9    f10
    db    0      ; 0xa    f8
    db    0      ; 0xb    f6
    db    0      ; 0xc    f4
    db    0      ; 0xd    tab
    db    0x60   ; 0xe    `
    db    0      ; 0xf    nothing
    db    0      ; 0x10   nothing
    db    0      ; 0x11   left alt
    db    0      ; 0x12   left shift
    db    0      ; 0x13   nothing
    db    0      ; 0x14   left control
    db    0x71   ; 0x15   q
    db    0x31   ; 0x16   1
    db    0      ; 0x17   nothing
    db    0      ; 0x18   nothing
    db    0      ; 0x19   nothing
    db    0x7a   ; 0x1a   z
    db    0x73   ; 0x1b   s
    db    0x61   ; 0x1c   a
    db    0x77   ; 0x1d   w
    db    0x32   ; 0x1e   2
    db    0      ; 0x1f   nothing
    db    0      ; 0x20   nothing
    db    0x63   ; 0x21   c
    db    0x78   ; 0x22   x
    db    0x64   ; 0x23   d
    db    0x65   ; 0x24   e
    db    0x34   ; 0x25   4
    db    0x33   ; 0x26   3
    db    0      ; 0x27   nothing
    db    0      ; 0x28   nothing
    db    0x20   ; 0x29   space
    db    0x76   ; 0x2a   v
    db    0x66   ; 0x2b   f
    db    0x74   ; 0x2c   t
    db    0x72   ; 0x2d   r
    db    0x35   ; 0x2e   5
    db    0      ; 0x2f   nothing
    db    0      ; 0x30   nothing
    db    0x6e   ; 0x31   n
    db    0x62   ; 0x32   b
    db    0x68   ; 0x33   h
    db    0x67   ; 0x34   g
    db    0x79   ; 0x35   y
    db    0x36   ; 0x36   6
    db    0      ; 0x37   nothing
    db    0      ; 0x38   nothing
    db    0      ; 0x39   nothing
    db    0x6d   ; 0x3a   m
    db    0x6a   ; 0x3b   j
    db    0x75   ; 0x3c   u
    db    0x37   ; 0x3d   7
    db    0x38   ; 0x3e   8
    db    0      ; 0x3f   nothing
    db    0      ; 0x40   nothing
    db    0x2c   ; 0x41   ,
    db    0x6b   ; 0x42   k
    db    0x69   ; 0x43   i
    db    0x6f   ; 0x44   o
    db    0x30   ; 0x45   0
    db    0x39   ; 0x46   9
    db    0      ; 0x47   nothing
    db    0      ; 0x48   nothing
    db    0x2e   ; 0x49   .
    db    0x2f   ; 0x4a   /
    db    0x6c   ; 0x4b   l
    db    0x3b   ; 0x4c   ;
    db    0x70   ; 0x4d   p
    db    0x2d   ; 0x4e   -
    db    0      ; 0x4f   nothing
    db    0      ; 0x50   nothing
    db    0      ; 0x51   nothing
    db    0x27   ; 0x52   '
    db    0      ; 0x53   nothing
    db    0x5b   ; 0x54   [
    db    0x3d   ; 0x55   =
    db    0      ; 0x56   nothing
    db    0      ; 0x57   nothing
    db    0      ; 0x58   capslock
    db    0      ; 0x59   right shift
    db    0      ; 0x5a   enter
    db    0x5d   ; 0x5b   ]
    db    0      ; 0x5c   nothing
    db    0x5c   ; 0x5d   \
    db    0      ; 0x5e   nothing
    db    0      ; 0x5f   nothing
    db    0      ; 0x60   nothing
    db    0      ; 0x61   nothing
    db    0      ; 0x62   nothing
    db    0      ; 0x63   nothing
    db    0      ; 0x64   nothing
    db    0      ; 0x65   nothing
    db    0      ; 0x66   baskspace
    db    0      ; 0x67   nothing
    db    0      ; 0x68   nothing
    db    0x31   ; 0x69   (keypad) 1
    db    0      ; 0x6a   nothing
    db    0x34   ; 0x6b   (keypad) 4
    db    0x37   ; 0x6c   (keypad) 7
    db    0      ; 0x6d   nothing
    db    0      ; 0x6e   nothing
    db    0      ; 0x6f   nothing
    db    0x30   ; 0x70   (keypad) 0
    db    0x2e   ; 0x71   (keypad) .
    db    0x32   ; 0x72   (keypad) 2
    db    0x35   ; 0x73   (keypad) 5
    db    0x36   ; 0x74   (keypad) 6
    db    0x38   ; 0x75   (keypad) 8
    db    0      ; 0x76   escape
    db    0      ; 0x77   numberlock
    db    0      ; 0x78   f11
    db    0x2b   ; 0x79   (keypad) +
    db    0x33   ; 0x7a   (keypad) 3
    db    0x2d   ; 0x7b   (keypad) -
    db    0x2a   ; 0x7c   (keypad) *
    db    0x39   ; 0x7d   (keypad) 9
    db    0      ; 0x7e   scrolllock
    db    0      ; 0x7f   nothing
    db    0      ; 0x80   nothing
    db    0      ; 0x81   nothing
    db    0      ; 0x82   nothing
    db    0      ; 0x83   f7

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

disable_scancode_tranlation:
    mov    al, 0x20
    out    0x64, al
  .read_wait:
    in     al, 0x64
    and    al, 1
    jz     .read_wait
    in     al, 0x60
    xor    al, 0b01000000

    mov    bl, al

    mov    al, 0x60
    out    0x64, al
  .write_wait:
    in     al, 0x64
    and    al, 2
    jnz    .write_wait

    mov    al, bl
    out    0x60, al

    sti

loop_at_the_end:
    xor    esi, esi
    jmp    loop_at_the_end
