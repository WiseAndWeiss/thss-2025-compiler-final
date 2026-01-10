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
    %arr = alloca [100 x i32], align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %sum = alloca i32, align 4
    store i32 0, i32* %sum, align 4
    br label %while_cond_0
while_cond_0:
    %call_temp0 = call i32 @getint()
    %icmp_ne_temp1 = icmp ne i32 %call_temp0, 0
    br i1 %icmp_ne_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %i, align 4
    %gep_temp3 = getelementptr [100 x i32], [100 x i32]* %arr, i32 0, i32 %load_temp2
    %call_temp4 = call i32 @getint()
    store i32 %call_temp4, i32* %gep_temp3, align 4
    %load_temp5 = load i32, i32* %i, align 4
    %add_temp6 = add i32 %load_temp5, 1
    store i32 %add_temp6, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp7 = load i32, i32* %i, align 4
    %icmp_ne_temp8 = icmp ne i32 %load_temp7, 0
    br i1 %icmp_ne_temp8, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp9 = load i32, i32* %i, align 4
    %sub_temp10 = sub i32 %load_temp9, 1
    store i32 %sub_temp10, i32* %i, align 4
    %load_temp11 = load i32, i32* %sum, align 4
    %load_temp12 = load i32, i32* %i, align 4
    %gep_temp13 = getelementptr [100 x i32], [100 x i32]* %arr, i32 0, i32 %load_temp12
    %load_temp14 = load i32, i32* %gep_temp13, align 4
    %add_temp15 = add i32 %load_temp11, %load_temp14
    store i32 %add_temp15, i32* %sum, align 4
    br label %while_cond_0
while_end_0:
    %load_temp16 = load i32, i32* %sum, align 4
    %srem_temp17 = srem i32 %load_temp16, 79
    ret i32 %srem_temp17
}

