TITLE Hash Function                (HashFunc.asm)
;Austin Draper
;4/21/16
;VISUAL STUDIO 2015	
;This program will use a hash function that reduces the
;number of collisions our professors code has.
INCLUDE Irvine32.inc

.data
str1		BYTE "Herman Smith",0
str2		BYTE "Louie Jones",0
str3		BYTE "Robert Sherman",0
str4		BYTE "Barbara Goldenstein",0
str5		BYTE "Johnny Unitas",0
str6		BYTE "Tyler Abrams",0
str7		BYTE "April Perkins",0
str8		BYTE "William Jones",0
str9		BYTE "Steve Schockley",0
str10		BYTE "Steve Williams",0
hello       BYTE "HashValue= ",0

Sum         BYTE ?		  
TABLE_SIZE = 11
.code
main PROC
	mov Sum, 0
	mov ecx, 0
	mov ecx, (SIZEOF str1)
	mov esi, OFFSET str1               ;set pointer at fullname variable
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf                          ;new line

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov Sum, 0
	mov ecx, (SIZEOF str2)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str3)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str4)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str5)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str6)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str7)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str8)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str9)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, (SIZEOF str10)
    call HashFunc
	mov edx, OFFSET hello
	call WriteString
	call WriteDec
	call Crlf
	call WaitMsg

	exit
main ENDP


;Loop until value in edi smaller than value in esi
HashFunc PROC
	mov eax, 0
	mov ebx, 0
	mov Sum, 0
Wloop:	
	cmp  ecx, 0
	jz  Next
	mov al, [esi]
	call WriteChar
	shl al,4                           
	ADD Sum, al
	dec ecx
	mov eax, 0
	inc esi
	jmp Wloop
Next:
	call Crlf
	xor edx, edx
	mov al, Sum
	mov bl, TABLE_SIZE
	div ebx
	xor ebx, ebx
	mov al, dl
    ret

HashFunc ENDP


END main