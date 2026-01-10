; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@N = constant i32 10000, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @long_array(i32 %k) {
entry:
    %k_local = alloca i32, align 4
    store i32 %k, i32* %k_local, align 4
    %a1 = alloca [10000 x i32], align 4
    %a2 = alloca [10000 x i32], align 4
    %a3 = alloca [10000 x i32], align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* @N, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    br i1 %icmp_slt_temp2, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp3
    %load_temp5 = load i32, i32* %i, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %mul_temp7 = mul i32 %load_temp5, %load_temp6
    %srem_temp8 = srem i32 %mul_temp7, 10
    store i32 %srem_temp8, i32* %gep_temp4, align 4
    %load_temp9 = load i32, i32* %i, align 4
    %add_temp10 = add i32 %load_temp9, 1
    store i32 %add_temp10, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp11 = load i32, i32* %i, align 4
    %load_temp12 = load i32, i32* @N, align 4
    %icmp_slt_temp13 = icmp slt i32 %load_temp11, %load_temp12
    br i1 %icmp_slt_temp13, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp14 = load i32, i32* %i, align 4
    %gep_temp15 = getelementptr [10000 x i32], [10000 x i32]* %a2, i32 0, i32 %load_temp14
    %load_temp16 = load i32, i32* %i, align 4
    %gep_temp17 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp16
    %load_temp18 = load i32, i32* %gep_temp17, align 4
    %load_temp19 = load i32, i32* %i, align 4
    %gep_temp20 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp19
    %load_temp21 = load i32, i32* %gep_temp20, align 4
    %mul_temp22 = mul i32 %load_temp18, %load_temp21
    %srem_temp23 = srem i32 %mul_temp22, 10
    store i32 %srem_temp23, i32* %gep_temp15, align 4
    %load_temp24 = load i32, i32* %i, align 4
    %add_temp25 = add i32 %load_temp24, 1
    store i32 %add_temp25, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp26 = load i32, i32* %i, align 4
    %load_temp27 = load i32, i32* @N, align 4
    %icmp_slt_temp28 = icmp slt i32 %load_temp26, %load_temp27
    br i1 %icmp_slt_temp28, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp29 = load i32, i32* %i, align 4
    %gep_temp30 = getelementptr [10000 x i32], [10000 x i32]* %a3, i32 0, i32 %load_temp29
    %load_temp31 = load i32, i32* %i, align 4
    %gep_temp32 = getelementptr [10000 x i32], [10000 x i32]* %a2, i32 0, i32 %load_temp31
    %load_temp33 = load i32, i32* %gep_temp32, align 4
    %load_temp34 = load i32, i32* %i, align 4
    %gep_temp35 = getelementptr [10000 x i32], [10000 x i32]* %a2, i32 0, i32 %load_temp34
    %load_temp36 = load i32, i32* %gep_temp35, align 4
    %mul_temp37 = mul i32 %load_temp33, %load_temp36
    %srem_temp38 = srem i32 %mul_temp37, 100
    %load_temp39 = load i32, i32* %i, align 4
    %gep_temp40 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp39
    %load_temp41 = load i32, i32* %gep_temp40, align 4
    %add_temp42 = add i32 %srem_temp38, %load_temp41
    store i32 %add_temp42, i32* %gep_temp30, align 4
    %load_temp43 = load i32, i32* %i, align 4
    %add_temp44 = add i32 %load_temp43, 1
    store i32 %add_temp44, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %ans = alloca i32, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp45 = load i32, i32* %i, align 4
    %load_temp46 = load i32, i32* @N, align 4
    %icmp_slt_temp47 = icmp slt i32 %load_temp45, %load_temp46
    br i1 %icmp_slt_temp47, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp48 = load i32, i32* %i, align 4
    %icmp_slt_temp49 = icmp slt i32 %load_temp48, 10
    br i1 %icmp_slt_temp49, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp50 = load i32, i32* %ans, align 4
    %load_temp51 = load i32, i32* %i, align 4
    %gep_temp52 = getelementptr [10000 x i32], [10000 x i32]* %a3, i32 0, i32 %load_temp51
    %load_temp53 = load i32, i32* %gep_temp52, align 4
    %add_temp54 = add i32 %load_temp50, %load_temp53
    %srem_temp55 = srem i32 %add_temp54, 1333
    store i32 %srem_temp55, i32* %ans, align 4
    %load_temp56 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp56)
    br label %if_end_0
if_else_0:
    %load_temp57 = load i32, i32* %i, align 4
    %icmp_slt_temp58 = icmp slt i32 %load_temp57, 20
    br i1 %icmp_slt_temp58, label %if_then_1, label %if_else_1
if_then_1:
    %j = alloca i32, align 4
    %load_temp59 = load i32, i32* @N, align 4
    %sdiv_temp60 = sdiv i32 %load_temp59, 2
    store i32 %sdiv_temp60, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp61 = load i32, i32* %j, align 4
    %load_temp62 = load i32, i32* @N, align 4
    %icmp_slt_temp63 = icmp slt i32 %load_temp61, %load_temp62
    br i1 %icmp_slt_temp63, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp64 = load i32, i32* %ans, align 4
    %load_temp65 = load i32, i32* %i, align 4
    %gep_temp66 = getelementptr [10000 x i32], [10000 x i32]* %a3, i32 0, i32 %load_temp65
    %load_temp67 = load i32, i32* %gep_temp66, align 4
    %add_temp68 = add i32 %load_temp64, %load_temp67
    %load_temp69 = load i32, i32* %j, align 4
    %gep_temp70 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp69
    %load_temp71 = load i32, i32* %gep_temp70, align 4
    %sub_temp72 = sub i32 %add_temp68, %load_temp71
    store i32 %sub_temp72, i32* %ans, align 4
    %load_temp73 = load i32, i32* %j, align 4
    %add_temp74 = add i32 %load_temp73, 1
    store i32 %add_temp74, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp75 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp75)
    br label %if_end_1
if_else_1:
    %load_temp76 = load i32, i32* %i, align 4
    %icmp_slt_temp77 = icmp slt i32 %load_temp76, 30
    br i1 %icmp_slt_temp77, label %if_then_2, label %if_else_2
if_then_2:
    %j = alloca i32, align 4
    %load_temp78 = load i32, i32* @N, align 4
    %sdiv_temp79 = sdiv i32 %load_temp78, 2
    store i32 %sdiv_temp79, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp80 = load i32, i32* %j, align 4
    %load_temp81 = load i32, i32* @N, align 4
    %icmp_slt_temp82 = icmp slt i32 %load_temp80, %load_temp81
    br i1 %icmp_slt_temp82, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp83 = load i32, i32* %j, align 4
    %icmp_sgt_temp84 = icmp sgt i32 %load_temp83, 2233
    br i1 %icmp_sgt_temp84, label %if_then_3, label %if_else_3
if_then_3:
    %load_temp85 = load i32, i32* %ans, align 4
    %load_temp86 = load i32, i32* %i, align 4
    %gep_temp87 = getelementptr [10000 x i32], [10000 x i32]* %a2, i32 0, i32 %load_temp86
    %load_temp88 = load i32, i32* %gep_temp87, align 4
    %add_temp89 = add i32 %load_temp85, %load_temp88
    %load_temp90 = load i32, i32* %j, align 4
    %gep_temp91 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp90
    %load_temp92 = load i32, i32* %gep_temp91, align 4
    %sub_temp93 = sub i32 %add_temp89, %load_temp92
    store i32 %sub_temp93, i32* %ans, align 4
    %load_temp94 = load i32, i32* %j, align 4
    %add_temp95 = add i32 %load_temp94, 1
    store i32 %add_temp95, i32* %j, align 4
    br label %if_end_3
if_else_3:
    %load_temp96 = load i32, i32* %ans, align 4
    %load_temp97 = load i32, i32* %i, align 4
    %gep_temp98 = getelementptr [10000 x i32], [10000 x i32]* %a1, i32 0, i32 %load_temp97
    %load_temp99 = load i32, i32* %gep_temp98, align 4
    %add_temp100 = add i32 %load_temp96, %load_temp99
    %load_temp101 = load i32, i32* %j, align 4
    %gep_temp102 = getelementptr [10000 x i32], [10000 x i32]* %a3, i32 0, i32 %load_temp101
    %load_temp103 = load i32, i32* %gep_temp102, align 4
    %add_temp104 = add i32 %add_temp100, %load_temp103
    %srem_temp105 = srem i32 %add_temp104, 13333
    store i32 %srem_temp105, i32* %ans, align 4
    %load_temp106 = load i32, i32* %j, align 4
    %add_temp107 = add i32 %load_temp106, 2
    store i32 %add_temp107, i32* %j, align 4
    br label %if_end_3
if_end_3:
    br label %while_cond_1
while_end_1:
    %load_temp108 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp108)
    br label %if_end_2
if_else_2:
    %load_temp109 = load i32, i32* %ans, align 4
    %load_temp110 = load i32, i32* %i, align 4
    %gep_temp111 = getelementptr [10000 x i32], [10000 x i32]* %a3, i32 0, i32 %load_temp110
    %load_temp112 = load i32, i32* %gep_temp111, align 4
    %load_temp113 = load i32, i32* %k_local, align 4
    %mul_temp114 = mul i32 %load_temp112, %load_temp113
    %add_temp115 = add i32 %load_temp109, %mul_temp114
    %srem_temp116 = srem i32 %add_temp115, 99988
    store i32 %srem_temp116, i32* %ans, align 4
    br label %if_end_2
if_end_2:
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    %load_temp117 = load i32, i32* %i, align 4
    %add_temp118 = add i32 %load_temp117, 1
    store i32 %add_temp118, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp119 = load i32, i32* %ans, align 4
    ret i32 %load_temp119
}

define i32 @main() {
entry:
    %call_temp120 = call i32 @long_array(i32 9)
    ret i32 %call_temp120
}

