 INCLUDE Irvine32.inc

.data
 str3 		BYTE 	"Enter your name: ", 0
 buffer		BYTE	50 dup(?)
 str6		BYTE	"Hello, ", 0
.code
 main PROC
; Ask the user to input their name:
	call ClrScr			; clear screen
	lea edx, str3		        ; "Enter your name": "
	call WriteString
	mov edx, OFFSET buffer		; the buffer pointer
	mov ecx, SIZEOF buffer-1	; max. # of chars.
	call ReadString			; input your name
	lea edx, str6		        ; "Hello, "
	call WriteString
	mov edx, OFFSET buffer		; Display your name
	call WriteString
	call CrLf

	exit
main ENDP
END main
