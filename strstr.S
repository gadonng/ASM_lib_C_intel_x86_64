
	global main
	extern printf

	section .text

strstr:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rbx, rbx

while:
	xor r8, r8
	cmp byte[rdi + rax], 0
	jz end
	cmp byte[rsi + rbx], 0
        jz end

	xor rcx, rcx
        mov cl, byte[rsi + rbx]

	cmp byte[rdi + rax], cl
	jz check_str

	inc rax

	jmp while

check_str:
	xor r8, r8
	mov r8, rax
while2:
	cmp byte[rsi + rbx], 0
	jz return_value

	xor rcx, rcx
        mov cl, byte[rsi + rbx]
        cmp byte[rdi + rax], cl
        jnz while

	inc rbx
	inc rax

	jmp while2

return_value:
	add rdi, r8
	mov rax, rdi

	mov rsp, rbp
        pop rbp
	ret

end:
	mov rax, 0
	mov rsp, rbp
        pop rbp

	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, FormatStr
	mov rsi, FormatStr2
	call strstr

	mov rdi, Value
	mov rsi, rax
	call printf

	mov rsp, rbp
	pop rbp

	mov rax, 60
	xor rdi, rdi
	syscall

	ret

section .data
	FormatStr db 'Hello World !',0
	FormatStr2 db 'ell',0
	Value db '%s',0Ah,0