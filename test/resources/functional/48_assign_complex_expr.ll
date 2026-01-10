; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    %result = alloca i32, align 4
    store i32 5, i32* %a, align 4
    store i32 5, i32* %b, align 4
    store i32 1, i32* %c, align 4
    %sub_temp0 = sub i32 0, 2
    store i32 %sub_temp0, i32* %d, align 4
    %load_temp1 = load i32, i32* %d, align 4
    %mul_temp2 = mul i32 %load_temp1, 1
    %sdiv_temp3 = sdiv i32 %mul_temp2, 2
    %load_temp4 = load i32, i32* %a, align 4
    %load_temp5 = load i32, i32* %b, align 4
    %sub_temp6 = sub i32 %load_temp4, %load_temp5
    %add_temp7 = add i32 %sdiv_temp3, %sub_temp6
    %load_temp8 = load i32, i32* %c, align 4
    %add_temp9 = add i32 %load_temp8, 3
    %sub_temp10 = sub i32 0, %add_temp9
    %srem_temp11 = srem i32 %sub_temp10, 2
    %sub_temp12 = sub i32 %add_temp7, %srem_temp11
    store i32 %sub_temp12, i32* %result, align 4
    %load_temp13 = load i32, i32* %result, align 4
    call void @putint(i32 %load_temp13)
    %load_temp14 = load i32, i32* %d, align 4
    %srem_temp15 = srem i32 %load_temp14, 2
    %add_temp16 = add i32 %srem_temp15, 67
    %load_temp17 = load i32, i32* %a, align 4
    %load_temp18 = load i32, i32* %b, align 4
    %sub_temp19 = sub i32 %load_temp17, %load_temp18
    %sub_temp20 = sub i32 0, %sub_temp19
    %add_temp21 = add i32 %add_temp16, %sub_temp20
    %load_temp22 = load i32, i32* %c, align 4
    %add_temp23 = add i32 %load_temp22, 2
    %srem_temp24 = srem i32 %add_temp23, 2
    %sub_temp25 = sub i32 0, %srem_temp24
    %sub_temp26 = sub i32 %add_temp21, %sub_temp25
    store i32 %sub_temp26, i32* %result, align 4
    %load_temp27 = load i32, i32* %result, align 4
    %add_temp28 = add i32 %load_temp27, 3
    store i32 %add_temp28, i32* %result, align 4
    %load_temp29 = load i32, i32* %result, align 4
    call void @putint(i32 %load_temp29)
    ret i32 0
}

