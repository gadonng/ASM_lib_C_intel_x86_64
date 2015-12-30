
	global main
	extern printf

	section .text

strcspn:
	push rbp
	mov rbp, rsp

	xor rax, rax

	xor rbx, rbx
	cmp byte[rsi + rbx], 0
	jz end

while:
	cmp byte[rdi + rax], 0
	jz end

	xor rbx, rbx

	jmp while2

while2:
	cmp byte[rsi + rbx], 0
        jz call_while

	xor rcx, rcx
        mov cl, byte[rsi + rbx]
        cmp byte[rdi + rax], cl
	jz return_value

	inc rbx

	jmp while2

call_while:
	inc rax
	jmp while

return_value:
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
	call strcspn

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
	FormatStr db 'fcba73',0
	FormatStr2 db '1234567890',0
	Value db '%d',0Ah,0
