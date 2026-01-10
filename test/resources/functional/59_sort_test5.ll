; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @swap(i32* %array, i32 %i, i32 %j) {
entry:
    %array_local = alloca i32*, align 4
    store i32* %array, i32** %array_local, align 4
    %i_local = alloca i32, align 4
    store i32 %i, i32* %i_local, align 4
    %j_local = alloca i32, align 4
    store i32 %j, i32* %j_local, align 4
    %temp = alloca i32, align 4
    %load_temp0 = load i32, i32* %i_local, align 4
    %gep_temp1 = getelementptr i32*, i32** %array_local, i32 0, i32 %load_temp0
    %load_temp2 = load i32*, i32** %gep_temp1, align 4
    store i32* %load_temp2, i32* %temp, align 4
    %load_temp3 = load i32, i32* %i_local, align 4
    %gep_temp4 = getelementptr i32*, i32** %array_local, i32 0, i32 %load_temp3
    %load_temp5 = load i32, i32* %j_local, align 4
    %gep_temp6 = getelementptr i32*, i32** %array_local, i32 0, i32 %load_temp5
    %load_temp7 = load i32*, i32** %gep_temp6, align 4
    store i32* %load_temp7, i32** %gep_temp4, align 4
    %load_temp8 = load i32, i32* %j_local, align 4
    %gep_temp9 = getelementptr i32*, i32** %array_local, i32 0, i32 %load_temp8
    %load_temp10 = load i32, i32* %temp, align 4
    store i32 %load_temp10, i32** %gep_temp9, align 4
    ret i32 0
}

define i32 @heap_ajust(i32* %arr, i32 %start, i32 %end) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %start_local = alloca i32, align 4
    store i32 %start, i32* %start_local, align 4
    %end_local = alloca i32, align 4
    store i32 %end, i32* %end_local, align 4
    %dad = alloca i32, align 4
    %load_temp11 = load i32, i32* %start_local, align 4
    store i32 %load_temp11, i32* %dad, align 4
    %son = alloca i32, align 4
    %load_temp12 = load i32, i32* %dad, align 4
    %mul_temp13 = mul i32 %load_temp12, 2
    %add_temp14 = add i32 %mul_temp13, 1
    store i32 %add_temp14, i32* %son, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp15 = load i32, i32* %son, align 4
    %load_temp16 = load i32, i32* %end_local, align 4
    %add_temp17 = add i32 %load_temp16, 1
    %icmp_slt_temp18 = icmp slt i32 %load_temp15, %add_temp17
    br i1 %icmp_slt_temp18, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp19 = load i32, i32* %son, align 4
    %load_temp20 = load i32, i32* %end_local, align 4
    %icmp_slt_temp21 = icmp slt i32 %load_temp19, %load_temp20
    %load_temp22 = load i32, i32* %son, align 4
    %gep_temp23 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp22
    %load_temp24 = load i32*, i32** %gep_temp23, align 4
    %load_temp25 = load i32, i32* %son, align 4
    %add_temp26 = add i32 %load_temp25, 1
    %gep_temp27 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp26
    %load_temp28 = load i32*, i32** %gep_temp27, align 4
    %icmp_slt_temp29 = icmp slt i32* %load_temp24, %load_temp28
    %zext_temp30 = zext i1 %icmp_slt_temp21 to i32
    %zext_temp31 = zext i1 %icmp_slt_temp29 to i32
    %mul_temp32 = mul i32 %zext_temp30, %zext_temp31
    %icmp_ne_temp33 = icmp ne i32 %mul_temp32, 0
    br i1 %icmp_ne_temp33, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp34 = load i32, i32* %son, align 4
    %add_temp35 = add i32 %load_temp34, 1
    store i32 %add_temp35, i32* %son, align 4
    br label %if_end_0
if_end_0:
    %load_temp36 = load i32, i32* %dad, align 4
    %gep_temp37 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp36
    %load_temp38 = load i32*, i32** %gep_temp37, align 4
    %load_temp39 = load i32, i32* %son, align 4
    %gep_temp40 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp39
    %load_temp41 = load i32*, i32** %gep_temp40, align 4
    %icmp_sgt_temp42 = icmp sgt i32* %load_temp38, %load_temp41
    br i1 %icmp_sgt_temp42, label %if_then_1, label %if_else_1
if_then_1:
    ret i32 0
if_else_1:
    %load_temp43 = load i32*, i32** %arr_local, align 4
    %load_temp44 = load i32, i32* %dad, align 4
    %load_temp45 = load i32, i32* %son, align 4
    %call_temp46 = call i32 @swap(i32* %load_temp43, i32 %load_temp44, i32 %load_temp45)
    store i32 %call_temp46, i32* %dad, align 4
    %load_temp47 = load i32, i32* %son, align 4
    store i32 %load_temp47, i32* %dad, align 4
    %load_temp48 = load i32, i32* %dad, align 4
    %mul_temp49 = mul i32 %load_temp48, 2
    %add_temp50 = add i32 %mul_temp49, 1
    store i32 %add_temp50, i32* %son, align 4
    br label %if_end_1
if_end_1:
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @heap_sort(i32* %arr, i32 %len) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %len_local = alloca i32, align 4
    store i32 %len, i32* %len_local, align 4
    %i = alloca i32, align 4
    %tmp = alloca i32, align 4
    %load_temp51 = load i32, i32* %len_local, align 4
    %sdiv_temp52 = sdiv i32 %load_temp51, 2
    %sub_temp53 = sub i32 %sdiv_temp52, 1
    store i32 %sub_temp53, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp54 = load i32, i32* %i, align 4
    %sub_temp55 = sub i32 0, 1
    %icmp_sgt_temp56 = icmp sgt i32 %load_temp54, %sub_temp55
    br i1 %icmp_sgt_temp56, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp57 = load i32, i32* %len_local, align 4
    %sub_temp58 = sub i32 %load_temp57, 1
    store i32 %sub_temp58, i32* %tmp, align 4
    %load_temp59 = load i32*, i32** %arr_local, align 4
    %load_temp60 = load i32, i32* %i, align 4
    %load_temp61 = load i32, i32* %tmp, align 4
    %call_temp62 = call i32 @heap_ajust(i32* %load_temp59, i32 %load_temp60, i32 %load_temp61)
    store i32 %call_temp62, i32* %tmp, align 4
    %load_temp63 = load i32, i32* %i, align 4
    %sub_temp64 = sub i32 %load_temp63, 1
    store i32 %sub_temp64, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp65 = load i32, i32* %len_local, align 4
    %sub_temp66 = sub i32 %load_temp65, 1
    store i32 %sub_temp66, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp67 = load i32, i32* %i, align 4
    %icmp_sgt_temp68 = icmp sgt i32 %load_temp67, 0
    br i1 %icmp_sgt_temp68, label %while_body_0, label %while_end_0
while_body_0:
    %tmp0 = alloca i32, align 4
    store i32 0, i32* %tmp0, align 4
    %load_temp69 = load i32*, i32** %arr_local, align 4
    %load_temp70 = load i32, i32* %tmp0, align 4
    %load_temp71 = load i32, i32* %i, align 4
    %call_temp72 = call i32 @swap(i32* %load_temp69, i32 %load_temp70, i32 %load_temp71)
    store i32 %call_temp72, i32* %tmp, align 4
    %load_temp73 = load i32, i32* %i, align 4
    %sub_temp74 = sub i32 %load_temp73, 1
    store i32 %sub_temp74, i32* %tmp, align 4
    %load_temp75 = load i32*, i32** %arr_local, align 4
    %load_temp76 = load i32, i32* %tmp0, align 4
    %load_temp77 = load i32, i32* %tmp, align 4
    %call_temp78 = call i32 @heap_ajust(i32* %load_temp75, i32 %load_temp76, i32 %load_temp77)
    store i32 %call_temp78, i32* %tmp, align 4
    %load_temp79 = load i32, i32* %i, align 4
    %sub_temp80 = sub i32 %load_temp79, 1
    store i32 %sub_temp80, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp81 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp81, align 4
    %gep_temp82 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp82, align 4
    %gep_temp83 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp83, align 4
    %gep_temp84 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp84, align 4
    %gep_temp85 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp85, align 4
    %gep_temp86 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp86, align 4
    %gep_temp87 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp87, align 4
    %gep_temp88 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp88, align 4
    %gep_temp89 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp89, align 4
    %gep_temp90 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp90, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %load_temp91 = load [10 x i32], [10 x i32]* %a, align 4
    %load_temp92 = load i32, i32* @n, align 4
    %call_temp93 = call i32 @heap_sort([10 x i32] %load_temp91, i32 %load_temp92)
    store i32 %call_temp93, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp94 = load i32, i32* %i, align 4
    %load_temp95 = load i32, i32* @n, align 4
    %icmp_slt_temp96 = icmp slt i32 %load_temp94, %load_temp95
    br i1 %icmp_slt_temp96, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp97 = load i32, i32* %i, align 4
    %gep_temp98 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp97
    %load_temp99 = load i32, i32* %gep_temp98, align 4
    store i32 %load_temp99, i32* %tmp, align 4
    %load_temp100 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp100)
    store i32 10, i32* %tmp, align 4
    %load_temp101 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp101)
    %load_temp102 = load i32, i32* %i, align 4
    %add_temp103 = add i32 %load_temp102, 1
    store i32 %add_temp103, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

