
	global main
	extern printf

	section .text

memmove:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:
	cmp rax, rdx
	jz end

	xor rcx, rcx
	mov cl, byte[rsi + rax]
	mov byte[rdi + rax], cl
	inc rax

	jmp while

end:
	mov rax, rdi

	mov rsp, rbp
        pop rbp

	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, FormatStr
	mov rsi, FormatStr2
	mov rdx, 5
	call memmove

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
	FormatStr2 db 'aaaaaaaa',0Ah,0
	Value db '%s',0Ah,0