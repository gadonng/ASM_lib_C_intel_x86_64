
	global main
	extern printf

	section .text

rindex:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rcx, rcx

while:
	cmp byte[rdi + rax], 0
	jz end

	cmp byte[rdi + rax], sil
	jz store_value

	inc rax

	jmp while

store_value:
	xor rcx, rcx
	mov rcx, rax

	inc rax
	jmp while

end:
	add rdi, rcx
	mov rax, rdi

	mov rsp, rbp
	pop rbp

	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, FormatStr
	mov rsi, 'o'
	call rindex

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
	FormatStr db 'Hello Helloo World!',0Ah,0
	Value db '%s',0Ah,0