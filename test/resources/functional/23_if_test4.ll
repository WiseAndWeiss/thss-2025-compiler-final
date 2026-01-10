; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @if_ifElse_() {
entry:
    %a = alloca i32, align 4
    store i32 5, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 10, i32* %b, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 5
    br i1 %icmp_eq_temp1, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp2 = load i32, i32* %b, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 10
    br i1 %icmp_eq_temp3, label %if_then_1, label %if_else_1
if_then_1:
    store i32 25, i32* %a, align 4
    br label %if_end_1
if_else_1:
    %load_temp4 = load i32, i32* %a, align 4
    %add_temp5 = add i32 %load_temp4, 15
    store i32 %add_temp5, i32* %a, align 4
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    %load_temp6 = load i32, i32* %a, align 4
    ret i32 %load_temp6
}

define i32 @main() {
entry:
    %call_temp7 = call i32 @if_ifElse_()
    ret i32 %call_temp7
}

