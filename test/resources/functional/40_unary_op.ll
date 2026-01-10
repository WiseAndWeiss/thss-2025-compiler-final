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
    store i32 10, i32* %a, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 0
    %icmp_eq_temp2 = icmp eq i1 %icmp_eq_temp1, 0
    %icmp_eq_temp3 = icmp eq i1 %icmp_eq_temp2, 0
    %zext_temp4 = zext i1 %icmp_eq_temp3 to i32
    %sub_temp5 = sub i32 0, %zext_temp4
    %icmp_ne_temp6 = icmp ne i32 %sub_temp5, 0
    br i1 %icmp_ne_temp6, label %if_then_0, label %if_else_0
if_then_0:
    %sub_temp7 = sub i32 0, 1
    %sub_temp8 = sub i32 0, %sub_temp7
    %sub_temp9 = sub i32 0, %sub_temp8
    store i32 %sub_temp9, i32* %a, align 4
    br label %if_end_0
if_else_0:
    store i32 0, i32* %a, align 4
    br label %if_end_0
if_end_0:
    %load_temp10 = load i32, i32* %a, align 4
    ret i32 %load_temp10
}

