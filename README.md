## Lab 2 (FASM)
### Task:

An integer multidimensional array is given. Display the odd elements of the array and count their sum.

### Code:

```
org 100h

start:
  mov ah, $09         ;Вывод текста
  mov dx, Hello
  int 21h

  mov ah, $09         ;Вывод текста
  mov dx, text
  int 21h
;---------------------------------------------------
Summa:                ;Подсчет суммы нечетных эл-тов
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
Label1:                            ;вывод суммы (bh)
  mov ah, 02h
  mov dl, bh
  add dl, 48
  int 21h
;---------------------------------------------------
  mov ah, 09h              ;Переход на новую строку
  mov dx, Next
  int 21h

  mov ah, 09h              ;Вывод текста
  mov dx, Nechetnye
  int 21h
;---------------------------------------------------
writeArray:                ;Вывод нечетных элементов
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
  mov ah, $08               ;Ожидание нажатия
  int 21h
  ret
;--------------------------------------------------
Nechetnye db 'Nechetnye: $'
text db 'Summa: $'
Hello db 'Hello, your array: 1,8,2,6,3,4,2,1',10,13,'$'
Next db 10,13,'$'
array db 1,8,2,6,3,4,2,1
```
