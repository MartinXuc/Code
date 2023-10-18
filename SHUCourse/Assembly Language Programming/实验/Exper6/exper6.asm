data segment
    linefeed               db 0ah,0dh,'$'
    hexChars               db '0123456789ABCDEF$'
    input_msg              db 'Please select the option you wish to input:$'
    input_name_msg         db 'Input the name:$'
    input_number_msg       db 'Input the number:$'
    chose_msg1             db '1 - query$'
    chose_msg2             db '2 - add$'
    chose_msg3             db '3 - end proc$'
    input_error_msg        db 'Invalid input! Again!$'
    not_matching_msg       db 'No data in the book!$'
    successful_msg         db 'Successful!$'
    show_database_msg      db 'Current database is : $'
    show_count_msg         db 'Current count is: $'
    show_name_buffer_msg   db 'Current name_buffer is : $'
    show_number_buffer_msg db 'Current number_buffer is : $'
    database               db 1024 dup('$')
    ;电话簿用1024byte存储
    ;规定人名占用16个Byte
    ;电话号码占用11个Byte
    ;一个对象占用16+11=27个字节
    name_buffer            db 17 dup(?),'$'
    number_buffer          db 12 dup(?),'$'
    count                  dw ?

data ends

code segment
                            assume cs:code,ds:data

    start:                  
    ;基本准备
                            mov    ax,data
                            mov    ds,ax
                            mov    es,ax
    ;count=0
                            xor    ax,ax
                            mov    count,ax
    input:                  
    ;输出当前database的值
                            call   show_database
                            call   print_linefeed
    ;输出当前name_buffer的值
                            lea    dx,show_name_buffer_msg
                            call   print_msg
                            lea    si,name_buffer
                            mov    cx,17
                            call   show_string
                            call   print_linefeed
    ;输出当前number_buffer的值
                            lea    dx,show_number_buffer_msg
                            call   print_msg
                            lea    si,number_buffer
                            mov    cx,12
                            call   show_string
                            call   print_linefeed
    ;输出提示语句
                            lea    dx,chose_msg1
                            call   print_msg_linefeed
                            lea    dx,chose_msg2
                            call   print_msg_linefeed
                            lea    dx,chose_msg3
                            call   print_msg_linefeed
                            lea    dx,input_msg
                            call   print_msg
    ;输入选择
                            call   get_input_char
                            call   print_linefeed
                            cmp    dl,'1'
                            je     query_mod
                            cmp    dl,'2'
                            je     add_mod
                            cmp    dl,'3'
                            je     end_proc
                            jne    not_illegal
    query_mod:              
                            call   query_module
                            jmp    input
    add_mod:                
                            call   add_module
                            jmp    input
    not_illegal:            
                            lea    dx,input_error_msg
                            call   print_msg_linefeed
                            jmp    input
    end_proc:               
                            mov    ah,4ch
                            int    21h
    ;------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;功能子程序

    ;输出信息，即输出字符串
print_msg proc near
                            push   ax
                            mov    ah,09h
                            int    21h
                            pop    ax
                            ret
print_msg endp

    ;输出回车换行
print_linefeed proc near
                            push   dx
                            lea    dx,linefeed
                            call   print_msg
                            pop    dx
                            ret
print_linefeed endp

    ;输出信息之后回车换行
print_msg_linefeed proc near
                            call   print_msg
                            call   print_linefeed
                            ret
print_msg_linefeed endp

    ;输出错误提示信息
print_input_error proc near
                            push   dx
                            lea    dx,input_error_msg
                            call   print_msg_linefeed
                            pop    dx
                            ret
print_input_error endp

    ;将dl中的值以16进制输出
print_number_4b proc near
                            push   ax
                            add    dl,30h                       ;将dl值+30h变成数字0-9的ascii码
                            cmp    dl,39h                       ;判断是不是超过'9'
                            jle    print_character              ;不超过就输出
                            add    dl,7                         ;超过了转换成大写字母再输出
    print_character:        
                            mov    ah,02h
                            int    21h
                            pop    ax
                            ret
print_number_4b endp

    ;读入一个字符，传入dl
get_input_char proc near
                            push   ax
                            mov    ah,01h
                            int    21h
                            mov    dl,al
                            pop    ax
                            ret
get_input_char endp

    ;从键盘中读入字符串，CX存储读入字符串最大长度，DI存储字符串目标位置首地址
get_input_string proc near
    get_input_string_init:  
                            push   ax
                            push   cx
                            push   dx
                            push   di
    input_loop:             
                            mov    ah,01h
                            int    21h
                            cmp    al,0dh
                            je     get_input_string_return
                            mov    [di],al
                            inc    di
                            loop   input_loop
    get_input_string_return:
                            xor    dh,dh
                            mov    dl,'$'
                            mov    [di],dx
                            pop    di
                            pop    dx
                            pop    cx
                            pop    ax
                            ret
get_input_string endp

show_string proc near
    show_string_init:       
                            push   dx
                            push   cx
                            push   ax
                            push   si
    show_string_start:      
                            mov    dl,[si]
                            mov    ah,02h
                            int    21h
                            inc    si
                            loop   show_string_start
    show_string_return:     
                            pop    si
                            pop    ax
                            pop    cx
                            pop    dx
                            ret
show_string endp

show_database proc near
    show_database_init:     
                            push   dx
                            push   cx
                            push   ax
                            push   si
    show_database_start:    
                            lea    dx,show_database_msg
                            call   print_msg
                            mov    cx,1024
                            lea    si,database
                            call   show_string
    show_database_return:   
                            pop    si
                            pop    ax
                            pop    cx
                            pop    dx
                            ret
    
show_database endp

    ;--------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;查询模块
query_module proc near
    query_module_init:      
                            push   ax
                            push   bx
                            push   cx
                            push   dx
                            push   si
                            push   di
    ;将count存入堆栈，因为本子程序会修改之
                            mov    ax,count
                            push   ax
    ;将name_buffer缓冲区清空
                            lea    si,name_buffer
                            mov    cx,16
    loop_clr_name_buffer:   
                            mov    [si],0
                            inc    si
                            loop   loop_clr_name_buffer
    query_module_input_name:
    ;输入输出操作
                            lea    dx,input_name_msg
                            call   print_msg_linefeed
                            lea    di,name_buffer
                            mov    cx,17
                            call   get_input_string
    init_loc:               
    ;初始化si的位置
                            lea    si,database
    compare_module:         
    ;保护si地址
    ;保证si指向对象开头
                            push   si
                            push   di
                            mov    cx,16
                            cld
                            repe   cmpsb
                            jz     matching
                            pop    di
                            pop    si
    step_loc:               
    ;步进一格
                            add    si,27
    ;count作为计数器
    ;当减到0说明比到了最后
    ;执行无匹配的逻辑
                            dec    count
                            jz     not_matching
                            jmp    compare_module
    matching:               
                            pop    di
                            pop    si
    ;将si指向该对象的电话号码
                            add    si,16
    ;将电话号码输出
                            mov    cx,11
    print_number:           
                            mov    dl,[si]
                            cmp    dl,'$'
                            je     query_module_return
                            mov    ah,02h
                            int    21h
                            inc    si
                            loop   print_number
                            jmp    query_module_return
    not_matching:           
                            lea    dx,not_matching_msg
                            call   print_msg
                            jmp    query_module_return
    query_module_return:    
                            call   print_linefeed
    ;还原count
                            pop    ax
                            mov    count,ax
                            pop    di
                            pop    si
                            pop    dx
                            pop    cx
                            pop    bx
                            pop    ax
                            ret
query_module endp
    ;------------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;---------------------------------------------------------------------------------------------------------
    ;添加数据模块
add_module proc near
    add_module_init:        
                            push   ax
                            push   bx
                            push   cx
                            push   dx
                            push   si
                            push   di
    add_module_input_name:  
    ;输出人名提示信息
                            lea    dx,input_name_msg
                            call   print_msg_linefeed
    ;输入人名字符串
                            lea    di,name_buffer
                            mov    cx,17
                            call   get_input_string
    ;检查输入是否合法
                            call   check_name
                            test   bx,bx
                            jz     invalid_name
    add_module_input_number:
    ;输出电话提示信息
                            lea    dx,input_number_msg
                            call   print_msg_linefeed
    ;输入电话字符串
                            lea    di,number_buffer
                            mov    cx,12
                            call   get_input_string
    ;检查输入是否合法
                            call   check_number
                            test   bx,bx
                            jz     invalid_number
    add_module_insert_data: 
    ;计算要插入数据的首地址
                            lea    di,database
                            mov    ax,count
                            mov    bx,27
                            mul    bx
                            add    di,ax
    ;获取人名缓冲区地址
                            lea    si,name_buffer
    ;将人名插入database
                            push   di
                            mov    cx,16
                            cld
                            rep    movsb
                            pop    di
    ;将di后移
                            add    di,16
    ;获取电话号码缓冲区地址
                            lea    si,number_buffer
    ;将电话号码插入database
                            push   di
                            mov    cx,11
                            cld
                            rep    movsb
                            pop    di
    ;di后移
                            add    di,11
                            jmp    add_module_return
    invalid_name:           
                            call   print_input_error
                            call   print_linefeed
                            jmp    add_module_input_name
    invalid_number:         
                            call   print_input_error
                            call   print_linefeed
                            jmp    add_module_input_number
    add_module_return:      
    ;输出提示信息
                            lea    dx,successful_msg
                            call   print_msg_linefeed
    ;count+1
                            inc    count
                            pop    di
                            pop    si
                            pop    dx
                            pop    cx
                            pop    bx
                            pop    ax
                            ret
add_module endp

check_name proc near
    ;默认合法，BX寄存器为标志位
                            mov    bx,1
                            ret
check_name endp

check_number proc near
    ;默认合法，BX寄存器为标志位
                            mov    bx,1
                            ret
check_number endp
    ;------------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
    ;------------------------------------------------------------------------------------------------------------
code ends
end start