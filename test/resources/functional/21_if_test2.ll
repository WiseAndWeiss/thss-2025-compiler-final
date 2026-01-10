; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @ifElseIf() {
entry:
    %a = alloca i32, align 4
    store i32 5, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 10, i32* %b, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 6
    %load_temp2 = load i32, i32* %b, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 11
    %zext_temp4 = zext i1 %icmp_eq_temp1 to i32
    %zext_temp5 = zext i1 %icmp_eq_temp3 to i32
    %add_temp6 = add i32 %zext_temp4, %zext_temp5
    %icmp_ne_temp7 = icmp ne i32 %add_temp6, 0
    br i1 %icmp_ne_temp7, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp8 = load i32, i32* %a, align 4
    ret i32 %load_temp8
if_else_0:
    %load_temp9 = load i32, i32* %b, align 4
    %icmp_eq_temp10 = icmp eq i32 %load_temp9, 10
    %load_temp11 = load i32, i32* %a, align 4
    %icmp_eq_temp12 = icmp eq i32 %load_temp11, 1
    %zext_temp13 = zext i1 %icmp_eq_temp10 to i32
    %zext_temp14 = zext i1 %icmp_eq_temp12 to i32
    %mul_temp15 = mul i32 %zext_temp13, %zext_temp14
    %icmp_ne_temp16 = icmp ne i32 %mul_temp15, 0
    br i1 %icmp_ne_temp16, label %if_then_1, label %if_else_1
if_then_1:
    store i32 25, i32* %a, align 4
    br label %if_end_1
if_else_1:
    %load_temp17 = load i32, i32* %b, align 4
    %icmp_eq_temp18 = icmp eq i32 %load_temp17, 10
    %load_temp19 = load i32, i32* %a, align 4
    %sub_temp20 = sub i32 0, 5
    %icmp_eq_temp21 = icmp eq i32 %load_temp19, %sub_temp20
    %zext_temp22 = zext i1 %icmp_eq_temp18 to i32
    %zext_temp23 = zext i1 %icmp_eq_temp21 to i32
    %mul_temp24 = mul i32 %zext_temp22, %zext_temp23
    %icmp_ne_temp25 = icmp ne i32 %mul_temp24, 0
    br i1 %icmp_ne_temp25, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp26 = load i32, i32* %a, align 4
    %add_temp27 = add i32 %load_temp26, 15
    store i32 %add_temp27, i32* %a, align 4
    br label %if_end_2
if_else_2:
    %load_temp28 = load i32, i32* %a, align 4
    %sub_temp29 = sub i32 0, %load_temp28
    store i32 %sub_temp29, i32* %a, align 4
    br label %if_end_2
if_end_2:
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    %load_temp30 = load i32, i32* %a, align 4
    ret i32 %load_temp30
}

define i32 @main() {
entry:
    %call_temp31 = call i32 @ifElseIf()
    call void @putint(i32 %call_temp31)
    ret i32 0
}

