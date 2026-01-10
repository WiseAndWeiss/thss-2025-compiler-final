; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @move(i32 %x, i32 %y) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %load_temp0 = load i32, i32* %x_local, align 4
    call void @putint(i32 %load_temp0)
    call void @putch(i32 32)
    %load_temp1 = load i32, i32* %y_local, align 4
    call void @putint(i32 %load_temp1)
    call void @putch(i32 44)
    call void @putch(i32 32)
    ret void
}

define void @hanoi(i32 %n, i32 %one, i32 %two, i32 %three) {
entry:
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %one_local = alloca i32, align 4
    store i32 %one, i32* %one_local, align 4
    %two_local = alloca i32, align 4
    store i32 %two, i32* %two_local, align 4
    %three_local = alloca i32, align 4
    store i32 %three, i32* %three_local, align 4
    %load_temp2 = load i32, i32* %n_local, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 1
    br i1 %icmp_eq_temp3, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp4 = load i32, i32* %one_local, align 4
    %load_temp5 = load i32, i32* %three_local, align 4
    call void @move(i32 %load_temp4, i32 %load_temp5)
    br label %if_end_0
if_else_0:
    %load_temp6 = load i32, i32* %n_local, align 4
    %sub_temp7 = sub i32 %load_temp6, 1
    %load_temp8 = load i32, i32* %one_local, align 4
    %load_temp9 = load i32, i32* %three_local, align 4
    %load_temp10 = load i32, i32* %two_local, align 4
    call void @hanoi(i32 %sub_temp7, i32 %load_temp8, i32 %load_temp9, i32 %load_temp10)
    %load_temp11 = load i32, i32* %one_local, align 4
    %load_temp12 = load i32, i32* %three_local, align 4
    call void @move(i32 %load_temp11, i32 %load_temp12)
    %load_temp13 = load i32, i32* %n_local, align 4
    %sub_temp14 = sub i32 %load_temp13, 1
    %load_temp15 = load i32, i32* %two_local, align 4
    %load_temp16 = load i32, i32* %one_local, align 4
    %load_temp17 = load i32, i32* %three_local, align 4
    call void @hanoi(i32 %sub_temp14, i32 %load_temp15, i32 %load_temp16, i32 %load_temp17)
    br label %if_end_0
if_end_0:
    ret void
}

define i32 @main() {
entry:
    %n = alloca i32, align 4
    %call_temp18 = call i32 @getint()
    store i32 %call_temp18, i32* %n, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp19 = load i32, i32* %n, align 4
    %icmp_sgt_temp20 = icmp sgt i32 %load_temp19, 0
    br i1 %icmp_sgt_temp20, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp21 = call i32 @getint()
    call void @hanoi(i32 %call_temp21, i32 1, i32 2, i32 3)
    call void @putch(i32 10)
    %load_temp22 = load i32, i32* %n, align 4
    %sub_temp23 = sub i32 %load_temp22, 1
    store i32 %sub_temp23, i32* %n, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

