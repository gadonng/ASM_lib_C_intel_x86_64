
	global main
        extern printf

	section .text

strlen:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:

	cmp byte[rdi + rax], 0
	jz end

	inc rax

	jmp while
end:
	mov rsp, rbp
        pop rbp

	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, FormatStr
	call strlen

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
	FormatStr db 'Hello World !',0Ah,0
	Value db '%d',0Ah,0