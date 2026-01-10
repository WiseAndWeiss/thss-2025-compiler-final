; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @insertsort(i32* %a) {
entry:
    %a_local = alloca i32*, align 4
    store i32* %a, i32** %a_local, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* @n, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    br i1 %icmp_slt_temp2, label %while_body_0, label %while_end_0
while_body_0:
    %temp = alloca i32, align 4
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp3
    %load_temp5 = load i32*, i32** %gep_temp4, align 4
    store i32* %load_temp5, i32* %temp, align 4
    %j = alloca i32, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %sub_temp7 = sub i32 %load_temp6, 1
    store i32 %sub_temp7, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp8 = load i32, i32* %j, align 4
    %sub_temp9 = sub i32 0, 1
    %icmp_sgt_temp10 = icmp sgt i32 %load_temp8, %sub_temp9
    %load_temp11 = load i32, i32* %temp, align 4
    %load_temp12 = load i32, i32* %j, align 4
    %gep_temp13 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp12
    %load_temp14 = load i32*, i32** %gep_temp13, align 4
    %icmp_slt_temp15 = icmp slt i32 %load_temp11, %load_temp14
    %zext_temp16 = zext i1 %icmp_sgt_temp10 to i32
    %zext_temp17 = zext i1 %icmp_slt_temp15 to i32
    %mul_temp18 = mul i32 %zext_temp16, %zext_temp17
    %icmp_ne_temp19 = icmp ne i32 %mul_temp18, 0
    br i1 %icmp_ne_temp19, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp20 = load i32, i32* %j, align 4
    %add_temp21 = add i32 %load_temp20, 1
    %gep_temp22 = getelementptr i32*, i32** %a_local, i32 0, i32 %add_temp21
    %load_temp23 = load i32, i32* %j, align 4
    %gep_temp24 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp23
    %load_temp25 = load i32*, i32** %gep_temp24, align 4
    store i32* %load_temp25, i32** %gep_temp22, align 4
    %load_temp26 = load i32, i32* %j, align 4
    %sub_temp27 = sub i32 %load_temp26, 1
    store i32 %sub_temp27, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp28 = load i32, i32* %j, align 4
    %add_temp29 = add i32 %load_temp28, 1
    %gep_temp30 = getelementptr i32*, i32** %a_local, i32 0, i32 %add_temp29
    %load_temp31 = load i32, i32* %temp, align 4
    store i32 %load_temp31, i32** %gep_temp30, align 4
    %load_temp32 = load i32, i32* %i, align 4
    %add_temp33 = add i32 %load_temp32, 1
    store i32 %add_temp33, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp34 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp34, align 4
    %gep_temp35 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp35, align 4
    %gep_temp36 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp37, align 4
    %gep_temp38 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp38, align 4
    %gep_temp39 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp39, align 4
    %gep_temp40 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp40, align 4
    %gep_temp41 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp41, align 4
    %gep_temp42 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp42, align 4
    %gep_temp43 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp43, align 4
    %i = alloca i32, align 4
    %load_temp44 = load [10 x i32], [10 x i32]* %a, align 4
    %call_temp45 = call i32 @insertsort([10 x i32] %load_temp44)
    store i32 %call_temp45, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp46 = load i32, i32* %i, align 4
    %load_temp47 = load i32, i32* @n, align 4
    %icmp_slt_temp48 = icmp slt i32 %load_temp46, %load_temp47
    br i1 %icmp_slt_temp48, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp49 = load i32, i32* %i, align 4
    %gep_temp50 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp49
    %load_temp51 = load i32, i32* %gep_temp50, align 4
    store i32 %load_temp51, i32* %tmp, align 4
    %load_temp52 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp52)
    store i32 10, i32* %tmp, align 4
    %load_temp53 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp53)
    %load_temp54 = load i32, i32* %i, align 4
    %add_temp55 = add i32 %load_temp54, 1
    store i32 %add_temp55, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

