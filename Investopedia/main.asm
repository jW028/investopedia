INCLUDE IRVINE32.INC

.data
    username BYTE "admin", 0
    password BYTE "1234", 0

    promptUser BYTE "Enter username: ", 0
    promptPass BYTE "Enter password: ", 0
    successMsg BYTE "Login successful", 0Dh, 0Ah, 0
    failureMsg BYTE "Invalid login. Try again.", 0Dh, 0Ah, 0
    enterMsg BYTE "Press ENTER to continue to the menu...", 0Dh, 0Ah, 0

    inputUsername BYTE 20 DUP(0)
    inputPassword BYTE 20 DUP(0)

    newline BYTE 0Dh, 0Ah, 0

    menuText BYTE 0Dh, 0Ah, "MENU:", 0Dh, 0Ah
             BYTE "1. Add investment", 0Dh, 0Ah
             BYTE "2. Calculator", 0Dh, 0Ah
             BYTE "3. Logout", 0Dh, 0Ah
             BYTE "Enter your choice: ", 0

    aiPage BYTE "You are in Add Investment Page", 0Dh, 0Ah, 0
    calPage BYTE "You are in Calculator Page", 0Dh, 0Ah, 0
    invalidMsg BYTE "Invalid choice. Try again.", 0Dh, 0Ah, 0

    userChoice BYTE ?

    ;Add investment data
    investment BYTE "1. Skibidi", 0Dh, 0Ah,
               "2. Linganguliguli", 0Dh, 0Ah,
               "3. Sigma", 0Dh, 0Ah,
               "Enter the choice of your investment: ", 0

    investChoice BYTE ?

    invest1 BYTE 0Dh, 0Ah, "Investment: Skibidi", 0Dh, 0Ah
            BYTE "Price per unit: $50", 0Dh, 0Ah
            BYTE "Risk Level: High", 0Dh, 0Ah
            BYTE "Description: High risk, high return, suitable for long-term investors.", 0Dh, 0Ah, 0

    invest2 BYTE 0Dh, 0Ah, "Investment: Linganguliguli", 0Dh, 0Ah
            BYTE "Price per unit: $100", 0Dh, 0Ah
            BYTE "Risk Level: Low", 0Dh, 0Ah
            BYTE "Description: Lower risk, steady income, ideal for conservative investors.", 0Dh, 0Ah, 0

    invest3 BYTE 0Dh, 0Ah, "Investment: Sigma", 0Dh, 0Ah
            BYTE "Price per unit: $200,000", 0Dh, 0Ah
            BYTE "Risk Level: Medium", 0Dh, 0Ah
            BYTE "Description: Physical asset, generates rental income, hedge against inflation.", 0Dh, 0Ah, 0


 


.code
main PROC

    call Login
    call Clrscr
    call Menu
    call ExitProcess
main ENDP

Login PROC

login_attempt:
    mov edx, OFFSET promptUser
    call WriteString

    mov edx, OFFSET inputUsername
    mov ecx, 20 
    call ReadString

    mov edx, OFFSET promptPass
    call WriteString

    mov edx, OFFSET inputPassword
    mov eax, 20  
    call ReadString

    mov esi, OFFSET username
    mov edi, OFFSET inputUsername
    call CompareStrings
    cmp eax, 0
    jne login_failed

    mov esi, OFFSET password
    mov edi, OFFSET inputPassword
    call CompareStrings
    cmp eax, 0
    jne login_failed

    mov edx, OFFSET successMsg
    call WriteString
    
    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf

    ret

login_failed:
    mov edx, OFFSET failureMsg
    call WriteString

    jmp login_attempt

Login ENDP

Menu PROC
    
menu_loop:
    mov edx, OFFSET menuText
    call WriteString

    call ReadChar
    mov userChoice, al
    call Crlf

    cmp userChoice, '1'
    je add_investment
    cmp userChoice, '2'
    je calculator
    cmp userChoice, '3'
    je exit_menu

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp menu_loop

add_investment:
    call AddInvestment
    call exit_menu

calculator:
    mov edx, OFFSET calPage
    call WriteString
    jmp menu_loop

exit_menu:
    call ExitProcess

Menu ENDP

AddInvestment PROC 
    call Clrscr
    mov edx, OFFSET aiPage
    call WriteString

investMenu:
    mov edx, OFFSET investment
    call WriteString

    call ReadChar
    mov investChoice, al
    call Crlf

    cmp investChoice, '1'
    je displayInvest1
    cmp investChoice, '2'
    je displayInvest2
    cmp investChoice, '3'
    je displayInvest3

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp investMenu

displayInvest1:
    mov edx,OFFSET invest1
    call WriteString
    jmp investMenu

displayInvest2:
    mov edx, OFFSET invest2
    call WriteString
    jmp investMenu

displayInvest3:
    mov edx, OFFSET invest3
    call WriteString
    jmp investMenu


AddInvestment ENDP

CompareStrings PROC
    push ecx  ; Save registers
    push esi
    push edi

compare_loop:
    mov al, [esi]   ; Load byte from first string
    mov bl, [edi]   ; Load byte from second string
    cmp al, bl      ; Compare characters
    jne not_equal   ; If different, return nonzero

    cmp al, 0       ; Check if end of string (null terminator)
    je strings_equal ; If both are 0, they match

    inc esi         ; Move to next char in first string
    inc edi         ; Move to next char in second string
    jmp compare_loop

not_equal:
    mov eax, 1      ; Return 1 (not equal)
    jmp compare_end

strings_equal:
    mov eax, 0      ; Return 0 (equal)

compare_end:
    pop edi         ; Restore registers
    pop esi
    pop ecx
    ret
CompareStrings ENDP

END main
