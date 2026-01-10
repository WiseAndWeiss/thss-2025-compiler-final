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
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %sum = alloca i32, align 4
    store i32 0, i32* %sum, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 100
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %i, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 50
    br i1 %icmp_eq_temp3, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp4 = load i32, i32* %i, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %i, align 4
    br label %while_cond_0
if_end_0:
    %load_temp6 = load i32, i32* %sum, align 4
    %load_temp7 = load i32, i32* %i, align 4
    %add_temp8 = add i32 %load_temp6, %load_temp7
    store i32 %add_temp8, i32* %sum, align 4
    %load_temp9 = load i32, i32* %i, align 4
    %add_temp10 = add i32 %load_temp9, 1
    store i32 %add_temp10, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp11 = load i32, i32* %sum, align 4
    ret i32 %load_temp11
}

