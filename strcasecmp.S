
	global main
	extern printf

	section .text

strcasecmp:
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
	call maj_cl

	xor rbx, rbx
	mov bl, byte[rdi + rax]
	call maj_bl

	cmp bl, cl
	jnz return_value

	inc rax

	jmp while

maj_cl:
	cmp cl, 65
	jl return
	cmp cl, 90
	jg return
	add cl, 32
	ret

maj_bl:
	cmp bl, 65
	jl return
	cmp bl, 90
	jg return
	add bl, 32
	ret

return:
	ret

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
	call strcasecmp

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
	FormatStr db 'hEllo World !',0
	FormatStr2 db 'HeLlo World !',0
	Value db '%d',0Ah,0
