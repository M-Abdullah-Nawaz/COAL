[org 0x100]
mov ax,0
push 5
push 8
push 9
push 3
call minofmany
mov ax,0x4c00
int 21h

minofmany: push bp
mov bp,sp
mov di,0
add di,4
mov cx,[bp+di]
dec cx
add di,2
mov ax,[bp+di]
add di,2
l1:cmp [bp+di],ax
jb store
here:add di,2
loop l1
cmp cx,0
je end
jmp l1
store: mov ax,[bp+di]
jmp here
end:pop bp
ret
