section .text
global memset
global asm_int_handler

extern int_handler

memset:
    push ebp
    mov ebp,esp

    push ebx
    push ecx
    push edx

    mov eax,[ebp+8] ; void * ptr
    mov cl,[ebp+12] ; char value
    mov edx,[ebp+16] ; int num

    add edx,eax

memset_loop:
    mov [eax],cl
    inc eax
    cmp eax,edx
    jne memset_loop

    mov eax,[ebp+8]

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret

asm_int_handler:
    pushad
    call int_handler
    popad
    iret
