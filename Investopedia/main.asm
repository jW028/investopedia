INCLUDE IRVINE32.INC

.data
    MAX_USERS EQU 10          ; Max users reg
    MAX_NAME_LENGTH EQU 50
    MAX_EMAIL_LENGTH EQU 100
    MAX_PASSWORD_LENGTH EQU 50

     User STRUCT
        name            BYTE MAX_NAME_LENGTH DUP(0)
        email           BYTE MAX_EMAIL_LENGTH DUP(0)
        password        BYTE MAX_PASSWORD_LENGTH DUP(0)
        purchaseHistory DWORD 10 DUP(0)      ; Add purchase history array
        purchaseCount   DWORD 0              ; Add purchase count
    User ENDS

    userDatabase   User MAX_USERS DUP(<>)
    userCount      DWORD 0

    userPageTitle BYTE "||====================================||", 0Dh, 0Ah,
                       "||          INVESTOPEDIA              ||", 0Dh, 0Ah, 
                       "||====================================||", 0Dh, 0Ah, 0
    userPageOptions BYTE "0. Register New Account", 0Dh, 0Ah,
                         "1. Login", 0Dh, 0Ah,
                         "2. Reset Password", 0Dh, 0Ah,
                         "3. Exit", 0Dh, 0Ah, 0Dh, 0Ah,
                         "Enter your choice (0-3): ", 0 
                      
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

     loginTitle        BYTE "||====================================||", 0Dh, 0Ah,
                            "||             LOGIN                  ||", 0Dh, 0Ah, 
                            "||====================================||", 0Dh, 0Ah, 0
    promptLoginEmail  BYTE "Enter your email: ", 0
    promptLoginPass   BYTE "Enter your password: ", 0
    loginSuccessMsg   BYTE "Login successful!", 0Dh, 0Ah, 0
    loginFailMsg      BYTE "Invalid email or password.", 0Dh, 0Ah, 0
    loginOptionsMsg   BYTE "Options:", 0Dh, 0Ah,
                           "0. Change Password", 0Dh, 0Ah,
                           "1. Try Login Again", 0Dh, 0Ah,
                           "2. Register New Account", 0Dh, 0Ah,
                           "Enter your choice (0-2): ", 0
    changePassTitle   BYTE "||====================================||", 0Dh, 0Ah,
                           "||        CHANGE PASSWORD             ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
    promptOldPass     BYTE "Enter your current password: ", 0
    promptNewPass     BYTE "Enter your new password: ", 0
    promptConfirmNewPass BYTE "Confirm your new password: ", 0
    passChangeSuccess BYTE "Password changed successfully!", 0Dh, 0Ah, 0
    passChangeFailure BYTE "Password change failed. Old password incorrect.", 0Dh, 0Ah, 0
    
    inputOldPass      BYTE MAX_PASSWORD_LENGTH DUP(0)
    inputNewPass      BYTE MAX_PASSWORD_LENGTH DUP(0)
    confirmNewPass    BYTE MAX_PASSWORD_LENGTH DUP(0)
    inputName         BYTE MAX_NAME_LENGTH DUP(0)
    inputEmail        BYTE MAX_EMAIL_LENGTH DUP(0)
    inputPassword     BYTE MAX_PASSWORD_LENGTH DUP(0)
    confirmInputPass  BYTE MAX_PASSWORD_LENGTH DUP(0)
    inputLoginEmail   BYTE MAX_EMAIL_LENGTH DUP(0)
    inputLoginPass    BYTE MAX_PASSWORD_LENGTH DUP(0)

    currentUserIndex  DWORD ?
    loginSuccess      BYTE 0
    userFileName    BYTE "users.dat", 0
    fileHandle      DWORD ?
    bytesWritten    DWORD ?
    bytesRead       DWORD ?
    fileOpenError   BYTE "Error opening file.", 0Dh, 0Ah, 0
    fileWriteError  BYTE "Error writing to file.", 0Dh, 0Ah, 0
    fileReadError   BYTE "Error reading from file.", 0Dh, 0Ah, 0

    ; Added for the second login procedure
    promptUser        BYTE "Enter your username: ", 0
    promptPass        BYTE "Enter your password: ", 0
    username          BYTE "admin", 0
    password          BYTE "password", 0
    inputUsername     BYTE MAX_NAME_LENGTH DUP(0)

    newline BYTE 0Dh, 0Ah, 0

     menuTitle         BYTE "||====================================||", 0Dh, 0Ah,
                            "||          INVESTOPEDIA              ||", 0Dh, 0Ah, 
                            "||====================================||", 0Dh, 0Ah, 0
     menuText BYTE 0Dh, 0Ah, "MENU:", 0Dh, 0Ah
             BYTE "1. Add investment", 0Dh, 0Ah
             BYTE "2. View / Remove your Investment", 0Dh, 0Ah
             BYTE "3. Calculator", 0Dh, 0Ah
             BYTE "4. Settings", 0Dh, 0Ah
             BYTE "Enter your choice (1-4): ", 0
    
    aiPage            BYTE "||====================================||", 0Dh, 0Ah,
                           "||      AVAILABLE INVESTMENTS         ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
    aiPromptAmount BYTE "Enter investment amount: ", 0
    aiSuccess BYTE "Investment added successfully!", 0Dh, 0Ah, 0
    maxQuantityMsg BYTE "Maximum purchase quantity is 1000. Please enter a smaller amount.", 0Dh, 0Ah, 0

    riPage            BYTE "||====================================||", 0Dh, 0Ah,
                           "||       INVESTMENT DETAILS           ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
    riPromptName BYTE "Enter investment name to sell: ", 0
    riPromptQuantity BYTE "Enter quantity to sell (or all available): ", 0
    sellQuantity DWORD ?
    investNameBuffer BYTE 50 DUP(0)
    stockTemp BYTE 50 DUP(0)
    DisplayInvestmentName PROTO

    riSuccess BYTE "Investment removed successfully!", 0Dh, 0Ah, 0
    riError BYTE "Investment not found!", 0Dh, 0Ah, 0
    delValue DWORD ?

    calPage           BYTE "||====================================||", 0Dh, 0Ah,
                           "||             CALCULATOR             ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
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
    
    settingsPage BYTE "||====================================||", 0Dh, 0Ah,
                      "||             SETTINGS               ||", 0Dh, 0Ah, 
                      "||====================================||", 0Dh, 0Ah, 0
    settingsOptions BYTE "1. Delete Account", 0Dh, 0Ah,
                     "2. Logout", 0Dh, 0Ah,
                     "3. View Information", 0Dh, 0Ah,
                     "4. Back to Main Menu", 0Dh, 0Ah, 0Dh, 0Ah,
                     "Enter your choice (1-4): ", 0
    deleteConfirmMsg BYTE "Are you sure you want to delete your account? (Y/N): ", 0
    accountDeletedMsg BYTE "Account deleted successfully. Returning to login page.", 0Dh, 0Ah, 0
    viewInfoPage BYTE "||====================================||", 0Dh, 0Ah,
                      "||          USER INFORMATION          ||", 0Dh, 0Ah, 
                      "||====================================||", 0Dh, 0Ah, 0
    viewInfoName BYTE "Full Name: ", 0
    viewInfoEmail BYTE "Email: ", 0
    viewInfoPassword BYTE "Password: ", 0
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

    investment BYTE "||====================================||", 0Dh, 0Ah,
                    "||         TYPE OF INVESTMENT         ||", 0Dh, 0Ah, 
                    "||====================================||", 0Dh, 0Ah, 0
    investment_options BYTE "1. Stocks / Equities", 0Dh, 0Ah,
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

    stocksListTitle   BYTE "||====================================||", 0Dh, 0Ah,
                           "||        AVAILABLE STOCKS            ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
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

     bondsListTitle    BYTE "||====================================||", 0Dh, 0Ah,
                           "||        AVAILABLE BONDS             ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
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

    indexListTitle    BYTE "||====================================||", 0Dh, 0Ah,
                           "||      AVAILABLE INDEX FUNDS         ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
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

    purchaseTypes DWORD 10 DUP(0)      ; Type of each purchase (1=stock, 2=bond, 3=index)
    purchaseItems DWORD 10 DUP(0)      ; Item number within each type (1-8)
    purchaseQuantities DWORD 10 DUP(0) ; Quantity of each purchase

    tableHeader BYTE "||=================================================||", 0Dh, 0Ah,
                     "||  #  |       Investment       | Quantity | Value ||", 0Dh, 0Ah,
                     "||=================================================||", 0Dh, 0Ah, 0
    tableRow BYTE "||  ", 0
    tableSep1 BYTE "  | ", 0
    tableSep2 BYTE " | ", 0
    tableSep3 BYTE " | $", 0
    tableEnd BYTE "  ||", 0Dh, 0Ah, 0
    tableFooter BYTE "||=================================================||", 0Dh, 0Ah, 0
    

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

    viewInvestmentPrompt BYTE "View investments by:", 0Dh, 0Ah,
                              "1. Stocks", 0Dh, 0Ah,
                              "2. Bonds", 0Dh, 0Ah,
                              "3. Index Funds", 0Dh, 0Ah,
                              "4. All Investments", 0Dh, 0Ah,
                              "Enter your choice (1-4): ", 0
    riPromptChoice BYTE "Enter investment number or name to sell (999 to return): ", 0
    invalidNumberMsg BYTE "Invalid investment number. Try again.", 0Dh, 0Ah, 0
    noMatchingInvestments BYTE "No matching investments found.", 0Dh, 0Ah, 0
    viewOption DWORD ?
    displayCount DWORD ?
    displayToActualMap DWORD 10 DUP(0)  ; Maps display index to actual index
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

UserPage PROC
user_page_start:
    call Clrscr
    mov edx, OFFSET userPageTitle
    call WriteString
    
    mov edx, OFFSET userPageOptions
    call WriteString
    
    call ReadInt
    call Crlf
    
    cmp eax, 0
    je go_to_registration
    cmp eax, 1
    je go_to_login
    cmp eax, 2
    je go_to_reset_password
    cmp eax, 3
    je exit_program
    
    ; Invalid option
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp user_page_start
    
go_to_registration:
    call Registration
    jmp user_page_start
    
go_to_login:
    call Login
    cmp loginSuccess, 1
    je exit_to_menu
    jmp user_page_start
    
go_to_reset_password:
    call ChangePassword
    jmp user_page_start
    
exit_program:
    call SaveUserData
    exit
    
exit_to_menu:
    ret
UserPage ENDP


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
    mov ecx, userCount
    cmp ecx, 0
    je input_pass  ; No users yet, skip check
    
    mov esi, OFFSET userDatabase

check_email_exists:
    push ecx
    
    ; Compare email
    lea edi, [esi + User.email]
    mov ebx, OFFSET inputEmail
    
    push esi
    mov esi, edi
    mov edi, ebx
    call CompareStrings
    pop esi
    
    pop ecx
    
    cmp eax, 0
    je email_exists
    
    add esi, SIZEOF User
    loop check_email_exists
    jmp input_pass
    
email_exists:
    mov edx, OFFSET errorEmailExists
    call InvalidTextDisplay
    jmp input_email

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
    mov ebx, esi  ; Name is at the beginning of the structure
    call CopyString

    ; Copy email
    mov edi, OFFSET inputEmail
    lea ebx, [esi + MAX_NAME_LENGTH]  ; Email comes after name
    call CopyString

    ; Copy password
    mov edi, OFFSET inputPassword
    lea ebx, [esi + MAX_NAME_LENGTH + MAX_EMAIL_LENGTH]  ; Password comes after email
    call CopyString

    inc userCount
    
    ; Save user data to file after registration
    call SaveUserData
    
    ; Show success message in green
    mov edx, OFFSET regsuccessMsg
    call SuccessTextDisplay
    call WaitForEnter
    ret

Registration ENDP

SaveUserData PROC
    ; Create/Open file for writing
    mov edx, OFFSET userFileName
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    jne file_opened_ok
    
    mov edx, OFFSET fileOpenError
    call WriteString
    ret
    
file_opened_ok:
    ; Write userCount to file
    mov eax, fileHandle
    mov edx, OFFSET userCount
    mov ecx, TYPE userCount
    call WriteToFile
    
    ; Check if write was successful
    cmp eax, 0
    je write_error
    
    ; Write user database to file
    mov eax, fileHandle
    mov edx, OFFSET userDatabase
    mov ecx, SIZEOF User
    imul ecx, userCount
    call WriteToFile
    
    ; Check if write was successful
    cmp eax, 0
    je write_error

    ; Write purchase types, items, and quantities
    mov eax, fileHandle
    mov edx, OFFSET purchaseTypes
    mov ecx, 40  ; 10 DWORDs (10 * 4 bytes)
    call WriteToFile
    
    mov eax, fileHandle
    mov edx, OFFSET purchaseItems
    mov ecx, 40  ; 10 DWORDs
    call WriteToFile
    
    mov eax, fileHandle
    mov edx, OFFSET purchaseQuantities
    mov ecx, 40  ; 10 DWORDs
    call WriteToFile
    
    jmp close_file

write_error:
    mov edx, OFFSET fileWriteError
    call WriteString
    
close_file:
    mov eax, fileHandle
    call CloseFile
    ret
SaveUserData ENDP

; Load user data from file
LoadUserData PROC
    ; Open file for reading
    mov edx, OFFSET userFileName
    call OpenInputFile
    mov fileHandle, eax
    
    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    jne read_file_ok
    
    ; File doesn't exist or can't be opened - that's ok for first run
    ret
    
read_file_ok:
    ; Read userCount from file
    mov eax, fileHandle
    mov edx, OFFSET userCount
    mov ecx, TYPE userCount
    call ReadFromFile
    
    ; Check if read was successful
    cmp eax, 0
    je read_error
    
    ; Read user database from file
    mov eax, fileHandle
    mov edx, OFFSET userDatabase
    mov ecx, SIZEOF User
    imul ecx, userCount
    call ReadFromFile
    
    ; Check if read was successful
    cmp eax, 0
    je read_error
    
    ; Read purchase types, items, and quantities
    mov eax, fileHandle
    mov edx, OFFSET purchaseTypes
    mov ecx, 40  ; 10 DWORDs
    call ReadFromFile
    
    mov eax, fileHandle
    mov edx, OFFSET purchaseItems
    mov ecx, 40  ; 10 DWORDs
    call ReadFromFile
    
    mov eax, fileHandle
    mov edx, OFFSET purchaseQuantities
    mov ecx, 40  ; 10 DWORDs
    call ReadFromFile
    
    jmp close_read_file

read_error:
    mov edx, OFFSET fileReadError
    call WriteString
    
close_read_file:
    mov eax, fileHandle
    call CloseFile
    ret
LoadUserData ENDP

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
    lea edi, [esi + MAX_NAME_LENGTH]  ; Email comes after name
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
    lea edi, [esi + MAX_NAME_LENGTH + MAX_EMAIL_LENGTH]  ; Password comes after email
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
    
    ; Display options after failed login
    call Crlf
    mov edx, OFFSET loginOptionsMsg
    call WriteString
    call ReadInt
    
    cmp eax, 0
    je change_password
    cmp eax, 1
    je login_start
    cmp eax, 2
    je go_to_registration
    
    ; If invalid option, default to try login again
    jmp login_start

change_password:
    call ChangePassword
    jmp login_start
    
go_to_registration:
    call Registration
    jmp login_start

login_success:
    pop ecx
    ; Save the current user index for later use
    mov eax, userCount
    sub eax, ecx
    mov currentUserIndex, eax
    
    ; Load current user's purchase history
    mov esi, OFFSET userDatabase
    imul eax, SIZEOF User
    add esi, eax
    
    ; Copy purchase count
    mov eax, [esi + User.purchaseCount]
    mov purchaseCount, eax
    
    ; Copy purchase history
    mov ecx, eax
    cmp ecx, 0
    je skip_history_copy
    
    lea edi, [esi + User.purchaseHistory]
    mov esi, OFFSET purchaseHistory
    
copy_history_loop:
    mov eax, [edi]
    mov [esi], eax
    add edi, 4
    add esi, 4
    loop copy_history_loop
    
skip_history_copy:
    mov loginSuccess, 1
    mov edx, OFFSET loginSuccessMsg
    call SuccessTextDisplay
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

ChangePassword PROC
    call Clrscr
    mov edx, OFFSET changePassTitle
    call WriteString
    call Crlf
    
    ; Email input for identification
    mov edx, OFFSET promptLoginEmail
    call WriteString
    mov edx, OFFSET inputLoginEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString
    
    ; Find user by email
    mov ecx, userCount
    cmp ecx, 0
    je change_pass_failed
    mov esi, OFFSET userDatabase
    
find_user_loop:
    ; Compare email
    lea edi, [esi + MAX_NAME_LENGTH]  ; Email comes after name
    mov ebx, OFFSET inputLoginEmail
    
check_email_loop:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne next_user_cp
    cmp al, 0
    je user_found
    inc edi
    inc ebx
    jmp check_email_loop
    
next_user_cp:
    add esi, SIZEOF User
    loop find_user_loop
    jmp change_pass_failed
    
user_found:
    ; Save the user record pointer for later use
    push esi    ; Save user record pointer
    
    ; Get old password
    mov edx, OFFSET promptOldPass
    call WriteString
    mov edx, OFFSET inputOldPass
    call ReadPasswordWithMask
    
    ; Verify old password
    lea edi, [esi + MAX_NAME_LENGTH + MAX_EMAIL_LENGTH]  ; Password comes after email
    mov ebx, OFFSET inputOldPass
    
check_password_loop:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne old_pass_incorrect
    cmp al, 0
    je old_pass_correct
    inc edi
    inc ebx
    jmp check_password_loop
    
old_pass_correct:
    ; Get new password
    mov edx, OFFSET promptNewPass
    call WriteString
    mov edx, OFFSET inputNewPass
    call ReadPasswordWithMask
    
    ; Copy string from inputNewPass to inputPassword for validation
    push esi
    mov edi, OFFSET inputNewPass
    mov esi, OFFSET inputPassword
    mov ecx, MAX_PASSWORD_LENGTH
copy_password_loop:
    mov al, [edi]
    mov [esi], al
    inc edi
    inc esi
    dec ecx
    cmp al, 0
    je end_copy_password
    cmp ecx, 0
    je end_copy_password
    jmp copy_password_loop
end_copy_password:
    pop esi
    
    call ValidatePassword
    cmp eax, 0
    je old_pass_correct  ; If invalid, try again
    
    ; Confirm new password
    mov edx, OFFSET promptConfirmNewPass
    call WriteString
    mov edx, OFFSET confirmNewPass
    call ReadPasswordWithMask
    
    ; Compare passwords
    mov edi, OFFSET confirmNewPass
    mov ebx, OFFSET inputNewPass
    
confirm_password_loop:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne passwords_mismatch
    cmp al, 0
    je passwords_match
    inc edi
    inc ebx
    jmp confirm_password_loop
    
passwords_match:
    ; Update password in database
    pop ebx     ; Get the saved user record pointer
    lea edi, [ebx + MAX_NAME_LENGTH + MAX_EMAIL_LENGTH]  ; Point to password field
    mov esi, OFFSET inputNewPass    ; Source is the new password
    
update_password_loop:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne update_password_loop
    
    ; Save user data after password change
    call SaveUserData
    
    mov edx, OFFSET passChangeSuccess
    call SuccessTextDisplay
    call WaitForEnter
    ret
    
passwords_mismatch:
    pop ebx     ; Clean up the stack if passwords don't match
    mov edx, OFFSET errorPasswordMismatch
    call InvalidTextDisplay
    jmp old_pass_correct  ; Try again
    
old_pass_incorrect:
    pop ebx     ; Clean up the stack if old password is incorrect
    mov edx, OFFSET passChangeFailure
    call WriteString
    call WaitForEnter
    ret
    
change_pass_failed:
    mov edx, OFFSET loginFailMsg
    call WriteString
    call WaitForEnter
    ret
ChangePassword ENDP

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
    je settings_menu

    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp menu_loop

add_investment:
    call AddInvestment
    jmp menu_loop

remove_investment:
    call RemoveInvestment
    jmp menu_loop

calculator:
    call CalculatorMenu
    jmp menu_loop

settings_menu:
    call Settings
    jmp menu_loop

Menu ENDP

DisplayInvestmentName PROC
    ; EAX contains investment type (1=stock, 2=bond, 3=index)
    ; ESI contains the index
    
    mov ebx, purchaseItems[esi*4]  ; Get item number
    
    cmp eax, 1
    jne check_bond_type
    
    ; It's a stock - display stock name
    cmp ebx, 1
    jne display_stock_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'A'
    mov BYTE PTR [edx+1], 'p'
    mov BYTE PTR [edx+2], 'p'
    mov BYTE PTR [edx+3], 'l'
    mov BYTE PTR [edx+4], 'e'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '('
    mov BYTE PTR [edx+7], 'A'
    mov BYTE PTR [edx+8], 'A'
    mov BYTE PTR [edx+9], 'P'
    mov BYTE PTR [edx+10], 'L'
    mov BYTE PTR [edx+11], ')'
    mov BYTE PTR [edx+12], 0
    jmp display_stock_name
    
display_stock_2:
    cmp ebx, 2
    jne display_stock_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'T'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 's'
    mov BYTE PTR [edx+3], 'l'
    mov BYTE PTR [edx+4], 'a'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '('
    mov BYTE PTR [edx+7], 'T'
    mov BYTE PTR [edx+8], 'S'
    mov BYTE PTR [edx+9], 'L'
    mov BYTE PTR [edx+10], 'A'
    mov BYTE PTR [edx+11], ')'
    mov BYTE PTR [edx+12], 0
    jmp display_stock_name
    
display_stock_3:
    cmp ebx, 3
    jne display_stock_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'i'
    mov BYTE PTR [edx+2], 'c'
    mov BYTE PTR [edx+3], 'r'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 's'
    mov BYTE PTR [edx+6], 'o'
    mov BYTE PTR [edx+7], 'f'
    mov BYTE PTR [edx+8], 't'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'M'
    mov BYTE PTR [edx+12], 'S'
    mov BYTE PTR [edx+13], 'F'
    mov BYTE PTR [edx+14], 'T'
    mov BYTE PTR [edx+15], ')'
    mov BYTE PTR [edx+16], 0
    jmp display_stock_name
    
display_stock_4:
    cmp ebx, 4
    jne display_stock_5
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'N'
    mov BYTE PTR [edx+1], 'V'
    mov BYTE PTR [edx+2], 'I'
    mov BYTE PTR [edx+3], 'D'
    mov BYTE PTR [edx+4], 'I'
    mov BYTE PTR [edx+5], 'A'
    mov BYTE PTR [edx+6], ' '
    mov BYTE PTR [edx+7], '('
    mov BYTE PTR [edx+8], 'N'
    mov BYTE PTR [edx+9], 'V'
    mov BYTE PTR [edx+10], 'D'
    mov BYTE PTR [edx+11], 'A'
    mov BYTE PTR [edx+12], ')'
    mov BYTE PTR [edx+13], 0
    jmp display_stock_name
    
display_stock_5:
    cmp ebx, 5
    jne display_stock_6
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'A'
    mov BYTE PTR [edx+1], 'm'
    mov BYTE PTR [edx+2], 'a'
    mov BYTE PTR [edx+3], 'z'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'n'
    mov BYTE PTR [edx+6], ' '
    mov BYTE PTR [edx+7], '('
    mov BYTE PTR [edx+8], 'A'
    mov BYTE PTR [edx+9], 'M'
    mov BYTE PTR [edx+10], 'Z'
    mov BYTE PTR [edx+11], 'N'
    mov BYTE PTR [edx+12], ')'
    mov BYTE PTR [edx+13], 0
    jmp display_stock_name
    
display_stock_6:
    cmp ebx, 6
    jne display_stock_7
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 't'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], ' '
    mov BYTE PTR [edx+5], '('
    mov BYTE PTR [edx+6], 'M'
    mov BYTE PTR [edx+7], 'E'
    mov BYTE PTR [edx+8], 'T'
    mov BYTE PTR [edx+9], 'A'
    mov BYTE PTR [edx+10], ')'
    mov BYTE PTR [edx+11], 0
    jmp display_stock_name
    
display_stock_7:
    cmp ebx, 7
    jne display_stock_8
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'C'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'c'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], '-'
    mov BYTE PTR [edx+5], 'C'
    mov BYTE PTR [edx+6], 'o'
    mov BYTE PTR [edx+7], 'l'
    mov BYTE PTR [edx+8], 'a'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'K'
    mov BYTE PTR [edx+12], 'O'
    mov BYTE PTR [edx+13], ')'
    mov BYTE PTR [edx+14], 0
    jmp display_stock_name
    
display_stock_8:
    cmp ebx, 8
    jne display_unknown_stock
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'B'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 'r'
    mov BYTE PTR [edx+3], 'k'
    mov BYTE PTR [edx+4], 's'
    mov BYTE PTR [edx+5], 'h'
    mov BYTE PTR [edx+6], 'i'
    mov BYTE PTR [edx+7], 'r'
    mov BYTE PTR [edx+8], 'e'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'B'
    mov BYTE PTR [edx+12], 'R'
    mov BYTE PTR [edx+13], 'K'
    mov BYTE PTR [edx+14], ')'
    mov BYTE PTR [edx+15], 0
    jmp display_stock_name
    
display_unknown_stock:
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'S'
    mov BYTE PTR [edx+1], 't'
    mov BYTE PTR [edx+2], 'o'
    mov BYTE PTR [edx+3], 'c'
    mov BYTE PTR [edx+4], 'k'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '#'
    mov BYTE PTR [edx+7], 0
    call WriteString
    mov eax, ebx
    call WriteDec
    jmp display_done
    
display_stock_name:
    call WriteString
    jmp display_done
    
check_bond_type:
    cmp eax, 2
    jne check_index_type
    
    ; It's a bond - display bond name
    cmp ebx, 1
    jne display_bond_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'U'
    mov BYTE PTR [edx+1], '.'
    mov BYTE PTR [edx+2], 'S'
    mov BYTE PTR [edx+3], ' '
    mov BYTE PTR [edx+4], 'T'
    mov BYTE PTR [edx+5], 'r'
    mov BYTE PTR [edx+6], 'e'
    mov BYTE PTR [edx+7], 'a'
    mov BYTE PTR [edx+8], 's'
    mov BYTE PTR [edx+9], 'u'
    mov BYTE PTR [edx+10], 'r'
    mov BYTE PTR [edx+11], 'y'
    mov BYTE PTR [edx+12], ' '
    mov BYTE PTR [edx+13], 'B'
    mov BYTE PTR [edx+14], 'o'
    mov BYTE PTR [edx+15], 'n'
    mov BYTE PTR [edx+16], 'd'
    mov BYTE PTR [edx+17], 0
    jmp display_stock_name
    
display_bond_2:
    cmp ebx, 2
    jne display_bond_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'u'
    mov BYTE PTR [edx+2], 'n'
    mov BYTE PTR [edx+3], 'i'
    mov BYTE PTR [edx+4], 'c'
    mov BYTE PTR [edx+5], 'i'
    mov BYTE PTR [edx+6], 'p'
    mov BYTE PTR [edx+7], 'a'
    mov BYTE PTR [edx+8], 'l'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], 'B'
    mov BYTE PTR [edx+11], 'o'
    mov BYTE PTR [edx+12], 'n'
    mov BYTE PTR [edx+13], 'd'
    mov BYTE PTR [edx+14], 0
    jmp display_stock_name
    
display_bond_3:
    cmp ebx, 3
    jne display_bond_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'C'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'r'
    mov BYTE PTR [edx+3], 'p'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'r'
    mov BYTE PTR [edx+6], 'a'
    mov BYTE PTR [edx+7], 't'
    mov BYTE PTR [edx+8], 'e'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], 'B'
    mov BYTE PTR [edx+11], 'o'
    mov BYTE PTR [edx+12], 'n'
    mov BYTE PTR [edx+13], 'd'
    mov BYTE PTR [edx+14], 0
    jmp display_stock_name
    
display_bond_4:
    ; Add more bonds as needed
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'B'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'n'
    mov BYTE PTR [edx+3], 'd'
    mov BYTE PTR [edx+4], ' '
    mov BYTE PTR [edx+5], '#'
    mov BYTE PTR [edx+6], 0
    call WriteString
    mov eax, ebx
    call WriteDec
    jmp display_done
    
check_index_type:
    cmp eax, 3
    jne unknown_investment_type
    
    ; It's an index fund - display index name
    cmp ebx, 1
    jne display_index_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'S'
    mov BYTE PTR [edx+1], '&'
    mov BYTE PTR [edx+2], 'P'
    mov BYTE PTR [edx+3], ' '
    mov BYTE PTR [edx+4], '5'
    mov BYTE PTR [edx+5], '0'
    mov BYTE PTR [edx+6], '0'
    mov BYTE PTR [edx+7], 0
    jmp display_stock_name
    
display_index_2:
    cmp ebx, 2
    jne display_index_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'T'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 't'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], 'l'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], 'S'
    mov BYTE PTR [edx+7], 't'
    mov BYTE PTR [edx+8], 'o'
    mov BYTE PTR [edx+9], 'c'
    mov BYTE PTR [edx+10], 'k'
    mov BYTE PTR [edx+11], ' '
    mov BYTE PTR [edx+12], 'M'
    mov BYTE PTR [edx+13], 'a'
    mov BYTE PTR [edx+14], 'r'
    mov BYTE PTR [edx+15], 'k'
    mov BYTE PTR [edx+16], 'e'
    mov BYTE PTR [edx+17], 't'
    mov BYTE PTR [edx+18], 0
    jmp display_stock_name
    
display_index_3:
    cmp ebx, 3
    jne display_index_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'N'
    mov BYTE PTR [edx+1], 'a'
    mov BYTE PTR [edx+2], 's'
    mov BYTE PTR [edx+3], 'd'
    mov BYTE PTR [edx+4], 'a'
    mov BYTE PTR [edx+5], 'q'
    mov BYTE PTR [edx+6], '-'
    mov BYTE PTR [edx+7], '1'
    mov BYTE PTR [edx+8], '0'
    mov BYTE PTR [edx+9], '0'
    mov BYTE PTR [edx+10], 0
    jmp display_stock_name
    
display_index_4:
    ; Add more indexes as needed
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'I'
    mov BYTE PTR [edx+1], 'n'
    mov BYTE PTR [edx+2], 'd'
    mov BYTE PTR [edx+3], 'e'
    mov BYTE PTR [edx+4], 'x'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '#'
    mov BYTE PTR [edx+7], 0
    call WriteString
    mov eax, ebx
    call WriteDec
    jmp display_done
    
unknown_investment_type:
    ; Unknown type - display generic name
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'U'
    mov BYTE PTR [edx+1], 'n'
    mov BYTE PTR [edx+2], 'k'
    mov BYTE PTR [edx+3], 'n'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'w'
    mov BYTE PTR [edx+6], 'n'
    mov BYTE PTR [edx+7], 0
    call WriteString
    
display_done:
    ret
DisplayInvestmentName ENDP

RemoveInvestment PROC
    call Clrscr
    mov edx, OFFSET riPage
    call WriteString
    
    cmp purchaseCount, 0
    je no_investments
    
    ; Ask user how they want to view investments
    mov edx, OFFSET viewInvestmentPrompt
    call WriteString
    call ReadInt
    
    ; Check if valid option (1-4)
    cmp eax, 1
    jl invalid_view_option
    cmp eax, 4
    jg invalid_view_option
    
    ; Store view option (default to 4 - show all)
    mov viewOption, eax
    
    ; Display table header
    mov edx, OFFSET tableHeader
    call WriteString
    
    ; Display each investment in a table row
    mov ecx, purchaseCount
    mov esi, 0
    mov displayCount, 0  ; Reset counter for displayed investments
    
display_history:
    ; Check if we should display this investment based on filter
    cmp viewOption, 4
    je display_investment  ; If option 4, display all investments
    
    ; Otherwise, check if type matches filter
    mov eax, purchaseTypes[esi*4]
    cmp eax, viewOption
    jne skip_display  ; Skip if not matching filter
    
display_investment:
    ; Display row number
    mov edx, OFFSET tableRow
    call WriteString
    mov eax, displayCount
    inc eax
    call WriteDec
    
    ; Store mapping from display index to actual index
    mov ebx, displayCount
    mov displayToActualMap[ebx*4], esi
    inc displayCount
    
    ; Display investment name
    mov edx, OFFSET tableSep1
    call WriteString
    
    ; Get investment type and item
    mov eax, purchaseTypes[esi*4]  ; 1=stock, 2=bond, 3=index
    
    ; Use a different approach to avoid long jumps
    push ecx                       ; Save loop counter
    push esi                       ; Save index
    
    ; Call a helper procedure to display the investment name
    call DisplayInvestmentName
    
    pop esi                        ; Restore index
    pop ecx                        ; Restore loop counter
    
    ; Display quantity
    mov edx, OFFSET tableSep2
    call WriteString
    mov eax, purchaseQuantities[esi*4]
    call WriteDec
    
    ; Display value
    mov edx, OFFSET tableSep3
    call WriteString
    mov eax, purchaseHistory[esi*4]
    call WriteDec
    
    mov edx, OFFSET tableEnd
    call WriteString
    
skip_display:
    inc esi
    dec ecx                        ; Decrement counter manually
    jnz display_history            ; Jump if not zero (replace loop instruction)
    
    ; Check if any investments were displayed
    cmp displayCount, 0
    je no_matching_investments
    
    ; Display table footer
    mov edx, OFFSET tableFooter
    call WriteString
    
    ; Prompt for investment to remove
    call Crlf
    mov edx, OFFSET riPromptChoice
    call WriteString
    
    ; Read choice (number or name)
    mov edx, OFFSET investNameBuffer
    mov ecx, 50
    call ReadString
    

    ; Check if input is a number
    call IsNumber
    cmp eax, 1
    je remove_by_number
    
    ; Find the investment by name
    mov ecx, displayCount
    mov esi, 0
    
find_investment_loop:
    push ecx
    push esi
    
    ; Get actual index from display index
    mov ebx, displayToActualMap[esi*4]
    
    ; Get investment type and item
    mov eax, purchaseTypes[ebx*4]
    mov ebx, purchaseItems[ebx*4]
    
    ; Call helper to get name in stockTemp
    call GetInvestmentName
    
    ; Compare with input name (case-insensitive)
    mov edi, OFFSET investNameBuffer
    mov esi, OFFSET stockTemp
    call CompareStringsIgnoreCase
    
    pop esi
    pop ecx
    
    cmp eax, 0
    je found_investment
    
    inc esi
    loop find_investment_loop
    
    ; Investment not found
    mov edx, OFFSET riError
    call WriteString
    call WaitForEnter
    ret
    
remove_by_number:
    ; Convert string to number
    mov edx, OFFSET investNameBuffer
    call ParseInt
    
    ; Check if number is valid
    cmp eax, 999
    je return_back
    cmp eax, 1
    jl invalid_number
    cmp eax, displayCount
    jg invalid_number
    
    ; Convert display index to actual index
    dec eax  ; Convert from 1-based to 0-based
    mov esi, eax
    mov esi, displayToActualMap[esi*4]
    jmp ask_quantity
    
found_investment:
    ; Get actual index from display index
    mov esi, displayToActualMap[esi*4]
    
ask_quantity:
    ; Ask for quantity to sell
    mov edx, OFFSET riPromptQuantity
    call WriteString
    call ReadInt
    mov sellQuantity, eax
    
    ; Check if quantity is valid
    cmp eax, purchaseQuantities[esi*4]
    jg invalid_quantity
    
    ; If selling all, remove the investment
    cmp eax, purchaseQuantities[esi*4]
    je remove_investment
    
    ; Otherwise, reduce the quantity
    mov eax, purchaseQuantities[esi*4]
    sub eax, sellQuantity
    mov purchaseQuantities[esi*4], eax
    
    ; Recalculate the value - this is where the issue is
    ; We need to get the correct unit price for this investment type and item
    push esi
    
    ; Get investment type and item
    mov eax, purchaseTypes[esi*4]
    mov ebx, purchaseItems[esi*4]
    
    ; Get the correct price based on type and item
    dec ebx  ; Convert from 1-based to 0-based for array indexing
    
    cmp eax, 1
    jne check_bond_price
    ; It's a stock
    imul ebx, 4
    mov eax, stockPrices[ebx]
    jmp got_price
    
check_bond_price:
    cmp eax, 2
    jne check_index_price
    ; It's a bond
    imul ebx, 4
    mov eax, bondPrices[ebx]
    jmp got_price
    
check_index_price:
    ; It's an index
    imul ebx, 4
    mov eax, indexPrices[ebx]
    
got_price:
    mov unitPrice, eax
    pop esi
    
    ; Calculate new total value
    mov eax, unitPrice
    mul purchaseQuantities[esi*4]
    mov purchaseHistory[esi*4], eax
    
    ; Update user database
    call UpdateUserDatabase
    
    mov edx, OFFSET riSuccess
    call SuccessTextDisplay
    call WaitForEnter
    ret
    
invalid_view_option:
    mov edx, OFFSET invalidMsg
    call WriteString
    call WaitForEnter
    ret
    
no_matching_investments:
    mov edx, OFFSET noMatchingInvestments
    call WriteString
    call WaitForEnter
    ret
    
invalid_number:
    mov edx, OFFSET invalidNumberMsg
    call WriteString
    call WaitForEnter
    ret
    
invalid_quantity:
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    ret
    
no_investments:
    mov edx, OFFSET noPurchaseMsg
    call InvalidTextDisplay
    call WaitForEnter
    ret
    
remove_investment:
    ; Remove the investment completely
    ; Shift all investments after this one
    mov ebx, esi
    
shift_investments:
    mov eax, ebx
    inc eax
    cmp eax, purchaseCount
    jge last_investment
    
    ; Copy next investment to current position
    mov ecx, purchaseHistory[eax*4]
    mov purchaseHistory[ebx*4], ecx
    
    mov ecx, purchaseTypes[eax*4]
    mov purchaseTypes[ebx*4], ecx
    
    mov ecx, purchaseItems[eax*4]
    mov purchaseItems[ebx*4], ecx
    
    mov ecx, purchaseQuantities[eax*4]
    mov purchaseQuantities[ebx*4], ecx
    
    inc ebx
    jmp shift_investments
    
last_investment:
    ; Clear the last entry
    mov purchaseHistory[ebx*4], 0
    mov purchaseTypes[ebx*4], 0
    mov purchaseItems[ebx*4], 0
    mov purchaseQuantities[ebx*4], 0
    
    ; Decrement purchase count
    dec purchaseCount
    
    ; Update user database
    call UpdateUserDatabase
    
    mov edx, OFFSET riSuccess
    call SuccessTextDisplay
    call WaitForEnter
    ret

return_back:
    ret

RemoveInvestment ENDP

; Helper to check if a string is a number
IsNumber PROC
    mov esi, OFFSET investNameBuffer
    mov ecx, 0
    
check_digit:
    mov al, [esi]
    cmp al, 0
    je end_check
    
    cmp al, '0'
    jl not_number
    cmp al, '9'
    jg not_number
    
    inc esi
    jmp check_digit
    
not_number:
    mov eax, 0
    ret
    
end_check:
    mov eax, 1
    ret
IsNumber ENDP

; Helper to parse integer from string
ParseInt PROC
    mov esi, OFFSET investNameBuffer
    mov eax, 0
    
parse_loop:
    mov bl, [esi]
    cmp bl, 0
    je parse_done
    
    ; Convert digit
    sub bl, '0'
    
    ; Multiply current result by 10
    mov ecx, eax
    shl eax, 3
    add eax, ecx
    add eax, ecx
    
    ; Add new digit
    movzx ebx, bl
    add eax, ebx
    
    inc esi
    jmp parse_loop
    
parse_done:
    ret
ParseInt ENDP

; Compare strings ignoring case (returns 0 if equal)
; ESI = first string, EDI = second string
CompareStringsIgnoreCase PROC
    push esi
    push edi
    push eax
    push ebx
    
compare_loop_ignore_case:
    mov al, [esi]
    mov bl, [edi]
    
    ; Convert to uppercase if lowercase
    cmp al, 'a'
    jl not_lowercase_al
    cmp al, 'z'
    jg not_lowercase_al
    sub al, 32  ; Convert to uppercase
    
not_lowercase_al:
    cmp bl, 'a'
    jl not_lowercase_bl
    cmp bl, 'z'
    jg not_lowercase_bl
    sub bl, 32  ; Convert to uppercase
    
not_lowercase_bl:
    ; Compare characters
    cmp al, bl
    jne strings_not_equal
    
    ; Check if end of string
    cmp al, 0
    je strings_equal
    
    ; Move to next character
    inc esi
    inc edi
    jmp compare_loop_ignore_case
    
strings_equal:
    mov eax, 0  ; Strings are equal
    jmp compare_done
    
strings_not_equal:
    mov eax, 1  ; Strings are not equal
    
compare_done:
    pop ebx
    pop eax
    pop edi
    pop esi
    ret
CompareStringsIgnoreCase ENDP

GetInvestmentName PROC
    ; EAX contains investment type (1=stock, 2=bond, 3=index)
    ; EBX contains item number
    ; Returns name in stockTemp
    
    cmp eax, 1
    jne check_bond_type_name
    
    ; It's a stock - get stock name
    cmp ebx, 1
    jne get_stock_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'A'
    mov BYTE PTR [edx+1], 'p'
    mov BYTE PTR [edx+2], 'p'
    mov BYTE PTR [edx+3], 'l'
    mov BYTE PTR [edx+4], 'e'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '('
    mov BYTE PTR [edx+7], 'A'
    mov BYTE PTR [edx+8], 'A'
    mov BYTE PTR [edx+9], 'P'
    mov BYTE PTR [edx+10], 'L'
    mov BYTE PTR [edx+11], ')'
    mov BYTE PTR [edx+12], 0
    ret
    
get_stock_2:
    cmp ebx, 2
    jne get_stock_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'T'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 's'
    mov BYTE PTR [edx+3], 'l'
    mov BYTE PTR [edx+4], 'a'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '('
    mov BYTE PTR [edx+7], 'T'
    mov BYTE PTR [edx+8], 'S'
    mov BYTE PTR [edx+9], 'L'
    mov BYTE PTR [edx+10], 'A'
    mov BYTE PTR [edx+11], ')'
    mov BYTE PTR [edx+12], 0
    ret
    
get_stock_3:
    cmp ebx, 3
    jne get_stock_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'i'
    mov BYTE PTR [edx+2], 'c'
    mov BYTE PTR [edx+3], 'r'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 's'
    mov BYTE PTR [edx+6], 'o'
    mov BYTE PTR [edx+7], 'f'
    mov BYTE PTR [edx+8], 't'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'M'
    mov BYTE PTR [edx+12], 'S'
    mov BYTE PTR [edx+13], 'F'
    mov BYTE PTR [edx+14], 'T'
    mov BYTE PTR [edx+15], ')'
    mov BYTE PTR [edx+16], 0
    ret
    
get_stock_4:
    cmp ebx, 4
    jne get_stock_5
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'N'
    mov BYTE PTR [edx+1], 'V'
    mov BYTE PTR [edx+2], 'I'
    mov BYTE PTR [edx+3], 'D'
    mov BYTE PTR [edx+4], 'I'
    mov BYTE PTR [edx+5], 'A'
    mov BYTE PTR [edx+6], ' '
    mov BYTE PTR [edx+7], '('
    mov BYTE PTR [edx+8], 'N'
    mov BYTE PTR [edx+9], 'V'
    mov BYTE PTR [edx+10], 'D'
    mov BYTE PTR [edx+11], 'A'
    mov BYTE PTR [edx+12], ')'
    mov BYTE PTR [edx+13], 0
    ret
    
get_stock_5:
    cmp ebx, 5
    jne get_stock_6
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'A'
    mov BYTE PTR [edx+1], 'm'
    mov BYTE PTR [edx+2], 'a'
    mov BYTE PTR [edx+3], 'z'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'n'
    mov BYTE PTR [edx+6], ' '
    mov BYTE PTR [edx+7], '('
    mov BYTE PTR [edx+8], 'A'
    mov BYTE PTR [edx+9], 'M'
    mov BYTE PTR [edx+10], 'Z'
    mov BYTE PTR [edx+11], 'N'
    mov BYTE PTR [edx+12], ')'
    mov BYTE PTR [edx+13], 0
    ret
    
get_stock_6:
    cmp ebx, 6
    jne get_stock_7
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 't'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], ' '
    mov BYTE PTR [edx+5], '('
    mov BYTE PTR [edx+6], 'M'
    mov BYTE PTR [edx+7], 'E'
    mov BYTE PTR [edx+8], 'T'
    mov BYTE PTR [edx+9], 'A'
    mov BYTE PTR [edx+10], ')'
    mov BYTE PTR [edx+11], 0
    ret
    
get_stock_7:
    cmp ebx, 7
    jne get_stock_8
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'C'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'c'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], '-'
    mov BYTE PTR [edx+5], 'C'
    mov BYTE PTR [edx+6], 'o'
    mov BYTE PTR [edx+7], 'l'
    mov BYTE PTR [edx+8], 'a'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'K'
    mov BYTE PTR [edx+12], 'O'
    mov BYTE PTR [edx+13], ')'
    mov BYTE PTR [edx+14], 0
    ret
    
get_stock_8:
    cmp ebx, 8
    jne get_unknown_stock
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'B'
    mov BYTE PTR [edx+1], 'e'
    mov BYTE PTR [edx+2], 'r'
    mov BYTE PTR [edx+3], 'k'
    mov BYTE PTR [edx+4], 's'
    mov BYTE PTR [edx+5], 'h'
    mov BYTE PTR [edx+6], 'i'
    mov BYTE PTR [edx+7], 'r'
    mov BYTE PTR [edx+8], 'e'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], '('
    mov BYTE PTR [edx+11], 'B'
    mov BYTE PTR [edx+12], 'R'
    mov BYTE PTR [edx+13], 'K'
    mov BYTE PTR [edx+14], ')'
    mov BYTE PTR [edx+15], 0
    ret
    
get_unknown_stock:
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'S'
    mov BYTE PTR [edx+1], 't'
    mov BYTE PTR [edx+2], 'o'
    mov BYTE PTR [edx+3], 'c'
    mov BYTE PTR [edx+4], 'k'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '#'
    mov BYTE PTR [edx+7], 0
    ret
    
check_bond_type_name:
    cmp eax, 2
    jne check_index_type_name
    
    ; It's a bond - get bond name
    cmp ebx, 1
    jne get_bond_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'U'
    mov BYTE PTR [edx+1], '.'
    mov BYTE PTR [edx+2], 'S'
    mov BYTE PTR [edx+3], ' '
    mov BYTE PTR [edx+4], 'T'
    mov BYTE PTR [edx+5], 'r'
    mov BYTE PTR [edx+6], 'e'
    mov BYTE PTR [edx+7], 'a'
    mov BYTE PTR [edx+8], 's'
    mov BYTE PTR [edx+9], 'u'
    mov BYTE PTR [edx+10], 'r'
    mov BYTE PTR [edx+11], 'y'
    mov BYTE PTR [edx+12], ' '
    mov BYTE PTR [edx+13], 'B'
    mov BYTE PTR [edx+14], 'o'
    mov BYTE PTR [edx+15], 'n'
    mov BYTE PTR [edx+16], 'd'
    mov BYTE PTR [edx+17], 0
    ret
    
get_bond_2:
    cmp ebx, 2
    jne get_bond_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'M'
    mov BYTE PTR [edx+1], 'u'
    mov BYTE PTR [edx+2], 'n'
    mov BYTE PTR [edx+3], 'i'
    mov BYTE PTR [edx+4], 'c'
    mov BYTE PTR [edx+5], 'i'
    mov BYTE PTR [edx+6], 'p'
    mov BYTE PTR [edx+7], 'a'
    mov BYTE PTR [edx+8], 'l'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], 'B'
    mov BYTE PTR [edx+11], 'o'
    mov BYTE PTR [edx+12], 'n'
    mov BYTE PTR [edx+13], 'd'
    mov BYTE PTR [edx+14], 0
    ret
    
get_bond_3:
    cmp ebx, 3
    jne get_bond_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'C'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'r'
    mov BYTE PTR [edx+3], 'p'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'r'
    mov BYTE PTR [edx+6], 'a'
    mov BYTE PTR [edx+7], 't'
    mov BYTE PTR [edx+8], 'e'
    mov BYTE PTR [edx+9], ' '
    mov BYTE PTR [edx+10], 'B'
    mov BYTE PTR [edx+11], 'o'
    mov BYTE PTR [edx+12], 'n'
    mov BYTE PTR [edx+13], 'd'
    mov BYTE PTR [edx+14], 0
    ret
    
get_bond_4:
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'B'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 'n'
    mov BYTE PTR [edx+3], 'd'
    mov BYTE PTR [edx+4], ' '
    mov BYTE PTR [edx+5], '#'
    mov BYTE PTR [edx+6], 0
    ret
    
check_index_type_name:
    cmp eax, 3
    jne get_unknown_investment
    
    ; It's an index fund - get index name
    cmp ebx, 1
    jne get_index_2
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'S'
    mov BYTE PTR [edx+1], '&'
    mov BYTE PTR [edx+2], 'P'
    mov BYTE PTR [edx+3], ' '
    mov BYTE PTR [edx+4], '5'
    mov BYTE PTR [edx+5], '0'
    mov BYTE PTR [edx+6], '0'
    mov BYTE PTR [edx+7], 0
    ret
    
get_index_2:
    cmp ebx, 2
    jne get_index_3
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'T'
    mov BYTE PTR [edx+1], 'o'
    mov BYTE PTR [edx+2], 't'
    mov BYTE PTR [edx+3], 'a'
    mov BYTE PTR [edx+4], 'l'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], 'S'
    mov BYTE PTR [edx+7], 't'
    mov BYTE PTR [edx+8], 'o'
    mov BYTE PTR [edx+9], 'c'
    mov BYTE PTR [edx+10], 'k'
    mov BYTE PTR [edx+11], ' '
    mov BYTE PTR [edx+12], 'M'
    mov BYTE PTR [edx+13], 'a'
    mov BYTE PTR [edx+14], 'r'
    mov BYTE PTR [edx+15], 'k'
    mov BYTE PTR [edx+16], 'e'
    mov BYTE PTR [edx+17], 't'
    mov BYTE PTR [edx+18], 0
    ret
    
get_index_3:
    cmp ebx, 3
    jne get_index_4
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'N'
    mov BYTE PTR [edx+1], 'a'
    mov BYTE PTR [edx+2], 's'
    mov BYTE PTR [edx+3], 'd'
    mov BYTE PTR [edx+4], 'a'
    mov BYTE PTR [edx+5], 'q'
    mov BYTE PTR [edx+6], '-'
    mov BYTE PTR [edx+7], '1'
    mov BYTE PTR [edx+8], '0'
    mov BYTE PTR [edx+9], '0'
    mov BYTE PTR [edx+10], 0
    ret
    
get_index_4:
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'I'
    mov BYTE PTR [edx+1], 'n'
    mov BYTE PTR [edx+2], 'd'
    mov BYTE PTR [edx+3], 'e'
    mov BYTE PTR [edx+4], 'x'
    mov BYTE PTR [edx+5], ' '
    mov BYTE PTR [edx+6], '#'
    mov BYTE PTR [edx+7], 0
    ret
    
get_unknown_investment:
    mov edx, OFFSET stockTemp
    mov BYTE PTR [edx], 'U'
    mov BYTE PTR [edx+1], 'n'
    mov BYTE PTR [edx+2], 'k'
    mov BYTE PTR [edx+3], 'n'
    mov BYTE PTR [edx+4], 'o'
    mov BYTE PTR [edx+5], 'w'
    mov BYTE PTR [edx+6], 'n'
    mov BYTE PTR [edx+7], 0
    ret
GetInvestmentName ENDP

; Helper to update the user database with current purchase information
UpdateUserDatabase PROC
    ; Update user's purchase history
    mov esi, OFFSET userDatabase
    mov eax, currentUserIndex
    imul eax, SIZEOF User
    add esi, eax
    
    ; Update purchase count
    mov eax, purchaseCount
    mov [esi + User.purchaseCount], eax
    
    ; Copy updated purchase history to user record
    mov ecx, eax
    cmp ecx, 0
    je skip_update
    
    mov edi, OFFSET purchaseHistory
    lea esi, [esi + User.purchaseHistory]
    
update_loop:
    mov eax, [edi]
    mov [esi], eax
    add edi, 4
    add esi, 4
    loop update_loop
    
skip_update:
    ; Save user data
    call SaveUserData
    ret
UpdateUserDatabase ENDP

AddInvestment PROC 
    call Clrscr
    mov edx, OFFSET aiPage
    call WriteString

investMenu:
    call Clrscr
    mov edx, OFFSET investment
    call WriteString
    
    mov edx, OFFSET investment_options
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
    call InvalidTextDisplay
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
    call InvalidTextDisplay
    call WaitForEnter
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
    call InvalidTextDisplay
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
    call InvalidTextDisplay
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
    
read_quantity:
    call ReadInt
    mov quantity, eax

    cmp eax, -999
    je purchase_return
    
    ; Check if quantity exceeds maximum limit (1000)
    cmp eax, 1000
    jle quantity_ok
    
    ; If quantity is too large, display error and ask again
    mov edx, OFFSET maxQuantityMsg
    call WriteString
    mov edx, OFFSET promptQuantity
    call WriteString
    jmp read_quantity
    
quantity_ok:
    mov eax, unitPrice
    mul quantity
    mov totalPrice, eax

    call Crlf
    mov edx, OFFSET totalMsg
    call WriteString

    mov eax, totalPrice
    call WriteDec
    call Crlf

    mov esi, OFFSET userDatabase
    mov eax, currentUserIndex
    imul eax, SIZEOF User
    add esi, eax
    
    mov ecx, [esi + User.purchaseCount]
    cmp ecx, 10
    jge skip_history_update
    
    ; Store investment type and item number
    mov eax, investChoice
    mov purchaseTypes[ecx * 4], eax
    mov eax, listingChoice
    mov purchaseItems[ecx * 4], eax
    mov eax, quantity
    mov purchaseQuantities[ecx * 4], eax
    
    lea edi, [esi + User.purchaseHistory]
    mov eax, totalPrice
    mov [edi + ecx * 4], eax
    inc ecx
    mov [esi + User.purchaseCount], ecx
    
    mov purchaseCount, ecx
    mov edi, OFFSET purchaseHistory
    mov eax, totalPrice
    mov [edi + ecx * 4 - 4], eax
    
skip_history_update:
    call SaveUserData
    
    mov edx, OFFSET purchaseConfirm
    call SuccessTextDisplay

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
    mov edx, OFFSET calPage
    call WriteString
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
    call InvalidTextDisplay
    call WaitForEnter
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

Settings PROC
settings_loop:
    call Clrscr
    mov edx, OFFSET settingsPage
    call WriteString
    
    mov edx, OFFSET settingsOptions
    call WriteString
    
    call ReadInt
    call Crlf
    
    cmp eax, 1
    je delete_account
    cmp eax, 2
    je logout_user
    cmp eax, 3
    je view_information
    cmp eax, 4
    je return_to_menu
    
    ; Invalid option
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp settings_loop
    
delete_account:
    ; Confirm deletion with red text
    mov edx, OFFSET deleteConfirmMsg
    call InvalidTextDisplay  ; This displays text in red
    call ReadChar
    call WriteChar
    call Crlf
    
    cmp al, 'Y'
    je confirm_delete
    cmp al, 'y'
    je confirm_delete
    
    ; User canceled deletion
    jmp settings_loop
    
confirm_delete:
    ; Get the current user index
    mov esi, currentUserIndex
    
    ; Shift all users after this one up by one position
    mov edi, OFFSET userDatabase
    imul eax, esi, SIZEOF User
    add edi, eax  ; Point to current user position
    
    ; Source = next user position
    mov esi, edi
    add esi, SIZEOF User
    
    ; Calculate remaining users to move
    mov ecx, userCount
    dec ecx
    sub ecx, currentUserIndex
    
    ; If there are users to move
    cmp ecx, 0
    jle last_user_delete
    
    ; Calculate bytes to move
    imul eax, ecx, SIZEOF User
    
    ; Move memory (shift users up)
    push ecx
    mov ecx, eax
    rep movsb
    pop ecx
    
last_user_delete:
    ; Decrement user count
    dec userCount
    
    ; Save updated user database
    call SaveUserData
    
    ; Show success message in green
    mov edx, OFFSET accountDeletedMsg
    call SuccessTextDisplay
    call WaitForEnter
    
    ; Return to login page (homepage)
    mov loginSuccess, 0
    call UserPage  ; This will bring user back to login/registration page
    ret
    
logout_user:
    ; Display logout message
    mov edx, OFFSET logoutMsg
    call WriteString
    call WaitForEnter
    
    ; Simply set loginSuccess to 0 to return to login screen
    ; without modifying any user data
    mov loginSuccess, 0
    
    ; Return to login page (homepage)
    call UserPage  ; This will bring user back to login/registration page
    ret
    
view_information:
    call Clrscr
    mov edx, OFFSET viewInfoPage
    call WriteString
    
    ; Get pointer to current user
    mov esi, OFFSET userDatabase
    mov eax, currentUserIndex
    imul eax, SIZEOF User
    add esi, eax

    ; Display user's name
    mov edx, OFFSET viewInfoName
    call WriteString
    mov edx, esi
    ; Name is at the beginning of the structure
    call WriteString
    call Crlf
    call Crlf
    
    ; Display user's email
    mov edx, OFFSET viewInfoEmail
    call WriteString
    lea edx, [esi + MAX_NAME_LENGTH]  ; Email comes after name
    call WriteString
    call Crlf
    
    ; Display user's password
    mov edx, OFFSET viewInfoPassword
    call WriteString
    lea edx, [esi + MAX_NAME_LENGTH + MAX_EMAIL_LENGTH]  ; Password comes after email
    call WriteString
    call Crlf
    call Crlf
    
    ; Wait for user to press Enter
    mov edx, OFFSET continueMsgPrompt
    call WriteString
    call ReadChar
    call Crlf
    
    ; Return to settings menu
    jmp settings_loop
    
return_to_menu:
    ret
    
Settings ENDP

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
    mov eax, 0Ch        ; Bright Red color (12)
    call SetTextColor
    call WriteString
    mov eax, 07h        ; Reset to default color (white)
    call SetTextColor
    ret
InvalidTextDisplay ENDP

; New procedure for success messages
SuccessTextDisplay PROC
    mov eax, 0Ah        ; Bright Green color (10)
    call SetTextColor
    call WriteString
    mov eax, 07h        ; Reset to default color (white)
    call SetTextColor
    ret
SuccessTextDisplay ENDP

main PROC
    call LoadUserData
    
    call UserPage
    call Menu
    
    call SaveUserData
    exit
main ENDP
END main