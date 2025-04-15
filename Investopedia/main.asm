INCLUDE IRVINE32.INC

.data
    MAX_USERS EQU 10          ; Max users reg
    MAX_NAME_LENGTH EQU 50
    MAX_EMAIL_LENGTH EQU 100
    MAX_PASSWORD_LENGTH EQU 50

    User STRUCT
        name        BYTE MAX_NAME_LENGTH DUP(0)
        email       BYTE MAX_EMAIL_LENGTH DUP(0)
        password    BYTE MAX_PASSWORD_LENGTH DUP(0)
    User ENDS

    userDatabase   User MAX_USERS DUP(<>)
    userCount      DWORD 0
                        
    registrationTitle BYTE "||====================================||", 0Dh, 0Ah,
                           "||  INVESTOPEDIA - USER REGISTRATION  ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
    promptName        BYTE "Enter your full name: ", 0
    promptEmail       BYTE "Enter your email address: ", 0
    promptPassword    BYTE "Enter your password: ", 0
    confirmPassword   BYTE "Confirm your password: ", 0

    errorNameTooShort BYTE "Name must be at least 3 characters long.", 0Dh, 0Ah, 0
    errorEmailInvalid BYTE "Invalid email format. Must contain '@' and '.'", 0Dh, 0Ah, 0
    errorPasswordShort BYTE "Password must be at least 6 characters long.", 0Dh, 0Ah, 0
    errorPasswordMismatch BYTE "Passwords do not match.", 0Dh, 0Ah, 0
    errorEmailExists   BYTE "Email already registered.", 0Dh, 0Ah, 0

    regsuccessMsg BYTE "Registration successful", 0Dh, 0Ah, 0
    regfailureMsg BYTE "Invalid registration. Try again.", 0Dh, 0Ah, 0
    enterMsg BYTE "Press ENTER to continue...", 0Dh, 0Ah, 0
    logoutMsg BYTE "Logging out...", 0Dh, 0Ah, 0

    loginTitle        BYTE "INVESTOPEDIA - LOGIN", 0Dh, 0Ah, 0
    promptLoginEmail  BYTE "Enter your email: ", 0
    promptLoginPass   BYTE "Enter your password: ", 0
    loginSuccessMsg   BYTE "Login successful!", 0Dh, 0Ah, 0
    loginFailMsg      BYTE "Invalid email or password.", 0Dh, 0Ah, 0

    inputName         BYTE MAX_NAME_LENGTH DUP(0)
    inputEmail        BYTE MAX_EMAIL_LENGTH DUP(0)
    inputPassword     BYTE MAX_PASSWORD_LENGTH DUP(0)
    confirmInputPass  BYTE MAX_PASSWORD_LENGTH DUP(0)
    inputLoginEmail   BYTE MAX_EMAIL_LENGTH DUP(0)
    inputLoginPass    BYTE MAX_PASSWORD_LENGTH DUP(0)

    currentUserIndex  DWORD ?
    loginSuccess      BYTE 0

    ; Added for the second login procedure
    promptUser        BYTE "Enter your username: ", 0
    promptPass        BYTE "Enter your password: ", 0
    username          BYTE "admin", 0
    password          BYTE "password", 0
    inputUsername     BYTE MAX_NAME_LENGTH DUP(0)

    newline BYTE 0Dh, 0Ah, 0

    menuTitle BYTE "INVESTOPEDIA", 0Dh, 0Ah, 0
    menuText BYTE 0Dh, 0Ah, "MENU:", 0Dh, 0Ah
             BYTE "1. Add investment", 0Dh, 0Ah
             BYTE "2. View / Remove your Investment", 0Dh, 0Ah
             BYTE "3. Calculator", 0Dh, 0Ah
             BYTE "4. Logout", 0Dh, 0Ah
             BYTE "Enter your choice (1-4): ", 0
    
    aiPage BYTE "Available Investments", 0Dh, 0Ah, 0
    aiPromptAmount BYTE "Enter investment amount: ", 0
    aiSuccess BYTE "Investment added successfully!", 0Dh, 0Ah, 0

    riPage BYTE "Investment Details", 0Dh, 0Ah, 0
    riPromptName BYTE "Enter investment amount to remove (-999 to return): ", 0
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
             BYTE "Enter your choice (1-6): ", 0
    calcPromptValue     BYTE "Enter Your Portfolio Value: ", 0
    calcPromptRate      BYTE "Enter annual interest rate (as decimal, e.g. 5 for 5%): ", 0
    calcPromptYears     BYTE "Enter number of years: ", 0
    calcPromptFees      BYTE "Enter transaction fees: $", 0
    
    
    calcPromptROI       BYTE "Return of Investment = RM ", 0Ah, 0Dh, 0
    calcPromptII        BYTE "Enter your initial investment: ", 0
    calcResultMsg       BYTE "Calculation Result: $", 0
    calcPercentMsg      BYTE "Calculation Result: ", 0
    calcFutureMsg       BYTE "Your Future Value: $", 0
    calcProfitLossMsg   BYTE "The total profit or loss: $", 0Ah, 0Dh, 0
    calcInitialInvestmentMsg    BYTE "Your initial investment is: ", 0
    
    percentSign         BYTE "%", 0
    calcTransCost       DWORD 500
    calcBrokeFees       DWORD 1000
    noPurchaseMsg       BYTE "There are no recent purchases.", 0Ah, 0Dh, 0

    profit_loss         DWORD ?
    futureValue         DWORD ?
    totalPortfolioValue DWORD ?
    rate  DWORD ?
    years DWORD ?
    scale  DWORD 10000
    initial_investment  DWORD ?
    fees  DWORD ?
    cagr  DWORD ?
    scale_factor DWORD 1000
    ratio DWORD ?

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
               "Enter the choice of your investment (1-4): ", 0

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
               BYTE "Enter your selection (1-9): ", 0

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
              BYTE "Enter your selection (1-9): ", 0

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
              BYTE "Enter your selection (1-9): ", 0

    tempFloat REAL8 0.0
    resultValue REAL8 0.0
    interestRate REAL8 0.0
    numYears REAL8 0.0
    ;fees REAL8 0.0
    compounds DWORD 0
    portfolioValue REAL8 0.0
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

    

    ;Data for ROI calc
    profit dword ?
    initialInvest dword ?
    roi dword ?

    ;Data for CAGR calc
    calcPromptInitialVal BYTE "Enter Initial Value: ", 0
    calcPromptFinalVal BYTE "Enter Final Value: ", 0
    calcCAGRMsg         BYTE "The Compound Annual Growth Rate: ", 0
    finalValue DWORD ?
    initialValue DWORD ?
    real100 REAL4 100.0
    resultScaled DWORD ?
    intPart DWORD ?
    decPart DWORD ?


    promptProfit byte "Enter the profit amount: ", 0
    promptInitInvest byte "Enter the initial investment amount: ", 0
    displayROI byte "Return On Investment: ", 0
    errDivZero byte "Error: Cannot divide by zero!", 0


    ;Data for compound interest calc
    
    principalAmount dword ?
	numCompound dword ?
	compoundInterest dword ?

    dot BYTE ".", 0
    calcPromptPrincipal BYTE "Enter principal amount: $", 0
    calcPromptCompound  BYTE "Enter number of times interest is compounded per year: ", 0
	promptCI BYTE "Compount Interest: ", 0

.code
; Validation procedures
ValidateName PROC USES esi ecx
    mov esi, OFFSET inputName
    mov ecx, 0

count_chars:
    mov al, [esi]
    cmp al, 0
    je check_length
    inc ecx
    inc esi
    jmp count_chars

check_length:
    cmp ecx, 2
    jle invalid_name
    mov eax, 1  ; Valid
    ret

invalid_name:
    mov edx, OFFSET errorNameTooShort
    call InvalidTextDisplay
    mov eax, 0  ; Invalid
    ret
ValidateName ENDP

ValidateEmail PROC USES esi
    mov esi, OFFSET inputEmail
    mov al, 0  ; '@' flag
    mov bl, 0  ; '.' flag

check_email_chars:
    mov cl, [esi]
    cmp cl, 0
    je check_email_flags

    cmp cl, '@'
    jne check_dot
    mov al, 1

check_dot:
    cmp cl, '.'
    jne next_char
    mov bl, 1

next_char:
    inc esi
    jmp check_email_chars

check_email_flags:
    cmp al, 1
    jne invalid_email
    cmp bl, 1
    jne invalid_email
    mov eax, 1  ; Valid
    ret

invalid_email:
    mov edx, OFFSET errorEmailInvalid
    call InvalidTextDisplay
    mov eax, 0  ; Invalid
    ret
ValidateEmail ENDP

ValidatePassword PROC USES esi ecx
    mov esi, OFFSET inputPassword
    mov ecx, 0

count_pass_chars:
    mov al, [esi]
    cmp al, 0
    je check_pass_length
    inc ecx
    inc esi
    jmp count_pass_chars

check_pass_length:
    cmp ecx, 5
    jle invalid_password
    mov eax, 1  ; Valid
    ret

invalid_password:
    mov edx, OFFSET errorPasswordShort
    call InvalidTextDisplay
    mov eax, 0  ; Invalid
    ret
ValidatePassword ENDP

; Read password with asterisk masking
ReadPasswordWithMask PROC USES esi ecx edx
    mov esi, edx      ; Store destination buffer address from edx
    mov ecx, 0

read_pass_char:
    call ReadChar     ; Changed from ReadCharWithEcho to avoid double echo
    cmp al, 0Dh       ; Enter key
    je finish_password_input

    cmp al, 8         ; Backspace
    je handle_backspace

    cmp ecx, MAX_PASSWORD_LENGTH - 1
    je read_pass_char

    mov [esi], al
    inc esi
    inc ecx

    mov al, '*'
    call WriteChar
    jmp read_pass_char

handle_backspace:
    cmp ecx, 0
    je read_pass_char
    ; Removed duplicate je read_pass_char
    dec esi
    dec ecx
    mov byte ptr [esi], 0
    mov al, 8
    call WriteChar
    mov al, ' '
    call WriteChar
    mov al, 8
    call WriteChar
    jmp read_pass_char

finish_password_input:
    mov byte ptr [esi], 0
    call Crlf
    ret
ReadPasswordWithMask ENDP

; Copy string from source to destination
CopyString PROC USES esi edi ebx
copy_loop:
    mov al, [edi]
    mov [ebx], al
    inc edi
    inc ebx
    cmp al, 0
    jne copy_loop
    ret
CopyString ENDP

; Registration Procedure
Registration PROC
registration_start:
    call Clrscr
    mov edx, OFFSET registrationTitle
    call WriteString
    call Crlf

    ; Name input
input_name:
    mov edx, OFFSET promptName
    call WriteString
    mov edx, OFFSET inputName
    mov ecx, MAX_NAME_LENGTH
    call ReadString
    call ValidateName
    cmp eax, 0
    je input_name

    ; Email input
input_email:
    mov edx, OFFSET promptEmail
    call WriteString
    mov edx, OFFSET inputEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString
    call ValidateEmail
    cmp eax, 0
    je input_email
    

    ; Password input
input_pass:
    mov edx, OFFSET promptPassword
    call WriteString
    mov edx, OFFSET inputPassword
    call ReadPasswordWithMask
    call ValidatePassword
    cmp eax, 0
    je input_pass

    ; Confirm password input
input_confirm_pass:
    mov edx, OFFSET confirmPassword
    call WriteString
    mov edx, OFFSET confirmInputPass
    call ReadPasswordWithMask

    ; Compare passwords
    mov esi, OFFSET inputPassword
    mov edi, OFFSET confirmInputPass
    call CompareStrings
    cmp eax, 0
    je password_match

    mov edx, OFFSET errorPasswordMismatch
    call InvalidTextDisplay
    jmp input_pass

password_match:
    ; Store user in database
    mov esi, OFFSET userDatabase
    mov ecx, userCount
    imul ecx, SIZEOF User
    add esi, ecx

    ; Copy name
    mov edi, OFFSET inputName
    call CopyString

    ; Copy email
    mov edi, OFFSET inputEmail
    lea ebx, [esi + User.email]
    call CopyString

    ; Copy password
    mov edi, OFFSET inputPassword
    lea ebx, [esi + User.password]
    call CopyString

    inc userCount
    
    ; Show success message
    mov edx, OFFSET regsuccessMsg
    call WriteString
    call WaitForEnter
    ret

Registration ENDP

; Login Procedure
Login PROC
login_start:
    call Clrscr
    mov loginSuccess, 0
    mov edx, OFFSET loginTitle
    call WriteString

    ; Email input
    mov edx, OFFSET promptLoginEmail
    call WriteString
    mov edx, OFFSET inputLoginEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString

    ; Password input
    mov edx, OFFSET promptLoginPass
    call WriteString
    mov edx, OFFSET inputLoginPass
    call ReadPasswordWithMask

    ; Check credentials
    mov ecx, userCount
    cmp ecx, 0
    je login_failed
    mov esi, OFFSET userDatabase

check_login:
    push ecx

    ; Compare email
    lea edi, [esi + User.email]
    mov ebx, OFFSET inputLoginEmail
    
check_email_loop:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne next_user
    cmp al, 0
    je email_match
    inc edi
    inc ebx
    jmp check_email_loop
    
email_match:
    ; Compare password
    lea edi, [esi + User.password]
    mov ebx, OFFSET inputLoginPass
    
check_password_loop:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne next_user
    cmp al, 0
    je login_success
    inc edi
    inc ebx
    jmp check_password_loop

next_user:
    add esi, SIZEOF User
    pop ecx
    dec ecx
    jnz check_login
    jmp login_failed

login_failed:
    mov edx, OFFSET loginFailMsg
    call WriteString
    call WaitForEnter
    jmp login_start

login_success:
    pop ecx
    mov loginSuccess, 1
    mov edx, OFFSET loginSuccessMsg
    call WriteString
    call WaitForEnter
    ret
Login ENDP

WaitForEnter PROC
    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf
    ret
WaitForEnter ENDP

; Renamed to avoid duplicate procedure
AdminLogin PROC
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

    mov edx, OFFSET regsuccessMsg
    call WriteString
    
    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf

    ret

login_failed:
    mov edx, OFFSET regfailureMsg
    call WriteString
    call WaitForEnter
    jmp login_attempt
AdminLogin ENDP

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
    call Clrscr
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
    mov edx, OFFSET calcPromptValue
    call WriteString
    call ReadInt
    mov totalPortfolioValue, eax
    
    mov edx, OFFSET calcPromptRate
    call WriteString
    call ReadInt
    mov rate, eax

    mov eax, rate
    imul eax, 100
    mov rate, eax

    mov edx, OFFSET calcPromptYears
    call WriteString
    call ReadInt
    mov years, eax

    mov eax, rate
    add eax, scale
    mov ebx, eax

    mov eax, scale
    mov ecx, years
    

exp_loop:
    test ecx, ecx
    jz done_exp

    mul ebx
    div scale

    loop exp_loop

done_exp:
    mul totalPortfolioValue
    div scale

    mov futureValue, eax

    mov edx, OFFSET calcFutureMsg
    call WriteString
    mov eax, futureValue
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop
    
calc_profit_loss:
    mov ecx, purchaseCount
    cmp ecx, 0
    je no_purchases         ; If no purchases, skip

    ;mov eax, 0
    ;mov initial_investment, eax

    ;mov ecx, purchaseCount
    mov edi, OFFSET purchaseHistory
    xor eax, eax            ; Clear EAX for summation

sum_loop:
    add eax, [edi]          ; Add purchase price to EAX
    add edi, 4              ; Move to next purchase entry
    loop sum_loop           ; Repeat until all purchases are added

    mov initial_investment, eax     ;Store total purchases

    mov eax, calcTransCost
    add eax, calcBrokeFees
    mov fees, eax                   ;Store total fees

    mov edx, OFFSET calcPromptValue
    call WriteString
    call ReadInt                    ; Read total portfolio value

    sub eax, initial_investment
    sub eax, fees
    mov profit_loss, eax            ; Store profit/loss result

    mov edx, OFFSET calcProfitLossMsg
    call WriteString   
    call WriteDec
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop

no_purchases:
    
    mov edx, 0
    mov edx, OFFSET noPurchaseMsg
    call WriteString
    call Crlf
    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop

calc_roi:

    ; Input profit
    mov edx, offset promptProfit
    call WriteString
    call ReadInt
    mov profit, eax

    ; Input initial investment
    mov edx, offset promptInitInvest
    call WriteString
    call ReadInt
    mov initialInvest, eax

    ; Check for division by zero
    cmp eax, 0
    je division_error

    ; Calculate ROI = (profit * 100) / initialInvest
    mov eax, profit
    imul eax, 100       ; Multiply profit by 100 first
    cdq                 ; Sign-extend for division
    idiv initialInvest  ; ROI = (profit*100)/investment
    mov roi, eax

    ; Display result
    mov edx, offset displayROI
    call WriteString
    mov eax, roi
    call WriteInt       ; Use WriteInt to handle negatives
    mov al, '%'
    call Writechar
    call Crlf
    jmp exit_calc

division_error:
    mov edx, offset errDivZero
    call WriteString
    call Crlf
    
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop
    
calc_cagr:
    ;Prompt for initial value
    mov edx, OFFSET calcPromptInitialVal
    call WriteString
    call ReadInt
    mov initialValue, eax
    
    ;Prompt for Final Value
    mov edx, OFFSET calcPromptFinalVal
    call WriteString
    call ReadInt
    mov finalValue, eax

    ;Prompt for Years
    mov edx, OFFSET calcPromptYears
    call WriteString
    call ReadInt
    mov years, eax

    ;Calculation
    fild finalValue
    fild initialValue
    fdiv                ; FV / IV

    fld1
    fild years
    fdiv                ; 1 / years

    fxch
    fyl2x               ; log2(base) * exponent
    fld st(0)
    frndint     
    fsub st(1), st(0)   ; split into integer & fraction
    fxch
    f2xm1
    fld1
    fadd
    fscale
    fstp st(1)

    fld1
    fsub                ; CAGR - 1

    ;multiply by 10000 (to keep 2 decimal places when rounding)
    fld real100         ; ST(0) = 100.0
    fmul                ; CAGR * 100
    fld real100
    fmul                ; CAGR * 100
    frndint             ; Round to nearest integer
    fist resultScaled   ; Store rounded int

    ;split into intPart.decPart
    mov eax, resultScaled
    mov ebx, 100
    mov edx, 0
    div ebx             ; EAX = intPart, EDX = decPart

    mov intPart, eax
    mov decPart, edx

    ;output CAGR
    mov edx, OFFSET calcCAGRMsg
    call WriteString

    mov eax, intPart
    call WriteDec

    mov al, '.'
    call WriteChar

    mov eax, decPart
    cmp eax, 10
    jae SkipZeroPercent
    mov al, '0'
    call WriteChar

SkipZeroPercent:
    call WriteDec
    mov al, '%'
    call WriteChar
    call Crlf

    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    jmp calculator_loop
    
calc_compound:
    
    ; Input Principal
    mov edx, OFFSET calcPromptPrincipal
    call WriteString
    call ReadInt
    mov principalAmount, eax

    ; Input Rate
    mov edx, OFFSET calcPromptRate
    call WriteString
    call ReadInt
    mov rate, eax

    ; Input Num of Compound
    mov edx, OFFSET calcPromptCompound
    call WriteString
    call ReadInt
    mov numCompound, eax

    ; Input Years
    mov edx, OFFSET calcPromptYears
    call WriteString
    call ReadInt
    mov years, eax

    ; Compound Interest Calculation = P * (1 + r/n)^(n * t)

    ; Compute (1 + r / n)
    fild rate
    fld real100
    fdivp st(1), st(0)  ; rate / 100

    fild numCompound
    fdiv                ; (rate / 100) / n

    fld1
    fadd                ; (1 + r/n)

    ; Compute exponent: n * t
    fild numCompound
    fild years
    fmul                ; n * t

    ; Stack: ST(0)=exponent, ST(1)=base
    fxch                ; ST(0)=base, ST(1)=exponent
    call Pow            ; ST(0) = (1 + r/n) ^ (n * t)

    ; Multiple by Principal
    fild principalAmount
    fmul                ; P * (1 + r/n) ^ (n * t)

    ; Scale to 2 decimal places and convert to int
    fld real100
    fmul
    frndint
    fist compoundInterest

    ; Format to 2 decimal place
    mov eax, compoundInterest
    mov ebx, 100
    xor edx, edx
    div ebx

    mov intPart, eax
    mov decPart, edx

    ; Display result
    mov edx, OFFSET promptCI
    call WriteString

    mov eax, intPart
    call WriteDec
      
    mov edx, OFFSET dot
    call WriteString

    mov eax, decPart
    cmp eax, 10
    jae skipZero
    mov al, '0'
    call WriteChar
    call Crlf

SkipZero:
    mov eax, decPart
    call WriteDec
    call Crlf
    
exit_calc:
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

; Power Function
Pow PROC
    fyl2x               ; ST(0) = y * log2(x)
    fld ST(0)           ; Duplicate
    frndint             ; Get integer part
    fsub ST(1), ST(0)   ; Subtract integer part -> frac in ST(1)
    fxch                ; ST(0)=frac, ST(1)=int
    f2xm1               ; 2^frac - 1
    fld1
    fadd                ; 2^frac
    fscale              ; * 2^int
    fstp ST(1)          ; Clean up
    ret
POW ENDP

InvalidTextDisplay PROC
    mov eax, 0Ch
    call SetTextColor
    call WriteString
    mov eax, 07h
    call SetTextColor
    ret
InvalidTextDisplay ENDP

main PROC
    call Registration
    call Login
    call Menu
    exit
main ENDP
END main