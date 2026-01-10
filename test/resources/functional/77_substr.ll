; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @MAX(i32 %a, i32 %b) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %load_temp0 = load i32, i32* %a_local, align 4
    %load_temp1 = load i32, i32* %b_local, align 4
    %icmp_eq_temp2 = icmp eq i32 %load_temp0, %load_temp1
    br i1 %icmp_eq_temp2, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp3 = load i32, i32* %a_local, align 4
    ret i32 %load_temp3
if_else_0:
    %load_temp4 = load i32, i32* %a_local, align 4
    %load_temp5 = load i32, i32* %b_local, align 4
    %icmp_sgt_temp6 = icmp sgt i32 %load_temp4, %load_temp5
    br i1 %icmp_sgt_temp6, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp7 = load i32, i32* %a_local, align 4
    ret i32 %load_temp7
if_else_1:
    %load_temp8 = load i32, i32* %b_local, align 4
    ret i32 %load_temp8
if_end_1:
    br label %if_end_0
if_end_0:
    ret void
}

define i32 @max_sum_nonadjacent(i32* %arr, i32 %n) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %temp = alloca [16 x i32], align 4
    %gep_temp9 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 0
    %gep_temp10 = getelementptr i32*, i32** %arr_local, i32 0, i32 0
    %load_temp11 = load i32*, i32** %gep_temp10, align 4
    store i32* %load_temp11, i32* %gep_temp9, align 4
    %gep_temp12 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 1
    %gep_temp13 = getelementptr i32*, i32** %arr_local, i32 0, i32 0
    %load_temp14 = load i32*, i32** %gep_temp13, align 4
    %gep_temp15 = getelementptr i32*, i32** %arr_local, i32 0, i32 1
    %load_temp16 = load i32*, i32** %gep_temp15, align 4
    %call_temp17 = call i32 @MAX(i32* %load_temp14, i32* %load_temp16)
    store i32 %call_temp17, i32* %gep_temp12, align 4
    %i = alloca i32, align 4
    store i32 2, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp18 = load i32, i32* %i, align 4
    %load_temp19 = load i32, i32* %n_local, align 4
    %icmp_slt_temp20 = icmp slt i32 %load_temp18, %load_temp19
    br i1 %icmp_slt_temp20, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp21 = load i32, i32* %i, align 4
    %gep_temp22 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 %load_temp21
    %load_temp23 = load i32, i32* %i, align 4
    %sub_temp24 = sub i32 %load_temp23, 2
    %gep_temp25 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 %sub_temp24
    %load_temp26 = load i32, i32* %gep_temp25, align 4
    %load_temp27 = load i32, i32* %i, align 4
    %gep_temp28 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp27
    %load_temp29 = load i32*, i32** %gep_temp28, align 4
    %add_temp30 = add i32 %load_temp26, %load_temp29
    %load_temp31 = load i32, i32* %i, align 4
    %sub_temp32 = sub i32 %load_temp31, 1
    %gep_temp33 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 %sub_temp32
    %load_temp34 = load i32, i32* %gep_temp33, align 4
    %call_temp35 = call i32 @MAX(i32 %add_temp30, i32 %load_temp34)
    store i32 %call_temp35, i32* %gep_temp22, align 4
    %load_temp36 = load i32, i32* %i, align 4
    %add_temp37 = add i32 %load_temp36, 1
    store i32 %add_temp37, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp38 = load i32, i32* %n_local, align 4
    %sub_temp39 = sub i32 %load_temp38, 1
    %gep_temp40 = getelementptr [16 x i32], [16 x i32]* %temp, i32 0, i32 %sub_temp39
    %load_temp41 = load i32, i32* %gep_temp40, align 4
    ret i32 %load_temp41
}

define i32 @longest_common_subseq(i32* %arr1, i32 %len1, i32* %arr2, i32 %len2) {
entry:
    %arr1_local = alloca i32*, align 4
    store i32* %arr1, i32** %arr1_local, align 4
    %len1_local = alloca i32, align 4
    store i32 %len1, i32* %len1_local, align 4
    %arr2_local = alloca i32*, align 4
    store i32* %arr2, i32** %arr2_local, align 4
    %len2_local = alloca i32, align 4
    store i32 %len2, i32* %len2_local, align 4
    %p = alloca [16 x [16 x i32]], align 4
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp42 = load i32, i32* %i, align 4
    %load_temp43 = load i32, i32* %len1_local, align 4
    %icmp_sle_temp44 = icmp sle i32 %load_temp42, %load_temp43
    br i1 %icmp_sle_temp44, label %while_body_0, label %while_end_0
while_body_0:
    store i32 1, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp45 = load i32, i32* %j, align 4
    %load_temp46 = load i32, i32* %len2_local, align 4
    %icmp_sle_temp47 = icmp sle i32 %load_temp45, %load_temp46
    br i1 %icmp_sle_temp47, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp48 = load i32, i32* %i, align 4
    %sub_temp49 = sub i32 %load_temp48, 1
    %gep_temp50 = getelementptr i32*, i32** %arr1_local, i32 0, i32 %sub_temp49
    %load_temp51 = load i32*, i32** %gep_temp50, align 4
    %load_temp52 = load i32, i32* %j, align 4
    %sub_temp53 = sub i32 %load_temp52, 1
    %gep_temp54 = getelementptr i32*, i32** %arr2_local, i32 0, i32 %sub_temp53
    %load_temp55 = load i32*, i32** %gep_temp54, align 4
    %icmp_eq_temp56 = icmp eq i32* %load_temp51, %load_temp55
    br i1 %icmp_eq_temp56, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp57 = load i32, i32* %i, align 4
    %load_temp58 = load i32, i32* %j, align 4
    %gep_temp59 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %load_temp57, i32 %load_temp58
    %load_temp60 = load i32, i32* %i, align 4
    %sub_temp61 = sub i32 %load_temp60, 1
    %load_temp62 = load i32, i32* %j, align 4
    %sub_temp63 = sub i32 %load_temp62, 1
    %gep_temp64 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %sub_temp61, i32 %sub_temp63
    %load_temp65 = load i32, i32* %gep_temp64, align 4
    %add_temp66 = add i32 %load_temp65, 1
    store i32 %add_temp66, i32* %gep_temp59, align 4
    br label %if_end_2
if_else_2:
    %load_temp67 = load i32, i32* %i, align 4
    %load_temp68 = load i32, i32* %j, align 4
    %gep_temp69 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %load_temp67, i32 %load_temp68
    %load_temp70 = load i32, i32* %i, align 4
    %sub_temp71 = sub i32 %load_temp70, 1
    %load_temp72 = load i32, i32* %j, align 4
    %gep_temp73 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %sub_temp71, i32 %load_temp72
    %load_temp74 = load i32, i32* %gep_temp73, align 4
    %load_temp75 = load i32, i32* %i, align 4
    %load_temp76 = load i32, i32* %j, align 4
    %sub_temp77 = sub i32 %load_temp76, 1
    %gep_temp78 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %load_temp75, i32 %sub_temp77
    %load_temp79 = load i32, i32* %gep_temp78, align 4
    %call_temp80 = call i32 @MAX(i32 %load_temp74, i32 %load_temp79)
    store i32 %call_temp80, i32* %gep_temp69, align 4
    br label %if_end_2
if_end_2:
    %load_temp81 = load i32, i32* %j, align 4
    %add_temp82 = add i32 %load_temp81, 1
    store i32 %add_temp82, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp83 = load i32, i32* %i, align 4
    %add_temp84 = add i32 %load_temp83, 1
    store i32 %add_temp84, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp85 = load i32, i32* %len1_local, align 4
    %load_temp86 = load i32, i32* %len2_local, align 4
    %gep_temp87 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %p, i32 0, i32 %load_temp85, i32 %load_temp86
    %load_temp88 = load i32, i32* %gep_temp87, align 4
    ret i32 %load_temp88
}

define i32 @main() {
entry:
    %A = alloca [15 x i32], align 4
    %gep_temp89 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 0
    store i32 8, i32* %gep_temp89, align 4
    %gep_temp90 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 1
    store i32 7, i32* %gep_temp90, align 4
    %gep_temp91 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 2
    store i32 4, i32* %gep_temp91, align 4
    %gep_temp92 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 3
    store i32 1, i32* %gep_temp92, align 4
    %gep_temp93 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 4
    store i32 2, i32* %gep_temp93, align 4
    %gep_temp94 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 5
    store i32 7, i32* %gep_temp94, align 4
    %gep_temp95 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 6
    store i32 0, i32* %gep_temp95, align 4
    %gep_temp96 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 7
    store i32 1, i32* %gep_temp96, align 4
    %gep_temp97 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 8
    store i32 9, i32* %gep_temp97, align 4
    %gep_temp98 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 9
    store i32 3, i32* %gep_temp98, align 4
    %gep_temp99 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 10
    store i32 4, i32* %gep_temp99, align 4
    %gep_temp100 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 11
    store i32 8, i32* %gep_temp100, align 4
    %gep_temp101 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 12
    store i32 3, i32* %gep_temp101, align 4
    %gep_temp102 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 13
    store i32 7, i32* %gep_temp102, align 4
    %gep_temp103 = getelementptr [15 x i32], [15 x i32]* %A, i32 0, i32 14
    store i32 0, i32* %gep_temp103, align 4
    %B = alloca [13 x i32], align 4
    %gep_temp104 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 0
    store i32 3, i32* %gep_temp104, align 4
    %gep_temp105 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 1
    store i32 9, i32* %gep_temp105, align 4
    %gep_temp106 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 2
    store i32 7, i32* %gep_temp106, align 4
    %gep_temp107 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 3
    store i32 1, i32* %gep_temp107, align 4
    %gep_temp108 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 4
    store i32 4, i32* %gep_temp108, align 4
    %gep_temp109 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 5
    store i32 2, i32* %gep_temp109, align 4
    %gep_temp110 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 6
    store i32 4, i32* %gep_temp110, align 4
    %gep_temp111 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 7
    store i32 3, i32* %gep_temp111, align 4
    %gep_temp112 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 8
    store i32 6, i32* %gep_temp112, align 4
    %gep_temp113 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 9
    store i32 8, i32* %gep_temp113, align 4
    %gep_temp114 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 10
    store i32 0, i32* %gep_temp114, align 4
    %gep_temp115 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 11
    store i32 1, i32* %gep_temp115, align 4
    %gep_temp116 = getelementptr [13 x i32], [13 x i32]* %B, i32 0, i32 12
    store i32 5, i32* %gep_temp116, align 4
    %An = alloca i32, align 4
    %Bn = alloca i32, align 4
    %load_temp117 = load [15 x i32], [15 x i32]* %A, align 4
    %call_temp118 = call i32 @max_sum_nonadjacent([15 x i32] %load_temp117, i32 15)
    call void @putint(i32 %call_temp118)
    call void @putch(i32 10)
    %load_temp119 = load [15 x i32], [15 x i32]* %A, align 4
    %load_temp120 = load [13 x i32], [13 x i32]* %B, align 4
    %call_temp121 = call i32 @longest_common_subseq([15 x i32] %load_temp119, i32 15, [13 x i32] %load_temp120, i32 13)
    call void @putint(i32 %call_temp121)
    call void @putch(i32 10)
    ret i32 0
}

