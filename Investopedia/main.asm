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

    userChoice DWORD ?

    ;Add investment data
    investment BYTE "1. Stocks / Equities", 0Dh, 0Ah,
               "2. Bonds", 0Dh, 0Ah,
               "3. Index Funds", 0Dh, 0Ah,
               "4. Back", 0Dh, 0Ah,
               "Enter the choice of your investment: ", 0

    investChoice DWORD ?

    invest1 BYTE 0Dh, 0Ah, "Investment: Stocks", 0Dh, 0Ah
            BYTE "Risk Level: High", 0Dh, 0Ah
            BYTE "Description: High risk, high return. Suitable for long-term investors (5+ years).", 0Dh, 0Ah, 0
            BYTE "Recommended Starting Capital: $1,000", 0Dh, 0Ah

    invest2 BYTE 0Dh, 0Ah, "Investment: Bonds", 0Dh, 0Ah
            BYTE "Risk Level: Medium - Low", 0Dh, 0Ah
            BYTE "Description: Lower risk, moderate returns. Suitable for medium to long-term investors (3+ years).", 0Dh, 0Ah, 0
            BYTE "Recommended Starting Capital: $500", 0Dh, 0Ah

    invest3 BYTE 0Dh, 0Ah, "Investment: Index Funds", 0Dh, 0Ah
            BYTE "Risk Level: Medium", 0Dh, 0Ah
            BYTE "Description: Moderate risk, good diversification. Suitable for long-term investors (5+ years).", 0Dh, 0Ah, 0
            BYTE "Price per unit: $200,000", 0Dh, 0Ah

    promptPurchase BYTE "Do you want to see its listings? (Y to confirm): ", 0
    userConfirm BYTE ?

    ;Purchase
    promptQuantity BYTE "Enter quantity (-999 to go back): ", 0
    purchaseConfirm BYTE 0Dh, 0Ah, "Purchase successful!", 0Dh, 0Ah, 0
    totalMsg BYTE "Total cost: $", 0

    price1 DWORD 50
    price2 DWORD 100
    price3 DWORD 200000

    unitPrice DWORD ?

    quantity DWORD ?  
    totalPrice DWORD ?

    ;Purchase history
    purchaseHistory DWORD 10 DUP(0)
    purchaseCount DWORD 0
    historyMsg BYTE "Purchase History: ", 0Dh, 0Ah, 0
    
 


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

    call ReadInt
    mov userChoice, eax
    call Crlf

    cmp userChoice, 1
    je add_investment
    cmp userChoice, 2
    je calculator
    cmp userChoice, 3
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

    call ReadInt
    mov investChoice, eax
    call Crlf

    cmp investChoice, 1
    je displayInvest1
    cmp investChoice, 2
    je displayInvest2
    cmp investChoice, 3
    je displayInvest3
    cmp investChoice, 4
    call Menu

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp investMenu

displayInvest1:
    mov edx,OFFSET invest1
    call WriteString
    mov eax, price1
    call Purchase
    call Clrscr
    jmp investMenu

displayInvest2:
    mov edx, OFFSET invest2
    call WriteString
    mov eax, price2
    call Purchase
    call Clrscr
    jmp investMenu

displayInvest3:
    mov edx, OFFSET invest3
    call WriteString
    mov eax, price3
    call Purchase
    call Clrscr
    jmp investMenu


AddInvestment ENDP

Purchase PROC
    ;call Crlf
    mov unitPrice, eax

    mov edx, OFFSET promptPurchase
    call WriteString
    call ReadCharWithEcho
    mov userConfirm, al
    call Crlf

    cmp userConfirm, 'Y'
    je purchase_process
    cmp userConfirm, 'y'
    je purchase_process
    
    ret

purchase_process:
    call Crlf
    mov edx, OFFSET promptQuantity
    call WriteString

    ; Save the unit price in ebx
    mov ebx, unitPrice

    call ReadInt

    cmp eax, -999
    je return

    ; Save quantity in ecx
    mov ecx, eax

    ; Calculate total price
    mov eax, ebx
    mul ecx

    mov totalPrice, eax

    mov edx, OFFSET totalMsg
    call WriteString

    mov eax, totalPrice
    call WriteDec
    call Crlf

    mov ecx, purchaseCount
    mov edi, OFFSET purchaseHistory
    mov [edi + ecx * 4], eax
    inc purchaseCount


    mov edx, OFFSET purchaseConfirm
    call WriteString
    call Crlf

    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf

return:
    ret

Purchase ENDP




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

ReadCharWithEcho PROC
    call ReadChar

    mov bl, al     ; Save the character in bl
    call WriteChar ; Display the character

    ret 		   ; Return
ReadCharWithEcho ENDP

END main
