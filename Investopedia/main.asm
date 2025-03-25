INCLUDE IRVINE32.INC

.data
    username BYTE "admin", 0
    password BYTE "1234", 0

    promptUser BYTE "Enter username: ", 0
    promptPass BYTE "Enter password: ", 0
    successMsg BYTE "Login successful", 0Dh, 0Ah, 0
    failureMsg BYTE "Invalid login. Try again.", 0Dh, 0Ah, 0
    enterMsg BYTE "Press ENTER to continue...", 0Dh, 0Ah, 0
    logoutMsg BYTE "Logging out...", 0Dh, 0Ah, 0

    inputUsername BYTE 20 DUP(0)
    inputPassword BYTE 20 DUP(0)

    newline BYTE 0Dh, 0Ah, 0

    menuTitle BYTE "INVESTOPEDIA", 0Dh, 0Ah, 0
    menuText BYTE 0Dh, 0Ah, "MENU:", 0Dh, 0Ah
             BYTE "1. Add investment", 0Dh, 0Ah
             BYTE "2. View / Remove your Investment", 0Dh, 0Ah
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
    delValue DWORD ?

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

    userChoice DWORD ?
    investChoice DWORD ?
    listingChoice DWORD ?

    investment BYTE "Types of Investment: ", 0Dh, 0Ah, 0Dh, 0Ah,
                "1. Stocks / Equities", 0Dh, 0Ah,
               "2. Bonds", 0Dh, 0Ah,
               "3. Index Funds", 0Dh, 0Ah,
               "4. Back", 0Dh, 0Ah, 0Dh, 0Ah,
               "Enter the choice of your investment: ", 0

    invest1 BYTE 0Dh, 0Ah, "Investment: Stocks / Equities", 0Dh, 0Ah
            BYTE "Risk Level: Medium - High", 0Dh, 0Ah
            BYTE "Description: Higher risk, higher potential returns. Suitable for long-term investors.", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: $1,000", 0Dh, 0Ah, 0

    invest2 BYTE 0Dh, 0Ah, "Investment: Bonds", 0Dh, 0Ah
            BYTE "Risk Level: Medium - Low", 0Dh, 0Ah
            BYTE "Description: Lower risk, moderate returns. Suitable for medium to long-term investors (3+ years).", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: $500", 0Dh, 0Ah, 0

    invest3 BYTE 0Dh, 0Ah, "Investment: Index Funds", 0Dh, 0Ah
            BYTE "Risk Level: Medium", 0Dh, 0Ah
            BYTE "Description: Moderate risk, good diversification. Suitable for long-term investors (5+ years).", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: $1,000", 0Dh, 0Ah, 0

    stocksListTitle BYTE 0Dh, 0Ah, "Available Stocks:", 0Dh, 0Ah, 0
    stocksList BYTE "1. Apple (AAPL)", 0Dh, 0Ah
               BYTE "2. Tesla (TSLA)", 0Dh, 0Ah
               BYTE "3. Microsoft (MSFT)", 0Dh, 0Ah
               BYTE "4. NVIDIA (NVDA)", 0Dh, 0Ah
               BYTE "5. Amazon (AMZN)", 0Dh, 0Ah
               BYTE "6. Meta (META)", 0Dh, 0Ah
               BYTE "7. Coca-Cola (KO)", 0Dh, 0Ah
               BYTE "8. Berkshire Hathaway (BRK.A)", 0Dh, 0Ah
               BYTE "9. Back to investment menu", 0Dh, 0Ah, 0Dh, 0Ah
               BYTE "Enter your selection: ", 0

    bondsListTitle BYTE 0Dh, 0Ah, "Available Bonds:", 0Dh, 0Ah, 0
    bondsList BYTE "1. U.S Treasury Bonds", 0Dh, 0Ah
              BYTE "2. Municipal Bonds", 0Dh, 0Ah
              BYTE "3. Corporate Bonds", 0Dh, 0Ah
              BYTE "4. High-Yield Bonds", 0Dh, 0Ah
              BYTE "5. Government Savings Bonds", 0Dh, 0Ah
              BYTE "6. Inflation-Protected Bonds", 0Dh, 0Ah
              BYTE "7. Green Bonds", 0Dh, 0Ah
              BYTE "8. Convertible Bonds", 0Dh, 0Ah
              BYTE "9. Back to investment menu", 0Dh, 0Ah, 0Dh, 0Ah
              BYTE "Enter your selection: ", 0

    indexListTitle BYTE 0Dh, 0Ah, "Available Index Funds:", 0Dh, 0Ah, 0
    indexList BYTE "1. S&P 500 Index Fund (SPY, VOO, IVV)", 0Dh, 0Ah
              BYTE "2. Total Stock Market Index (VTI, FSKAX)", 0Dh, 0Ah
              BYTE "3. Nasdaq-100 Index Fund (QQQ)", 0Dh, 0Ah
              BYTE "4. Russell 2000 Index Fund (IWM, VTWO)", 0Dh, 0Ah
              BYTE "5. International Index Fund (VXUS, IXUS)", 0Dh, 0Ah
              BYTE "6. Emerging Markets Index Fund (VWO, EEM)", 0Dh, 0Ah
              BYTE "7. Dividend Growth Index Fund (VIG, SCHD)", 0Dh, 0Ah
              BYTE "8. Bond Index Fund (AGG, BND)", 0Dh, 0Ah
              BYTE "9. Back to investment menu", 0Dh, 0Ah, 0Dh, 0Ah
              BYTE "Enter your selection: ", 0

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
    promptPurchase BYTE "Do you want to see its listings? (Y to confirm): ", 0
    userConfirm BYTE ?

    selectedItemMsg BYTE "You selected: ", 0Dh, 0Ah, "Unit Price: $", 0
    stockPrices DWORD 145, 210, 340, 820, 175, 500, 60, 525700
    bondPrices DWORD 1000, 5000, 1000, 800, 100, 1000, 1000, 1000
    indexPrices DWORD 420, 260, 380, 170, 70, 45, 80, 80

    promptQuantity BYTE "Enter quantity (-999 to go back): ", 0
    purchaseConfirm BYTE 0Dh, 0Ah, "Purchase successful!", 0Dh, 0Ah, 0
    totalMsg BYTE "Total cost: $", 0

    price1 DWORD 50
    price2 DWORD 100
    price3 DWORD 200000

    unitPrice DWORD ?

    quantity DWORD ?  
    totalPrice DWORD ?

    purchaseHistory DWORD 10 DUP(0)
    purchaseCount DWORD 0
    historyMsg BYTE "Purchase History: ", 0Dh, 0Ah, 0
    
 
.code
main PROC
    call Login
    call Clrscr
    call Menu
    exit
main ENDP

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
    call Clrscr
    mov edx, OFFSET menuTitle
    call WriteString
    
    mov edx, OFFSET menuText
    call WriteString

    call ReadInt
    mov userChoice, eax
    call Crlf

    cmp userChoice, 1
    je add_investment
    cmp userChoice, 2
    je remove_investment
    cmp userChoice, 3
    je calculator
    cmp userChoice, 4
    je exit_menu

    mov edx, OFFSET invalidMsg
    call WriteString
    call WaitForEnter
    jmp menu_loop

add_investment:
    call AddInvestment
    jmp menu_loop

remove_investment:
    call RemoveInvestment
    jmp menu_loop

calculator:
    mov edx, OFFSET calPage
    call WriteString
    call CalculatorMenu
    jmp menu_loop

exit_menu:
    mov edx, OFFSET logoutMsg
    call WriteString
    call WaitForEnter
    exit

Menu ENDP

RemoveInvestment PROC
    call Clrscr
    mov edx, OFFSET riPage
    call WriteString
    
    cmp purchaseCount, 0
    je no_investments
    
    mov edx, OFFSET historyMsg
    call WriteString
    
    mov ecx, purchaseCount
    mov esi, 0
    
display_history:
    mov eax, purchaseHistory[esi*4]
    call WriteDec
    mov al, ' '
    call WriteChar
    inc esi
    loop display_history
    
    call Crlf
    
    mov edx, OFFSET riPromptName
    call WriteString
    call ReadInt
    mov delValue, eax
    jmp delete_investment

    
no_investments:
    mov edx, OFFSET riError
    call WriteString
    call WaitForEnter
    ret

delete_investment:
    mov ecx, purchaseCount
    mov esi, OFFSET purchaseHistory

find_loop:
    mov eax, [esi]
    cmp eax, delValue
    je found
    add esi, 4
    loop find_loop
    jmp remove_success

found:
    mov ebx, esi

shift_loop:
    add ebx, 4
    mov eax, purchaseCount
    imul eax, 4
    add eax, OFFSET purchaseHistory
    cmp ebx,eax
    je clear_last

    mov eax, [ebx]
    sub ebx, 4
    mov [ebx], eax
    add ebx, 4
    jmp shift_loop

clear_last:
    sub purchaseCount, 1
    mov eax, purchaseCount
    imul eax, 4
    add eax, OFFSET purchaseHistory
    mov dword ptr [eax], 0

remove_success:
    mov edx, OFFSET riSuccess
    call WriteString
    call WaitForEnter
    ret


RemoveInvestment ENDP

AddInvestment PROC 
    call Clrscr
    mov edx, OFFSET aiPage
    call WriteString

investMenu:
    call Clrscr
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
    je return_to_menu


    mov edx, OFFSET invalidMsg
    call WriteString
    mov edx, OFFSET enterMsg
    call ReadChar
    jmp investMenu

return_to_menu:
    ret

displayInvest1:
    mov edx, OFFSET invest1
    call WriteString
    mov eax, price1
    call Purchase
    
    cmp userConfirm, 'Y'
    je display_stocks_list
    cmp userConfirm, 'y'
    je display_stocks_list

    call Clrscr
    jmp investMenu

display_stocks_list:
    call Clrscr
    mov edx, OFFSET stocksListTitle
    call WriteString
    mov edx, OFFSET stocksList
    call WriteString

    call ReadInt
    mov listingChoice, eax
    call Crlf

    cmp listingChoice, 9
    je investMenu

    cmp listingChoice, 1
    jl invalid_stock_choice
    cmp listingChoice, 8
    jg invalid_stock_choice

    mov edx, OFFSET selectedItemMsg
    call WriteString

    mov eax, listingChoice
    dec eax 
    imul eax, 4
    mov ebx, stockPrices[eax]
    mov unitPrice, ebx
    mov eax, unitPrice
    call WriteDec

    call purchase_process
    call Clrscr
    jmp display_stocks_list

invalid_stock_choice:
    mov edx, OFFSET invalidMsg
    call WriteString
    jmp display_stocks_list

displayInvest2:
    mov edx, OFFSET invest2
    call WriteString
    mov eax, price2
    call Purchase

    cmp userConfirm, 'Y'
    je display_bonds_list
    cmp userConfirm, 'y'
    je display_bonds_list

    call Clrscr
    jmp investMenu

display_bonds_list:
    call Clrscr
    mov edx, OFFSET bondsListTitle
    call WriteString
    mov edx, OFFSET bondsList
    call WriteString

    call ReadInt
    mov listingChoice, eax
    call Crlf

    cmp listingChoice, 9
    je investMenu

    cmp listingChoice, 1
    jl invalid_bond_choice
    cmp listingChoice, 8
    jg invalid_bond_choice

    mov edx, OFFSET selectedItemMsg
    call WriteString

    mov eax, listingChoice
    dec eax 
    imul eax, 4
    mov ebx, bondPrices[eax]
    mov unitPrice, ebx
    mov eax, unitPrice
    call WriteDec

    call purchase_process
    call Clrscr
    jmp investMenu

invalid_bond_choice:
    mov edx, OFFSET invalidMsg
    call WriteString
    jmp display_bonds_list

displayInvest3:
    mov edx, OFFSET invest3
    call WriteString
    mov eax, price3
    call Purchase

    cmp userConfirm, 'Y'
    je display_index_list
    cmp userConfirm, 'y'
    je display_index_list

    call Clrscr
    jmp investMenu

display_index_list:
    call Clrscr
    mov edx, OFFSET indexListTitle
    call WriteString
    mov edx, OFFSET indexList
    call WriteString

    call ReadInt
    mov listingChoice, eax
    call Crlf

    cmp listingChoice, 9
    je investMenu

    cmp listingChoice, 1
    jl invalid_index_choice
    cmp listingChoice, 8
    jg invalid_index_choice

    mov edx, OFFSET selectedItemMsg
    call WriteString

    mov eax, listingChoice
    dec eax 
    imul eax, 4
    mov ebx, indexPrices[eax]
    mov unitPrice, ebx
    mov eax, unitPrice
    call WriteDec

    call purchase_process
    call Clrscr
    jmp investMenu

invalid_index_choice:
    mov edx, OFFSET invalidMsg
    call WriteString
    jmp display_index_list

AddInvestment ENDP

Purchase PROC
    mov unitPrice, eax

    mov edx, OFFSET promptPurchase
    call WriteString
    call ReadChar
    mov userConfirm, al
    call WriteChar
    call Crlf
    
    ret
Purchase ENDP

purchase_process PROC
    call Crlf
    mov edx, OFFSET promptQuantity
    call WriteString
    
    call ReadInt
    mov quantity, eax

    cmp eax, -999
    je purchase_return
    
    mov eax, unitPrice
    mul quantity
    mov totalPrice, eax

    call Crlf
    mov edx, OFFSET totalMsg
    call WriteString

    mov eax, totalPrice
    call WriteDec
    call Crlf

    mov ecx, purchaseCount
    cmp ecx, 10
    jge skip_history_update
    
    mov edi, OFFSET purchaseHistory
    mov eax, totalPrice
    mov [edi + ecx * 4], eax
    inc purchaseCount
    
skip_history_update:
    mov edx, OFFSET purchaseConfirm
    call WriteString

    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf

purchase_return:
    ret

purchase_process ENDP

CalculatorMenu PROC
calculator_loop:
    mov edx, OFFSET calcMenu
    call WriteString
    
    call ReadInt
    call Crlf

    cmp eax, 1
    je calc_future_value
    cmp eax, 2
    je calc_profit_loss
    cmp eax, 3
    je calc_roi
    cmp eax, 4
    je calc_cagr
    cmp eax, 5
    je calc_compound
    cmp eax, 6
    je exit_calculator

    mov edx, OFFSET invalidMsg
    call WriteString
    jmp calculator_loop

calc_future_value:
    mov edx, OFFSET calcPromptPrincipal
    call WriteString
    call ReadInt
    mov eax, 1000   
    
    mov edx, OFFSET calcResultMsg
    call WriteString
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop
    
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
    jmp calculator_loop
    
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
    jmp calculator_loop
    
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
    jmp calculator_loop
    
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
    jmp calculator_loop
    
exit_calculator:
    ret
CalculatorMenu ENDP

CompareStrings PROC
    push ecx
    push esi
    push edi

compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_equal

    cmp al, 0
    je strings_equal

    inc esi
    inc edi
    jmp compare_loop

not_equal:
    mov eax, 1
    jmp compare_end

strings_equal:
    mov eax, 0

compare_end:
    pop edi
    pop esi
    pop ecx
    ret
CompareStrings ENDP

ReadCharWithEcho PROC
    call ReadChar

    mov bl, al
    call WriteChar

    mov al, bl
    ret
ReadCharWithEcho ENDP

END main