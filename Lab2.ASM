org 100h

start:
  mov ah, $09         ;����� ������
  mov dx, Hello
  int 21h

  mov ah, $09         ;����� ������
  mov dx, text
  int 21h
;---------------------------------------------------
Summa:                ;������� ����� �������� ��-���
  mov si, 0h
  mov cx, 8

.plus:
  mov dl, [array+si]

  test dl, 1
  jz next1
  add bh, dl

next1:
  add si, 1
  loop Summa.plus
;---------------------------------------------------
Label1:                            ;����� ����� (bh)
  mov ah, 02h
  mov dl, bh
  add dl, 48
  int 21h
;---------------------------------------------------
  mov ah, 09h              ;������� �� ����� ������
  mov dx, Next
  int 21h

  mov ah, 09h              ;����� ������
  mov dx, Nechetnye
  int 21h
;---------------------------------------------------
writeArray:                ;����� �������� ���������
  mov si, 0h
  mov bx, 8   ;cx

.show:
  mov ah, 02h
  mov dl, [array+si]
  test dl,1
  jz next2
  add dl, 48
  int 21h

next2:

  add si, 1
  mov dx, 32
  int 21h
  cmp si, bx
  jnl Exit
  loop writeArray.show
;--------------------------------------------------
Exit:
  mov ah, $08               ;�������� �������
  int 21h
  ret
;--------------------------------------------------
Nechetnye db 'Nechetnye: $'
text db 'Summa: $'
Hello db 'Hello, your array: 1,8,2,6,3,4,2,1',10,13,'$'
Next db 10,13,'$'
array db 1,8,2,6,3,4,2,1