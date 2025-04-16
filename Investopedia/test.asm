INCLUDE Irvine32.inc  

; Data Section - Organized by Type and Alphabetized
.DATA
    ; Account File
    accountfile BYTE "accounts.txt", 0
    accounthandle DWORD ?

    ; Buffers
    fileBuffer BYTE 1024 DUP(0)    ; Buffer for reading file contents
    fileContent BYTE 80 DUP(0)     ; File writing buffer
    password BYTE 20 DUP(0)        ; Password input buffer
    tempPassword BYTE 20 DUP(0)    ; Temporary password buffer
    tempUsername BYTE 20 DUP(0)    ; Temporary username buffer
    userinput BYTE 2 DUP(0), 0     ; User menu choice buffer
    username BYTE 20 DUP(0)        ; Username input buffer

    ; Byte Counters and Tracking
    bytesRead DWORD ?
    bytesWritten DWORD ?

    ; Debug and Error Messages
    debugMsg BYTE "Processing line: ", 0
    errormsg1 BYTE "INVALID INPUT!", 0
    errormsg2 BYTE "Error opening file!", 0
    readErrMsg BYTE "Error reading from file!", 0
    writeErrMsg BYTE "Error writing to file!", 0

    ; Login State and User Tracking
    currentUser BYTE 20 DUP(0)     ; Stores the username of the current logged-in user
    isLoggedIn BYTE 0               ; 0 = not logged in, 1 = logged in

    ; Menu Messages
    exitprogmsg BYTE "EXITING THE PROGRAM...", 0
    loginFailed BYTE "Login Failed! Username or password incorrect.", 0
    loginSuccess BYTE "Login Successful! Welcome, ", 0
    loginmenumsg BYTE "LOGIN MENU", 0
    loggedInAs BYTE "Logged in as: ", 0
    msgmenuopt1 BYTE "1. LOG IN", 0
    msgmenuopt2 BYTE "2. REGISTER", 0
    msgmenuopt3 BYTE "3. EXIT PROGRAM", 0
    msgmenupromp BYTE "Please Enter Your Option: ", 0
    msgwelc1 BYTE "Welcome to LRroT LRT Train booking system", 0
    registerSuccess BYTE "Registration Successful, Loading Menu Page...", 0
    registermenumsg BYTE "REGISTER MENU: Please Enter Your Details", 0

    ; Prompts
    passwordPrompt BYTE "Enter Password: ", 0
    usernamePrompt BYTE "Enter username: ", 0

    ; Separators and Special Characters
    comma BYTE ",", 0
    newline BYTE 0Dh, 0Ah

.CODE
;------------------
; Main Procedure
;------------------
main:
    CALL Clrscr
    
    ; Initial welcome and menu display
    CALL DisplayWelcomeMessage
    JMP MainMenuLoop

;------------------
; Utility Functions
;------------------
CleanupTempBuffers:
    ; Clear temp username buffer
    MOV edi, OFFSET tempUsername
    MOV ecx, 20
clear_username:
    MOV BYTE PTR [edi], 0
    INC edi
    LOOP clear_username
    
    ; Clear temp password buffer
    MOV edi, OFFSET tempPassword
    MOV ecx, 20
clear_password:
    MOV BYTE PTR [edi], 0
    INC edi
    LOOP clear_password
    
    RET

CompareCredentials:
    ; Compare username
    MOV edi, OFFSET username
    MOV esi, OFFSET tempUsername
compare_username:
    MOV al, [esi]
    MOV bl, [edi]
    CMP al, 0                      ; Check for end of string
    JE check_username_end
    CMP bl, 0                      ; Check for end of string
    JE username_no_match
    CMP al, bl                     ; Compare characters
    JNE username_no_match
    INC esi
    INC edi
    JMP compare_username
    
check_username_end:
    CMP BYTE PTR [edi], 0          ; Make sure we're at the end of both strings
    JNE username_no_match
    
    ; Compare password
    MOV edi, OFFSET password
    MOV esi, OFFSET tempPassword
compare_password:
    MOV al, [esi]
    MOV bl, [edi]
    CMP al, 0                      ; Check for end of string
    JE check_password_end
    CMP bl, 0                      ; Check for end of string
    JNE continue_password
    JMP password_no_match          ; Password lengths don't match
continue_password:
    CMP al, bl                     ; Compare characters
    JNE password_no_match
    INC esi
    INC edi
    JMP compare_password
    
check_password_end:
    CMP BYTE PTR [edi], 0          ; Make sure we're at the end of both strings
    JNE password_no_match
    
    ; Login successful - Set login flag
    MOV isLoggedIn, 1
    
    ; Copy the username to currentUser
    MOV esi, OFFSET username
    MOV edi, OFFSET currentUser
    MOV ecx, 20
copy_current_user:
    MOV al, [esi]
    MOV [edi], al
    CMP al, 0
    JE credentials_match    ; Stop if null terminator is reached
    INC esi
    INC edi
    LOOP copy_current_user
    
credentials_match:
    MOV eax, 1  ; Return success
    RET

username_no_match:
password_no_match:
    MOV eax, 0  ; Return failure
    RET

DisplayWelcomeMessage:
    MOV edx, OFFSET msgwelc1
    CALL WriteString
    CALL Crlf
    
    ; Check if user is logged in and display username if they are
    CMP isLoggedIn, 1
    JNE ret_display_welcome    ; Skip if not logged in
    
    MOV edx, OFFSET loggedInAs
    CALL WriteString
    MOV edx, OFFSET currentUser
    CALL WriteString
    CALL Crlf
    
ret_display_welcome:
    RET

;------------------
; File I/O Functions
;------------------
ProcessCredentials:
process_line:
    ; Check if we reached the end of buffer
    MOV al, [esi]
    CMP al, 0
    JE verify_credentials
    
    ; Cleanup temporary buffers
    CALL CleanupTempBuffers
    
    ; Extract username
    MOV edi, OFFSET tempUsername
extract_username:
    MOV al, [esi]
    CMP al, ','                    ; Check for username-password separator
    JE username_done
    CMP al, 0                      ; Check for end of buffer
    JE verify_credentials
    CMP al, 0Dh                    ; Check for carriage return
    JE next_line
    CMP al, 0Ah                    ; Check for line feed
    JE next_line
    
    MOV [edi], al                  ; Copy character to username buffer
    INC esi
    INC edi
    JMP extract_username
    
username_done:
    INC esi                        ; Skip comma
    
    ; Extract password
    MOV edi, OFFSET tempPassword
extract_password:
    MOV al, [esi]
    CMP al, 0Dh                    ; Check for carriage return
    JE check_credentials
    CMP al, 0Ah                    ; Check for line feed
    JE check_credentials
    CMP al, 0                      ; Check for end of buffer
    JE check_credentials
    
    MOV [edi], al                  ; Copy character to password buffer
    INC esi
    INC edi
    JMP extract_password
    
check_credentials:
    PUSH esi  ; Save current position
    CALL CompareCredentials
    CMP eax, 1
    JE credentials_found
    
    POP esi   ; Restore current position
    
next_line:
    ; Find the next line
    MOV al, [esi]
    CMP al, 0                      ; Check for end of buffer
    JE verify_credentials
    CMP al, 0Dh                    ; Check for CR
    JE skip_cr
    CMP al, 0Ah                    ; Check for LF
    JE skip_lf
    INC esi
    JMP next_line
    
skip_cr:
    INC esi
    MOV al, [esi]
    CMP al, 0Ah                    ; Check if CR is followed by LF
    JNE process_line               ; If not, start processing next line
    INC esi                        ; Skip LF
    JMP process_line               ; Start processing next line
    
skip_lf:
    INC esi                        ; Skip LF
    JMP process_line               ; Start processing next line

credentials_found:
    POP esi   ; Clean up stack
    JMP verify_credentials

verify_credentials:
    RET

;------------------
; Login Functions
;------------------
Login:
    CALL Clrscr
    MOV edx, OFFSET loginmenumsg
    CALL WriteString
    CALL Crlf
    
    ; Get username for login
    MOV edx, OFFSET usernamePrompt
    CALL WriteString
    MOV edx, OFFSET username
    MOV ecx, 19
    CALL ReadString

    ; Get password for login
    MOV edx, OFFSET passwordPrompt
    CALL WriteString
    MOV edx, OFFSET password
    MOV ecx, 19
    CALL ReadString
    
    ; Open and read account file
    INVOKE CreateFile, 
        ADDR accountfile,          ; filename
        GENERIC_READ,              ; mode - read only
        0,                         ; share mode
        0,                         ; security
        OPEN_EXISTING,             ; open only if exists
        FILE_ATTRIBUTE_NORMAL,     ; normal file attribute
        0                          ; template
    
    CMP eax, INVALID_HANDLE_VALUE
    JE login_error_file
    MOV accounthandle, eax
    
    ; Read file contents
    INVOKE ReadFile,
        accounthandle,             ; file handle
        ADDR fileBuffer,           ; buffer
        SIZEOF fileBuffer - 1,     ; number of bytes to read
        ADDR bytesRead,            ; bytes read
        0                          ; overlapped
        
    CMP eax, 0                     ; Check if read was successful
    JE login_error_read
    
    ; Null-terminate the buffer
    MOV edi, OFFSET fileBuffer
    ADD edi, bytesRead
    MOV BYTE PTR [edi], 0
    
    ; Close file
    INVOKE CloseHandle, accounthandle
    
    ; Reset login status
    MOV isLoggedIn, 0
    
    ; Process credentials
    MOV esi, OFFSET fileBuffer     ; Source: file buffer
    CALL ProcessCredentials
    
    ; Check login result
    CMP isLoggedIn, 1
    JE login_success
    
    ; Login failed
    MOV edx, OFFSET loginFailed
    CALL WriteString
    CALL Crlf
    CALL WaitMsg
    RET

login_success:
    MOV edx, OFFSET loginSuccess
    CALL WriteString
    MOV edx, OFFSET currentUser
    CALL WriteString               ; Show the username in the success message
    CALL Crlf
    CALL WaitMsg
    RET

login_error_file:
    MOV edx, OFFSET errormsg2
    CALL WriteString
    CALL Crlf
    CALL WaitMsg
    RET

login_error_read:
    MOV edx, OFFSET readErrMsg
    CALL WriteString
    CALL Crlf
    CALL WaitMsg
    RET

;------------------
; Registration Functions
;------------------
Register:
    CALL Clrscr
    MOV edx, OFFSET registermenumsg
    CALL WriteString
    CALL Crlf
    
    ; Get username
    MOV edx, OFFSET usernamePrompt
    CALL WriteString
    MOV edx, OFFSET username
    MOV ecx, 19
    CALL ReadString

    ; Get password
    MOV edx, OFFSET passwordPrompt
    CALL WriteString
    MOV edx, OFFSET password
    MOV ecx, 19
    CALL ReadString

    ; Open file for writing (Append Mode)
    INVOKE CreateFile, 
        ADDR accountfile,                ; filename
        GENERIC_WRITE,                   ; mode
        0,                               ; share mode
        0,                               ; security
        OPEN_ALWAYS,                     ; open existing or create new
        FILE_ATTRIBUTE_NORMAL,           ; normal file attribute
        0                                ; template
        
    CMP eax, INVALID_HANDLE_VALUE
    JE register_error_file
    MOV accounthandle, eax

    ; Move file pointer to end
    INVOKE SetFilePointer,
        accounthandle,                   ; file handle
        0,                               ; distance low
        0,                               ; distance high
        FILE_END                         ; move method
    
    ; Prepare buffer
    MOV edi, OFFSET fileContent
    MOV ecx, 0  

    ; Copy username
    MOV esi, OFFSET username
copy_username:
    MOV al, [esi]
    CMP al, 0
    JE done_username
    MOV [edi], al
    INC esi
    INC edi
    INC ecx
    JMP copy_username
done_username:

    ; Add comma
    MOV al, ','
    MOV [edi], al
    INC edi
    INC ecx

    ; Copy password
    MOV esi, OFFSET password
copy_password:
    MOV al, [esi]
    CMP al, 0
    JE done_password
    MOV [edi], al
    INC esi
    INC edi
    INC ecx
    JMP copy_password
done_password:

    ; Add newline
    MOV BYTE PTR [edi], 0Dh
    INC edi
    INC ecx
    MOV BYTE PTR [edi], 0Ah
    INC edi
    INC ecx

    ; Write to file
    INVOKE WriteFile,
        accounthandle,                   ; file handle
        ADDR fileContent,                ; buffer
        ecx,                             ; number of bytes
        ADDR bytesWritten,               ; bytes written
        0                                ; overlapped

    ; Close file
    INVOKE CloseHandle, accounthandle

    ; Success message
    MOV edx, OFFSET registerSuccess
    CALL WriteString
    CALL Crlf
    CALL WaitMsg
    RET

register_error_file:
    MOV edx, OFFSET errormsg2
    CALL WriteString
    CALL Crlf
    CALL WaitMsg
    RET

;------------------
; Menu and Navigation Functions
;------------------
MainMenuLoop:
    ; Reset login state
    MOV BYTE PTR userinput, 0
    MOV BYTE PTR userinput+1, 0

    ; Display menu
    MOV edx, OFFSET msgmenuopt1
    CALL WriteString
    CALL Crlf
    MOV edx, OFFSET msgmenuopt2
    CALL WriteString
    CALL Crlf
    MOV edx, OFFSET msgmenuopt3
    CALL WriteString
    CALL Crlf
    MOV edx, OFFSET msgmenupromp
    CALL WriteString

    ; Get user choice
    MOV edx, OFFSET userinput
    MOV ecx, 2
    CALL ReadString
    CMP eax, 0
    JE error_input
    
    MOV al, userinput
    CMP al, '1'
    JE do_login
    CMP al, '2'
    JE do_register
    CMP al, '3'
    JE exit_program
    JMP error_input

do_login:
    CALL Login
    JMP main

do_register:
    CALL Register
    JMP main

;------------------
; Error Handling Functions
;------------------
error_input:
    CALL Crlf
    MOV edx, OFFSET errormsg1
    CALL WriteString
    CALL Crlf
    MOV eax, 1500
    CALL Delay
    JMP main

;------------------
; Program Termination Functions
;------------------
exit_program:
    MOV edx, OFFSET exitprogmsg
    CALL WriteString
    CALL Crlf
    MOV eax, 1500
    CALL Delay
    INVOKE ExitProcess, 0

END main