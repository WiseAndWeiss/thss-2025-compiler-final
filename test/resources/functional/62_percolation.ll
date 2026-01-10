; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@array = global [110 x i32] zeroinitializer, align 4
@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @init(i32 %n) {
entry:
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* %n_local, align 4
    %load_temp2 = load i32, i32* %n_local, align 4
    %mul_temp3 = mul i32 %load_temp1, %load_temp2
    %add_temp4 = add i32 %mul_temp3, 1
    %icmp_sle_temp5 = icmp sle i32 %load_temp0, %add_temp4
    br i1 %icmp_sle_temp5, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp6 = load i32, i32* %i, align 4
    %gep_temp7 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp6
    %sub_temp8 = sub i32 0, 1
    store i32 %sub_temp8, i32* %gep_temp7, align 4
    %load_temp9 = load i32, i32* %i, align 4
    %add_temp10 = add i32 %load_temp9, 1
    store i32 %add_temp10, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @findfa(i32 %a) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %load_temp11 = load i32, i32* %a_local, align 4
    %gep_temp12 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp11
    %load_temp13 = load i32, i32* %gep_temp12, align 4
    %load_temp14 = load i32, i32* %a_local, align 4
    %icmp_eq_temp15 = icmp eq i32 %load_temp13, %load_temp14
    br i1 %icmp_eq_temp15, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp16 = load i32, i32* %a_local, align 4
    ret i32 %load_temp16
if_else_0:
    %load_temp17 = load i32, i32* %a_local, align 4
    %gep_temp18 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp17
    %load_temp19 = load i32, i32* %a_local, align 4
    %gep_temp20 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp19
    %load_temp21 = load i32, i32* %gep_temp20, align 4
    %call_temp22 = call i32 @findfa(i32 %load_temp21)
    store i32 %call_temp22, i32* %gep_temp18, align 4
    %load_temp23 = load i32, i32* %a_local, align 4
    %gep_temp24 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp23
    %load_temp25 = load i32, i32* %gep_temp24, align 4
    ret i32 %load_temp25
if_end_0:
    ret void
}

define void @mmerge(i32 %a, i32 %b) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %m = alloca i32, align 4
    %load_temp26 = load i32, i32* %a_local, align 4
    %call_temp27 = call i32 @findfa(i32 %load_temp26)
    store i32 %call_temp27, i32* %m, align 4
    %n = alloca i32, align 4
    %load_temp28 = load i32, i32* %b_local, align 4
    %call_temp29 = call i32 @findfa(i32 %load_temp28)
    store i32 %call_temp29, i32* %n, align 4
    %load_temp30 = load i32, i32* %m, align 4
    %load_temp31 = load i32, i32* %n, align 4
    %icmp_ne_temp32 = icmp ne i32 %load_temp30, %load_temp31
    br i1 %icmp_ne_temp32, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp33 = load i32, i32* %m, align 4
    %gep_temp34 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp33
    %load_temp35 = load i32, i32* %n, align 4
    store i32 %load_temp35, i32* %gep_temp34, align 4
    br label %if_end_1
if_end_1:
    ret void
}

define i32 @main() {
entry:
    %t = alloca i32, align 4
    %m = alloca i32, align 4
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    store i32 1, i32* %t, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp36 = load i32, i32* %t, align 4
    %icmp_ne_temp37 = icmp ne i32 %load_temp36, 0
    br i1 %icmp_ne_temp37, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp38 = load i32, i32* %t, align 4
    %sub_temp39 = sub i32 %load_temp38, 1
    store i32 %sub_temp39, i32* %t, align 4
    store i32 4, i32* @n, align 4
    store i32 10, i32* %m, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %flag = alloca i32, align 4
    store i32 0, i32* %flag, align 4
    %load_temp40 = load i32, i32* @n, align 4
    call void @init(i32 %load_temp40)
    %k = alloca i32, align 4
    %load_temp41 = load i32, i32* @n, align 4
    %load_temp42 = load i32, i32* @n, align 4
    %mul_temp43 = mul i32 %load_temp41, %load_temp42
    %add_temp44 = add i32 %mul_temp43, 1
    store i32 %add_temp44, i32* %k, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp45 = load i32, i32* %i, align 4
    %load_temp46 = load i32, i32* %m, align 4
    %icmp_slt_temp47 = icmp slt i32 %load_temp45, %load_temp46
    br i1 %icmp_slt_temp47, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp48 = call i32 @getint()
    store i32 %call_temp48, i32* %a, align 4
    %call_temp49 = call i32 @getint()
    store i32 %call_temp49, i32* %b, align 4
    %load_temp50 = load i32, i32* %flag, align 4
    %icmp_eq_temp51 = icmp eq i32 %load_temp50, 0
    br i1 %icmp_eq_temp51, label %if_then_2, label %if_end_2
if_then_2:
    %loc = alloca i32, align 4
    %load_temp52 = load i32, i32* @n, align 4
    %load_temp53 = load i32, i32* %a, align 4
    %sub_temp54 = sub i32 %load_temp53, 1
    %mul_temp55 = mul i32 %load_temp52, %sub_temp54
    %load_temp56 = load i32, i32* %b, align 4
    %add_temp57 = add i32 %mul_temp55, %load_temp56
    store i32 %add_temp57, i32* %loc, align 4
    %load_temp58 = load i32, i32* %loc, align 4
    %gep_temp59 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp58
    %load_temp60 = load i32, i32* %loc, align 4
    store i32 %load_temp60, i32* %gep_temp59, align 4
    %load_temp61 = load i32, i32* %a, align 4
    %icmp_eq_temp62 = icmp eq i32 %load_temp61, 1
    br i1 %icmp_eq_temp62, label %if_then_3, label %if_end_3
if_then_3:
    %gep_temp63 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 0
    store i32 0, i32* %gep_temp63, align 4
    %load_temp64 = load i32, i32* %loc, align 4
    call void @mmerge(i32 %load_temp64, i32 0)
    br label %if_end_3
if_end_3:
    %load_temp65 = load i32, i32* %a, align 4
    %load_temp66 = load i32, i32* @n, align 4
    %icmp_eq_temp67 = icmp eq i32 %load_temp65, %load_temp66
    br i1 %icmp_eq_temp67, label %if_then_4, label %if_end_4
if_then_4:
    %load_temp68 = load i32, i32* %k, align 4
    %gep_temp69 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp68
    %load_temp70 = load i32, i32* %k, align 4
    store i32 %load_temp70, i32* %gep_temp69, align 4
    %load_temp71 = load i32, i32* %loc, align 4
    %load_temp72 = load i32, i32* %k, align 4
    call void @mmerge(i32 %load_temp71, i32 %load_temp72)
    br label %if_end_4
if_end_4:
    %load_temp73 = load i32, i32* %b, align 4
    %load_temp74 = load i32, i32* @n, align 4
    %icmp_slt_temp75 = icmp slt i32 %load_temp73, %load_temp74
    %load_temp76 = load i32, i32* %loc, align 4
    %add_temp77 = add i32 %load_temp76, 1
    %gep_temp78 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %add_temp77
    %load_temp79 = load i32, i32* %gep_temp78, align 4
    %sub_temp80 = sub i32 0, 1
    %icmp_ne_temp81 = icmp ne i32 %load_temp79, %sub_temp80
    %zext_temp82 = zext i1 %icmp_slt_temp75 to i32
    %zext_temp83 = zext i1 %icmp_ne_temp81 to i32
    %mul_temp84 = mul i32 %zext_temp82, %zext_temp83
    %icmp_ne_temp85 = icmp ne i32 %mul_temp84, 0
    br i1 %icmp_ne_temp85, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp86 = load i32, i32* %loc, align 4
    %load_temp87 = load i32, i32* %loc, align 4
    %add_temp88 = add i32 %load_temp87, 1
    call void @mmerge(i32 %load_temp86, i32 %add_temp88)
    br label %if_end_5
if_end_5:
    %load_temp89 = load i32, i32* %b, align 4
    %icmp_sgt_temp90 = icmp sgt i32 %load_temp89, 1
    %load_temp91 = load i32, i32* %loc, align 4
    %sub_temp92 = sub i32 %load_temp91, 1
    %gep_temp93 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %sub_temp92
    %load_temp94 = load i32, i32* %gep_temp93, align 4
    %sub_temp95 = sub i32 0, 1
    %icmp_ne_temp96 = icmp ne i32 %load_temp94, %sub_temp95
    %zext_temp97 = zext i1 %icmp_sgt_temp90 to i32
    %zext_temp98 = zext i1 %icmp_ne_temp96 to i32
    %mul_temp99 = mul i32 %zext_temp97, %zext_temp98
    %icmp_ne_temp100 = icmp ne i32 %mul_temp99, 0
    br i1 %icmp_ne_temp100, label %if_then_6, label %if_end_6
if_then_6:
    %load_temp101 = load i32, i32* %loc, align 4
    %load_temp102 = load i32, i32* %loc, align 4
    %sub_temp103 = sub i32 %load_temp102, 1
    call void @mmerge(i32 %load_temp101, i32 %sub_temp103)
    br label %if_end_6
if_end_6:
    %load_temp104 = load i32, i32* %a, align 4
    %load_temp105 = load i32, i32* @n, align 4
    %icmp_slt_temp106 = icmp slt i32 %load_temp104, %load_temp105
    %load_temp107 = load i32, i32* %loc, align 4
    %load_temp108 = load i32, i32* @n, align 4
    %add_temp109 = add i32 %load_temp107, %load_temp108
    %gep_temp110 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %add_temp109
    %load_temp111 = load i32, i32* %gep_temp110, align 4
    %sub_temp112 = sub i32 0, 1
    %icmp_ne_temp113 = icmp ne i32 %load_temp111, %sub_temp112
    %zext_temp114 = zext i1 %icmp_slt_temp106 to i32
    %zext_temp115 = zext i1 %icmp_ne_temp113 to i32
    %mul_temp116 = mul i32 %zext_temp114, %zext_temp115
    %icmp_ne_temp117 = icmp ne i32 %mul_temp116, 0
    br i1 %icmp_ne_temp117, label %if_then_7, label %if_end_7
if_then_7:
    %load_temp118 = load i32, i32* %loc, align 4
    %load_temp119 = load i32, i32* %loc, align 4
    %load_temp120 = load i32, i32* @n, align 4
    %add_temp121 = add i32 %load_temp119, %load_temp120
    call void @mmerge(i32 %load_temp118, i32 %add_temp121)
    br label %if_end_7
if_end_7:
    %load_temp122 = load i32, i32* %a, align 4
    %icmp_sgt_temp123 = icmp sgt i32 %load_temp122, 1
    %load_temp124 = load i32, i32* %loc, align 4
    %load_temp125 = load i32, i32* @n, align 4
    %sub_temp126 = sub i32 %load_temp124, %load_temp125
    %gep_temp127 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %sub_temp126
    %load_temp128 = load i32, i32* %gep_temp127, align 4
    %sub_temp129 = sub i32 0, 1
    %icmp_ne_temp130 = icmp ne i32 %load_temp128, %sub_temp129
    %zext_temp131 = zext i1 %icmp_sgt_temp123 to i32
    %zext_temp132 = zext i1 %icmp_ne_temp130 to i32
    %mul_temp133 = mul i32 %zext_temp131, %zext_temp132
    %icmp_ne_temp134 = icmp ne i32 %mul_temp133, 0
    br i1 %icmp_ne_temp134, label %if_then_8, label %if_end_8
if_then_8:
    %load_temp135 = load i32, i32* %loc, align 4
    %load_temp136 = load i32, i32* %loc, align 4
    %load_temp137 = load i32, i32* @n, align 4
    %sub_temp138 = sub i32 %load_temp136, %load_temp137
    call void @mmerge(i32 %load_temp135, i32 %sub_temp138)
    br label %if_end_8
if_end_8:
    %gep_temp139 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 0
    %load_temp140 = load i32, i32* %gep_temp139, align 4
    %sub_temp141 = sub i32 0, 1
    %icmp_ne_temp142 = icmp ne i32 %load_temp140, %sub_temp141
    %load_temp143 = load i32, i32* %k, align 4
    %gep_temp144 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %load_temp143
    %load_temp145 = load i32, i32* %gep_temp144, align 4
    %sub_temp146 = sub i32 0, 1
    %icmp_ne_temp147 = icmp ne i32 %load_temp145, %sub_temp146
    %zext_temp148 = zext i1 %icmp_ne_temp142 to i32
    %zext_temp149 = zext i1 %icmp_ne_temp147 to i32
    %mul_temp150 = mul i32 %zext_temp148, %zext_temp149
    %icmp_ne_temp151 = icmp ne i32 %mul_temp150, 0
    %call_temp152 = call i32 @findfa(i32 0)
    %load_temp153 = load i32, i32* %k, align 4
    %call_temp154 = call i32 @findfa(i32 %load_temp153)
    %icmp_eq_temp155 = icmp eq i32 %call_temp152, %call_temp154
    %zext_temp156 = zext i1 %icmp_ne_temp151 to i32
    %zext_temp157 = zext i1 %icmp_eq_temp155 to i32
    %mul_temp158 = mul i32 %zext_temp156, %zext_temp157
    %icmp_ne_temp159 = icmp ne i32 %mul_temp158, 0
    br i1 %icmp_ne_temp159, label %if_then_9, label %if_end_9
if_then_9:
    store i32 1, i32* %flag, align 4
    %tmp = alloca i32, align 4
    %load_temp160 = load i32, i32* %i, align 4
    %add_temp161 = add i32 %load_temp160, 1
    store i32 %add_temp161, i32* %tmp, align 4
    %load_temp162 = load i32, i32* %tmp, align 4
    call void @putint(i32 %load_temp162)
    call void @putch(i32 10)
    br label %if_end_9
if_end_9:
    br label %if_end_2
if_end_2:
    %load_temp163 = load i32, i32* %i, align 4
    %add_temp164 = add i32 %load_temp163, 1
    store i32 %add_temp164, i32* %i, align 4
    br label %while_cond_1
while_end_1:
    %load_temp165 = load i32, i32* %flag, align 4
    %icmp_eq_temp166 = icmp eq i32 %load_temp165, 0
    br i1 %icmp_eq_temp166, label %if_then_10, label %if_end_10
if_then_10:
    %sub_temp167 = sub i32 0, 1
    call void @putint(i32 %sub_temp167)
    call void @putch(i32 10)
    br label %if_end_10
if_end_10:
    br label %while_cond_0
while_end_0:
    ret i32 0
}

