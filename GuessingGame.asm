; Simple Guessing Game involving User Input
; Continually prompt the user to guess between 0 and 9 until they Guess Correctly; 4
; Program output "Invalid input" when non-digit character is Guessed
; Justin Ho 
; Spring 2022

        .ORIG x3000                  
        AND    R1, R1, #0 ; clear R1
        AND    R2, R2, #0 ; clear R2
        AND    R3, R3, #0 ; clear R3, use Register as count for Guesses
        AND    R4, R4, #0 ; clear R4
        AND    R5, R5, #0 ; clear R5
        AND    R6, R6, #0 ; clear R6, use Register for sum of testing invalid input
        AND    R7, R7, #0 ; clear R7
        
        LD     R1, FOUR   ; store FOUR in R1, 52 DEC
        LD     R5, ZERO   ;
LOOP    LEA    R0, PROMPT ; load the start address of the prompt
        PUTS              ; display the prompt
        GETC              ; read a character placed in R0
        OUT               ; echo the key pressed
        
        ;Test Invalid Input, R5 < 0
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        
        ADD    R6, R5, R0 ; R6 <- R5 + R0
        BRn    NON        ; Branch skip ahead when R6 is Negative
        
        ;Test Invalid Input, R5 > 9
        AND    R6, R6, #0 ; clear R6
        LD     R5, NINE  
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 
        BRp    NON
        
        NOT    R1, R1     ; store the complement into R1
        ADD    R1, R1, #1 ; Complement used to test greater or less than
        ADD    R2, R1, R0 ; R2 <- R1 + R0    
        BRp    yas        ; Branch skip ahead when R2 is Positive
        BRn    large      ; Branch skip ahead when R2 is Negative
        BRz    perfect    ; Branch skip ahead when R2 is Zero
        
        
        ;Invalid Input 
NON     LEA    R0, INVALID 
        PUTS
        AND    R0, R0, #0 ; clear R0
        ADD    R3, R3, #1 ; Increment count when guessed 
        AND    R1, R1, #0 ; clear R1
        AND    R2, R2, #0 ; clear R2
        AND    R5, R5, #0 ; clear R5

        LD     R5, ZERO   ; store ZERO in R5, 48 DEC
        LD     R1, FOUR   ; store FOUR in R1, 52 DEC
        LEA    R0, AGAIN  
        PUTS 
        GETC
        OUT               ; echo the key pressed
        
        ;Test Invalid Input, R5 < 0
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 ; R6 <- R5 + R0
        BRn    NON        ; Branch skip ahead when R6 is Negative
        
        ;Test Invalid Input, R5 > 9
        AND    R6, R6, #0 ; clear R6
        LD     R5, NINE   
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 
        BRp    NON
        
        
        NOT    R1, R1     ; store the complement into R1
        ADD    R1, R1, #1 ; Complement used to test greater or less than
        ADD    R2, R1, R0 ; R2 <- R1 + R0
        BRn    large 
        BRp    yas
        BRz    perfect
        
        
yas     LEA    R0, TOBIG  ; load the start address of the prompt
        PUTS
        AND    R0, R0, #0 ; clear R0
        ADD    R3, R3, #1 ; Increment count when guessed 
        AND    R1, R1, #0 ; clear R1
        AND    R2, R2, #0 ; clear R2
        AND    R5, R5, #0 ; clear R5
        LD     R5, ZERO   ; store ZERO in R5, 48 DEC
        LD     R1, FOUR   ; store FOUR in R1, 52 DEC
        LEA    R0, AGAIN  
        PUTS 
        GETC
        OUT               ; echo the key pressed
        
        ;Test Invalid Input, R5 < 0
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 ; R6 <- R5 + R0
        BRn    NON        ; Branch skip ahead when R6 is Negative
        
        ;Test Invalid Input, R5 > 9
        AND    R6, R6, #0 ; clear R6
        LD     R5, NINE   
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 
        BRp    NON
        
        NOT    R1, R1     ; store the complement into R1
        ADD    R1, R1, #1 ; Complement used to test greater or less than
        ADD    R2, R1, R0 ; R2 <- R1 + R0
        BRn    large 
        BRp    yas
        BRz    perfect
        
            
large   LEA    R0, TOSMALL; load the start address of the prompt
        PUTS
        AND    R0, R0, #0 ; clear R0
        ADD    R3, R3, #1 ; Increment count when guessed wrong
        AND    R1, R1, #0 ; clear R1
        AND    R2, R2, #0 ; clear R2
        AND    R5, R5, #0 ; clear R5
        LD     R1, FOUR   ; store FOUR in R1, 52 DEC
        LD     R5, ZERO   ; store ZERO in R5, 48 DEC
        LEA    R0, AGAIN  ; 
        PUTS 
        GETC
        OUT
        
        ;Test Invalid Input, R5 < 0
        AND    R6, R6, #0 ; clear R6
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1 ; Complement used to test invalid input
        ADD    R6, R5, R0 ; R6 <- R5 + R0
        BRn    NON        ; Branch skip ahead when R6 is Negative
        
        ;Test Invalid Input, R5 > 9
        LD     R5, NINE   
        NOT    R5, R5     ; store the complement into R5
        ADD    R5, R5, #1
        ADD    R6, R5, R0 
        BRp    NON
        
        NOT    R1, R1     ; store the complement into R1
        ADD    R1, R1, #1 ; Complement used to test greater or less than
        ADD    R2, R1, R0 ; R2 <- R1 + R0
        BRn    large 
        BRp    yas
        BRz    perfect
        
perfect LEA    R0, CORRECT; load the start address of the prompt
        ADD    R3, R3, #1 ; Increment count when guessed 
        PUTS
        AND    R0, R0, #0 ; clear R0
        AND    R1, R1, #0 ; clear R1
        AND    R2, R2, #0 ; clear R2
        LD     R4, ZERO   ; store ZERO in R4, 48 DEC
        ADD    R0, R3, R4 ; Add count to R0 but in ASCII
        OUT               ; echo the Count for Guesses
        LEA    R0, AWESOME
        PUTS
        HALT  
            
            
            
             
PROMPT  .STRINGZ "\nGuess a number between 0 and 9: "   
TOSMALL .STRINGZ "\nToo small."
TOBIG   .STRINGZ "\nToo big."
AGAIN   .STRINGZ "\nGuess Again: "
INVALID .STRINGZ "\nInvalid input."
CORRECT .STRINGZ "\nCorrect! You took "
NEXT    .STRINGZ " guess"
AWESOME .STRINGZ " guesses"
FOUR    .FILL x0034 ; hex value for ASCII character 4
ZERO    .FILL x0030 ; hex value for ASCII character 0 
NINE    .FILL x0039 ; hex value for ASCII character 9
        .END