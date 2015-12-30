
	global main
	extern printf

	section .text

memset:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:
	cmp rax, rdx
	jz end

	mov byte[rdi + rax], sil
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
	mov rsi, 'a'
	mov rdx, 5
	call memset

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
	Value db '%s',0Ah,0