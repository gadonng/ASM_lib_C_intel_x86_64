
	global main
	extern printf

	section .text

strchr:
	push rbp
	mov rbp, rsp

	xor rax, rax

while:
	cmp byte[rdi + rax], 0 	; check if != 0
	jz end

	cmp byte[rdi + rax], sil ; check if string char == to char to search
	jz return_value

	inc rax

	jmp while

return_value:
	add rdi, rax
	mov rax, rdi

end:
	mov rsp, rbp
        pop rbp

	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, FormatStr
	mov rsi, 'o'
	call strchr

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