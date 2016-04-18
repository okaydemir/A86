 jmp start
 input db 13 dup 0 ;input variable
 
start:
mov dx, offset input
 mov bx,dx
  mov b[bx],11			; maximum 10 characters to read(+1 for CR)
  mov ah,0ah			;buffered input
  int 21h				;dos interrupt
  inc bx				; bx points to beggining of input
  mov cx,0
  mov cl,[bx]			; cl now contains number of digits
  cmp cl,0
  JE exit
  add bx,cx ; bx points to end of input
  
    mov dl, 10  ;move \n to dl
     mov ah,02h

    int 21h     ;print new line
 _while:
 
mov dl,b[bx]
mov ah,02
int 21h ;print one char
dec bx ; bx points to previous character
loop _while
 
  exit:
    mov ah,4ch
  mov al,0		  ; Exit code 0
  int 21h

  
