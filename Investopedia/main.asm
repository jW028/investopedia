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
    userPageOptions BYTE "1. Register New Account", 0Dh, 0Ah,
                         "2. Login", 0Dh, 0Ah,
                         "3. Exit", 0Dh, 0Ah, 0Dh, 0Ah,
                         "Enter your choice (1-3): ", 0
                      
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
    loginOptionsMsg    BYTE "1. Login Again", 0Dh, 0Ah,
                        "2. Register New Account", 0Dh, 0Ah,
                        "3. Return Back", 0Dh, 0Ah,
                        "Enter your choice (1-3): ", 0
    changePassTitle   BYTE "||====================================||", 0Dh, 0Ah,
                           "||        CHANGE PASSWORD             ||", 0Dh, 0Ah, 
                           "||====================================||", 0Dh, 0Ah, 0
    promptOldPass     BYTE "Enter your current password: ", 0
    promptNewPass     BYTE "Enter your new password: ", 0
    promptConfirmNewPass BYTE "Confirm your new password: ", 0
    passChangeSuccess BYTE "Password changed successfully!", 0Dh, 0Ah, 0
    passChangeFailure BYTE "Password change failed. Old password incorrect.", 0Dh, 0Ah, 0
    otpValue        DWORD ?          
    otpBuffer       BYTE 10 DUP(0)    
    otpPrompt       BYTE "A verification code has been sent.", 0Dh, 0Ah,
                         "Enter the 6-digit code: ", 0
    otpInvalidMsg   BYTE "Invalid verification code. Please try again.", 0Dh, 0Ah, 0
    otpSuccessMsg   BYTE "Email verified successfully!", 0Dh, 0Ah, 0
    otpEmailMsg     BYTE "Your verification code is: ", 0
    passwordReuseError BYTE "New password cannot be the same as your current password.", 0Dh, 0Ah, 0

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
    userFileName    BYTE "users.txt", 0
    tempFileName    BYTE "temp.txt", 0
    fileHandle      DWORD ?
    tempFileHandle DWORD ?
    bytesWritten    DWORD ?
    bytesRead       DWORD ?
    fileOpenError   BYTE "Error opening file.", 0Dh, 0Ah, 0
    fileWriteError  BYTE "Error writing to file.", 0Dh, 0Ah, 0
    fileReadError   BYTE "Error reading from file.", 0Dh, 0Ah, 0
    fileBuffer BYTE 1024 DUP(0)
    fileContent BYTE 120 DUP(0)
    isLoggedIn BYTE 0
    currentUser BYTE MAX_NAME_LENGTH DUP(0)
    errorDeleteUser BYTE "Error delete user", 0Dh, 0Ah, 0

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
    riPromptQuantity BYTE "Enter quantity to sell: ", 0
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
    calcPromptFees      BYTE "Enter transaction fees: RM", 0
    
    
    calcPromptROI       BYTE "Return of Investment = RM ", 0Ah, 0Dh, 0
    calcPromptII        BYTE "Enter your initial investment: ", 0
    calcResultMsg       BYTE "Calculation Result: RM", 0
    calcPercentMsg      BYTE "Calculation Result: ", 0
    calcFutureMsg       BYTE "Future Value: RM", 0
    calcProfitLossMsg   BYTE "(RM+XXXX = Profit / RM-XXXX = Loss)", 0Dh, 0Ah,
                             "The total profit or loss: RM", 0
    calcInitialInvestmentMsg    BYTE "Your initial investment is: ", 0
    
    settingsPage BYTE "||====================================||", 0Dh, 0Ah,
                      "||             SETTINGS               ||", 0Dh, 0Ah, 
                      "||====================================||", 0Dh, 0Ah, 0
    settingsOptions BYTE "1. Logout", 0Dh, 0Ah,
                     "2. View Information", 0Dh, 0Ah,
                     "3. Back to Main Menu", 0Dh, 0Ah, 0Dh, 0Ah,
                     "Enter your choice (1-3): ", 0
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

    stockInfo BYTE 0Dh, 0Ah, "Investment: Stocks / Equities", 0Dh, 0Ah
            BYTE "Risk Level: Medium - High", 0Dh, 0Ah
            BYTE "Description: Higher risk, higher potential returns. Suitable for long-term investors.", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: RM1,000", 0Dh, 0Ah, 0

    bondInfo BYTE 0Dh, 0Ah, "Investment: Bonds", 0Dh, 0Ah
            BYTE "Risk Level: Medium - Low", 0Dh, 0Ah
            BYTE "Description: Lower risk, moderate returns. Suitable for medium to long-term investors (3+ years).", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: RM500", 0Dh, 0Ah, 0

    indexInfo BYTE 0Dh, 0Ah, "Investment: Index Funds", 0Dh, 0Ah
            BYTE "Risk Level: Medium", 0Dh, 0Ah
            BYTE "Description: Moderate risk, good diversification. Suitable for long-term investors (5+ years).", 0Dh, 0Ah
            BYTE "Recommended Starting Capital: RM1,000", 0Dh, 0Ah, 0

    stockNames BYTE "Apple (AAPL)                   ", 0
               BYTE "Tesla (TSLA)                   ", 0
               BYTE "Microsoft (MSFT)               ", 0
               BYTE "NVIDIA (NVDA)                  ", 0
               BYTE "Amazon (AMZN)                  ", 0
               BYTE "Meta (META)                    ", 0
               BYTE "Coca-Cola (KO)                 ", 0
               BYTE "Berkshire (BRK)                ", 0

    bondNames BYTE "U.S. Treasury Bond             ", 0
              BYTE "Municipal Bond                 ", 0
              BYTE "Corporate Bond                 ", 0
              BYTE "High-Yield Bond                ", 0
              BYTE "Government Savings Bond        ", 0
              BYTE "Inflation-Protected Bond       ", 0
              BYTE "Green Bond                     ", 0
              BYTE "Convertible Bond               ", 0

    indexNames BYTE "S&P 500                        ", 0
               BYTE "Total Stock Market             ", 0
               BYTE "Nasdaq-100                     ", 0
               BYTE "Russell 2000                   ", 0
               BYTE "International Index            ", 0
               BYTE "Emerging Markets               ", 0
               BYTE "Dividend Growth                ", 0
               BYTE "Bond Index                     ", 0

    stockNamePtrs DWORD 8 DUP(?)
    bondNamePtrs DWORD 8 DUP(?)
    indexNamePtrs DWORD 8 DUP(?)

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

    tableHeader BYTE "||===========================================================||", 0Dh, 0Ah,
                     "||  #  |       Investment                | Quantity => Value ||", 0Dh, 0Ah,
                     "||===========================================================||", 0Dh, 0Ah, 0
                        
    tableRow BYTE "    ", 0
    tableSep1 BYTE "  | ", 0
    tableSep2 BYTE " | ", 0
    tableSep3 BYTE " => RM", 0
    tableEnd BYTE "    ", 0Dh, 0Ah, 0
    tableFooter BYTE "||===========================================================||", 0Dh, 0Ah, 0
    totalPurchaseMsg BYTE "Total Purchase = RM", 0
    totalPurchase DWORD 0

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

    selectedItemMsg BYTE "You selected: ", 0Dh, 0Ah, "Unit Price: RM", 0
    stockPrices DWORD 145, 210, 340, 820, 175, 500, 60, 525700
    bondPrices DWORD 1000, 5000, 1000, 800, 100, 1000, 1000, 1000
    indexPrices DWORD 420, 260, 380, 170, 70, 45, 80, 80

    promptQuantity BYTE "Enter quantity (-999 to go back): ", 0
    purchaseConfirm BYTE 0Dh, 0Ah, "Purchase successful!", 0Dh, 0Ah, 0
    totalMsg BYTE "Total cost: RM", 0

    price1 DWORD 50
    price2 DWORD 100
    price3 DWORD 200000

    viewInvestmentPrompt BYTE "View investments by:", 0Dh, 0Ah,
                              "1. Stocks", 0Dh, 0Ah,
                              "2. Bonds", 0Dh, 0Ah,
                              "3. Index Funds", 0Dh, 0Ah,
                              "4. All Investments", 0Dh, 0Ah,
                              "Enter your choice (1-4): ", 0
    riPromptChoice BYTE "Enter investment number to sell (9999 to return): ", 0
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
    calcPromptInitialVal BYTE "Your Initial Value: ", 0
    calcPromptFinalVal BYTE "Enter Final Value: ", 0
    calcCAGRMsg         BYTE "The Compound Annual Growth Rate: ", 0
    finalValue DWORD ?
    initialValue DWORD ?
    real100 REAL4 100.0
    resultScaled DWORD ?
    intPart DWORD ?
    decPart DWORD ?


    promptProfit byte "Enter profit amount: RM", 0
    promptInitInvest byte "Enter initial investment amount: RM", 0
    displayROI byte "Return On Investment: ", 0
    errDivZero byte "Error: Cannot divide by zero!", 0


    ;Data for compound interest calc
    
    principalAmount dword ?
	numCompound dword ?
	compoundInterest dword ?

    dot BYTE ".", 0
    calcPromptPrincipal BYTE "Enter principal amount: RM", 0
    calcPromptCompound  BYTE "Enter number of times interest is compounded per year: ", 0
	promptCI BYTE "Compount Interest: RM", 0

    ; Data for input validation
    invalidDigitMsg BYTE "Invalid input (including '-'), please enter digits as input.", 0Dh, 0Ah, 0
    validationBuffer BYTE 16 DUP(0)
    invalidValueRange BYTE "Invalid input. Please enter value between 100 - 100,000,000", 0Dh, 0Ah, 0
    invalidRateYearRange BYTE "Invalid value. Please enter value between 1 - 99", 0Dh, 0Ah, 0

    ; Data for calculator output
    titleFV BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 
                 "          Future Value         ", 0Dh, 0Ah, 
                 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 0Dh, 0Ah,
                 "        PFV x (1 + r) ^ n      ", 0Dh, 0Ah, 0Dh, 0Ah, 0

    titlePL BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 
                 "          Profit / Loss         ", 0Dh, 0Ah, 
                 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah,
                 "       PFV - IV - (TC + BF)     ", 0Dh, 0Ah, 0Dh, 0Ah, 0

    titleROI BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 
                  "   Return on Investment (ROI)   ", 0Dh, 0Ah, 
                  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah,
                  "         (PA / IV) x 100        ", 0Dh, 0Ah, 0Dh, 0Ah, 0
                  

    titleCAGR BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 
                   "   Compound Annual Growth Rate (CAGR)   ", 0Dh, 0Ah, 
                   "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah,
                   "       [(FV / IV) ^ (1 / t)] - 1        ", 0Dh, 0Ah, 0Dh, 0Ah, 0

    titleCI BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah, 
                 "        Compound Interest       ", 0Dh, 0Ah, 
                 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0Dh, 0Ah,
                 "  PR x [1 + (r / n)] ^ (n x t)  ", 0Dh, 0Ah, 0Dh, 0Ah, 0

    displayPFV BYTE         "Portfolio Value         PFV = RM", 0
    displayRate BYTE        "Rate(%)                   r = ", 0
    displayYear BYTE        "Years                     t = ", 0
    displayProfit BYTE      "Profit Amount            PA = RM", 0
    displayInitVal BYTE     "Initial Value            IV = RM", 0
    displayFinalVal BYTE    "Final Value              FV = RM", 0
    displayPA BYTE          "Principal Amount         PR = RM", 0
    displayNumComp1 BYTE    "Number of times interest, n = ", 0
    displayNumComp2 BYTE    "compounded per year    ", 0Dh, 0Ah, 0
    displayTransCost BYTE   "Transaction Cost         TC = RM", 0
    displayBrokeFees BYTE   "Broke Fees               BF = RM", 0

    invalidFinalVal BYTE "Final Value must greater than Initial Value", 0Dh, 0Ah, 0
    errorNameFormat BYTE "Name must be contain alphabets only! ", 0Dh, 0Ah, 0
    errorQuantity BYTE "Invalid quantity, please enter quantity between 1 - 999!", 0Dh, 0Ah, 0
    invalidQuantityMsg BYTE "Invalid quantity, please enter the available amount! ", 0Dh, 0Ah, 0

    emailBuffer BYTE MAX_EMAIL_LENGTH DUP(0)
    passBuffer BYTE MAX_PASSWORD_LENGTH DUP(0)
    nameBuffer BYTE MAX_NAME_LENGTH DUP(0)
    errorLoginFile BYTE "Error open login file", 0Dh, 0Ah, 0
    errorLoginRead BYTE "Error file reading", 0Dh, 0Ah, 0
    invalidLoginEmail BYTE "Invalid login email", 0Dh, 0Ah, 0
    invalidLoginPass BYTE "Invalid login pass", 0Dh, 0Ah , 0
    tempFileContent BYTE 120 DUP(0)

    emailNotExistMsg BYTE "Email does not registered." , 0Dh,0Ah, 0


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

    mov esi, OFFSET inputName
check_char:
    mov al, [esi]
    cmp al, ' '
    je nextChar
    cmp al, 'A'
    jb checkLowercase
    cmp al, 'Z'
    jbe nextChar
    

checkLowercase:
    cmp al, 'a'
    jb invalid_name_format
    cmp al, 'z'
    ja invalid_name_format

nextChar:
    inc esi
    loop check_char
    
    mov eax, 1
    ret

invalid_name:
    mov edx, OFFSET errorNameTooShort
    call InvalidTextDisplay
    mov eax, 0  ; Invalid
    ret

invalid_name_format:
    mov edx, OFFSET errorNameFormat
    call InvalidTextDisplay
    mov eax, 0
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

ValidateLoginEmail PROC USES esi
    mov esi, OFFSET inputLoginEmail
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
ValidateLoginEmail ENDP

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
CopyString PROC
    push eax            ; Save registers we'll modify
    push esi
    push edi
    
copy_loop:
    mov al, [esi]       ; Load byte from source
    mov [edi], al       ; Store byte in destination
    inc esi             ; Move to next source byte
    inc edi             ; Move to next destination byte
    cmp al, 0           ; Check for null terminator
    jne copy_loop       ; Continue if not null
    
    pop edi             ; Restore registers
    pop esi
    pop eax
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
    
    cmp eax, 1  
    je go_to_registration
    cmp eax, 2  
    je go_to_login
    cmp eax, 3
    je exit_program
    
    ; Invalid option
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp user_page_start
    
go_to_registration:
    call registration
    jmp user_page_start
    
go_to_login:
    call Login
    cmp loginSuccess, 1
    je exit_to_menu
    jmp user_page_start

    
exit_program:
    exit
    
exit_to_menu:
    ret
UserPage ENDP


Registration PROC


registration_start:
    call Clrscr
    mov edx, OFFSET registrationtitle
    call WriteString
    call Crlf

input_name:
    mov edx, OFFSET promptName
    call WriteString
    mov edx, OFFSET inputName
    mov ecx, MAX_NAME_LENGTH
    call ReadString
    call ValidateName
    cmp eax, 0
    je input_name

input_email:
    mov edx, OFFSET promptEmail
    call WriteString
    mov edx, OFFSET inputEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString
    call CheckEmailExists
    cmp eax, 0
    je email_existed
    call ValidateEmail
    cmp eax, 1
    jne input_email
    jmp input_password

email_existed:
    mov edx, OFFSET errorEmailExists
    call InvalidTextDisplay
    jmp input_email

input_password:
    mov edx, OFFSET promptPassword
    call WriteString
    mov edx, OFFSET inputPassword
    call ReadPasswordWithMask
    call ValidatePassword
    cmp eax, 0
    je input_password

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
    jmp input_password

password_match:

OTP_verification:    
    ; Generate OTP first for verification
    call GenerateOTP
    
    call Crlf
    mov edx, OFFSET otpEmailMsg
    call WriteString
    mov eax, otpValue
    call WriteDec
    call Crlf
    call Crlf
    
    mov edx, OFFSET otpPrompt
    call WriteString
    mov edx, OFFSET otpBuffer
    mov ecx, 10
    call ReadString
    
    mov edx, OFFSET otpBuffer
    call ParseDecimal
    
    ; Compare with generated OTP
    cmp eax, otpValue
    jne otp_invalid
    
    ; OTP validation successful
    mov edx, OFFSET otpSuccessMsg
    call SuccessTextDisplay
    call Crlf
    jmp save_file


save_file:
    ; Open file for writing
    INVOKE CreateFile,
        ADDR userFileName,
        GENERIC_WRITE,
        0,
        0,
        OPEN_ALWAYS,
        FILE_ATTRIBUTE_NORMAL,
        0

    cmp eax, INVALID_HANDLE_VALUE
    je register_error
    mov fileHandle, eax

    ; Move file pointer to end
    INVOKE SetFilePointer,
        fileHandle,
        0,
        0, 
        FILE_END

    
    mov edi, OFFSET fileContent
    mov ecx, 0

    ; Copy email
    mov esi, OFFSET inputEmail
copy_email:
    mov al, [esi]
    cmp al, 0
    je done_email
    mov [edi], al
    inc esi
    inc edi
    inc ecx
    jmp copy_email

done_email:

    ; Add comma
    mov al, ','
    mov [edi], al
    inc edi
    inc ecx

    ; Copy password
    mov esi, OFFSET inputPassword
copy_password:
    mov al, [esi]
    cmp al, 0
    je done_password
    mov [edi], al
    inc esi
    inc edi
    inc ecx
    jmp copy_password

done_password:

    ; Add comma
    mov al, ','
    mov [edi], al
    inc edi
    inc ecx

    ; Copy name
    mov esi, OFFSET inputName
copy_name:
    mov al, [esi]
    cmp al, 0
    je done_name
    mov [edi], al
    inc esi
    inc edi
    inc ecx
    jmp copy_name

done_name:

    ; Add newline
    mov BYTE PTR [edi], 0Dh
    inc edi
    inc ecx
    mov BYTE PTR [edi], 0Ah
    inc edi
    inc ecx

    ; Write into file
    INVOKE WriteFile,
        filehandle,
        ADDR fileContent,
        ecx,
        ADDR bytesWritten,
        0

    ; Close file
    INVOKE CloseHandle, filehandle

    mov edx, OFFSET regsuccessMsg
    call SuccessTextDisplay
    call WaitForEnter
    ret
  
otp_invalid:
    mov edx, OFFSET otpInvalidMsg
    call InvalidTextDisplay
    call Crlf
register_error:
    mov edx, OFFSET regFailureMsg
    call WriteString
    call Crlf
    call WaitForEnter
    ret


Registration ENDP



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
input_login_email:
    mov edx, OFFSET promptLoginEmail
    call WriteString
    mov edx, OFFSET inputLoginEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString
    call ValidateLoginEmail
    cmp eax, 0
    je input_login_email
    call CheckEmailLoginExists
    cmp eax, 0
    je input_login_pass

    mov edx, OFFSET emailNotExistMsg
    call InvalidTextDisplay
    jmp login_failed

input_login_pass:
    ; Password input
    mov edx, OFFSET promptLoginPass
    call WriteString
    mov edx, OFFSET inputLoginPass
    call ReadPasswordWithMask

    ; Open and read account file
    INVOKE CreateFile, 
        ADDR userFileName,          ; filename
        GENERIC_READ,              ; mode - read only
        0,                         ; share mode
        0,                         ; security
        OPEN_EXISTING,             ; open only if exists
        FILE_ATTRIBUTE_NORMAL,     ; normal file attribute
        0                          ; template

    cmp eax, INVALID_HANDLE_VALUE
    je login_error_file
    mov filehandle, eax

    ; Read file contents
    INVOKE ReadFile,
        filehandle,             ; file handle
        ADDR fileBuffer,           ; buffer
        SIZEOF fileBuffer - 1,     ; number of bytes to read
        ADDR bytesRead,            ; bytes read
        0                          ; overlapped

    cmp eax, 0
    je login_error_read

    mov edi, OFFSET fileBuffer
    add edi, bytesRead
    mov BYTE PTR [edi], 0

    ; Close file
    INVOKE CloseHandle, filehandle

    mov isLoggedIn, 0

    ; Process credentials
    mov esi, OFFSET fileBuffer
    call ProcessCredentials

    ; Check login result
    cmp isLoggedIn, 1
    je login_success

    ; login failed
login_failed:
    call Crlf
    mov edx, OFFSET loginFailMsg
    call InvalidTextDisplay
    call Crlf
    mov edx, OFFSET loginOptionsMsg
    call WriteString
    call ReadInt

    cmp eax, 1
    je login_start
    cmp eax, 2
    je go_to_registration
    cmp eax, 3
    je return_userPage

    
    ; If invalid option, default to try login again
    jmp login_start

    
go_to_registration:
    call Registration
    jmp login_start


login_success:
    mov loginsuccess, 1
    mov edx, OFFSET loginSuccessMsg
    call SuccessTextDisplay
    call WaitForEnter
    ret

login_error_file:
    mov edx, OFFSET errorLoginFile
    call InvalidTextDisplay
    call crlf
    call WaitForEnter
    ret

login_error_read:
    mov edx, OFFSET errorLoginRead
    call InvalidTextDisplay
    call crlf
    call WaitForEnter
    ret

return_userPage:
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
change_pass_start:    
    call Clrscr
    mov edx, OFFSET changePassTitle
    call WriteString
    call Crlf
 
input_email:  
    ; Email input for identification
    mov edx, OFFSET promptLoginEmail
    call WriteString
    mov edx, OFFSET inputEmail
    mov ecx, MAX_EMAIL_LENGTH
    call ReadString
  
    mov edx, OFFSET inputEmail
    call CheckEmailExists
    call writeint
    cmp eax, 0
    je user_found

    mov edx, OFFSET emailNotExistMsg
    call InvalidTextDisplay
    jmp change_pass_failed

    
user_found:
    
    ; Generate OTP first for verification
    call GenerateOTP
    
    call Crlf
    mov edx, OFFSET otpEmailMsg
    call WriteString
    mov eax, otpValue
    call WriteDec
    call Crlf
    call Crlf
    
    mov edx, OFFSET otpPrompt
    call WriteString
    mov edx, OFFSET otpBuffer
    mov ecx, 10
    call ReadString
    
    mov edx, OFFSET otpBuffer
    call ParseDecimal
    
    ; Compare with generated OTP
    cmp eax, otpValue
    jne otp_invalid
    
    ; OTP validation successful
    mov edx, OFFSET otpSuccessMsg
    call SuccessTextDisplay
    call Crlf

prompt_new_pass:
    ; Now prompt for new password
    mov edx, OFFSET promptNewPass
    call WriteString
    mov edx, OFFSET inputNewPass
    call ReadPasswordWithMask

    mov edx, OFFSET inputEmail
    cmp eax, 0
    jmp change_pass_failed

    
    ; Check if new password is same as current password in database
    mov edi, OFFSET passBuffer
    mov ebx, OFFSET inputNewPass
    
check_password_reuse:
    mov al, [edi]
    mov ah, [ebx]
    cmp al, ah
    jne passwords_different
    cmp al, 0
    je password_reused
    inc edi
    inc ebx
    jmp check_password_reuse
    
password_reused:

    mov edx, OFFSET passwordReuseError
    call InvalidTextDisplay
    call Crlf  ; Add a newline for better visibility
    call WaitForEnter  ; Wait for user to acknowledge the error
    jmp prompt_new_pass  ; Try again with a different password
    
passwords_different:
    
    ; Copy string from inputNewPass to inputPassword for validation

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
    je prompt_new_pass
    
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
    call UpdatePassWordInFile

    
    mov edx, OFFSET passChangeSuccess
    call SuccessTextDisplay
    call WaitForEnter
    ret
    
passwords_mismatch:
    pop ebx     ; Clean up the stack if passwords don't match
    mov edx, OFFSET errorPasswordMismatch
    call InvalidTextDisplay
    jmp prompt_new_pass  ; Try again from OTP step
    
otp_invalid:
    mov edx, OFFSET otpInvalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp change_pass_start  ; Return to the beginning of password change
    
change_pass_failed:
    mov edx, OFFSET loginFailMsg
    call WriteString
    call WaitForEnter
    ret
ChangePassword ENDP

GenerateOTP PROC
    ; Get system time for seed
    call GetMseconds
    
    ; Use the current time as a seed
    mov ebx, eax
    
    ; Generate a random number between 100000 and 999999
    mov eax, 900000  ; Range size
    call RandomRange
    add eax, 100000  ; Minimum value
    
    ; Store the OTP
    mov otpValue, eax
    ret
GenerateOTP ENDP


UpdatePasswordInFile PROC
    mov edx, OFFSET userFileName
    call OpenInputFile
    mov fileHandle, eax

    mov edx, OFFSET fileBuffer
    mov ecx, SIZEOF fileBuffer
    call ReadFromFile
    mov bytesRead, eax

    mov eax, fileHandle
    call CLoseFile

    ; Find and modify user's line
    mov esi, OFFSET fileBuffer
    mov edi, OFFSET fileBuffer

find_user_line:
    push esi
    push edi
    mov edi, OFFSET emailBuffer
    call CompareStrings
    pop edi
    pop esi
    cmp eax, 0
    je found_user_line

copy_line:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0Dh
    je line_copied
    cmp al, 0Dh
    je line_copied
    jmp copy_line

line_copied:
    jmp find_user_line

found_user_line:
    mov ecx, 0
copy_email:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    inc ecx
    cmp al, ','
    jne copy_email

skip_old_password:
    mov al, [esi]
    inc esi
    cmp al, ','
    jne skip_old_password
    mov byte ptr [edi], ','
    inc edi

    ;insert new password
    mov esi, OFFSET inputNewPass
copy_new_password:
    mov al, [esi]
    cmp al, 0
    je password_copied
    mov [edi], al
    inc esi
    inc edi
    jmp copy_new_password

password_copied:
    mov byte ptr [edi], ','
    inc edi

skip_to_eol:
    mov al, [esi]
    inc esi
    cmp al, 0Dh
    je copy_rest
    cmp al, 0Ah
    je copy_rest
    jmp skip_to_eol

copy_rest:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne copy_rest

    ; Write modified content back to file
    mov edx, OFFSET userFileName
    call CreateOutputFile
    mov fileHandle, eax

    mov edx, OFFSET fileBuffer
    sub edi, OFFSET fileBuffer
    mov ecx, edi
    call WriteToFile

    mov eax, fileHandle
    call CloseFIle 
    ret

      

UpdatePasswordInFile ENDP





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
    mov ebx, purchaseItems[esi*4]  ; Get item number
    
    cmp eax, 1
    jne check_bond_type
    
    ; It's a stock - display stock name
    cmp ebx, 1
    jl display_stock_generic
    cmp ebx, 8
    jg display_stock_generic
    
    ; Get pointer to stock name - using a different approach
    push ebx
    push esi
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov edx, stockNamePtrs[esi]
    pop esi
    pop ebx
    call WriteString
    jmp display_done
    
display_stock_generic:
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
    
check_bond_type:
    cmp eax, 2
    jne check_index_type
    
    ; It's a bond - display bond name
    cmp ebx, 1
    jl display_bond_generic
    cmp ebx, 8
    jg display_bond_generic
    
    ; Get pointer to bond name - using a different approach
    push ebx
    push esi
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov edx, bondNamePtrs[esi]
    pop esi
    pop ebx
    call WriteString
    jmp display_done
    
display_bond_generic:
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
    jne display_done  ; Just finish if not a known type
    
    ; It's an index - display index name
    cmp ebx, 1
    jl display_index_generic
    cmp ebx, 8
    jg display_index_generic
    
    ; Get pointer to index name - using a different approach
    push ebx
    push esi
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov edx, indexNamePtrs[esi]
    pop esi
    pop ebx
    call WriteString
    jmp display_done
    
display_index_generic:
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
    
display_done:
    ret
DisplayInvestmentName ENDP

RemoveInvestment PROC
    
viewInvestment:    
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
    mov totalPurchase, 0

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
    
    add totalPurchase, eax

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
     
    ; Display total purchase for the filter
    
    mov edx, OFFSET tablerow
    call WriteString
    mov edx, OFFSET totalPurchaseMsg
    call WriteString
    mov eax, totalPurchase
    call WriteDec
    call Crlf

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
    cmp eax, 0
    je invalid_number
    
    
remove_by_number:
    ; Convert string to number
    mov edx, OFFSET investNameBuffer
    call ParseInt
    
    ; Check if number is valid
    cmp eax, 9999
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
    cmp eax, 0
    jle invalid_quantity
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
   
    
    mov edx, OFFSET riSuccess
    call SuccessTextDisplay
    call WaitForEnter
    jmp viewInvestment
    
invalid_view_option:
    mov edx, OFFSET invalidMsg
    call WriteString
    call WaitForEnter
    jmp viewInvestment
    
no_matching_investments:
    mov edx, OFFSET noMatchingInvestments
    call WriteString
    call WaitForEnter
    ret
    
invalid_number:
    mov edx, OFFSET invalidNumberMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp viewInvestment
    
invalid_quantity:
    mov edx, OFFSET invalidQuantityMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp viewInvestment
    
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
    
    
    mov edx, OFFSET riSuccess
    call SuccessTextDisplay
    call WaitForEnter
    jmp viewInvestment

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

ParseDecimal PROC
    mov esi, edx    ; EDX contains the address of the string
    mov eax, 0      ; Initialize result to 0
    
parse_decimal_loop:
    mov bl, [esi]   ; Get current character
    cmp bl, 0       ; Check for end of string
    je parse_decimal_done
    
    ; Check if character is a digit
    cmp bl, '0'
    jl parse_decimal_done
    cmp bl, '9'
    jg parse_decimal_done
    
    ; Convert character to digit
    sub bl, '0'
    
    ; Multiply current result by 10
    mov ecx, eax
    shl eax, 3      ; EAX = EAX * 8
    add eax, ecx    ; EAX = EAX * 9
    add eax, ecx    ; EAX = EAX * 10
    
    ; Add new digit
    movzx ebx, bl
    add eax, ebx
    
    inc esi         ; Move to next character
    jmp parse_decimal_loop
    
parse_decimal_done:
    ret
ParseDecimal ENDP

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

InitializeInvestmentData PROC
    ; Initialize stock name pointers
    mov esi, OFFSET stockNames
    mov ebx, OFFSET stockNamePtrs
    mov ecx, 8  ; 8 stocks
    
init_stock_ptrs:
    mov [ebx], esi
    add ebx, 4
    
    ; Find end of current string (0 terminator)
    push ebx
    push ecx
find_stock_end:
    mov al, [esi]
    inc esi
    cmp al, 0
    jne find_stock_end
    pop ecx
    pop ebx
    
    loop init_stock_ptrs
    
    ; Initialize bond name pointers
    mov esi, OFFSET bondNames
    mov ebx, OFFSET bondNamePtrs
    mov ecx, 8  ; 8 bonds
    
init_bond_ptrs:
    mov [ebx], esi
    add ebx, 4
    
    ; Find end of current string
    push ebx
    push ecx
find_bond_end:
    mov al, [esi]
    inc esi
    cmp al, 0
    jne find_bond_end
    pop ecx
    pop ebx
    
    loop init_bond_ptrs
    
    ; Initialize index name pointers
    mov esi, OFFSET indexNames
    mov ebx, OFFSET indexNamePtrs
    mov ecx, 8  ; 8 indexes
    
init_index_ptrs:
    mov [ebx], esi
    add ebx, 4
    
    ; Find end of current string
    push ebx
    push ecx
find_index_end:
    mov al, [esi]
    inc esi
    cmp al, 0
    jne find_index_end
    pop ecx
    pop ebx
    
    loop init_index_ptrs
    
    ret
InitializeInvestmentData ENDP

GetInvestmentName PROC
    ; EAX = investment type (1=stock, 2=bond, 3=index)
    ; EBX = item number (1-based)
    
    ; Clear stockTemp buffer
    mov edi, OFFSET stockTemp
    mov ecx, 50
    mov al, 0
    rep stosb
    
    ; Reset EDI to start of buffer
    mov edi, OFFSET stockTemp
    
    ; Check investment type
    cmp eax, 1
    jne check_bond_name
    
    ; It's a stock - copy stock name
    cmp ebx, 1
    jl get_stock_generic
    cmp ebx, 8
    jg get_stock_generic
    
    ; Get pointer to stock name - using a different approach
    push ebx
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov esi, stockNamePtrs[esi]
    pop ebx
    
copy_stock_name:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne copy_stock_name
    ret
    
get_stock_generic:
    mov BYTE PTR [edi], 'S'
    mov BYTE PTR [edi+1], 't'
    mov BYTE PTR [edi+2], 'o'
    mov BYTE PTR [edi+3], 'c'
    mov BYTE PTR [edi+4], 'k'
    mov BYTE PTR [edi+5], ' '
    mov BYTE PTR [edi+6], '#'
    mov BYTE PTR [edi+7], 0
    ret
    
check_bond_name:
    cmp eax, 2
    jne check_index_name
    
    ; It's a bond - copy bond name
    cmp ebx, 1
    jl get_bond_generic
    cmp ebx, 8
    jg get_bond_generic
    
    ; Get pointer to bond name - using a different approach
    push ebx
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov esi, bondNamePtrs[esi]
    pop ebx
    
copy_bond_name:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne copy_bond_name
    ret
    
get_bond_generic:
    mov BYTE PTR [edi], 'B'
    mov BYTE PTR [edi+1], 'o'
    mov BYTE PTR [edi+2], 'n'
    mov BYTE PTR [edi+3], 'd'
    mov BYTE PTR [edi+4], ' '
    mov BYTE PTR [edi+5], '#'
    mov BYTE PTR [edi+6], 0
    ret
    
check_index_name:
    cmp eax, 3
    jne get_default_name
    
    ; It's an index - copy index name
    cmp ebx, 1
    jl get_index_generic
    cmp ebx, 8
    jg get_index_generic
    
    ; Get pointer to index name - using a different approach
    push ebx
    mov esi, ebx
    dec esi         ; Convert from 1-based to 0-based
    shl esi, 2      ; Multiply by 4 (same as imul esi, 4)
    mov esi, indexNamePtrs[esi]
    pop ebx
    
copy_index_name:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne copy_index_name
    ret
    
get_index_generic:
    mov BYTE PTR [edi], 'I'
    mov BYTE PTR [edi+1], 'n'
    mov BYTE PTR [edi+2], 'd'
    mov BYTE PTR [edi+3], 'e'
    mov BYTE PTR [edi+4], 'x'
    mov BYTE PTR [edi+5], ' '
    mov BYTE PTR [edi+6], '#'
    mov BYTE PTR [edi+7], 0
    ret
    
get_default_name:
    mov BYTE PTR [edi], 'I'
    mov BYTE PTR [edi+1], 'n'
    mov BYTE PTR [edi+2], 'v'
    mov BYTE PTR [edi+3], 'e'
    mov BYTE PTR [edi+4], 's'
    mov BYTE PTR [edi+5], 't'
    mov BYTE PTR [edi+6], 'm'
    mov BYTE PTR [edi+7], 'e'
    mov BYTE PTR [edi+8], 'n'
    mov BYTE PTR [edi+9], 't'
    mov BYTE PTR [edi+10], 0
    ret
GetInvestmentName ENDP

; Helper to update the user database with current purchase information


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
    je displayStockInfo
    cmp investChoice, 2
    je displayBondInfo
    cmp investChoice, 3
    je displayIndexInfo
    cmp investChoice, 4
    je return_to_menu


    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    mov edx, OFFSET enterMsg
    call ReadChar
    jmp investMenu

return_to_menu:
    ret

displayStockInfo:
    mov edx, OFFSET stockInfo
    call WriteString
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

displayBondInfo:
    mov edx, OFFSET bondInfo
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
    jmp display_bonds_list


invalid_bond_choice:
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp display_bonds_list

displayIndexInfo:
    mov edx, OFFSET indexInfo
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
    jmp display_index_list

invalid_index_choice:
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp display_index_list
AddInvestment ENDP

Purchase PROC

    mov edx, OFFSET promptPurchase
    call WriteString
    call ReadChar
    mov userConfirm, al
    call WriteChar
    call Crlf
    
    ret
Purchase ENDP

purchase_process PROC

read_quantity:
    call Crlf
    mov edx, OFFSET promptQuantity
    call WriteString
   
    call ReadInt
    mov quantity, eax

    cmp eax, -999
    je purchase_return

    cmp eax, 0
    jle invalidQuantity
    
    ; Check if quantity exceeds maximum limit (1000)
    cmp eax, 1000
    jl quantity_ok
    
    ; If quantity is too large, display error and ask again
    mov edx, OFFSET maxQuantityMsg
    call InvalidTextDisplay
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
    
    mov edx, OFFSET purchaseConfirm
    call SuccessTextDisplay

    mov edx, OFFSET enterMsg
    call WriteString
    call ReadChar
    call Crlf
    jmp purchase_return

invalidQuantity:
    mov edx, OFFSET errorQuantity
    call InvalidTextDisplay
    jmp read_quantity

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
    ; Prompt for portfolio value
prompt_port_value:    
    mov edx, OFFSET calcPromptValue
    call WriteString
    call ValidateDigit
    call ValidateValueRange
    cmp eax, 0
    je prompt_port_value
    mov totalPortfolioValue, eax

    ; Prompt for annual interest rate
prompt_rate1:
    call Crlf
    mov edx, OFFSET calcPromptRate
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_rate1

    mov rate, eax

     ; Prompt for number of years
prompt_year1:
    call Crlf
    mov edx, OFFSET calcPromptYears
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_year1
    mov years, eax

    ; Future Value Calculation: FV = PV * (1 + r)^t

    ; Compute (1+r)
    fild rate                      ; Load rate as floating-point
    fld real100                    ; Load 100.0
    fdivp st(1), st(0)             ; rate / 100
    fld1
    fadd                           ; (1 + r)

    ; Compute exponent: t (years)
    fild years                     ; Load years as floating-point

    ; Stack: ST(0)=exponent, ST(1)=base
    fxch						   ; Exchange ST(0) and ST(1)
    call Pow                       ; ST(0) = (1 + r) ^ t

    ; Multiply by PV
    fild totalPortfolioValue
    fmul						   ; PV * (1 + r) ^ t

    ; Scale to 2 decimal places and convert to int
    fld real100
    fmul
    frndint
    fist futureValue

    ; Format to 2 decimal places
    mov eax, futureValue
    mov ebx, 100
    xor edx, edx
    div ebx

    mov intPart, eax
    mov decPart, edx

    ; Display the result
    call Crlf
    mov edx, OFFSET titleFV
    call WriteString

    mov edx, OFFSET displayPFV
    call WriteString
    mov eax, totalPortfolioValue
    call WriteDec
    call Crlf

    mov edx, OFFSET displayRate
    call WriteString
    mov eax, rate
    call WriteDec
    call Crlf

    mov edx, OFFSET displayYear
    call WriteString
    mov eax, years
    call WriteDec
    call Crlf
    
    call Crlf
    mov edx, OFFSET calcFutureMsg
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

    ; Wait for user to continue
    call Crlf
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

    mov edx, OFFSET calcPromptInitialVal
    call WriteString
    mov eax, initial_investment
    call WriteDec

prompt_value1:
    call Crlf
    mov edx, OFFSET calcPromptValue
    call WriteString
    call ValidateDigit                    ; Read total portfolio value
    call ValidateValueRange
    cmp eax, 0
    je prompt_value1
    mov totalPortfolioValue, eax

    mov eax, totalPortfolioValue
    sub eax, initial_investment
    sub eax, fees
    mov profit_loss, eax            ; Store profit/loss result
    
    call Crlf
    mov edx, OFFSET titlePL
    call WriteString

    mov edx, OFFSET displayPFV
    call WriteString
    mov eax, totalPortfolioValue
    call WriteDec

    call Crlf
    mov edx, OFFSET displayInitVal
    call WriteString
    mov eax, initial_investment
    call WriteDec
    call Crlf

    mov edx, OFFSET displayTransCost
    call WriteString
    mov eax, calcTransCost
    call WriteDec
    call Crlf

    mov edx, OFFSET displayBrokeFees
    call WriteString
    mov eax, calcBrokeFees
    call WriteDec
    call Crlf

    call Crlf
    mov edx, OFFSET calcProfitLossMsg
    call WriteString   
    mov eax, profit_loss
    call WriteInt
    call Crlf
    
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
    
    jmp exit_calc

calc_roi:

    ; Input profit
prompt_profit:
    call Crlf
    mov edx, offset promptProfit
    call WriteString
    call ValidateDigit
    call ValidateValueRange
    cmp eax, 0
    je prompt_profit
    mov profit, eax

    ; Input initial investment
prompt_ii1:
    call Crlf
    mov edx, offset promptInitInvest
    call WriteString
    call ValidateDigit
    call ValidateValueRange
    cmp eax, 0
    je prompt_ii1
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
    call Crlf
    mov edx, OFFSET titleROI
    call WriteString

    mov edx, OFFSET displayProfit
    call WriteString
    mov eax, profit
    call WriteDec
    call Crlf

    mov edx, OFFSET displayInitVal
    call WriteString
    mov eax, initialInvest
    call WriteDec
    call Crlf
    
    call Crlf
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
    call InvalidTextDisplay
    call Crlf
    
    jmp exit_calc
    
calc_cagr:
    ; Auto-fill initial_investment from purchaseHistory
    mov ecx, purchaseCount
    cmp ecx, 0
    je no_purchases_cagr        ; If no purchases, skip calculation

    mov edi, OFFSET purchaseHistory
    xor eax, eax                ; Clear EAX to store the sum

sum_loop_cagr:
    add eax, [edi]              ; Add current purchase price to total
    add edi, 4                  ; Move to next purchase entry
    loop sum_loop_cagr

    mov initial_investment, eax ; Save total to initial_investment

    ;Prompt for initial value
prompt_ii2:
    call Crlf
    mov edx, OFFSET calcPromptInitialVal
    call WriteString
    mov eax, initial_investment
    call WriteDec
    mov eax, initial_investment

    
    ;Prompt for Final Value
prompt_final1:
    call Crlf
    mov edx, OFFSET calcPromptFinalVal
    call WriteString
    call ValidateDigit
    call ValidateValueRange
    cmp eax, 0
    je prompt_final1
    mov ebx, initial_investment
    cmp eax, ebx
    ja storeFinalVal

    mov edx, OFFSET invalidFinalVal
    call InvalidTextDisplay
    jmp prompt_final1


storeFinalVal:
    mov finalValue, eax

    ;Prompt for Years
prompt_year2:
    call Crlf
    mov edx, OFFSET calcPromptYears
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_year2
    mov years, eax

    ;Calculation
    fild finalValue
    fild initial_investment
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
    call Crlf
    mov edx, OFFSET titleCAGR
    call WriteString
    
    mov edx, OFFSET displayInitVal
    call WriteString
    mov eax, initial_investment
    call WriteDec
    call Crlf

    mov edx, OFFSET displayFinalVal
    call WriteString
    mov eax, finalValue
    call WriteDec
    call Crlf

    mov edx, OFFSET displayYear
    call WriteString
    mov eax, years
    call WriteDec
    call Crlf

    call Crlf
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

    jmp exit_calc

no_purchases_cagr:
    mov edx, OFFSET noPurchaseMsg
    call WriteString
    jmp exit_calc
    
calc_compound:
    
    ; Input Principal
prompt_pv:
    call Crlf
    mov edx, OFFSET calcPromptPrincipal
    call WriteString
    call ValidateDigit
    call ValidateValueRange
    cmp eax, 0
    je prompt_pv
    mov principalAmount, eax

    ; Input Rate
prompt_rate2:
    call Crlf
    mov edx, OFFSET calcPromptRate
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_rate2
    mov rate, eax

    ; Input Num of Compound
prompt_compound:
    call Crlf
    mov edx, OFFSET calcPromptCompound
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_compound
    mov numCompound, eax

    ; Input Years
prompt_year3:
    call Crlf
    mov edx, OFFSET calcPromptYears
    call WriteString
    call ValidateDigit
    call ValidateRateYearRange
    cmp eax, 0
    je prompt_year3
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
    call Crlf
    mov edx, OFFSET titleCI
    call WriteString

    mov edx, OFFSET displayPA
    call WriteString
    mov eax, principalAmount
    call WriteDec
    call Crlf

    mov edx, OFFSET displayRate
    call WriteString
    mov eax, rate
    call WriteDec
    call Crlf

    mov edx, OFFSET displayNumComp1
    call WriteString
    mov eax, numCompound
    call WriteDec
    call Crlf
    mov edx, OFFSET displayNumComp2
    call WriteString

    mov edx, OFFSET displayYear
    call WriteString
    mov eax, years
    call WriteDec
    call Crlf

    call Crlf
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

SkipZero:
    mov eax, decPart
    call WriteDec
    call Crlf

    
exit_calc:
    call Crlf
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
    je logout_user
    cmp eax, 2
    je view_information
    cmp eax, 3
    je return_to_menu
    
    ; Invalid option
    mov edx, OFFSET invalidMsg
    call InvalidTextDisplay
    call WaitForEnter
    jmp settings_loop
    
    
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
    


    ; Display user's name
    mov edx, OFFSET viewInfoName
    call WriteString
    mov edx, OFFSET nameBuffer
    call WriteString
    call Crlf
    call Crlf
    
    ; Display user's email
    mov edx, OFFSET viewInfoEmail
    call WriteString
    mov edx, OFFSET emailBuffer
    call WriteString
    call Crlf
    
    ; Display user's password
    mov edx, OFFSET viewInfoPassword
    call WriteString
    mov edx, OFFSET passBuffer
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

ValidateDigit PROC

    mov edi, OFFSET validationBuffer
    mov ecx, SIZEOF validationBuffer
    mov al, 0
clearloop:
    mov [edi], al
    inc edi
    loop clearloop

    mov edx, OFFSET validationBuffer
    mov ecx, SIZEOF validationBuffer
    call ReadString

    mov esi, edx
    mov ecx, eax
    jecxz invalid

check_digit:
    mov al, [esi]
    cmp al, '0'
    jb invalid
    cmp al, '9'
    ja invalid
    inc esi
    loop check_digit

    mov esi, edx
    xor eax, eax
    xor ebx, ebx

convertLoop:
    mov bl, [esi]
    cmp bl, 0
    je conversionDone

    mov edx, 10
    mul edx

    sub bl, '0'
    add eax, ebx

    inc esi
    jmp convertLoop

conversionDone:
    ret

invalid:
    mov edx, OFFSET invalidDigitMsg
    call InvalidTextDisplay
    mov eax, 0
    ret

ValidateDigit ENDP

ValidateValueRange PROC
    cmp eax, 0
    je return
    cmp eax, 100
    jb invalid_range
    cmp eax, 100000000
    ja invalid_range

return:
    ret

invalid_range:
    mov edx, OFFSET invalidValueRange
    call InvalidTextDisplay
    mov eax, 0
    ret

ValidateValueRange ENDP

ValidateRateYearRange PROC
    cmp eax, 0
    je return
    cmp eax, 1
    jb invalid_range
    cmp eax, 100
    jae invalid_range

return:
    ret

invalid_range:
    mov edx, OFFSET invalidRateYearRange
    call InvalidTextDisplay
    mov eax, 0
    ret

ValidateRateYearRange ENDP

ValidateAlphabeticInput PROC
    mov ecx, SIZEOF validationBuffer
    mov esi, OFFSET validationBuffer
    cmp ecx, 0
    je invalid

check_char:
    mov al, [esi]
    cmp al, 'A'
    jb checkLowercase
    cmp al, 'Z'
    jbe nextChar

checkLowercase:
    cmp al, 'a'
    jb invalid
    cmp al, 'z'
    ja invalid

nextChar:
    inc esi
    loop check_char

    mov eax, 1
    ret

invalid:
    mov eax, 0
    ret

ValidateAlphabeticInput ENDP


ProcessCredentials PROC
    
process_line:
    ; Check if reached the end of buffer
    mov al, [esi]
    cmp al, 0
    je verify_credentials

    call CleanupTempBuffers

    ; Extract email
    mov edi, OFFSET emailBuffer
extract_email:
    mov al, [esi]
    cmp al, ','
    je email_done
    cmp al, 0
    je verify_credentials
    cmp al, 0Dh
    je next_line
    cmp al, 0Ah
    je next_line

    mov [edi], al
    inc esi
    inc edi
    jmp extract_email

email_done:
    inc esi

    ; Extract password
    mov edi, OFFSET passBuffer
extract_password:
    mov al, [esi]
    cmp al, ','
    je password_done
    cmp al, 0Dh
    je next_line
    cmp al, 0Ah
    je next_line
    cmp al, 0
    je verify_credentials

    mov [edi], al
    inc esi
    inc edi
    jmp extract_password

password_done:
    inc esi

    ; Extract name
    mov edi, OFFSET nameBuffer
extract_name:
    mov al, [esi]
    cmp al, 0Dh
    je check_credentials
    cmp al, 0Ah
    je check_credentials
    cmp al, 0
    je check_credentials

    mov [edi], al
    inc esi
    inc edi
    jmp extract_name

check_credentials:
    push esi
    call CompareCredentials
    cmp eax, 1
    je credentials_found

    pop esi

next_line:
    mov al, [esi]
    cmp al, 0
    je verify_credentials
    cmp al, 0Dh
    je skip_cr
    cmp al, 0Ah
    je skip_lf
    inc esi
    jmp next_line

skip_cr:
    inc esi
    mov al, [esi]
    cmp al, 0Ah
    jne process_line
    inc esi
    jmp process_line

skip_lf:
    inc esi
    jmp process_line

credentials_found:
    pop esi
    jmp verify_credentials

verify_credentials:
    ret
    
invalid_login_email:
    mov edx, OFFSET invalidLoginEmail
    call InvalidTextDisplay
    call WaitForEnter
    ret

invalid_login_pass:
    mov edx, OFFSET invalidLoginPass
    call InvalidTextDisplay
    call WaitForEnter
    ret


ProcessCredentials ENDP

CleanupTempBuffers PROC
    mov edi, OFFSET emailBuffer
    mov ecx, MAX_EMAIL_LENGTH
clear_email:
    mov BYTE PTR [edi], 0
    inc edi
    loop clear_email

    mov edi, OFFSET passBuffer
    mov ecx, MAX_PASSWORD_LENGTH
clear_password:
    mov BYTE PTR [edi], 0
    inc edi
    loop clear_password

    mov edi, OFFSET nameBuffer
    mov ecx, MAX_NAME_LENGTH
clear_name:
    mov BYTE PTR [edi], 0
    inc edi
    loop clear_name
    ret

CleanupTempBuffers ENDP

CompareCredentials PROC
    ; Compare email
    mov edi, OFFSET inputLoginEmail
    mov esi, OFFSET emailBuffer
compare_email:
    mov al, [esi]
    mov bl, [edi]
    cmp al, 0
    je done_email_check
    cmp bl, 0
    je email_no_match
    cmp al, bl
    jne email_no_match
    inc esi
    inc edi
    jmp compare_email

done_email_check:
    cmp BYTE PTR [edi], 0
    jne email_no_match

    ; Compare password
    mov edi, OFFSET inputLoginPass
    mov esi, OFFSET passBuffer
compare_password:
    mov al, [esi]
    mov bl, [edi]
    cmp al, 0
    je done_password_check
    cmp bl, 0
    jne continue_password
    jmp password_no_match
continue_password:
    cmp al, bl
    jne password_no_match
    inc esi
    inc edi
    jmp compare_password

done_password_check:
    cmp BYTE PTR [edi], 0
    jne password_no_match

    mov isLoggedIn, 1

    ; Copy name to currentUser
    mov esi, OFFSET nameBuffer
    mov edi, OFFSET currentUser
copy_current_user:
    mov al, [esi]
    mov [edi], al
    cmp al, 0
    je credentials_match_done
    inc esi
    inc edi
    jmp copy_current_user

credentials_match_done:
    mov eax, 1
    ret

email_no_match:
    mov eax, 0
    ret

password_no_match:
    mov eax, 0
    ret

CompareCredentials ENDP
    
CheckEmailExists PROC
    ; Returns: 
    ;   EAX = 1 if email exists
    ;   EAX = 0 if email doesn't exist
    ;   EAX = -1 on file error

    ; Open file
    INVOKE CreateFile,
        ADDR userFileName,
        GENERIC_READ,
        0,
        0,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        0

    cmp eax, INVALID_HANDLE_VALUE
    je file_error
    mov filehandle, eax

    ; Read file content
    INVOKE ReadFile,
        filehandle,
        ADDR fileBuffer,
        SIZEOF fileBuffer - 1,
        ADDR bytesRead,
        0

    cmp eax, 0
    je read_error

    ; Null-terminate buffer
    mov edi, OFFSET fileBuffer
    add edi, bytesRead
    mov BYTE PTR [edi], 0

    ; Close file
    INVOKE CloseHandle, filehandle

    mov esi, OFFSET fileBuffer  ; Point to start of buffer

check_loop:
    ; Clean email buffer
    mov edi, OFFSET emailBuffer
    mov ecx, MAX_EMAIL_LENGTH
    mov al, 0
    cld
    rep stosb

    ; Extract email (first field before comma)
    mov edi, OFFSET emailBuffer
extract_email:
    mov al, [esi]
    cmp al, ','            
    je compare_current
    cmp al, 0              ; EOF
    je email_not_found
    cmp al, 0Dh            ; CR
    je skip_rest_of_line
    cmp al, 0Ah            ; LF
    je skip_rest_of_line
    
    mov [edi], al          
    inc esi
    inc edi
    jmp extract_email

compare_current:
    ; Save current position (after comma)
    push esi
    
    ; Compare strings
    mov esi, OFFSET emailBuffer
    mov edi, OFFSET inputEmail
compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne compare_fail
    
    ; Check if both strings ended
    cmp al, 0
    je email_found
    
    inc esi
    inc edi
    jmp compare_loop

compare_fail:
    pop esi                ; Restore position after comma
    
    ; Skip rest of the line
skip_rest_of_line:
    mov al, [esi]
    cmp al, 0              ; EOF
    je email_not_found
    cmp al, 0Dh            ; CR
    je handle_line_end
    cmp al, 0Ah            ; LF
    je handle_line_end
    inc esi
    jmp skip_rest_of_line

handle_line_end:
    ; Skip CR/LF
    inc esi
    cmp BYTE PTR [esi-1], 0Dh  ; If it was CR
    jne check_next_line
    cmp BYTE PTR [esi], 0Ah    ; Check for LF after CR
    jne check_next_line
    inc esi                   ; Skip LF if CR+LF
    
check_next_line:
    jmp check_loop

email_found:
    add esp, 4              ; Clean stack (remove saved ESI)
    mov eax, 0             ; Email exists
    ret

email_not_found:
    mov eax, 1            ; Email not found
    ret

file_error:
read_error:
    mov eax, -1            ; Error occurred
    ret

CheckEmailExists ENDP

CheckEmailLoginExists PROC
    ; Returns: 
    ;   EAX = 1 if email exists
    ;   EAX = 0 if email doesn't exist
    ;   EAX = -1 on file error

    ; Open file
    INVOKE CreateFile,
        ADDR userFileName,
        GENERIC_READ,
        0,
        0,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        0

    cmp eax, INVALID_HANDLE_VALUE
    je file_error
    mov filehandle, eax

    ; Read file content
    INVOKE ReadFile,
        filehandle,
        ADDR fileBuffer,
        SIZEOF fileBuffer - 1,
        ADDR bytesRead,
        0

    cmp eax, 0
    je read_error

    ; Null-terminate buffer
    mov edi, OFFSET fileBuffer
    add edi, bytesRead
    mov BYTE PTR [edi], 0

    ; Close file
    INVOKE CloseHandle, filehandle

    mov esi, OFFSET fileBuffer  ; Point to start of buffer

check_loop:
    ; Clean email buffer
    mov edi, OFFSET emailBuffer
    mov ecx, MAX_EMAIL_LENGTH
    mov al, 0
    cld
    rep stosb

    ; Extract email (first field before comma)
    mov edi, OFFSET emailBuffer
extract_email:
    mov al, [esi]
    cmp al, ','            
    je compare_current
    cmp al, 0              ; EOF
    je email_not_found
    cmp al, 0Dh            ; CR
    je skip_rest_of_line
    cmp al, 0Ah            ; LF
    je skip_rest_of_line
    
    mov [edi], al          
    inc esi
    inc edi
    jmp extract_email

compare_current:
    ; Save current position (after comma)
    push esi
    
    ; Compare strings
    mov esi, OFFSET emailBuffer
    mov edi, OFFSET inputLoginEmail
compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne compare_fail
    
    ; Check if both strings ended
    cmp al, 0
    je email_found
    
    inc esi
    inc edi
    jmp compare_loop

compare_fail:
    pop esi                ; Restore position after comma
    
    ; Skip rest of the line
skip_rest_of_line:
    mov al, [esi]
    cmp al, 0              ; EOF
    je email_not_found
    cmp al, 0Dh            ; CR
    je handle_line_end
    cmp al, 0Ah            ; LF
    je handle_line_end
    inc esi
    jmp skip_rest_of_line

handle_line_end:
    ; Skip CR/LF
    inc esi
    cmp BYTE PTR [esi-1], 0Dh  ; If it was CR
    jne check_next_line
    cmp BYTE PTR [esi], 0Ah    ; Check for LF after CR
    jne check_next_line
    inc esi                   ; Skip LF if CR+LF
    
check_next_line:
    jmp check_loop

email_found:
    add esp, 4              ; Clean stack (remove saved ESI)
    mov eax, 0             ; Email exists
    ret

email_not_found:
    mov eax, 1            ; Email not found
    ret

file_error:
read_error:
    mov eax, -1            ; Error occurred
    ret

CheckEmailLoginExists ENDP



CompareEmail PROC
    push esi
    push edi

    mov esi, OFFSET fileBuffer
    mov edi, OFFSET inputLoginEmail

compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, ','
    je check_email_end
    cmp al, 0
    je check_email_end
    cmp al, bl
    jne no_match

    inc esi
    inc edi
    jmp compare_loop

check_email_end:
    cmp byte ptr [edi], 0
    jne no_match

    pop edi
    pop esi
    mov eax, 1
    ret

no_match:
	pop edi
	pop esi
	mov eax, 0
	ret

CompareEmail ENDP




main PROC
    call InitializeInvestmentData
    call LoadUserData
    
    call UserPage
    call Menu
    
    exit
main ENDP
END main