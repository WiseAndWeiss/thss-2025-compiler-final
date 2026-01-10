; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @bubblesort(i32* %arr) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* @n, align 4
    %sub_temp2 = sub i32 %load_temp1, 1
    %icmp_slt_temp3 = icmp slt i32 %load_temp0, %sub_temp2
    br i1 %icmp_slt_temp3, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp4 = load i32, i32* %j, align 4
    %load_temp5 = load i32, i32* @n, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %sub_temp7 = sub i32 %load_temp5, %load_temp6
    %sub_temp8 = sub i32 %sub_temp7, 1
    %icmp_slt_temp9 = icmp slt i32 %load_temp4, %sub_temp8
    br i1 %icmp_slt_temp9, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp10 = load i32, i32* %j, align 4
    %gep_temp11 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp10
    %load_temp12 = load i32*, i32** %gep_temp11, align 4
    %load_temp13 = load i32, i32* %j, align 4
    %add_temp14 = add i32 %load_temp13, 1
    %gep_temp15 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp14
    %load_temp16 = load i32*, i32** %gep_temp15, align 4
    %icmp_sgt_temp17 = icmp sgt i32* %load_temp12, %load_temp16
    br i1 %icmp_sgt_temp17, label %if_then_0, label %if_end_0
if_then_0:
    %tmp = alloca i32, align 4
    %load_temp18 = load i32, i32* %j, align 4
    %add_temp19 = add i32 %load_temp18, 1
    %gep_temp20 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp19
    %load_temp21 = load i32*, i32** %gep_temp20, align 4
    store i32* %load_temp21, i32* %tmp, align 4
    %load_temp22 = load i32, i32* %j, align 4
    %add_temp23 = add i32 %load_temp22, 1
    %gep_temp24 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp23
    %load_temp25 = load i32, i32* %j, align 4
    %gep_temp26 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp25
    %load_temp27 = load i32*, i32** %gep_temp26, align 4
    store i32* %load_temp27, i32** %gep_temp24, align 4
    %load_temp28 = load i32, i32* %j, align 4
    %gep_temp29 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp28
    %load_temp30 = load i32, i32* %tmp, align 4
    store i32 %load_temp30, i32** %gep_temp29, align 4
    br label %if_end_0
if_end_0:
    %load_temp31 = load i32, i32* %j, align 4
    %add_temp32 = add i32 %load_temp31, 1
    store i32 %add_temp32, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp33 = load i32, i32* %i, align 4
    %add_temp34 = add i32 %load_temp33, 1
    store i32 %add_temp34, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp35 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp35, align 4
    %gep_temp36 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp37, align 4
    %gep_temp38 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp38, align 4
    %gep_temp39 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp39, align 4
    %gep_temp40 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp40, align 4
    %gep_temp41 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp41, align 4
    %gep_temp42 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp42, align 4
    %gep_temp43 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp43, align 4
    %gep_temp44 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp44, align 4
    %i = alloca i32, align 4
    %load_temp45 = load [10 x i32], [10 x i32]* %a, align 4
    %call_temp46 = call i32 @bubblesort([10 x i32] %load_temp45)
    store i32 %call_temp46, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp47 = load i32, i32* %i, align 4
    %load_temp48 = load i32, i32* @n, align 4
    %icmp_slt_temp49 = icmp slt i32 %load_temp47, %load_temp48
    br i1 %icmp_slt_temp49, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp50 = load i32, i32* %i, align 4
    %gep_temp51 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp50
    %load_temp52 = load i32, i32* %gep_temp51, align 4
    store i32 %load_temp52, i32* %tmp, align 4
    %load_temp53 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp53)
    store i32 10, i32* %tmp, align 4
    %load_temp54 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp54)
    %load_temp55 = load i32, i32* %i, align 4
    %add_temp56 = add i32 %load_temp55, 1
    store i32 %add_temp56, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

