; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@len = constant i32 20, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    %t = alloca i32, align 4
    %n = alloca i32, align 4
    %temp = alloca i32, align 4
    %mult1 = alloca [20 x i32], align 4
    %gep_temp0 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 0
    store i32 1, i32* %gep_temp0, align 4
    %gep_temp1 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 1
    store i32 2, i32* %gep_temp1, align 4
    %gep_temp2 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 2
    store i32 3, i32* %gep_temp2, align 4
    %gep_temp3 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 3
    store i32 4, i32* %gep_temp3, align 4
    %gep_temp4 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 4
    store i32 5, i32* %gep_temp4, align 4
    %gep_temp5 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 5
    store i32 6, i32* %gep_temp5, align 4
    %gep_temp6 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 6
    store i32 7, i32* %gep_temp6, align 4
    %gep_temp7 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 7
    store i32 8, i32* %gep_temp7, align 4
    %gep_temp8 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 8
    store i32 9, i32* %gep_temp8, align 4
    %gep_temp9 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 9
    store i32 0, i32* %gep_temp9, align 4
    %gep_temp10 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 10
    store i32 1, i32* %gep_temp10, align 4
    %gep_temp11 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 11
    store i32 2, i32* %gep_temp11, align 4
    %gep_temp12 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 12
    store i32 3, i32* %gep_temp12, align 4
    %gep_temp13 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 13
    store i32 4, i32* %gep_temp13, align 4
    %gep_temp14 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 14
    store i32 5, i32* %gep_temp14, align 4
    %gep_temp15 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 15
    store i32 6, i32* %gep_temp15, align 4
    %gep_temp16 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 16
    store i32 7, i32* %gep_temp16, align 4
    %gep_temp17 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 17
    store i32 8, i32* %gep_temp17, align 4
    %gep_temp18 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 18
    store i32 9, i32* %gep_temp18, align 4
    %gep_temp19 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 19
    store i32 0, i32* %gep_temp19, align 4
    %mult2 = alloca [20 x i32], align 4
    %gep_temp20 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 0
    store i32 2, i32* %gep_temp20, align 4
    %gep_temp21 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 1
    store i32 3, i32* %gep_temp21, align 4
    %gep_temp22 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 2
    store i32 4, i32* %gep_temp22, align 4
    %gep_temp23 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 3
    store i32 2, i32* %gep_temp23, align 4
    %gep_temp24 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 4
    store i32 5, i32* %gep_temp24, align 4
    %gep_temp25 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 5
    store i32 7, i32* %gep_temp25, align 4
    %gep_temp26 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 6
    store i32 9, i32* %gep_temp26, align 4
    %gep_temp27 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 7
    store i32 9, i32* %gep_temp27, align 4
    %gep_temp28 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 8
    store i32 0, i32* %gep_temp28, align 4
    %gep_temp29 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 9
    store i32 1, i32* %gep_temp29, align 4
    %gep_temp30 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 10
    store i32 9, i32* %gep_temp30, align 4
    %gep_temp31 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 11
    store i32 8, i32* %gep_temp31, align 4
    %gep_temp32 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 12
    store i32 7, i32* %gep_temp32, align 4
    %gep_temp33 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 13
    store i32 6, i32* %gep_temp33, align 4
    %gep_temp34 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 14
    store i32 4, i32* %gep_temp34, align 4
    %gep_temp35 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 15
    store i32 3, i32* %gep_temp35, align 4
    %gep_temp36 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 16
    store i32 2, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 17
    store i32 1, i32* %gep_temp37, align 4
    %gep_temp38 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 18
    store i32 2, i32* %gep_temp38, align 4
    %gep_temp39 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 19
    store i32 2, i32* %gep_temp39, align 4
    %len1 = alloca i32, align 4
    %load_temp40 = load i32, i32* @len, align 4
    store i32 %load_temp40, i32* %len1, align 4
    %len2 = alloca i32, align 4
    %load_temp41 = load i32, i32* @len, align 4
    store i32 %load_temp41, i32* %len2, align 4
    %c1 = alloca [25 x i32], align 4
    %c2 = alloca [25 x i32], align 4
    %result = alloca [40 x i32], align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp42 = load i32, i32* %i, align 4
    %load_temp43 = load i32, i32* %len1, align 4
    %icmp_slt_temp44 = icmp slt i32 %load_temp42, %load_temp43
    br i1 %icmp_slt_temp44, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp45 = load i32, i32* %i, align 4
    %gep_temp46 = getelementptr [25 x i32], [25 x i32]* %c1, i32 0, i32 %load_temp45
    %load_temp47 = load i32, i32* %i, align 4
    %gep_temp48 = getelementptr [20 x i32], [20 x i32]* %mult1, i32 0, i32 %load_temp47
    %load_temp49 = load i32, i32* %gep_temp48, align 4
    store i32 %load_temp49, i32* %gep_temp46, align 4
    %load_temp50 = load i32, i32* %i, align 4
    %add_temp51 = add i32 %load_temp50, 1
    store i32 %add_temp51, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp52 = load i32, i32* %i, align 4
    %load_temp53 = load i32, i32* %len2, align 4
    %icmp_slt_temp54 = icmp slt i32 %load_temp52, %load_temp53
    br i1 %icmp_slt_temp54, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp55 = load i32, i32* %i, align 4
    %gep_temp56 = getelementptr [25 x i32], [25 x i32]* %c2, i32 0, i32 %load_temp55
    %load_temp57 = load i32, i32* %i, align 4
    %gep_temp58 = getelementptr [20 x i32], [20 x i32]* %mult2, i32 0, i32 %load_temp57
    %load_temp59 = load i32, i32* %gep_temp58, align 4
    store i32 %load_temp59, i32* %gep_temp56, align 4
    %load_temp60 = load i32, i32* %i, align 4
    %add_temp61 = add i32 %load_temp60, 1
    store i32 %add_temp61, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp62 = load i32, i32* %len1, align 4
    %load_temp63 = load i32, i32* %len2, align 4
    %add_temp64 = add i32 %load_temp62, %load_temp63
    %sub_temp65 = sub i32 %add_temp64, 1
    store i32 %sub_temp65, i32* %n, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp66 = load i32, i32* %i, align 4
    %load_temp67 = load i32, i32* %n, align 4
    %icmp_sle_temp68 = icmp sle i32 %load_temp66, %load_temp67
    br i1 %icmp_sle_temp68, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp69 = load i32, i32* %i, align 4
    %gep_temp70 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %load_temp69
    store i32 0, i32* %gep_temp70, align 4
    %load_temp71 = load i32, i32* %i, align 4
    %add_temp72 = add i32 %load_temp71, 1
    store i32 %add_temp72, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %temp, align 4
    %load_temp73 = load i32, i32* %len2, align 4
    %sub_temp74 = sub i32 %load_temp73, 1
    store i32 %sub_temp74, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp75 = load i32, i32* %i, align 4
    %sub_temp76 = sub i32 0, 1
    %icmp_sgt_temp77 = icmp sgt i32 %load_temp75, %sub_temp76
    br i1 %icmp_sgt_temp77, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp78 = load i32, i32* %i, align 4
    %gep_temp79 = getelementptr [25 x i32], [25 x i32]* %c2, i32 0, i32 %load_temp78
    %load_temp80 = load i32, i32* %gep_temp79, align 4
    store i32 %load_temp80, i32* %t, align 4
    %load_temp81 = load i32, i32* %len1, align 4
    %sub_temp82 = sub i32 %load_temp81, 1
    store i32 %sub_temp82, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp83 = load i32, i32* %j, align 4
    %sub_temp84 = sub i32 0, 1
    %icmp_sgt_temp85 = icmp sgt i32 %load_temp83, %sub_temp84
    br i1 %icmp_sgt_temp85, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp86 = load i32, i32* %n, align 4
    %gep_temp87 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %load_temp86
    %load_temp88 = load i32, i32* %gep_temp87, align 4
    %load_temp89 = load i32, i32* %t, align 4
    %load_temp90 = load i32, i32* %j, align 4
    %gep_temp91 = getelementptr [25 x i32], [25 x i32]* %c1, i32 0, i32 %load_temp90
    %load_temp92 = load i32, i32* %gep_temp91, align 4
    %mul_temp93 = mul i32 %load_temp89, %load_temp92
    %add_temp94 = add i32 %load_temp88, %mul_temp93
    store i32 %add_temp94, i32* %temp, align 4
    %load_temp95 = load i32, i32* %temp, align 4
    %icmp_sge_temp96 = icmp sge i32 %load_temp95, 10
    br i1 %icmp_sge_temp96, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp97 = load i32, i32* %n, align 4
    %gep_temp98 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %load_temp97
    %load_temp99 = load i32, i32* %temp, align 4
    store i32 %load_temp99, i32* %gep_temp98, align 4
    %load_temp100 = load i32, i32* %n, align 4
    %sub_temp101 = sub i32 %load_temp100, 1
    %gep_temp102 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %sub_temp101
    %load_temp103 = load i32, i32* %n, align 4
    %sub_temp104 = sub i32 %load_temp103, 1
    %gep_temp105 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %sub_temp104
    %load_temp106 = load i32, i32* %gep_temp105, align 4
    %load_temp107 = load i32, i32* %temp, align 4
    %sdiv_temp108 = sdiv i32 %load_temp107, 10
    %add_temp109 = add i32 %load_temp106, %sdiv_temp108
    store i32 %add_temp109, i32* %gep_temp102, align 4
    br label %if_end_0
if_else_0:
    %load_temp110 = load i32, i32* %n, align 4
    %gep_temp111 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %load_temp110
    %load_temp112 = load i32, i32* %temp, align 4
    store i32 %load_temp112, i32* %gep_temp111, align 4
    br label %if_end_0
if_end_0:
    %load_temp113 = load i32, i32* %j, align 4
    %sub_temp114 = sub i32 %load_temp113, 1
    store i32 %sub_temp114, i32* %j, align 4
    %load_temp115 = load i32, i32* %n, align 4
    %sub_temp116 = sub i32 %load_temp115, 1
    store i32 %sub_temp116, i32* %n, align 4
    br label %while_cond_1
while_end_1:
    %load_temp117 = load i32, i32* %n, align 4
    %load_temp118 = load i32, i32* %len1, align 4
    %add_temp119 = add i32 %load_temp117, %load_temp118
    %sub_temp120 = sub i32 %add_temp119, 1
    store i32 %sub_temp120, i32* %n, align 4
    %load_temp121 = load i32, i32* %i, align 4
    %sub_temp122 = sub i32 %load_temp121, 1
    store i32 %sub_temp122, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %gep_temp123 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 0
    %load_temp124 = load i32, i32* %gep_temp123, align 4
    %icmp_ne_temp125 = icmp ne i32 %load_temp124, 0
    br i1 %icmp_ne_temp125, label %if_then_1, label %if_end_1
if_then_1:
    %gep_temp126 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 0
    %load_temp127 = load i32, i32* %gep_temp126, align 4
    call void @putint(i32 %load_temp127)
    br label %if_end_1
if_end_1:
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp128 = load i32, i32* %i, align 4
    %load_temp129 = load i32, i32* %len1, align 4
    %load_temp130 = load i32, i32* %len2, align 4
    %add_temp131 = add i32 %load_temp129, %load_temp130
    %sub_temp132 = sub i32 %add_temp131, 1
    %icmp_sle_temp133 = icmp sle i32 %load_temp128, %sub_temp132
    br i1 %icmp_sle_temp133, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp134 = load i32, i32* %i, align 4
    %gep_temp135 = getelementptr [40 x i32], [40 x i32]* %result, i32 0, i32 %load_temp134
    %load_temp136 = load i32, i32* %gep_temp135, align 4
    call void @putint(i32 %load_temp136)
    %load_temp137 = load i32, i32* %i, align 4
    %add_temp138 = add i32 %load_temp137, 1
    store i32 %add_temp138, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

