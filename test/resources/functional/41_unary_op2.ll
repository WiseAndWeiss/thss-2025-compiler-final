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
    store i32 56, i32* %a, align 4
    store i32 4, i32* %b, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %sub_temp1 = sub i32 0, 4
    %sub_temp2 = sub i32 %load_temp0, %sub_temp1
    %load_temp3 = load i32, i32* %b, align 4
    %add_temp4 = add i32 %sub_temp2, %load_temp3
    store i32 %add_temp4, i32* %a, align 4
    %load_temp5 = load i32, i32* %a, align 4
    %icmp_eq_temp6 = icmp eq i32 %load_temp5, 0
    %icmp_eq_temp7 = icmp eq i1 %icmp_eq_temp6, 0
    %icmp_eq_temp8 = icmp eq i1 %icmp_eq_temp7, 0
    %zext_temp9 = zext i1 %icmp_eq_temp8 to i32
    %sub_temp10 = sub i32 0, %zext_temp9
    %icmp_ne_temp11 = icmp ne i32 %sub_temp10, 0
    br i1 %icmp_ne_temp11, label %if_then_0, label %if_else_0
if_then_0:
    %sub_temp12 = sub i32 0, 1
    %sub_temp13 = sub i32 0, %sub_temp12
    %sub_temp14 = sub i32 0, %sub_temp13
    store i32 %sub_temp14, i32* %a, align 4
    br label %if_end_0
if_else_0:
    %load_temp15 = load i32, i32* %b, align 4
    %add_temp16 = add i32 0, %load_temp15
    store i32 %add_temp16, i32* %a, align 4
    br label %if_end_0
if_end_0:
    %load_temp17 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp17)
    ret i32 0
}

