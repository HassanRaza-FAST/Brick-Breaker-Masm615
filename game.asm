.model small
.stack 100h

brick struct
brick_x_cordinate dw 100; 0
brick_y_cordinate dw 100; 2
brick_height dw 5; 4
brick_width dw 30; 6
brick_speed dw 10; 8
brick_health dw 1; 10 --- health is in the factor of 5, 5 health means 1 hit to break, 10 means 2 and so on
brick_level dw 1; 12 --- value changed when score exceeds certain limit, MOV instruction used not incrementer
brick_colour dw 4; 14
brick_level2_flag dw 0 ; 16 --- when it jumps to level2, this flag is turned on, other attributes are only changed if this flag was false, otherwise other attributes would keep getting reset
brick_level3_flag dw 0 ; 18
brick_score dw 0 ;20 
brick_bomb_flag dw 0 ;22
brick_fixed_flag dw 0 ;24
brick ends

.data
bricks brick <50, 50, 20, 30, 10, 1, 1, 4, 0, 0, 5>, <80, 50, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <110, 50, 20, 30, 10, 1, 1, 2, 0, 0, 15>,
<140, 50, 20, 30, 10, 1, 1, 4, 0, 0, 5>, <170, 50, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <200, 50, 20, 30, 10, 1, 1, 2, 0, 0, 15>, 
<230, 50, 20, 30, 10, 1, 1, 4, 0, 0, 5>, <50, 80, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <80, 80, 20, 30, 10, 1, 1, 2, 0, 0, 15>,
<110, 80, 20, 30, 10, 1, 1, 4, 0, 0, 5>, <140, 80, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <170, 80, 20, 30, 10, 1, 1, 4, 0, 0, 5>


bricks1 brick <200, 80, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <230, 80, 20, 30, 10, 1, 1, 2, 0, 0, 15>, <50, 110, 20, 30, 10, 1, 1, 4, 0, 0, 5>,
<80, 110, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <110, 110, 20, 30, 10, 1, 1, 2, 0, 0, 15>, <140, 110, 20, 30, 10, 1, 1, 4, 0, 0, 5>,
<170, 110, 20, 30, 10, 1, 1, 1, 0, 0, 10>, <200, 110, 20, 30, 10, 1, 1, 2, 0, 0, 15>, <230, 110, 20, 30, 10, 1, 1, 4, 0, 0, 5>

org_ball_x_cordinate dw 140
org_ball_y_cordinate dw 150
ball_x_cordinate dw 140 ; initial x cordinate 
ball_y_cordinate dw 150  ; initial y cordinate
ball_radius dw 20
ball_speed_x dw 4 ;used to increment the ball position horizontally
ball_speed_y dw 6 ;used to increment the ball position vertically
time_update db 0 ;used to check if time has been updated
console_w DW 140h ;the width of the window (320 pixels)
console_h DW 0C8h ;the height of the window (200 pixels)
paddle_x_cordinate dw 150;150
paddle_y_cordinate dw 180;195
paddle_height dw 5
paddle_width dw 45
paddle_speed dw 10
user_score dw 0
user_lives db 3
string_user_points db "0$"
string_user_lives db "3$"
game_flag db 1 ;1 means its on, 0 means its off
string_gameover db "GAME OVER$"
string1_gameover db "YOUR SCORE WAS$"
string2_gameover db "PRESS P TO PLAY AGAIN$"
string3_gameover db "PRESS M TO GO TO MAIN MENU$"
string4_gameover db "PRESS E TO EXIT$"
string5_gameover db "PLEASE ENTER YOUR NAME$"
string_menu db "BRICK BREAKER GAME$"
string1_menu db "PRESS P TO PLAY NEW GAME$"
string2_menu db "PRESS E TO EXIT$"
name_string_menu db "PRESS N TO ENTER YOUR NAME$"
count db 0 ;count for number of digits while printing 
current_screen db 0 ;1 is the game, 0 is the menu
;brick_variables = 8; number of variables in brick class
initial_no_of_bricks = 21 ;number of bricks we are starting with 
current_no_of_bricks db initial_no_of_bricks
i dw 0 ;counter for loop
exit_program db 0
score_filename db "ascore.txt$"
file_address dw 0
string db 20 DUP("$")
length_of_string dw 0
temp_digit dw 0
count_of_digit dw 0
game_level db 1
string_game_level db "1$"
prompt_gamelevel db "LEVEL$"
string_gamescore db "SCORE$"
string_live db "LIVES$"
game_level2_flag db 0
game_level3_flag db 0
ball_bomb db 0
ball_bomb_done db 0
more_ball_flag db 0
level_2_screen db 0

spawn_object db 0
despawn_object db 0
object_x_cordinate dw 50 ; initial x cordinate 
object_y_cordinate dw 50  ; initial y cordinate
object_radius dw 30
object_speed_x dw 5 ;used to increment the object position horizontally
object_speed_y dw 8

videoMode db 13h
check db 1
back_colour db 00h    ; the background color
pixelColor db 02h     ; the pixel color 
x_coordinate db 0
y_coordinate db 0
textColor db 0Fh
widthVar dw 0
heightVar dw 0
wallheight db 0
wallwidth db 0
tempx db 0
tempy db 0
text1 db "Your Name:$"
text2 db "Brick-Breaker Game$"
text3 db "1.PLAY GAME$"
text4 db "2.RESUME$"
text5 db "3.INSTRUCTIONS$"
text6 db "3.SCORE BOARD$"
text7 db "4.EXIT GAME$"
text8 db "PRESS A KEY 1-4$"
instruct db "INSTRUCTIONS$"
instruct1 db "1.In this game, the player moves a$"
instruct2 db "  paddle from side to side to hit a$"
instruct3 db "  BALL.$"
instruct4 db "2.The game objective is to eliminate$"
instruct5 db "  all of the BRICKS at the$"
instruct6 db "  top of the screen by hitting them$"
instruct7 db "  with the BALL.$"
instruct8 db "  But if the ball hit the bottom $"
instruct9 db "  ENCLOSURE,the player loses and the $"
instruct10 db "  game ends!$"
instruct11 db "3.To win the game, all the BRICKS must$"
instruct12 db "  be eliminated.$"
instruct13 db "note:PRESS ENTER TO GO BACK$"
username db 20 dup()

.code

main proc
mov ax , @data
mov ds , ax

;call refresh_screen

 mov ah,00h ;set the configuration to video mode
    mov al,13h                   
    int 10h   

measure_time:


    cmp exit_program, 01h
    je exitl

    cmp current_screen, 00h
    je name_menu

    cmp current_screen, 02H
    je instruct_menu

    cmp current_screen, 03h
    je main_menu

    cmp game_flag, 00h
    je game_fin_interface

    mov ah, 2ch
    int 21h

    cmp dl, time_update
    je measure_time ;time is same check again else draw updated stuff
    mov time_update, dl
    
    call refresh_screen
    cmp spawn_object, 1
    je spawn_the_obj
    cont:
    call run_ball
    call draw_ball
    call check_for_collision_with_bricks
    call draw_bricks ;DRAW
    call run_paddle
    call draw_paddle
    call game_interface
    jmp measure_time

    game_fin_interface:
        call game_finish_interface
        jmp measure_time
    main_menu:
        ;call draw_name_menu
        mov ax, 0
        call TurnOnVidMode
        call MainMenu
        ;call draw_menu
        jmp measure_time

    name_menu:
        call TurnOnVidMode
        call SetTheBackground
        call firstPage
        jmp measure_time

    exitl:
        call finish_game
        jmp fin
    spawn_the_obj:
        cmp despawn_object, 1
        je cont
        call run_object
        call draw_object
        jmp cont

    instruct_menu:
    call InstructionsPage
    jmp measure_time

fin:
mov ah, 4ch
int 21h
main endp

draw_object proc
    mov bx, object_radius
    mov cx, object_x_cordinate
    mov dx, object_y_cordinate

    outer:
        push bx
        mov bx, object_radius
    inner:
        mov al, 14
        mov ah, 0ch
        int 10h
        add cx, 1
        sub bx, 1
        cmp bx, 0
        jnz inner
    pop bx
    add dx, 1
    mov cx, object_x_cordinate
    sub bx, 1
    cmp bx, 0
    jnz outer
    ret
draw_object endp

run_object proc


    mov ax, object_speed_y
    add object_y_cordinate, ax
    mov ax, console_h
    sub ax, 10
    cmp object_y_cordinate, ax
    jg object_done
    jmp fin 

    object_done:
    mov despawn_object, 1

    fin:
    ret
run_object endp

draw_ball proc

    mov bx, ball_radius
    mov cx, ball_x_cordinate
    mov dx, ball_y_cordinate

    outer:
        push bx
        mov bx, ball_radius
    inner:
        mov al, 13
        mov ah, 0ch
        int 10h
        add cx, 1
        sub bx, 1
        cmp bx, 0
        jnz inner
    pop bx
    add dx, 1
    mov cx, ball_x_cordinate
    sub bx, 1
    cmp bx, 0
    jnz outer

    cmp more_ball_flag, 0
    je fin

    cmp user_score, 185
    jb fin

    mov bx, ball_radius
    mov cx, ball_x_cordinate
    sub cx, 50
    mov dx, ball_y_cordinate
    sub dx, 50

    outer1:
        push bx
        mov bx, ball_radius
    inner1:
        mov al, 03h
        mov ah, 0ch
        int 10h
        add cx, 1
        sub bx, 1
        cmp bx, 0
        jnz inner1
    pop bx
    add dx, 1
    mov cx, ball_x_cordinate
    sub bx, 1
    cmp bx, 0
    jnz outer1

    fin:
    ret
draw_ball endp

draw_paddle proc
    mov bx, paddle_height
    mov cx, paddle_x_cordinate
    mov dx, paddle_y_cordinate

    outer:
    push bx
    mov bx, paddle_width
    inner:
        mov al, 0eh
        mov ah, 0ch
        int 10h
        add cx, 1
        sub bx, 1
        cmp bx, 0
        jnz inner
    pop bx
    add dx, 1
    mov cx, paddle_x_cordinate
    sub bx, 1
    cmp bx, 0
    jnz outer

    ret
draw_paddle endp

refresh_screen proc               
	
    ; mov ah,00h ;set the configuration to video mode
    ; mov al,13h                   
    ; int 10h    	

    cmp game_level2_flag, 0
    jne level2_s
    cmp game_level3_flag,0 
    jne level3_s

    mov ah,06h
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov dh, 25   ; dh = row
    mov dl, 40     ; dl = col
    MOV BH, 0   ; whiteOnBlue
    INT 10H			
    jmp fin

   
   level2_s:
    mov ah,06h
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov dh, 25   ; dh = row
    mov dl, 40     ; dl = col
    MOV BH, 8  ; whiteOnBlue
    INT 10H	
    jmp fin	

    level3_s:
    mov ah,06h
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov dh, 25   ; dh = row
    mov dl, 40     ; dl = col
    MOV BH, 7  ; whiteOnBlue
    INT 10H	
    jmp fin	
    
fin:
    ret	
refresh_screen endp

run_ball proc
    mov ax, ball_speed_x
    add ball_x_cordinate, ax

    cmp ball_x_cordinate, 05h
    jl reverse_speed_x
    mov ax, console_w
    sub ax, 20
    cmp ball_x_cordinate, ax
    jg reverse_speed_x


    mov ax, ball_speed_y
    sub ball_y_cordinate, ax

    cmp ball_y_cordinate, 00h
    jl reverse_speed_y
    mov ax, console_h
    sub ax, 10
    cmp ball_y_cordinate, ax
    jg newRound   ; decrement the live 
    

    ;check if the is colliding with the paddle

    mov ax, ball_x_cordinate
	add ax, ball_radius
	cmp ax, paddle_x_cordinate
	jng fin  
		
	mov ax, paddle_x_cordinate
	add ax, paddle_width
	cmp ball_x_cordinate,ax
	jnl fin  
		
	mov ax, ball_y_cordinate
	add ax, ball_radius
    ;sub ax, 50
	cmp ax, paddle_y_cordinate
	jng fin  
		
	mov ax, paddle_y_cordinate
	add ax, paddle_height
    ;add ax, 50
	cmp ball_y_cordinate,ax
	jnl fin  
    ;if it reaches this point, the ball is colliding with paddle
	jmp reverse_speed_y
    jmp fin

    reverse_speed_x:
        neg ball_speed_x
        jmp fin
    reverse_speed_y:
        neg ball_speed_y
        jmp fin

    newRound:
        dec user_lives
        call restore_ball_pos
        call update_string_user_lives
        cmp user_lives, 00h
        je gameover
        jmp fin

    gameover:
        mov user_lives, 3
        call update_string_user_lives
        mov game_flag, 0
        jmp fin

    fin:
    ret
run_ball endp

restore_ball_pos proc
    mov ax, org_ball_x_cordinate
    ;mov ax, 50
    mov ball_x_cordinate, ax

    mov ax, org_ball_y_cordinate
    ;mov ax, 50
    mov ball_y_cordinate, ax
    ; now we also want to reverse the direction of the ball in y direction
    neg ball_speed_y

    ret
restore_ball_pos endp

run_paddle proc

    mov ah, 01h
    int 16h
    jz fin ;zero flag = 1 if no key was pressed so simply exit the procedure

    ;else determine which key is pressed
    mov ah, 00h
    int 16h
    cmp al, 'a' ;left arrow
    je move_paddle_left
        ;call do_file_handling
    cmp al, 'd'
    je move_paddle_right
    cmp al, 'p'
    je pause_l
    jmp fin


    move_paddle_left:
    mov ax, paddle_speed
    sub paddle_x_cordinate, ax
    cmp paddle_x_cordinate, 00h
    jl bounce_paddle_leftboundary
    jmp fin

    bounce_paddle_leftboundary:
    mov paddle_x_cordinate, 05h
    jmp fin

    move_paddle_right:
    mov ax, paddle_speed
    add paddle_x_cordinate, ax
    cmp paddle_x_cordinate, 275
    jg bounce_paddle_rightboundary
    jmp fin

    bounce_paddle_rightboundary:
    mov paddle_x_cordinate, 275
    jmp fin

    pause_l:
        call pause_game
        jmp fin

    fin:
    ret
run_paddle endp

pause_game proc

    mov ah,00h ;set the configuration to video mode
    mov al,13h                   
    int 10h    

    call MainMenu

    ; takeagain:
    ; mov ah, 01h
    ; int 16h
    ; jz takeagain
    ; mov ah, 00h
    ; int 16h
    ; cmp al, 'r' 
    ; je fin
    ; cmp al, 'q'
    ; je quit_game
    ; jmp takeagain

    ; quit_game:
    ;     mov exit_program, 01h
    ;     jmp fin

    fin:
    ret
pause_game endp

game_interface proc

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,04h                       ;set row 
    MOV DL,08h						 ;set column
    INT 10h							 

    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX, string_user_lives    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
    INT 21h                        

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,02h                       ;set row 
    MOV DL,1ah						 ;set column
    INT 10h	

    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX, string_gamescore    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
    INT 21h                        

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,02h                       ;set row 
    MOV DL,20h						 ;set column
    INT 10h	


    call calc_score

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,02h                       ;set row 
    MOV DL,0fh						 ;set column
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string 
    INT 21h  

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,02h                       ;set row 
    MOV DL,02h						 ;set column
    INT 10h							 

    MOV AH,09h                       
    LEA DX, prompt_gamelevel    
    INT 21h       

    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,02h                       ;set row 
    MOV DL,08h						 ;set column
    INT 10h							 

    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX, string_game_level    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
    INT 21h   
    
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,04h                       ;set row 
    MOV DL,02h						 ;set column
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string_live    
    INT 21h       

    ret
game_interface endp

update_string_user_lives proc

    XOR AX,AX
    MOV AL, user_lives 
    ADD AL,30h                
    MOV [string_user_lives],AL

    ret
update_string_user_lives endp

update_string_game_level proc

    XOR AX,AX
    MOV AL, game_level
    ADD AL,30h                
    MOV [string_game_level],AL

    ret
update_string_game_level endp


game_finish_interface proc
    call refresh_screen
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,04h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string_gameover    
    INT 21h             

    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,06h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string1_gameover    
    INT 21h  

    MOV AH,02h                    
    MOV BH,00h                      
    mov dh, 06h
    mov dl, 14h
    int 10h

    ;actually this is outputting score
    call calc_score


    MOV AH,02h                    
    MOV BH,00h                      
    mov dh, 08h
    mov dl, 04h
    int 10h

    MOV AH,09h                       
    LEA DX, string2_gameover    
    INT 21h  

    MOV AH,02h                    
    MOV BH,00h                      
    mov dh, 0ah
    mov dl, 04h
    int 10h

    MOV AH,09h                       
    LEA DX, string3_gameover    
    INT 21h  

    
    MOV AH,02h                    
    MOV BH,00h                      
    mov dh, 0ch
    mov dl, 04h
    int 10h

    MOV AH,09h                       
    LEA DX, string4_gameover    
    INT 21h

    MOV AH,02h                    
    MOV BH,00h                      
    mov dh, 0eh
    mov dl, 04h
    int 10h

    MOV AH,09h                       
    LEA DX, string5_gameover    
    INT 21h  

    waitl2:
    mov ah,00h
    int 16h 
    cmp al, 'n'
    jne waitl2

    call do_file_handling

    ;waits for a keystroke and key asci is stored in al register
    waitl:
    mov ah,00h
    int 16h 
    cmp al, 'r'
    je restart_game
    cmp al, 'm'
    je jump_to_menu
    cmp al, 'e'
    je exitl
    jmp waitl

    restart_game:
        mov game_flag, 1
        jmp fin

    jump_to_menu:
        mov game_flag, 0
        mov current_screen, 03h
        jmp fin

    exitl:
        mov exit_program, 01h
        jmp fin

    fin:
    ret
game_finish_interface endp

calc_score proc

    ;MOV AX, 32
    mov ax, user_score
    MOV DX,0

    HERE:
    CMP AX,0
    JE DISP

    MOV BL,10
    DIV BL

    MOV DL,AH
    MOV DH,0
    PUSH DX
    MOV CL,AL
    MOV CH,0
    MOV AX,CX
    INC COUNT
    JMP HERE

    DISP:
    CMP COUNT,0
    JBE EX2
    POP DX
    ADD DL,48
    MOV AH,02H
    INT 21H
    DEC COUNT
    JMP DISP
    Ex2:
    ret
calc_score endp

draw_menu proc
    call refresh_screen

    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,04h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string_menu    
    INT 21h             

    
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,06h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string1_menu    
    INT 21h            

    
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,08h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, string2_menu    
    INT 21h            

;   Check whick key was pressed
    check_key:
    mov ah, 00h
    int 16h
    cmp al, 'p'
    je start_game
    CMP AL,'e'
    JE exit_prog
    jmp check_key

    start_game:
    MOV current_screen,01h
    MOV game_flag,01h
    jmp fin

    exit_prog:
    mov exit_program, 01h
    jmp fin

    fin:
    ret
draw_menu endp

draw_name_menu proc
    
    call refresh_screen

    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,04h                       
    MOV DL,04h						 
    INT 10h							 

    MOV AH,09h                       
    LEA DX, name_string_menu    
    INT 21h             

    ;Check whick key was pressed
    check_key:
    mov ah, 00h
    int 16h
    cmp al, 'n'
    je take_input
    jnz check_key

    take_input:

    ; setting the cursor    
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,06h                       
    MOV DL,04h						
    INT 10h							 

        mov si, offset string
        user_input_loop:
            mov ah, 01h
            int 21H
            cmp al, 13
            je stop_taking_username
            mov [si], al
            inc si
            jmp user_input_loop

        stop_taking_username:

        ;we need to find string length which will be passed in cx
        mov si, offset string
        start:
            mov al, [si]
            cmp al, '$'
            je stop_counting
            inc length_of_string
            inc si
            loop start

        stop_counting:
        mov al, ' '
        mov [si], al
        add si, 1 ;from this poistion onwards score will be appended into string
        inc length_of_string

    fin:
    ret
draw_name_menu endp

draw_bricks proc

    mov i, initial_no_of_bricks
    mov si, offset bricks
    ;mov si, 0
    ;mov bx, bricks[si+4]
    ; when I wrote above code, it gave me error that invalid size so it means that bricks[si] is the whole object, so we could have used something like mov di, offset bricks[si]
    outermost:
        mov bx, [si+10] ;move health to bx
        cmp bx, 0
        je skip ;dont draw this brick as health is finished
        mov bx, [si+4]
        mov cx, [si+0]
        mov dx, [si+2]

        outer:
        push bx
        mov bx, [si+6]
        inner:
            mov ax, [si+14]
            mov ah, 0ch
            int 10h
            add cx, 1
            sub bx, 1
            cmp bx, 0
            jnz inner
        pop bx
        add dx, 1
        mov cx, [si+0]
        sub bx, 1
        cmp bx, 0
        jnz outer
    skip:
    add si, type brick
    dec i
    jnz outermost

    ret
draw_bricks endp

check_for_collision_with_bricks proc

    mov i, initial_no_of_bricks
    mov si, offset bricks
    outer:
        mov ax, ball_x_cordinate
        add ax, ball_radius
        cmp ax, [si+0] ;brick_x_cordinate
        jng skip  
            

        mov ax, [si+0] ;brick_x_cordinate
        add ax, [si+6] ;brick_width
        cmp ball_x_cordinate,ax
        jnl skip  
            
        mov ax, ball_y_cordinate
        add ax, ball_radius
        ;sub ax, 50
        cmp ax, [si+2];brick_y_cordinate
        jng skip  
            
        mov ax, [si+2];box_y_cordinate
        add ax, [si+4]; box_height
        cmp ball_y_cordinate,ax
        jnl skip  
        ;if it reaches this point, the ball is colliding with brick
        jmp take_action_after_collision

    skip:
        add si, type brick
        dec i
        jnz outer
    
    jmp fin ;all bricks have been checked

    take_action_after_collision:
        mov ax, [si+10] ;move health
        cmp ax, 0
        ja do_processing ;if the health is above 0 means the brick has not been broken yet
        continue:
        

    jmp fin

    do_processing:
        ; mov ax, ball_x_cordinate
        ; add ax, ball_radius
        ; cmp ax, [si+0] ;brick_x_cordinate
        ; jg reverse_balll_x  
            
            
        ; mov ax, [si+0] ;brick_x_cordinate
        ; add ax, [si+6] ;brick_width
        ; cmp ball_x_cordinate,ax
        ; jl reverse_balll_x
            
        ; mov ax, ball_y_cordinate
        ; add ax, ball_radius
        ; ;sub ax, 50
        ; cmp ax, [si+2];brick_y_cordinate
        ; jg reverse_balll_y  
            
        ; mov ax, [si+2];box_y_cordinate
        ; add ax, [si+4]; box_height
        ; cmp ball_y_cordinate,ax
        ; jl reverse_balll_y

        ; jmp skip1

        ; reverse_balll_x:
        ; neg ball_speed_x
        ; jmp skip1  

        ; reverse_balll_y:
        ; neg ball_speed_y
        ; jmp skip1  


        ;.if()
        ;neg ball_speed_y
        ;neg ball_speed_x



        skip1:
        ; decrement health
        dec ax ;ax contains the health currently
        mov bx, [si+16]
        cmp bx, 0 ;compare level of brick flag, if its zero then do normal processing
        jbe skipl
        ;cmp ax, [si+22] ;compare the new decremented health with the stored health from level1, if they are equal then it means now only 1 hit is needed to destroy ball so change colour now
        cmp ax, 5 ;since i know that my program works like that if brick has health 5, it can break, 
        je updatecolor

        skipl:
        mov [si+10], ax


        ;if I add score here then the health concept is shown, score needs to be initiliazed with value of "1"
        ;mov ax, [si+20]
        ;add user_score, ax
        
        cmp ax, 0 ;brick has been broken
        je updating_incase_of_brickbroken
        innercontinue:

        jmp continue

    updating_incase_of_brickbroken:
    ;if I add score here then score only updated if the brick has been broken, and the score value needs to be initilizaed with orginal score value
    mov ax, [si+20]
    add user_score, ax
    ; if(userscore >= 50 && we have not levelled up before)
    cmp user_score, 50
    jb continuel
    cmp game_level2_flag, 0
    je levelup_totwo
    cmp user_score, 100
    jb continuel
    cmp game_level3_flag, 0
    je levelup_tothree
    ; at this point user score is greater than 100 and we are already at level 3
    continuel2:
    cmp more_ball_flag, 0
    je add_more_ball
    continuel4:
    cmp ball_bomb, 0
    je make_ballbomb
    ;continuel3:
    cmp ball_bomb_done, 1
    ; if we get here then ball_bomb is on so use bomb_ball and turn on the ball_bomb exec flag
    je continuel ;bomb has been done we don't need to call it
    call ball_bombing

    continuel:
    call make_Sound
    dec current_no_of_bricks
    cmp current_no_of_bricks, 0
    je gameover
    jmp innercontinue    

    gameover:
        mov user_lives, 3
        call update_string_user_lives
        ;call do_file_handling
        mov game_flag, 0
        ; MIGHT NEED TO DO MORE PROCESSING BEFORE JUMPING TO FIN
        jmp fin

    levelup_tothree:
        call update_level_three
        jmp continuel

    levelup_totwo:
        call update_level_two
        jmp continuel


    updatecolor:
        ;cmp game_level3_flag, 0
        ;jne skipl ;update colour only on level2
        ;dont use ax register as it had health saved in it
        mov bx, [si+14] ;move colour
        cmp bx, 4 ;it is red colour
        je redcolorupdate
        cmp bx, 1 ;it is blue colour
        je bluecolorupdate
        ;if it has reached this point then it means that it is green colour
        cmp bx, 2
        je greencolorupdate
        jmp skipl

    redcolorupdate:
        mov bx, 12
        mov [si+14], bx
        jmp skipl

    bluecolorupdate:
        mov bx, 9
        mov [si+14], bx
        jmp skipl

    greencolorupdate:
        mov bx, 10
        mov [si+14], bx
        jmp skipl

    make_ballbomb:
        mov ball_bomb, 1
        call making_ball_bomb
        ;take any first occuridng ball which has not been destroyed and make it bomb
        jmp continuel

    add_more_ball:
        mov more_ball_flag, 1
        ; check user score if it is greater than 184 then make all brick health to 1, so they get instantly destroyed
        mov dx, 175
        cmp user_score, dx
        jb continuel4
        mov cx, initial_no_of_bricks
        mov si, offset bricks
        startl:
            mov ax, [si+10]
            cmp ax, 0
            jbe skip2 ;if health is already zero then that brick has been destroyed and we are not concerned with it
            mov ax, 2
            mov [si+10], ax ;double the health becase we are in level2 now
            skip2:
            add si, type brick
            loop startl
        jmp continuel4

    fin:
    ret
check_for_collision_with_bricks endp

ball_bombing proc
    mov ball_bomb_done, 1

    mov cx, initial_no_of_bricks
    mov si, offset bricks
    startl:
        mov ax, [si+10]
        cmp ax, 0
        jbe skip ;if health is already zero then that brick has been destroyed and we are not concerned with it
        ;add ax, 5
        mov ax, 1
        cmp [si+22], ax ;first ball has been activated
        je destroy_5_bricks
        skip:
        add si, type brick
        loop startl

    destroy_5_bricks:
    mov cx, initial_no_of_bricks
    mov si, offset bricks
    mov bx, 0
    start2:
        mov ax, [si+10]
        cmp ax, 0
        jbe skip1 ;if health is already zero then that brick has been destroyed and we are not concerned with it
        mov ax, 0
        mov [si+10], ax ; make the health 0, 
        dec current_no_of_bricks
        mov ax, [si+20]
        add user_score, ax
        inc bx
        cmp bx, 5 ;we destroy 3 bricks
        je fin
        skip1:
        add si, type brick
        loop start2
    jmp fin

fin:
    ret
ball_bombing endp

making_ball_bomb proc
    mov cx, initial_no_of_bricks
    mov si, offset bricks
    startl:
        mov ax, [si+10]
        cmp ax, 0
        jbe skip ;if health is already zero then that brick has been destroyed and we are not concerned with it
        ;add ax, 5
        mov ax, 1
        mov [si+22], ax ;first ball has been activated
        skip:
        add si, type brick
        loop startl
    ret
making_ball_bomb endp

do_file_handling proc

    
    ; setting the cursor    
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,10h                       
    MOV DL,04h						 
    INT 10h							 

        mov si, offset string
        user_input_loop:
            mov ah, 01h
            int 21H
            cmp al, 13
            je stop_taking_username
            mov [si], al
            inc si
            jmp user_input_loop

        stop_taking_username:

        ;we need to find string length which will be passed in cx
        mov si, offset string
        start:
            mov al, [si]
            cmp al, '$'
            je stop_counting
            inc length_of_string
            inc si
            loop start

        stop_counting:
        mov al, ' '
        mov [si], al
        add si, 1 ;from this poistion onwards score will be appended into string
        inc length_of_string


    ;write the scores in text file
    ;first find the digit by digit
    mov ax, user_score
    mov bx, 10

    start_finding_digits:
        inc count_of_digit
        div bl
        add ah, 48
        mov byte ptr temp_digit, ah
        push temp_digit
        mov ah, 0
        cmp ax, 0
        jne start_finding_digits

    mov cx, count_of_digit
    start_adding_digits:
        pop ax
        mov [si], al
        inc si
        inc length_of_string
        loop start_adding_digits


    mov ax, 0
    mov al, ' '
    mov [si], ax
    inc si
    inc length_of_string

    mov ax, 0
    mov al, user_lives
    mov [si], ax
    mov al, 48
    add [si], ax
    inc si
    inc length_of_string

    mov al, 13
    mov [si], al
    inc length_of_string

    ;load file handler
    mov dx,offset score_filename
    mov al,2
    mov ah,3dh
    int 21h

    ;append to a file
    mov bx, ax
    mov cx, 0
    mov ah, 42h
    mov al, 02H
    int 21h;
    ;pointer is at the eof, now use the same code for write to a file
    mov cx, length_of_string
    mov dx, offset string
    mov ah, 40h
    int 21h

    ; Close a file
    mov ah, 3eh
    mov bx, file_address
    int 21h


do_file_handling endp

make_Sound proc

    mov     al, 182d        
    out     43h, al        
    mov     ax, 399d        
    out     42h, al        
    mov     al, ah         
    out     42h, al 
    in      al, 61h        
    or      al, 3d   
    out     61h, al         

    mov dx, 3d
    mov cx, 545987d
    first_stop:
        push cx
        second_stop:
            loop second_stop
        pop cx
        dec dx
        jnz first_stop
    in al, 61h         
    xor al, 3d
    out 61h, al         

ret
make_Sound endp

finish_game proc
    
    mov ah, 00h
    mov al, 00h
    int 10h

    ret
finish_game endp

update_level_two proc

    mov ah,00h ;set the configuration to video mode
    mov al,13h                   
    int 10h    					  

    ;40 x 25 where 40 is coloumn and 25 is row
    ;mov level_2_screen, 1
    mov ah,06h
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov dh, 25   ; dh = row
    mov dl, 40     ; dl = col
    MOV BH, 10011011b    
    INT 10H		

    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,09h                       
    MOV DL,11h						
    INT 10h		

    mov dl, 50
    mov ah, 02H
    int 21h			 
    
    check_key:
    mov ah, 00h
    int 16h
    cmp al, 'a'
    je contii
    cmp al, 'd'
    je contii
    jmp check_key

    contii:

    add game_level, 1
    not game_level2_flag ;making it true
    call update_string_game_level 
    ;shorten the length of the paddle
    sub paddle_width, 5
    ;store the current health of all the bricks, double their health
    ;in the other function first check whether they are in level2 of the game, if they are
    ; then compare their health with the org health stored from level1, if it is equal then change their colour to lighter color
    mov cx, initial_no_of_bricks
    mov si, offset bricks
    startl:
        mov ax, [si+10]
        cmp ax, 0
        jbe skip ;if health is already zero then that brick has been destroyed and we are not concerned with it
        ;add ax, 5
        mov ax, 7
        mov [si+10], ax ;double the health becase we are in level2 now
        mov ax, 7
        mov [si+16], ax ;because we are at level2
        skip:
        add si, type brick
        loop startl
    ret
update_level_two endp

update_level_three proc

    mov ah,00h ;set the configuration to video mode
    mov al,13h                   
    int 10h    					  

    ;40 x 25 where 40 is coloumn and 25 is row
    ;mov level_2_screen, 1
    mov ah,06h
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov dh, 25   ; dh = row
    mov dl, 40     ; dl = col
    MOV BH, 00000101b    ; whiteOnBlue
    INT 10H					 
    
    MOV AH,02h                    
    MOV BH,00h                      
    MOV DH,09h                       
    MOV DL,11h						
    INT 10h		

    mov dl, 51
    mov ah, 02H
    int 21h		



    check_key:
    mov ah, 00h
    int 16h
    cmp al, 'a'
    je contii
    cmp al, 'd'
    je contii
    jmp check_key

   
    contii:
    mov level_2_screen, 1 
    mov spawn_object, 1
    add game_level, 1
    not game_level3_flag ;making it true
    call update_string_game_level 
    ;shorten the length of the paddle
    sub paddle_width, 5
    ;increase ball speed
    add ball_speed_x, 1
    add ball_speed_y, 2
    mov cx, initial_no_of_bricks
    mov si, offset bricks
    startl:
        mov ax, [si+10]
        cmp ax, 0
        jbe skip ;if health is already zero then that brick has been destroyed and we are not concerned with it
        ;add ax, 5
        mov ax, 13
        mov [si+10], ax ;double the health becase we are in level2 now
        mov ax, 13
        mov [si+16], ax ;because we are at level2
        skip:
        add si, type brick
        loop startl
    ret
update_level_three endp


firstPage proc        ; the first screen page to take user's name.
;displaying the game name.
mov al,0eh
mov x_coordinate,3
mov y_coordinate,28
call ResetCursor
mov dx, offset text2   
mov ah,09h
int 21h
call DrawBase1
call DrawBase2
mov x_coordinate,30
mov y_coordinate,86
call ResetCursor
call Display   ; displaying "Enter your name :"
mov x_coordinate,170
mov y_coordinate,145
mov widthVar,100
mov heightVar,20
mov al,08h
call DrawBoundary

;reset the cursor to take input inside the box
mov x_coordinate,111
mov y_coordinate,89
call ResetCursor
call takeInput
mov current_screen, 03h
ret
firstPage endp  

MainMenu proc
goBack:
call SetTheBackground
call DisplayMenu

call DrawBase1
call DrawBase2

; again:                ;detecting the enter key being pressed.
; mov ah,1       
; int 16h
; jnz again
; mov ah,0
; int 16h
; .if(al==49)       ; 1 being pressed.
; ;CALL THE GAME PROC HERE.

; .elseif(al==50)   ; 2 being pressed.
; ;RESUME THE GAME
; .elseif(al==51)   ; 3 being pressed.
; call InstructionsPage
; again2:                ;detecting the enter key being pressed.
; mov ah,1
; int 16h
; jz again2
; mov ah,0
; int 16h
; cmp al,27
; je goBack
; .elseif(al==52)   ; 4 being pressed.
; mov bl,0
; .else
; mov ax, 0
; or ax, 0
; jnz again
; .endif

 check_key:
    mov ah, 00h
    int 16h
    cmp al, '1'
    je start_game
    cmp al, '2'
    je start_game
    cmp al, '3'
    je instruct_page
    CMP AL,'4'
    JE exit_prog
    jmp check_key

    start_game:
    MOV current_screen,01h
    MOV game_flag,01h
    jmp fin

    exit_prog:
    mov exit_program, 01h
    jmp fin

    instruct_page:
    mov current_screen, 02H
    jmp fin

    fin:
    ret

ret
MainMenu endp

DisplayMenu proc      ;for text, the screen size if 40 cols x 25 rows.
;displaying the game name.
mov al,0eh
mov x_coordinate,3
mov y_coordinate,28
call ResetCursor
mov dx, offset text2   
mov ah,09h
int 21h
;displaying "PLAY GAME"
mov x_coordinate,6
mov y_coordinate,32
call ResetCursor
mov dx, offset text3   
mov ah,09h
int 21h
mov x_coordinate,173   ;setting the coordinates and variables for drwaing the box around options.
mov y_coordinate,170
mov heightVar,20
mov widthVar,114
call DrawBoundary
;displaying "RESUME"
mov x_coordinate,6 
mov y_coordinate,35
call ResetCursor
mov dx, offset text4   ;displaying "RESUME"
mov ah,09h
int 21h
mov x_coordinate,173   ;setting the coordinates and variables for drwaing the box around options.
mov y_coordinate,95
mov heightVar,20
mov widthVar,114
call DrawBoundary
;displaying "INSTRUCTIONS"
mov x_coordinate,6
mov y_coordinate,38
call ResetCursor
mov dx, offset text5   ;displaying "INSTRUCTIONS"
mov ah,09h
int 21h
mov x_coordinate,173   ;setting the coordinates and variables for drwaing the box around options.
mov y_coordinate,145
mov heightVar,20
mov widthVar,114
call DrawBoundary
;displaying "EXIT GAME"
mov x_coordinate,6
mov y_coordinate,41
call ResetCursor
mov dx, offset text7   ;displaying "EXIT GAME"
mov ah,09h
int 21h
mov x_coordinate,173   ;setting the coordinates and variables for drwaing the box around options.
mov y_coordinate,120
mov heightVar,20
mov widthVar,114
call DrawBoundary
;displaying "PRESS A KEY 1-4"
mov x_coordinate,5
mov y_coordinate,46
call ResetCursor
mov dx, offset text8   ;displaying "press a key 1-4"
mov ah,09h
int 21h
ret
DisplayMenu endp
                              
InstructionsPage proc  ; proc for instructions page
call SetTheBackground
mov x_coordinate,14
mov y_coordinate,2
call ResetCursor
mov dx, offset instruct  
mov ah,09h
int 21h
call DrawBase2
mov x_coordinate,7
mov y_coordinate,5
call ResetCursor
mov dx, offset instruct13  
mov ah,09h
int 21h
;displaying the intructions below.
mov x_coordinate,1
mov y_coordinate,7
call ResetCursor
mov dx, offset instruct1  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,8
call ResetCursor
mov dx, offset instruct2  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,9
call ResetCursor
mov dx, offset instruct3  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,11
call ResetCursor
mov dx, offset instruct4
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,12
call ResetCursor
mov dx, offset instruct5  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,13
call ResetCursor
mov dx, offset instruct6 
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,14
call ResetCursor
mov dx, offset instruct7  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,15
call ResetCursor
mov dx, offset instruct8 
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,16
call ResetCursor
mov dx, offset instruct9  
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,17
call ResetCursor
mov dx, offset instruct10 
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,19
call ResetCursor
mov dx, offset instruct11
mov ah,09h
int 21h
mov x_coordinate,1
mov y_coordinate,20
call ResetCursor
mov dx, offset instruct12 
mov ah,09h
int 21h

check_key:
    mov ah, 00h
    int 16h
    cmp al, 13
    je resume_menu
    jmp check_key

    resume_menu:
    MOV current_screen,03h
    jmp fin
fin:
ret
InstructionsPage endp  ;  instructions page ends here


ResetCursor proc  ; reset cursor position
mov ah, 02h
mov bx, 0
mov dh, y_coordinate
mov dl, x_coordinate
mov bl,pixelColor
int 10h
ret
ResetCursor endp           ; reset cursor macro ends here.
 

TurnOnVidMode proc
mov ah, 00
mov al, videoMode
int 10h
ret
TurnOnVidMode endp

SetTheBackgroundWhite proc
mov ah, 06h
mov al, 0
mov cx, 0
mov dh, 80
mov dl, 80
mov bh, 0fh
int 10h
mov x_coordinate,0
mov y_coordinate,0
mov heightVar,199
mov widthVar,319
mov pixelColor,04h
mov al,pixelColor
call DrawBoundary
ret
SetTheBackgroundWhite endp

SetTheBackground proc
mov ah, 06h
mov al, 0
mov cx, 0
mov dh, 80
mov dl, 80
mov bh, back_colour
int 10h
mov x_coordinate,0
mov y_coordinate,0
mov heightVar,199
mov widthVar,319
mov pixelColor,04h
mov al,pixelColor
call DrawBoundary
ret
SetTheBackground endp

DrawBoundary proc 
;mov al, pixelColor
mov ah, 0ch
mov bx, heightVar
mov cl, x_coordinate
mov dl, y_coordinate
line1:
int 10h
inc dx
dec bx
cmp bx, 0
ja line1
mov bx, widthVar
line2:
int 10h
inc cx
dec bx
cmp bx, 0
ja line2
mov bx, heightVar
line3:
int 10h
dec dx
dec bx
cmp bx, 0
ja line3
mov bx, widthVar
line4:
int 10h
dec cx
dec bx
cmp bx, 0
ja line4

ret
DrawBoundary endp

takeInput proc   ; macro to take input 


check_key:

    take_input:		 

        mov si, offset string
        user_input_loop:
            mov ah, 01h
            int 21H
            cmp al, 13
            je stop_taking_username
            mov [si], al
            inc si
            jmp user_input_loop

        stop_taking_username:

        ;we need to find string length which will be passed in cx
        mov si, offset string
        start:
            mov al, [si]
            cmp al, '$'
            je stop_counting
            inc length_of_string
            inc si
            loop start

        stop_counting:
        mov al, ' '
        mov [si], al
        add si, 1 ;from this poistion onwards score will be appended into string
        inc length_of_string

    fin:

ret
takeInput endp               ; input macro ends here.


Display proc  ; displaying text 
mov dx, offset text1
mov ah,09h
int 21h
ret
Display endp           ; output macro ends here.


DrawBrick proc 
mov heightVar,4
mov widthVar,6
mov al, 04h
mov ah, 0ch
;mov bx, heightVar
mov cl, x_coordinate
mov dl, y_coordinate

.while(heightVar>0)
mov bx, widthVar
l1:
int 10h
inc cx
dec bx
cmp bx, 0
ja l1
mov cl,x_coordinate
mov dl,y_coordinate
inc dx
inc y_coordinate
dec heightVar
.endw
ret
DrawBrick endp

DrawBase2 proc
mov x_coordinate,200
mov y_coordinate,85
mov wallwidth,26
.while(wallwidth>0)
call DrawBrick
add x_coordinate,7
mov y_coordinate,85
dec wallwidth
.endw
ret
DrawBase2 endp

DrawBase1 proc
mov x_coordinate,200
mov y_coordinate,60
mov wallwidth,26
.while(wallwidth>0)
call DrawBrick
add x_coordinate,7
mov y_coordinate,60
dec wallwidth
.endw
ret
DrawBase1 endp


end