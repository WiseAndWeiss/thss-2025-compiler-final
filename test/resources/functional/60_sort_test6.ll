; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @counting_sort(i32* %ini_arr, i32* %sorted_arr, i32 %n) {
entry:
    %ini_arr_local = alloca i32*, align 4
    store i32* %ini_arr, i32** %ini_arr_local, align 4
    %sorted_arr_local = alloca i32*, align 4
    store i32* %sorted_arr, i32** %sorted_arr_local, align 4
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %count_arr = alloca [10 x i32], align 4
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    %k = alloca i32, align 4
    store i32 0, i32* %k, align 4
    store i32 0, i32* %i, align 4
    store i32 0, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %k, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 10
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %k, align 4
    %gep_temp3 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp2
    store i32 0, i32* %gep_temp3, align 4
    %load_temp4 = load i32, i32* %k, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp6 = load i32, i32* %i, align 4
    %load_temp7 = load i32, i32* %n_local, align 4
    %icmp_slt_temp8 = icmp slt i32 %load_temp6, %load_temp7
    br i1 %icmp_slt_temp8, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp9 = load i32, i32* %i, align 4
    %gep_temp10 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %load_temp9
    %load_temp11 = load i32*, i32** %gep_temp10, align 4
    %gep_temp12 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp11
    %load_temp13 = load i32, i32* %i, align 4
    %gep_temp14 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %load_temp13
    %load_temp15 = load i32*, i32** %gep_temp14, align 4
    %gep_temp16 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp15
    %load_temp17 = load i32, i32* %gep_temp16, align 4
    %add_temp18 = add i32 %load_temp17, 1
    store i32 %add_temp18, i32* %gep_temp12, align 4
    %load_temp19 = load i32, i32* %i, align 4
    %add_temp20 = add i32 %load_temp19, 1
    store i32 %add_temp20, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 1, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp21 = load i32, i32* %k, align 4
    %icmp_slt_temp22 = icmp slt i32 %load_temp21, 10
    br i1 %icmp_slt_temp22, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp23 = load i32, i32* %k, align 4
    %gep_temp24 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp23
    %load_temp25 = load i32, i32* %k, align 4
    %gep_temp26 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp25
    %load_temp27 = load i32, i32* %gep_temp26, align 4
    %load_temp28 = load i32, i32* %k, align 4
    %sub_temp29 = sub i32 %load_temp28, 1
    %gep_temp30 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %sub_temp29
    %load_temp31 = load i32, i32* %gep_temp30, align 4
    %add_temp32 = add i32 %load_temp27, %load_temp31
    store i32 %add_temp32, i32* %gep_temp24, align 4
    %load_temp33 = load i32, i32* %k, align 4
    %add_temp34 = add i32 %load_temp33, 1
    store i32 %add_temp34, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    %load_temp35 = load i32, i32* %n_local, align 4
    store i32 %load_temp35, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp36 = load i32, i32* %j, align 4
    %icmp_sgt_temp37 = icmp sgt i32 %load_temp36, 0
    br i1 %icmp_sgt_temp37, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp38 = load i32, i32* %j, align 4
    %sub_temp39 = sub i32 %load_temp38, 1
    %gep_temp40 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %sub_temp39
    %load_temp41 = load i32*, i32** %gep_temp40, align 4
    %gep_temp42 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp41
    %load_temp43 = load i32, i32* %j, align 4
    %sub_temp44 = sub i32 %load_temp43, 1
    %gep_temp45 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %sub_temp44
    %load_temp46 = load i32*, i32** %gep_temp45, align 4
    %gep_temp47 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp46
    %load_temp48 = load i32, i32* %gep_temp47, align 4
    %sub_temp49 = sub i32 %load_temp48, 1
    store i32 %sub_temp49, i32* %gep_temp42, align 4
    %load_temp50 = load i32, i32* %j, align 4
    %sub_temp51 = sub i32 %load_temp50, 1
    %gep_temp52 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %sub_temp51
    %load_temp53 = load i32*, i32** %gep_temp52, align 4
    %gep_temp54 = getelementptr [10 x i32], [10 x i32]* %count_arr, i32 0, i32 %load_temp53
    %load_temp55 = load i32, i32* %gep_temp54, align 4
    %gep_temp56 = getelementptr i32*, i32** %sorted_arr_local, i32 0, i32 %load_temp55
    %load_temp57 = load i32, i32* %j, align 4
    %sub_temp58 = sub i32 %load_temp57, 1
    %gep_temp59 = getelementptr i32*, i32** %ini_arr_local, i32 0, i32 %sub_temp58
    %load_temp60 = load i32*, i32** %gep_temp59, align 4
    store i32* %load_temp60, i32** %gep_temp56, align 4
    %load_temp61 = load i32, i32* %j, align 4
    %sub_temp62 = sub i32 %load_temp61, 1
    store i32 %sub_temp62, i32* %j, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 10, i32* @n, align 4
    %a = alloca [10 x i32], align 4
    %gep_temp63 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 4, i32* %gep_temp63, align 4
    %gep_temp64 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 3, i32* %gep_temp64, align 4
    %gep_temp65 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 2
    store i32 9, i32* %gep_temp65, align 4
    %gep_temp66 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 3
    store i32 2, i32* %gep_temp66, align 4
    %gep_temp67 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 4
    store i32 0, i32* %gep_temp67, align 4
    %gep_temp68 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 5
    store i32 1, i32* %gep_temp68, align 4
    %gep_temp69 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 6
    store i32 6, i32* %gep_temp69, align 4
    %gep_temp70 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 7
    store i32 5, i32* %gep_temp70, align 4
    %gep_temp71 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 8
    store i32 7, i32* %gep_temp71, align 4
    %gep_temp72 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 9
    store i32 8, i32* %gep_temp72, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %b = alloca [10 x i32], align 4
    %load_temp73 = load [10 x i32], [10 x i32]* %a, align 4
    %load_temp74 = load [10 x i32], [10 x i32]* %b, align 4
    %load_temp75 = load i32, i32* @n, align 4
    %call_temp76 = call i32 @counting_sort([10 x i32] %load_temp73, [10 x i32] %load_temp74, i32 %load_temp75)
    store i32 %call_temp76, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp77 = load i32, i32* %i, align 4
    %load_temp78 = load i32, i32* @n, align 4
    %icmp_slt_temp79 = icmp slt i32 %load_temp77, %load_temp78
    br i1 %icmp_slt_temp79, label %while_body_0, label %while_end_0
while_body_0:
    %tmp = alloca i32, align 4
    %load_temp80 = load i32, i32* %i, align 4
    %gep_temp81 = getelementptr [10 x i32], [10 x i32]* %b, i32 0, i32 %load_temp80
    %load_temp82 = load i32, i32* %gep_temp81, align 4
    store i32 %load_temp82, i32* %tmp, align 4
    %load_temp83 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp83)
    store i32 10, i32* %tmp, align 4
    %load_temp84 = load i32, i32* %tmp, align 4
    call void @putch(i32 %load_temp84)
    %load_temp85 = load i32, i32* %i, align 4
    %add_temp86 = add i32 %load_temp85, 1
    store i32 %add_temp86, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

