
	global main
	extern printf

	section .text

strpbrk:
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
	add rdi, rax
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
	call strpbrk

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
	FormatStr2 db 'rdsdlkdjd',0
	Value db '%s',0Ah,0