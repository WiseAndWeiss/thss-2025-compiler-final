; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 7, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func() {
entry:
    %b = alloca i32, align 4
    %load_temp0 = load i32, i32* @a, align 4
    store i32 %load_temp0, i32* %b, align 4
    %a = alloca i32, align 4
    store i32 1, i32* %a, align 4
    %load_temp1 = load i32, i32* %a, align 4
    %load_temp2 = load i32, i32* %b, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp1, %load_temp2
    br i1 %icmp_eq_temp3, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp4 = load i32, i32* %a, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %a, align 4
    ret i32 1
if_else_0:
    ret i32 0
if_end_0:
    ret void
}

define i32 @main() {
entry:
    %result = alloca i32, align 4
    store i32 0, i32* %result, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp6 = load i32, i32* %i, align 4
    %icmp_slt_temp7 = icmp slt i32 %load_temp6, 100
    br i1 %icmp_slt_temp7, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp8 = call i32 @func()
    %icmp_eq_temp9 = icmp eq i32 %call_temp8, 1
    br i1 %icmp_eq_temp9, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp10 = load i32, i32* %result, align 4
    %add_temp11 = add i32 %load_temp10, 1
    store i32 %add_temp11, i32* %result, align 4
    br label %if_end_1
if_end_1:
    %load_temp12 = load i32, i32* %i, align 4
    %add_temp13 = add i32 %load_temp12, 1
    store i32 %add_temp13, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp14 = load i32, i32* %result, align 4
    %icmp_slt_temp15 = icmp slt i32 %load_temp14, 100
    br i1 %icmp_slt_temp15, label %if_then_2, label %if_else_2
if_then_2:
    call void @putint(i32 1)
    br label %if_end_2
if_else_2:
    call void @putint(i32 0)
    br label %if_end_2
if_end_2:
    ret i32 0
}

