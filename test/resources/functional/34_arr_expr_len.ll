; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@N = constant i32 -1, align 4
@arr = global [6 x i32] zeroinitializer, align 4
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
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 6
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %sum, align 4
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr [6 x i32], [6 x i32]* @arr, i32 0, i32 %load_temp3
    %load_temp5 = load i32, i32* %gep_temp4, align 4
    %add_temp6 = add i32 %load_temp2, %load_temp5
    store i32 %add_temp6, i32* %sum, align 4
    %load_temp7 = load i32, i32* %i, align 4
    %add_temp8 = add i32 %load_temp7, 1
    store i32 %add_temp8, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp9 = load i32, i32* %sum, align 4
    ret i32 %load_temp9
}

