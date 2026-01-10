; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @QuickSort(i32* %arr, i32 %low, i32 %high) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %low_local = alloca i32, align 4
    store i32 %low, i32* %low_local, align 4
    %high_local = alloca i32, align 4
    store i32 %high, i32* %high_local, align 4
    %load_temp0 = load i32, i32* %low_local, align 4
    %load_temp1 = load i32, i32* %high_local, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    br i1 %icmp_slt_temp2, label %if_then_0, label %if_end_0
if_then_0:
    %i = alloca i32, align 4
    %load_temp3 = load i32, i32* %low_local, align 4
    store i32 %load_temp3, i32* %i, align 4
    %j = alloca i32, align 4
    %load_temp4 = load i32, i32* %high_local, align 4
    store i32 %load_temp4, i32* %j, align 4
    %k = alloca i32, align 4
    %load_temp5 = load i32, i32* %low_local, align 4
    %gep_temp6 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp5
    %load_temp7 = load i32*, i32** %gep_temp6, align 4
    store i32* %load_temp7, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp8 = load i32, i32* %i, align 4
    %load_temp9 = load i32, i32* %j, align 4
    %icmp_slt_temp10 = icmp slt i32 %load_temp8, %load_temp9
    br i1 %icmp_slt_temp10, label %while_body_0, label %while_end_0
while_body_0:
    br label %while_cond_1
while_cond_1:
    %load_temp11 = load i32, i32* %i, align 4
    %load_temp12 = load i32, i32* %j, align 4
    %icmp_slt_temp13 = icmp slt i32 %load_temp11, %load_temp12
    %load_temp14 = load i32, i32* %j, align 4
    %gep_temp15 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp14
    %load_temp16 = load i32*, i32** %gep_temp15, align 4
    %load_temp17 = load i32, i32* %k, align 4
    %sub_temp18 = sub i32 %load_temp17, 1
    %icmp_sgt_temp19 = icmp sgt i32* %load_temp16, %sub_temp18
    %zext_temp20 = zext i1 %icmp_slt_temp13 to i32
    %zext_temp21 = zext i1 %icmp_sgt_temp19 to i32
    %mul_temp22 = mul i32 %zext_temp20, %zext_temp21
    %icmp_ne_temp23 = icmp ne i32 %mul_temp22, 0
    br i1 %icmp_ne_temp23, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp24 = load i32, i32* %j, align 4
    %sub_temp25 = sub i32 %load_temp24, 1
    store i32 %sub_temp25, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp26 = load i32, i32* %i, align 4
    %load_temp27 = load i32, i32* %j, align 4
    %icmp_slt_temp28 = icmp slt i32 %load_temp26, %load_temp27
    br i1 %icmp_slt_temp28, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp29 = load i32, i32* %i, align 4
    %gep_temp30 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp29
    %load_temp31 = load i32, i32* %j, align 4
    %gep_temp32 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp31
    %load_temp33 = load i32*, i32** %gep_temp32, align 4
    store i32* %load_temp33, i32** %gep_temp30, align 4
    %load_temp34 = load i32, i32* %i, align 4
    %add_temp35 = add i32 %load_temp34, 1
    store i32 %add_temp35, i32* %i, align 4
    br label %if_end_1
if_end_1:
    br label %while_cond_1
while_cond_1:
    %load_temp36 = load i32, i32* %i, align 4
    %load_temp37 = load i32, i32* %j, align 4
    %icmp_slt_temp38 = icmp slt i32 %load_temp36, %load_temp37
    %load_temp39 = load i32, i32* %i, align 4
    %gep_temp40 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp39
    %load_temp41 = load i32*, i32** %gep_temp40, align 4
    %load_temp42 = load i32, i32* %k, align 4
    %icmp_slt_temp43 = icmp slt i32* %load_temp41, %load_temp42
    %zext_temp44 = zext i1 %icmp_slt_temp38 to i32
    %zext_temp45 = zext i1 %icmp_slt_temp43 to i32
    %mul_temp46 = mul i32 %zext_temp44, %zext_temp45
    %icmp_ne_temp47 = icmp ne i32 %mul_temp46, 0
    br i1 %icmp_ne_temp47, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp48 = load i32, i32* %i, align 4
    %add_temp49 = add i32 %load_temp48, 1
    store i32 %add_temp49, i32* %i, align 4
    br label %while_cond_1
while_end_1:
    %load_temp50 = load i32, i32* %i, align 4
    %load_temp51 = load i32, i32* %j, align 4
    %icmp_slt_temp52 = icmp slt i32 %load_temp50, %load_temp51
    br i1 %icmp_slt_temp52, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp53 = load i32, i32* %j, align 4
    %gep_temp54 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp53
    %load_temp55 = load i32, i32* %i, align 4
    %gep_temp56 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp55
    %load_temp57 = load i32*, i32** %gep_temp56, align 4
    store i32* %load_temp57, i32** %gep_temp54, align 4
    %load_temp58 = load i32, i32* %j, align 4
    %sub_temp59 = sub i32 %load_temp58, 1
    store i32 %sub_temp59, i32* %j, align 4
    br label %if_end_2
if_end_2:
    br label %while_cond_0
while_end_0:
    %load_temp60 = load i32, i32* %i, align 4
    %gep_temp61 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp60
    %load_temp62 = load i32, i32* %k, align 4
    store i32 %load_temp62, i32** %gep_temp61, align 4
    %tmp = alloca i32, align 4
    %load_temp63 = load i32, i32* %i, align 4
    %sub_temp64 = sub i32 %load_temp63, 1
    store i32 %sub_temp64, i32* %tmp, align 4
    %load_temp65 = load i32*, i32** %arr_local, align 4
    %load_temp66 = load i32, i32* %low_local, align 4
    %load_temp67 = load i32, i32* %tmp, align 4
    %call_temp68 = call i32 @QuickSort(i32* %load_temp65, i32 %load_temp66, i32 %load_temp67)
    store i32 %call_temp68, i32* %tmp, align 4
    %load_temp69 = load i32, i32* %i, align 4
    %add_temp70 = add i32 %load_temp69, 1
    store i32 %add_temp70, i32* %tmp, align 4
    %load_temp71 = load i32*, i32** %arr_local, align 4
    %load_temp72 = load i32, i32* %tmp, align 4
    %load_temp73 = load i32, i32* %high_local, align 4
    %call_temp74 = call i32 @QuickSort(i32* %load_temp71, i32 %load_temp72, i32 %load_temp73)
    store i32 %call_temp74, i32* %tmp, align 4
    br label %if_end_0
if_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp75 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp75, align 4
    %gep_temp76 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp76, align 4
    %gep_temp77 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp77, align 4
    %gep_temp78 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp78, align 4
    %gep_temp79 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp79, align 4
    %gep_temp80 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp80, align 4
    %gep_temp81 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp81, align 4
    %gep_temp82 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp82, align 4
    %gep_temp83 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp83, align 4
    %gep_temp84 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp84, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %tmp = alloca i32, align 4
    store i32 9, i32* %tmp, align 4
    %load_temp85 = load [10 x i32], [10 x i32]* %a, align 4
    %load_temp86 = load i32, i32* %i, align 4
    %load_temp87 = load i32, i32* %tmp, align 4
    %call_temp88 = call i32 @QuickSort([10 x i32] %load_temp85, i32 %load_temp86, i32 %load_temp87)
    store i32 %call_temp88, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp89 = load i32, i32* %i, align 4
    %load_temp90 = load i32, i32* @n, align 4
    %icmp_slt_temp91 = icmp slt i32 %load_temp89, %load_temp90
    br i1 %icmp_slt_temp91, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp92 = load i32, i32* %i, align 4
    %gep_temp93 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp92
    %load_temp94 = load i32, i32* %gep_temp93, align 4
    store i32 %load_temp94, i32* %tmp, align 4
    %load_temp95 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp95)
    store i32 10, i32* %tmp, align 4
    %load_temp96 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp96)
    %load_temp97 = load i32, i32* %i, align 4
    %add_temp98 = add i32 %load_temp97, 1
    store i32 %add_temp98, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

