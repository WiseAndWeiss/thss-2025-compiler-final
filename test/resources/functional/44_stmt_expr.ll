; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@k = global i32 0, align 4
@n = constant i32 10, align 4
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
    store i32 1, i32* @k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* @n, align 4
    %sub_temp2 = sub i32 %load_temp1, 1
    %icmp_sle_temp3 = icmp sle i32 %load_temp0, %sub_temp2
    br i1 %icmp_sle_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp4 = load i32, i32* %i, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %i, align 4
    %load_temp6 = load i32, i32* @k, align 4
    %add_temp7 = add i32 %load_temp6, 1
    %load_temp8 = load i32, i32* @k, align 4
    %load_temp9 = load i32, i32* @k, align 4
    %add_temp10 = add i32 %load_temp8, %load_temp9
    store i32 %add_temp10, i32* @k, align 4
    br label %while_cond_0
while_end_0:
    %load_temp11 = load i32, i32* @k, align 4
    call void @putint(i32 %load_temp11)
    %load_temp12 = load i32, i32* @k, align 4
    ret i32 %load_temp12
}

