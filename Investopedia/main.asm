INCLUDE IRVINE32.INC

.data
    username BYTE "admin", 0
    password BYTE "1234", 0

    promptUser BYTE "Enter username: ", 0
    promptPass BYTE "Enter password: ", 0
    successMsg BYTE "Login successful", 0Dh, 0Ah, 0
    failureMsg BYTE "Invalid login. Try again.", 0Dh, 0Ah, 0
    enterMsg BYTE "Press ENTER to continue to the menu...", 0Dh, 0Ah, 0
    logoutMsg BYTE "Logging out...", 0Dh, 0Ah, 0

    inputUsername BYTE 20 DUP(0)
    inputPassword BYTE 20 DUP(0)

    newline BYTE 0Dh, 0Ah, 0

    menuTitle BYTE "INVESTOPEDIA", 0Dh, 0Ah, 0
    menuText BYTE 0Dh, 0Ah, "MENU:", 0Dh, 0Ah
             BYTE "1. Add investment", 0Dh, 0Ah
             BYTE "2. Remove Investment", 0Dh, 0Ah
             BYTE "3. Calculator", 0Dh, 0Ah
             BYTE "4. Logout", 0Dh, 0Ah
             BYTE "Enter your choice: ", 0
    
    aiPage BYTE "You are in Add Investment Page", 0Dh, 0Ah, 0
    aiPromptAmount BYTE "Enter investment amount: ", 0
    aiSuccess BYTE "Investment added successfully!", 0Dh, 0Ah, 0

    riPage BYTE "You are in Remove Investment Page", 0Dh, 0Ah, 0
    riPromptName BYTE "Enter investment amount to remove: ", 0
    riSuccess BYTE "Investment removed successfully!", 0Dh, 0Ah, 0
    riError BYTE "Investment not found!", 0Dh, 0Ah, 0

    calPage BYTE "You are in Calculator Page", 0Dh, 0Ah, 0
    calcMenu BYTE "1. Calculate Future Value", 0Dh, 0Ah
             BYTE "2. Calculate Profit/Loss", 0Dh, 0Ah
             BYTE "3. Calculate Return on Investment (ROI)", 0Dh, 0Ah
             BYTE "4. Calculate Annual Growth Rate (CAGR)", 0Dh, 0Ah
             BYTE "5. Calculate Compound Interest", 0Dh, 0Ah
             BYTE "6. Return to Main Menu", 0Dh, 0Ah
             BYTE "Enter your choice: ", 0
    calcPromptRate BYTE "Enter annual interest rate (as decimal, e.g., 0.05 for 5%): ", 0
    calcPromptYears BYTE "Enter number of years: ", 0
    calcPromptFees BYTE "Enter transaction fees: $", 0
    calcPromptCompound BYTE "Enter number of times interest is compounded per year: ", 0
    calcPromptPrincipal BYTE "Enter principal amount: $", 0
    calcResultMsg BYTE "Calculation Result: $", 0
    calcPercentMsg BYTE "Calculation Result: ", 0
    percentSign BYTE "%", 0


    invalidMsg BYTE "Invalid choice. Try again.", 0Dh, 0Ah, 0
    continueMsgPrompt BYTE "Press ENTER to continue..", 0Dh, 0Ah, 0


    userChoice BYTE ?

    stk1 BYTE "Skibidi", 0
    stk2 BYTE "Linganguliguli", 0
    stk3 BYTE "Sigma", 0

    investArray DWORD OFFSET stk1
                DWORD OFFSET stk2
                DWORD OFFSET stk3
    numString DWORD 3
    
    ;Could be used ltr for calcs
    tempFloat REAL8 0.0
    resultValue REAL8 0.0
    interestRate REAL8 0.0
    numYears REAL8 0.0
    fees REAL8 0.0
    compounds DWORD 0
    principalAmount REAL8 0.0
    portfolioValue REAL8 0.0
    initialInvestment REAL8 0.0
    profitLoss REAL8 0.0

.code
main PROC
    call Login
    call Clrscr
    call Menu
main ENDP


 exit_program:
        mov edx, OFFSET logoutMsg
        call WriteString
        call WaitForEnter
        call ExitProcess
WaitForEnter PROC
    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf
    ret
WaitForEnter ENDP

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
    mov ecx, 20 
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
    call WaitForEnter
    jmp login_attempt

Login ENDP

Menu PROC
menu_loop:
    mov edx, OFFSET menuText
    call WriteString

    call ReadChar
    mov userChoice, al
    call WriteChar  
    call Crlf

    cmp userChoice, '1'
    je add_investment
    cmp userChoice, '2'
    je remove_investment
    cmp userChoice, '3'
    je calculator
    cmp userChoice, '4'
    je exit_menu

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp menu_loop

add_investment:
    mov edx, OFFSET aiPage
    call WriteString
    call AddInvestment
    jmp menu_loop

remove_investment:
    mov edx, OFFSET riPage
    call WriteString
    call RemoveInvestment
    jmp menu_loop

calculator:
    mov edx, OFFSET calPage
    call WriteString
    call CalculatorMenu
    jmp menu_loop

exit_menu:
    jmp exit_program

Menu ENDP

AddInvestment PROC 
    mov esi, OFFSET investArray
    mov ecx, numString

print_loop:
    mov edx, [esi]
    call WriteString
    call Crlf

    add esi, 4  ; Move to next DWORD pointer
    loop print_loop

    mov edx, OFFSET aiSuccess
    call WriteString
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    
    ret
AddInvestment ENDP

RemoveInvestment PROC
    mov esi, OFFSET investArray
    mov ecx, numString

remove_print_loop:
    mov edx, [esi]  ; Load address of the string
    call WriteString
    call Crlf

    add esi, 4      ; Move to next DWORD pointer in the array
    loop remove_print_loop

    mov edx, OFFSET riSuccess
    call WriteString
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf

    ret
RemoveInvestment ENDP

CalculatorMenu PROC
    ; Display calculator menu
    mov edx, OFFSET calcMenu
    call WriteString
    
    ; Read user choice
    call ReadChar
    call WriteChar
    call Crlf

    cmp al, '1'
    je calc_future_value
    cmp al, '2'
    je calc_profit_loss
    cmp al, '3'
    je calc_roi
    cmp al, '4'
    je calc_cagr
    cmp al, '5'
    je calc_compound
    cmp al, '6'
    je exit_calculator

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp CalculatorMenu 

;The Calculations r not done just placeholder
calc_future_value:
    mov edx, OFFSET calcResultMsg
    call WriteString
    mov eax, 1000   
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    ret
    
calc_profit_loss:
    mov edx, OFFSET calcResultMsg
    call WriteString
    mov eax, 500    
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    ret
    
calc_roi:
    mov edx, OFFSET calcPercentMsg
    call WriteString
    mov eax, 15
    call WriteDec
    mov edx, OFFSET percentSign
    call WriteString
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    ret
    
calc_cagr:
    mov edx, OFFSET calcPercentMsg
    call WriteString
    mov eax, 8      
    call WriteDec
    mov edx, OFFSET percentSign
    call WriteString
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    ret
    
calc_compound:
    mov edx, OFFSET calcResultMsg
    call WriteString
    mov eax, 2000   
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    ret
    
exit_calculator:
    ret
CalculatorMenu ENDP

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
