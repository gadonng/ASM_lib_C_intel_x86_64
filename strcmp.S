
	global main
	extern printf

	section .text

strcmp:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:
	cmp byte[rdi + rax], 0
	jz end
	cmp byte[rsi + rax], 0
	jz end

	xor rcx, rcx
	mov cl, byte[rsi + rax]

	cmp byte[rdi + rax], cl
	jnz return_value

	inc rax

	jmp while

return_value:
	xor rcx, rcx
	mov cl, byte[rdi + rax]
	xor rbx, rbx
	mov bl, byte[rsi + rax]
	sub rcx, rbx
	mov rax, rcx

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
	call strcmp

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
	FormatStr db 'HEllo World !',0
	FormatStr2 db 'HeLlo World !',0
	Value db '%d',0Ah,0
