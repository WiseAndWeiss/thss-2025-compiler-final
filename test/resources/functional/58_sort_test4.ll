; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @select_sort(i32* %A, i32 %n) {
entry:
    %A_local = alloca i32*, align 4
    store i32* %A, i32** %A_local, align 4
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    %min = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* %n_local, align 4
    %sub_temp2 = sub i32 %load_temp1, 1
    %icmp_slt_temp3 = icmp slt i32 %load_temp0, %sub_temp2
    br i1 %icmp_slt_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp4 = load i32, i32* %i, align 4
    store i32 %load_temp4, i32* %min, align 4
    %load_temp5 = load i32, i32* %i, align 4
    %add_temp6 = add i32 %load_temp5, 1
    store i32 %add_temp6, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp7 = load i32, i32* %j, align 4
    %load_temp8 = load i32, i32* %n_local, align 4
    %icmp_slt_temp9 = icmp slt i32 %load_temp7, %load_temp8
    br i1 %icmp_slt_temp9, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp10 = load i32, i32* %min, align 4
    %gep_temp11 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp10
    %load_temp12 = load i32*, i32** %gep_temp11, align 4
    %load_temp13 = load i32, i32* %j, align 4
    %gep_temp14 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp13
    %load_temp15 = load i32*, i32** %gep_temp14, align 4
    %icmp_sgt_temp16 = icmp sgt i32* %load_temp12, %load_temp15
    br i1 %icmp_sgt_temp16, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp17 = load i32, i32* %j, align 4
    store i32 %load_temp17, i32* %min, align 4
    br label %if_end_0
if_end_0:
    %load_temp18 = load i32, i32* %j, align 4
    %add_temp19 = add i32 %load_temp18, 1
    store i32 %add_temp19, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp20 = load i32, i32* %min, align 4
    %load_temp21 = load i32, i32* %i, align 4
    %icmp_ne_temp22 = icmp ne i32 %load_temp20, %load_temp21
    br i1 %icmp_ne_temp22, label %if_then_1, label %if_end_1
if_then_1:
    %tmp = alloca i32, align 4
    %load_temp23 = load i32, i32* %min, align 4
    %gep_temp24 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp23
    %load_temp25 = load i32*, i32** %gep_temp24, align 4
    store i32* %load_temp25, i32* %tmp, align 4
    %load_temp26 = load i32, i32* %min, align 4
    %gep_temp27 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp26
    %load_temp28 = load i32, i32* %i, align 4
    %gep_temp29 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp28
    %load_temp30 = load i32*, i32** %gep_temp29, align 4
    store i32* %load_temp30, i32** %gep_temp27, align 4
    %load_temp31 = load i32, i32* %i, align 4
    %gep_temp32 = getelementptr i32*, i32** %A_local, i32 0, i32 %load_temp31
    %load_temp33 = load i32, i32* %tmp, align 4
    store i32 %load_temp33, i32** %gep_temp32, align 4
    br label %if_end_1
if_end_1:
    %load_temp34 = load i32, i32* %i, align 4
    %add_temp35 = add i32 %load_temp34, 1
    store i32 %add_temp35, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp36 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp37, align 4
    %gep_temp38 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp38, align 4
    %gep_temp39 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp39, align 4
    %gep_temp40 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp40, align 4
    %gep_temp41 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp41, align 4
    %gep_temp42 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp42, align 4
    %gep_temp43 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp43, align 4
    %gep_temp44 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp44, align 4
    %gep_temp45 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp45, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %load_temp46 = load [10 x i32], [10 x i32]* %a, align 4
    %load_temp47 = load i32, i32* @n, align 4
    %call_temp48 = call i32 @select_sort([10 x i32] %load_temp46, i32 %load_temp47)
    store i32 %call_temp48, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp49 = load i32, i32* %i, align 4
    %load_temp50 = load i32, i32* @n, align 4
    %icmp_slt_temp51 = icmp slt i32 %load_temp49, %load_temp50
    br i1 %icmp_slt_temp51, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp52 = load i32, i32* %i, align 4
    %gep_temp53 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp52
    %load_temp54 = load i32, i32* %gep_temp53, align 4
    store i32 %load_temp54, i32* %tmp, align 4
    %load_temp55 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp55)
    store i32 10, i32* %tmp, align 4
    %load_temp56 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp56)
    %load_temp57 = load i32, i32* %i, align 4
    %add_temp58 = add i32 %load_temp57, 1
    store i32 %add_temp58, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

