; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@SHIFT_TABLE = constant [16 x i32] [i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384, i32 32768], align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @long_func() {
entry:
    %ans = alloca i32, align 4
    %i = alloca i32, align 4
    %x = alloca i32, align 4
    %y = alloca i32, align 4
    %cur = alloca i32, align 4
    %pl = alloca i32, align 4
    store i32 2, i32* %pl, align 4
    %pr = alloca i32, align 4
    store i32 0, i32* %pr, align 4
    %pres = alloca i32, align 4
    store i32 1, i32* %pres, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %pr, align 4
    %icmp_sgt_temp1 = icmp sgt i32 %load_temp0, 0
    br i1 %icmp_sgt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2 = load i32, i32* %pr, align 4
    store i32 %load_temp2, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp3 = load i32, i32* %i, align 4
    %icmp_slt_temp4 = icmp slt i32 %load_temp3, 16
    br i1 %icmp_slt_temp4, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp5 = load i32, i32* %x, align 4
    %srem_temp6 = srem i32 %load_temp5, 2
    %load_temp7 = load i32, i32* %y, align 4
    %srem_temp8 = srem i32 %load_temp7, 2
    %icmp_ne_temp9 = icmp ne i32 %srem_temp6, 0
    %icmp_ne_temp10 = icmp ne i32 %srem_temp8, 0
    %zext_temp11 = zext i1 %icmp_ne_temp9 to i32
    %zext_temp12 = zext i1 %icmp_ne_temp10 to i32
    %mul_temp13 = mul i32 %zext_temp11, %zext_temp12
    %icmp_ne_temp14 = icmp ne i32 %mul_temp13, 0
    br i1 %icmp_ne_temp14, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp15 = load i32, i32* %ans, align 4
    %load_temp16 = load i32, i32* %i, align 4
    %gep_temp17 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp16
    %load_temp18 = load i32, i32* %gep_temp17, align 4
    %mul_temp19 = mul i32 1, %load_temp18
    %add_temp20 = add i32 %load_temp15, %mul_temp19
    store i32 %add_temp20, i32* %ans, align 4
    br label %if_end_0
if_end_0:
    %load_temp21 = load i32, i32* %x, align 4
    %sdiv_temp22 = sdiv i32 %load_temp21, 2
    store i32 %sdiv_temp22, i32* %x, align 4
    %load_temp23 = load i32, i32* %y, align 4
    %sdiv_temp24 = sdiv i32 %load_temp23, 2
    store i32 %sdiv_temp24, i32* %y, align 4
    %load_temp25 = load i32, i32* %i, align 4
    %add_temp26 = add i32 %load_temp25, 1
    store i32 %add_temp26, i32* %i, align 4
    br label %while_cond_1
while_end_1:
    %load_temp27 = load i32, i32* %ans, align 4
    %icmp_ne_temp28 = icmp ne i32 %load_temp27, 0
    br i1 %icmp_ne_temp28, label %if_then_1, label %if_end_1
if_then_1:
    %ml = alloca i32, align 4
    %load_temp29 = load i32, i32* %pres, align 4
    store i32 %load_temp29, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp30 = load i32, i32* %pl, align 4
    store i32 %load_temp30, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp31 = load i32, i32* %mr, align 4
    %icmp_ne_temp32 = icmp ne i32 %load_temp31, 0
    br i1 %icmp_ne_temp32, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp33 = load i32, i32* %mr, align 4
    store i32 %load_temp33, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp34 = load i32, i32* %i, align 4
    %icmp_slt_temp35 = icmp slt i32 %load_temp34, 16
    br i1 %icmp_slt_temp35, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp36 = load i32, i32* %x, align 4
    %srem_temp37 = srem i32 %load_temp36, 2
    %load_temp38 = load i32, i32* %y, align 4
    %srem_temp39 = srem i32 %load_temp38, 2
    %icmp_ne_temp40 = icmp ne i32 %srem_temp37, 0
    %icmp_ne_temp41 = icmp ne i32 %srem_temp39, 0
    %zext_temp42 = zext i1 %icmp_ne_temp40 to i32
    %zext_temp43 = zext i1 %icmp_ne_temp41 to i32
    %mul_temp44 = mul i32 %zext_temp42, %zext_temp43
    %icmp_ne_temp45 = icmp ne i32 %mul_temp44, 0
    br i1 %icmp_ne_temp45, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp46 = load i32, i32* %ans, align 4
    %load_temp47 = load i32, i32* %i, align 4
    %gep_temp48 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp47
    %load_temp49 = load i32, i32* %gep_temp48, align 4
    %mul_temp50 = mul i32 1, %load_temp49
    %add_temp51 = add i32 %load_temp46, %mul_temp50
    store i32 %add_temp51, i32* %ans, align 4
    br label %if_end_2
if_end_2:
    %load_temp52 = load i32, i32* %x, align 4
    %sdiv_temp53 = sdiv i32 %load_temp52, 2
    store i32 %sdiv_temp53, i32* %x, align 4
    %load_temp54 = load i32, i32* %y, align 4
    %sdiv_temp55 = sdiv i32 %load_temp54, 2
    store i32 %sdiv_temp55, i32* %y, align 4
    %load_temp56 = load i32, i32* %i, align 4
    %add_temp57 = add i32 %load_temp56, 1
    store i32 %add_temp57, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp58 = load i32, i32* %ans, align 4
    %icmp_ne_temp59 = icmp ne i32 %load_temp58, 0
    br i1 %icmp_ne_temp59, label %if_then_3, label %if_end_3
if_then_3:
    %al = alloca i32, align 4
    %load_temp60 = load i32, i32* %mres, align 4
    store i32 %load_temp60, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp61 = load i32, i32* %ml, align 4
    store i32 %load_temp61, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp62 = load i32, i32* %c, align 4
    %icmp_ne_temp63 = icmp ne i32 %load_temp62, 0
    br i1 %icmp_ne_temp63, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp64 = load i32, i32* %al, align 4
    store i32 %load_temp64, i32* %x, align 4
    %load_temp65 = load i32, i32* %c, align 4
    store i32 %load_temp65, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp66 = load i32, i32* %i, align 4
    %icmp_slt_temp67 = icmp slt i32 %load_temp66, 16
    br i1 %icmp_slt_temp67, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp68 = load i32, i32* %x, align 4
    %srem_temp69 = srem i32 %load_temp68, 2
    %icmp_ne_temp70 = icmp ne i32 %srem_temp69, 0
    br i1 %icmp_ne_temp70, label %if_then_4, label %if_else_4
if_then_4:
    %load_temp71 = load i32, i32* %y, align 4
    %srem_temp72 = srem i32 %load_temp71, 2
    %icmp_eq_temp73 = icmp eq i32 %srem_temp72, 0
    br i1 %icmp_eq_temp73, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp74 = load i32, i32* %ans, align 4
    %load_temp75 = load i32, i32* %i, align 4
    %gep_temp76 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp75
    %load_temp77 = load i32, i32* %gep_temp76, align 4
    %mul_temp78 = mul i32 1, %load_temp77
    %add_temp79 = add i32 %load_temp74, %mul_temp78
    store i32 %add_temp79, i32* %ans, align 4
    br label %if_end_5
if_end_5:
    br label %if_end_4
if_else_4:
    %load_temp80 = load i32, i32* %y, align 4
    %srem_temp81 = srem i32 %load_temp80, 2
    %icmp_ne_temp82 = icmp ne i32 %srem_temp81, 0
    br i1 %icmp_ne_temp82, label %if_then_6, label %if_end_6
if_then_6:
    %load_temp83 = load i32, i32* %ans, align 4
    %load_temp84 = load i32, i32* %i, align 4
    %gep_temp85 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp84
    %load_temp86 = load i32, i32* %gep_temp85, align 4
    %mul_temp87 = mul i32 1, %load_temp86
    %add_temp88 = add i32 %load_temp83, %mul_temp87
    store i32 %add_temp88, i32* %ans, align 4
    br label %if_end_6
if_end_6:
    br label %if_end_4
if_end_4:
    %load_temp89 = load i32, i32* %x, align 4
    %sdiv_temp90 = sdiv i32 %load_temp89, 2
    store i32 %sdiv_temp90, i32* %x, align 4
    %load_temp91 = load i32, i32* %y, align 4
    %sdiv_temp92 = sdiv i32 %load_temp91, 2
    store i32 %sdiv_temp92, i32* %y, align 4
    %load_temp93 = load i32, i32* %i, align 4
    %add_temp94 = add i32 %load_temp93, 1
    store i32 %add_temp94, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp95 = load i32, i32* %ans, align 4
    store i32 %load_temp95, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp96 = load i32, i32* %al, align 4
    store i32 %load_temp96, i32* %x, align 4
    %load_temp97 = load i32, i32* %c, align 4
    store i32 %load_temp97, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp98 = load i32, i32* %i, align 4
    %icmp_slt_temp99 = icmp slt i32 %load_temp98, 16
    br i1 %icmp_slt_temp99, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp100 = load i32, i32* %x, align 4
    %srem_temp101 = srem i32 %load_temp100, 2
    %load_temp102 = load i32, i32* %y, align 4
    %srem_temp103 = srem i32 %load_temp102, 2
    %icmp_ne_temp104 = icmp ne i32 %srem_temp101, 0
    %icmp_ne_temp105 = icmp ne i32 %srem_temp103, 0
    %zext_temp106 = zext i1 %icmp_ne_temp104 to i32
    %zext_temp107 = zext i1 %icmp_ne_temp105 to i32
    %mul_temp108 = mul i32 %zext_temp106, %zext_temp107
    %icmp_ne_temp109 = icmp ne i32 %mul_temp108, 0
    br i1 %icmp_ne_temp109, label %if_then_7, label %if_end_7
if_then_7:
    %load_temp110 = load i32, i32* %ans, align 4
    %load_temp111 = load i32, i32* %i, align 4
    %gep_temp112 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp111
    %load_temp113 = load i32, i32* %gep_temp112, align 4
    %mul_temp114 = mul i32 1, %load_temp113
    %add_temp115 = add i32 %load_temp110, %mul_temp114
    store i32 %add_temp115, i32* %ans, align 4
    br label %if_end_7
if_end_7:
    %load_temp116 = load i32, i32* %x, align 4
    %sdiv_temp117 = sdiv i32 %load_temp116, 2
    store i32 %sdiv_temp117, i32* %x, align 4
    %load_temp118 = load i32, i32* %y, align 4
    %sdiv_temp119 = sdiv i32 %load_temp118, 2
    store i32 %sdiv_temp119, i32* %y, align 4
    %load_temp120 = load i32, i32* %i, align 4
    %add_temp121 = add i32 %load_temp120, 1
    store i32 %add_temp121, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp122 = load i32, i32* %ans, align 4
    store i32 %load_temp122, i32* %c, align 4
    %icmp_sgt_temp123 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp123, label %if_then_8, label %if_else_8
if_then_8:
    store i32 0, i32* %ans, align 4
    br label %if_end_8
if_else_8:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp124 = load i32, i32* %c, align 4
    %gep_temp125 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp126 = load i32, i32* %gep_temp125, align 4
    %mul_temp127 = mul i32 %load_temp124, %load_temp126
    store i32 %mul_temp127, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp128 = load i32, i32* %i, align 4
    %icmp_slt_temp129 = icmp slt i32 %load_temp128, 16
    br i1 %icmp_slt_temp129, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp130 = load i32, i32* %x, align 4
    %srem_temp131 = srem i32 %load_temp130, 2
    %load_temp132 = load i32, i32* %y, align 4
    %srem_temp133 = srem i32 %load_temp132, 2
    %icmp_ne_temp134 = icmp ne i32 %srem_temp131, 0
    %icmp_ne_temp135 = icmp ne i32 %srem_temp133, 0
    %zext_temp136 = zext i1 %icmp_ne_temp134 to i32
    %zext_temp137 = zext i1 %icmp_ne_temp135 to i32
    %mul_temp138 = mul i32 %zext_temp136, %zext_temp137
    %icmp_ne_temp139 = icmp ne i32 %mul_temp138, 0
    br i1 %icmp_ne_temp139, label %if_then_9, label %if_end_9
if_then_9:
    %load_temp140 = load i32, i32* %ans, align 4
    %load_temp141 = load i32, i32* %i, align 4
    %gep_temp142 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp141
    %load_temp143 = load i32, i32* %gep_temp142, align 4
    %mul_temp144 = mul i32 1, %load_temp143
    %add_temp145 = add i32 %load_temp140, %mul_temp144
    store i32 %add_temp145, i32* %ans, align 4
    br label %if_end_9
if_end_9:
    %load_temp146 = load i32, i32* %x, align 4
    %sdiv_temp147 = sdiv i32 %load_temp146, 2
    store i32 %sdiv_temp147, i32* %x, align 4
    %load_temp148 = load i32, i32* %y, align 4
    %sdiv_temp149 = sdiv i32 %load_temp148, 2
    store i32 %sdiv_temp149, i32* %y, align 4
    %load_temp150 = load i32, i32* %i, align 4
    %add_temp151 = add i32 %load_temp150, 1
    store i32 %add_temp151, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_8
if_end_8:
    %load_temp152 = load i32, i32* %ans, align 4
    store i32 %load_temp152, i32* %c, align 4
    %load_temp153 = load i32, i32* %sum, align 4
    store i32 %load_temp153, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp154 = load i32, i32* %al, align 4
    store i32 %load_temp154, i32* %ans, align 4
    %load_temp155 = load i32, i32* %ans, align 4
    store i32 %load_temp155, i32* %mres, align 4
    br label %if_end_3
if_end_3:
    %al = alloca i32, align 4
    %load_temp156 = load i32, i32* %ml, align 4
    store i32 %load_temp156, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp157 = load i32, i32* %ml, align 4
    store i32 %load_temp157, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp158 = load i32, i32* %c, align 4
    %icmp_ne_temp159 = icmp ne i32 %load_temp158, 0
    br i1 %icmp_ne_temp159, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp160 = load i32, i32* %al, align 4
    store i32 %load_temp160, i32* %x, align 4
    %load_temp161 = load i32, i32* %c, align 4
    store i32 %load_temp161, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp162 = load i32, i32* %i, align 4
    %icmp_slt_temp163 = icmp slt i32 %load_temp162, 16
    br i1 %icmp_slt_temp163, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp164 = load i32, i32* %x, align 4
    %srem_temp165 = srem i32 %load_temp164, 2
    %icmp_ne_temp166 = icmp ne i32 %srem_temp165, 0
    br i1 %icmp_ne_temp166, label %if_then_10, label %if_else_10
if_then_10:
    %load_temp167 = load i32, i32* %y, align 4
    %srem_temp168 = srem i32 %load_temp167, 2
    %icmp_eq_temp169 = icmp eq i32 %srem_temp168, 0
    br i1 %icmp_eq_temp169, label %if_then_11, label %if_end_11
if_then_11:
    %load_temp170 = load i32, i32* %ans, align 4
    %load_temp171 = load i32, i32* %i, align 4
    %gep_temp172 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp171
    %load_temp173 = load i32, i32* %gep_temp172, align 4
    %mul_temp174 = mul i32 1, %load_temp173
    %add_temp175 = add i32 %load_temp170, %mul_temp174
    store i32 %add_temp175, i32* %ans, align 4
    br label %if_end_11
if_end_11:
    br label %if_end_10
if_else_10:
    %load_temp176 = load i32, i32* %y, align 4
    %srem_temp177 = srem i32 %load_temp176, 2
    %icmp_ne_temp178 = icmp ne i32 %srem_temp177, 0
    br i1 %icmp_ne_temp178, label %if_then_12, label %if_end_12
if_then_12:
    %load_temp179 = load i32, i32* %ans, align 4
    %load_temp180 = load i32, i32* %i, align 4
    %gep_temp181 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp180
    %load_temp182 = load i32, i32* %gep_temp181, align 4
    %mul_temp183 = mul i32 1, %load_temp182
    %add_temp184 = add i32 %load_temp179, %mul_temp183
    store i32 %add_temp184, i32* %ans, align 4
    br label %if_end_12
if_end_12:
    br label %if_end_10
if_end_10:
    %load_temp185 = load i32, i32* %x, align 4
    %sdiv_temp186 = sdiv i32 %load_temp185, 2
    store i32 %sdiv_temp186, i32* %x, align 4
    %load_temp187 = load i32, i32* %y, align 4
    %sdiv_temp188 = sdiv i32 %load_temp187, 2
    store i32 %sdiv_temp188, i32* %y, align 4
    %load_temp189 = load i32, i32* %i, align 4
    %add_temp190 = add i32 %load_temp189, 1
    store i32 %add_temp190, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp191 = load i32, i32* %ans, align 4
    store i32 %load_temp191, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp192 = load i32, i32* %al, align 4
    store i32 %load_temp192, i32* %x, align 4
    %load_temp193 = load i32, i32* %c, align 4
    store i32 %load_temp193, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp194 = load i32, i32* %i, align 4
    %icmp_slt_temp195 = icmp slt i32 %load_temp194, 16
    br i1 %icmp_slt_temp195, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp196 = load i32, i32* %x, align 4
    %srem_temp197 = srem i32 %load_temp196, 2
    %load_temp198 = load i32, i32* %y, align 4
    %srem_temp199 = srem i32 %load_temp198, 2
    %icmp_ne_temp200 = icmp ne i32 %srem_temp197, 0
    %icmp_ne_temp201 = icmp ne i32 %srem_temp199, 0
    %zext_temp202 = zext i1 %icmp_ne_temp200 to i32
    %zext_temp203 = zext i1 %icmp_ne_temp201 to i32
    %mul_temp204 = mul i32 %zext_temp202, %zext_temp203
    %icmp_ne_temp205 = icmp ne i32 %mul_temp204, 0
    br i1 %icmp_ne_temp205, label %if_then_13, label %if_end_13
if_then_13:
    %load_temp206 = load i32, i32* %ans, align 4
    %load_temp207 = load i32, i32* %i, align 4
    %gep_temp208 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp207
    %load_temp209 = load i32, i32* %gep_temp208, align 4
    %mul_temp210 = mul i32 1, %load_temp209
    %add_temp211 = add i32 %load_temp206, %mul_temp210
    store i32 %add_temp211, i32* %ans, align 4
    br label %if_end_13
if_end_13:
    %load_temp212 = load i32, i32* %x, align 4
    %sdiv_temp213 = sdiv i32 %load_temp212, 2
    store i32 %sdiv_temp213, i32* %x, align 4
    %load_temp214 = load i32, i32* %y, align 4
    %sdiv_temp215 = sdiv i32 %load_temp214, 2
    store i32 %sdiv_temp215, i32* %y, align 4
    %load_temp216 = load i32, i32* %i, align 4
    %add_temp217 = add i32 %load_temp216, 1
    store i32 %add_temp217, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp218 = load i32, i32* %ans, align 4
    store i32 %load_temp218, i32* %c, align 4
    %icmp_sgt_temp219 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp219, label %if_then_14, label %if_else_14
if_then_14:
    store i32 0, i32* %ans, align 4
    br label %if_end_14
if_else_14:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp220 = load i32, i32* %c, align 4
    %gep_temp221 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp222 = load i32, i32* %gep_temp221, align 4
    %mul_temp223 = mul i32 %load_temp220, %load_temp222
    store i32 %mul_temp223, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp224 = load i32, i32* %i, align 4
    %icmp_slt_temp225 = icmp slt i32 %load_temp224, 16
    br i1 %icmp_slt_temp225, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp226 = load i32, i32* %x, align 4
    %srem_temp227 = srem i32 %load_temp226, 2
    %load_temp228 = load i32, i32* %y, align 4
    %srem_temp229 = srem i32 %load_temp228, 2
    %icmp_ne_temp230 = icmp ne i32 %srem_temp227, 0
    %icmp_ne_temp231 = icmp ne i32 %srem_temp229, 0
    %zext_temp232 = zext i1 %icmp_ne_temp230 to i32
    %zext_temp233 = zext i1 %icmp_ne_temp231 to i32
    %mul_temp234 = mul i32 %zext_temp232, %zext_temp233
    %icmp_ne_temp235 = icmp ne i32 %mul_temp234, 0
    br i1 %icmp_ne_temp235, label %if_then_15, label %if_end_15
if_then_15:
    %load_temp236 = load i32, i32* %ans, align 4
    %load_temp237 = load i32, i32* %i, align 4
    %gep_temp238 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp237
    %load_temp239 = load i32, i32* %gep_temp238, align 4
    %mul_temp240 = mul i32 1, %load_temp239
    %add_temp241 = add i32 %load_temp236, %mul_temp240
    store i32 %add_temp241, i32* %ans, align 4
    br label %if_end_15
if_end_15:
    %load_temp242 = load i32, i32* %x, align 4
    %sdiv_temp243 = sdiv i32 %load_temp242, 2
    store i32 %sdiv_temp243, i32* %x, align 4
    %load_temp244 = load i32, i32* %y, align 4
    %sdiv_temp245 = sdiv i32 %load_temp244, 2
    store i32 %sdiv_temp245, i32* %y, align 4
    %load_temp246 = load i32, i32* %i, align 4
    %add_temp247 = add i32 %load_temp246, 1
    store i32 %add_temp247, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_14
if_end_14:
    %load_temp248 = load i32, i32* %ans, align 4
    store i32 %load_temp248, i32* %c, align 4
    %load_temp249 = load i32, i32* %sum, align 4
    store i32 %load_temp249, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp250 = load i32, i32* %al, align 4
    store i32 %load_temp250, i32* %ans, align 4
    %load_temp251 = load i32, i32* %ans, align 4
    store i32 %load_temp251, i32* %ml, align 4
    %load_temp252 = load i32, i32* %mr, align 4
    store i32 %load_temp252, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp253 = load i32, i32* %y, align 4
    %icmp_sge_temp254 = icmp sge i32 %load_temp253, 15
    br i1 %icmp_sge_temp254, label %if_then_16, label %if_else_16
if_then_16:
    %load_temp255 = load i32, i32* %x, align 4
    %icmp_slt_temp256 = icmp slt i32 %load_temp255, 0
    br i1 %icmp_slt_temp256, label %if_then_17, label %if_else_17
if_then_17:
    store i32 65535, i32* %ans, align 4
    br label %if_end_17
if_else_17:
    store i32 0, i32* %ans, align 4
    br label %if_end_17
if_end_17:
    br label %if_end_16
if_else_16:
    %load_temp257 = load i32, i32* %y, align 4
    %icmp_sgt_temp258 = icmp sgt i32 %load_temp257, 0
    br i1 %icmp_sgt_temp258, label %if_then_18, label %if_else_18
if_then_18:
    %load_temp259 = load i32, i32* %x, align 4
    %icmp_sgt_temp260 = icmp sgt i32 %load_temp259, 32767
    br i1 %icmp_sgt_temp260, label %if_then_19, label %if_else_19
if_then_19:
    %load_temp261 = load i32, i32* %x, align 4
    %load_temp262 = load i32, i32* %y, align 4
    %gep_temp263 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp262
    %load_temp264 = load i32, i32* %gep_temp263, align 4
    %sdiv_temp265 = sdiv i32 %load_temp261, %load_temp264
    store i32 %sdiv_temp265, i32* %x, align 4
    %load_temp266 = load i32, i32* %x, align 4
    %add_temp267 = add i32 %load_temp266, 65536
    %load_temp268 = load i32, i32* %y, align 4
    %sub_temp269 = sub i32 15, %load_temp268
    %add_temp270 = add i32 %sub_temp269, 1
    %gep_temp271 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp270
    %load_temp272 = load i32, i32* %gep_temp271, align 4
    %sub_temp273 = sub i32 %add_temp267, %load_temp272
    store i32 %sub_temp273, i32* %ans, align 4
    br label %if_end_19
if_else_19:
    %load_temp274 = load i32, i32* %x, align 4
    %load_temp275 = load i32, i32* %y, align 4
    %gep_temp276 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp275
    %load_temp277 = load i32, i32* %gep_temp276, align 4
    %sdiv_temp278 = sdiv i32 %load_temp274, %load_temp277
    store i32 %sdiv_temp278, i32* %ans, align 4
    br label %if_end_19
if_end_19:
    br label %if_end_18
if_else_18:
    %load_temp279 = load i32, i32* %x, align 4
    store i32 %load_temp279, i32* %ans, align 4
    br label %if_end_18
if_end_18:
    br label %if_end_16
if_end_16:
    %load_temp280 = load i32, i32* %ans, align 4
    store i32 %load_temp280, i32* %mr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp281 = load i32, i32* %mres, align 4
    store i32 %load_temp281, i32* %ans, align 4
    %load_temp282 = load i32, i32* %ans, align 4
    store i32 %load_temp282, i32* %pres, align 4
    br label %if_end_1
if_end_1:
    %ml = alloca i32, align 4
    %load_temp283 = load i32, i32* %pl, align 4
    store i32 %load_temp283, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp284 = load i32, i32* %pl, align 4
    store i32 %load_temp284, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp285 = load i32, i32* %mr, align 4
    %icmp_ne_temp286 = icmp ne i32 %load_temp285, 0
    br i1 %icmp_ne_temp286, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp287 = load i32, i32* %mr, align 4
    store i32 %load_temp287, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp288 = load i32, i32* %i, align 4
    %icmp_slt_temp289 = icmp slt i32 %load_temp288, 16
    br i1 %icmp_slt_temp289, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp290 = load i32, i32* %x, align 4
    %srem_temp291 = srem i32 %load_temp290, 2
    %load_temp292 = load i32, i32* %y, align 4
    %srem_temp293 = srem i32 %load_temp292, 2
    %icmp_ne_temp294 = icmp ne i32 %srem_temp291, 0
    %icmp_ne_temp295 = icmp ne i32 %srem_temp293, 0
    %zext_temp296 = zext i1 %icmp_ne_temp294 to i32
    %zext_temp297 = zext i1 %icmp_ne_temp295 to i32
    %mul_temp298 = mul i32 %zext_temp296, %zext_temp297
    %icmp_ne_temp299 = icmp ne i32 %mul_temp298, 0
    br i1 %icmp_ne_temp299, label %if_then_20, label %if_end_20
if_then_20:
    %load_temp300 = load i32, i32* %ans, align 4
    %load_temp301 = load i32, i32* %i, align 4
    %gep_temp302 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp301
    %load_temp303 = load i32, i32* %gep_temp302, align 4
    %mul_temp304 = mul i32 1, %load_temp303
    %add_temp305 = add i32 %load_temp300, %mul_temp304
    store i32 %add_temp305, i32* %ans, align 4
    br label %if_end_20
if_end_20:
    %load_temp306 = load i32, i32* %x, align 4
    %sdiv_temp307 = sdiv i32 %load_temp306, 2
    store i32 %sdiv_temp307, i32* %x, align 4
    %load_temp308 = load i32, i32* %y, align 4
    %sdiv_temp309 = sdiv i32 %load_temp308, 2
    store i32 %sdiv_temp309, i32* %y, align 4
    %load_temp310 = load i32, i32* %i, align 4
    %add_temp311 = add i32 %load_temp310, 1
    store i32 %add_temp311, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp312 = load i32, i32* %ans, align 4
    %icmp_ne_temp313 = icmp ne i32 %load_temp312, 0
    br i1 %icmp_ne_temp313, label %if_then_21, label %if_end_21
if_then_21:
    %al = alloca i32, align 4
    %load_temp314 = load i32, i32* %mres, align 4
    store i32 %load_temp314, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp315 = load i32, i32* %ml, align 4
    store i32 %load_temp315, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp316 = load i32, i32* %c, align 4
    %icmp_ne_temp317 = icmp ne i32 %load_temp316, 0
    br i1 %icmp_ne_temp317, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp318 = load i32, i32* %al, align 4
    store i32 %load_temp318, i32* %x, align 4
    %load_temp319 = load i32, i32* %c, align 4
    store i32 %load_temp319, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp320 = load i32, i32* %i, align 4
    %icmp_slt_temp321 = icmp slt i32 %load_temp320, 16
    br i1 %icmp_slt_temp321, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp322 = load i32, i32* %x, align 4
    %srem_temp323 = srem i32 %load_temp322, 2
    %icmp_ne_temp324 = icmp ne i32 %srem_temp323, 0
    br i1 %icmp_ne_temp324, label %if_then_22, label %if_else_22
if_then_22:
    %load_temp325 = load i32, i32* %y, align 4
    %srem_temp326 = srem i32 %load_temp325, 2
    %icmp_eq_temp327 = icmp eq i32 %srem_temp326, 0
    br i1 %icmp_eq_temp327, label %if_then_23, label %if_end_23
if_then_23:
    %load_temp328 = load i32, i32* %ans, align 4
    %load_temp329 = load i32, i32* %i, align 4
    %gep_temp330 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp329
    %load_temp331 = load i32, i32* %gep_temp330, align 4
    %mul_temp332 = mul i32 1, %load_temp331
    %add_temp333 = add i32 %load_temp328, %mul_temp332
    store i32 %add_temp333, i32* %ans, align 4
    br label %if_end_23
if_end_23:
    br label %if_end_22
if_else_22:
    %load_temp334 = load i32, i32* %y, align 4
    %srem_temp335 = srem i32 %load_temp334, 2
    %icmp_ne_temp336 = icmp ne i32 %srem_temp335, 0
    br i1 %icmp_ne_temp336, label %if_then_24, label %if_end_24
if_then_24:
    %load_temp337 = load i32, i32* %ans, align 4
    %load_temp338 = load i32, i32* %i, align 4
    %gep_temp339 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp338
    %load_temp340 = load i32, i32* %gep_temp339, align 4
    %mul_temp341 = mul i32 1, %load_temp340
    %add_temp342 = add i32 %load_temp337, %mul_temp341
    store i32 %add_temp342, i32* %ans, align 4
    br label %if_end_24
if_end_24:
    br label %if_end_22
if_end_22:
    %load_temp343 = load i32, i32* %x, align 4
    %sdiv_temp344 = sdiv i32 %load_temp343, 2
    store i32 %sdiv_temp344, i32* %x, align 4
    %load_temp345 = load i32, i32* %y, align 4
    %sdiv_temp346 = sdiv i32 %load_temp345, 2
    store i32 %sdiv_temp346, i32* %y, align 4
    %load_temp347 = load i32, i32* %i, align 4
    %add_temp348 = add i32 %load_temp347, 1
    store i32 %add_temp348, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp349 = load i32, i32* %ans, align 4
    store i32 %load_temp349, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp350 = load i32, i32* %al, align 4
    store i32 %load_temp350, i32* %x, align 4
    %load_temp351 = load i32, i32* %c, align 4
    store i32 %load_temp351, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp352 = load i32, i32* %i, align 4
    %icmp_slt_temp353 = icmp slt i32 %load_temp352, 16
    br i1 %icmp_slt_temp353, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp354 = load i32, i32* %x, align 4
    %srem_temp355 = srem i32 %load_temp354, 2
    %load_temp356 = load i32, i32* %y, align 4
    %srem_temp357 = srem i32 %load_temp356, 2
    %icmp_ne_temp358 = icmp ne i32 %srem_temp355, 0
    %icmp_ne_temp359 = icmp ne i32 %srem_temp357, 0
    %zext_temp360 = zext i1 %icmp_ne_temp358 to i32
    %zext_temp361 = zext i1 %icmp_ne_temp359 to i32
    %mul_temp362 = mul i32 %zext_temp360, %zext_temp361
    %icmp_ne_temp363 = icmp ne i32 %mul_temp362, 0
    br i1 %icmp_ne_temp363, label %if_then_25, label %if_end_25
if_then_25:
    %load_temp364 = load i32, i32* %ans, align 4
    %load_temp365 = load i32, i32* %i, align 4
    %gep_temp366 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp365
    %load_temp367 = load i32, i32* %gep_temp366, align 4
    %mul_temp368 = mul i32 1, %load_temp367
    %add_temp369 = add i32 %load_temp364, %mul_temp368
    store i32 %add_temp369, i32* %ans, align 4
    br label %if_end_25
if_end_25:
    %load_temp370 = load i32, i32* %x, align 4
    %sdiv_temp371 = sdiv i32 %load_temp370, 2
    store i32 %sdiv_temp371, i32* %x, align 4
    %load_temp372 = load i32, i32* %y, align 4
    %sdiv_temp373 = sdiv i32 %load_temp372, 2
    store i32 %sdiv_temp373, i32* %y, align 4
    %load_temp374 = load i32, i32* %i, align 4
    %add_temp375 = add i32 %load_temp374, 1
    store i32 %add_temp375, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp376 = load i32, i32* %ans, align 4
    store i32 %load_temp376, i32* %c, align 4
    %icmp_sgt_temp377 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp377, label %if_then_26, label %if_else_26
if_then_26:
    store i32 0, i32* %ans, align 4
    br label %if_end_26
if_else_26:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp378 = load i32, i32* %c, align 4
    %gep_temp379 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp380 = load i32, i32* %gep_temp379, align 4
    %mul_temp381 = mul i32 %load_temp378, %load_temp380
    store i32 %mul_temp381, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp382 = load i32, i32* %i, align 4
    %icmp_slt_temp383 = icmp slt i32 %load_temp382, 16
    br i1 %icmp_slt_temp383, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp384 = load i32, i32* %x, align 4
    %srem_temp385 = srem i32 %load_temp384, 2
    %load_temp386 = load i32, i32* %y, align 4
    %srem_temp387 = srem i32 %load_temp386, 2
    %icmp_ne_temp388 = icmp ne i32 %srem_temp385, 0
    %icmp_ne_temp389 = icmp ne i32 %srem_temp387, 0
    %zext_temp390 = zext i1 %icmp_ne_temp388 to i32
    %zext_temp391 = zext i1 %icmp_ne_temp389 to i32
    %mul_temp392 = mul i32 %zext_temp390, %zext_temp391
    %icmp_ne_temp393 = icmp ne i32 %mul_temp392, 0
    br i1 %icmp_ne_temp393, label %if_then_27, label %if_end_27
if_then_27:
    %load_temp394 = load i32, i32* %ans, align 4
    %load_temp395 = load i32, i32* %i, align 4
    %gep_temp396 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp395
    %load_temp397 = load i32, i32* %gep_temp396, align 4
    %mul_temp398 = mul i32 1, %load_temp397
    %add_temp399 = add i32 %load_temp394, %mul_temp398
    store i32 %add_temp399, i32* %ans, align 4
    br label %if_end_27
if_end_27:
    %load_temp400 = load i32, i32* %x, align 4
    %sdiv_temp401 = sdiv i32 %load_temp400, 2
    store i32 %sdiv_temp401, i32* %x, align 4
    %load_temp402 = load i32, i32* %y, align 4
    %sdiv_temp403 = sdiv i32 %load_temp402, 2
    store i32 %sdiv_temp403, i32* %y, align 4
    %load_temp404 = load i32, i32* %i, align 4
    %add_temp405 = add i32 %load_temp404, 1
    store i32 %add_temp405, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_26
if_end_26:
    %load_temp406 = load i32, i32* %ans, align 4
    store i32 %load_temp406, i32* %c, align 4
    %load_temp407 = load i32, i32* %sum, align 4
    store i32 %load_temp407, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp408 = load i32, i32* %al, align 4
    store i32 %load_temp408, i32* %ans, align 4
    %load_temp409 = load i32, i32* %ans, align 4
    store i32 %load_temp409, i32* %mres, align 4
    br label %if_end_21
if_end_21:
    %al = alloca i32, align 4
    %load_temp410 = load i32, i32* %ml, align 4
    store i32 %load_temp410, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp411 = load i32, i32* %ml, align 4
    store i32 %load_temp411, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp412 = load i32, i32* %c, align 4
    %icmp_ne_temp413 = icmp ne i32 %load_temp412, 0
    br i1 %icmp_ne_temp413, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp414 = load i32, i32* %al, align 4
    store i32 %load_temp414, i32* %x, align 4
    %load_temp415 = load i32, i32* %c, align 4
    store i32 %load_temp415, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp416 = load i32, i32* %i, align 4
    %icmp_slt_temp417 = icmp slt i32 %load_temp416, 16
    br i1 %icmp_slt_temp417, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp418 = load i32, i32* %x, align 4
    %srem_temp419 = srem i32 %load_temp418, 2
    %icmp_ne_temp420 = icmp ne i32 %srem_temp419, 0
    br i1 %icmp_ne_temp420, label %if_then_28, label %if_else_28
if_then_28:
    %load_temp421 = load i32, i32* %y, align 4
    %srem_temp422 = srem i32 %load_temp421, 2
    %icmp_eq_temp423 = icmp eq i32 %srem_temp422, 0
    br i1 %icmp_eq_temp423, label %if_then_29, label %if_end_29
if_then_29:
    %load_temp424 = load i32, i32* %ans, align 4
    %load_temp425 = load i32, i32* %i, align 4
    %gep_temp426 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp425
    %load_temp427 = load i32, i32* %gep_temp426, align 4
    %mul_temp428 = mul i32 1, %load_temp427
    %add_temp429 = add i32 %load_temp424, %mul_temp428
    store i32 %add_temp429, i32* %ans, align 4
    br label %if_end_29
if_end_29:
    br label %if_end_28
if_else_28:
    %load_temp430 = load i32, i32* %y, align 4
    %srem_temp431 = srem i32 %load_temp430, 2
    %icmp_ne_temp432 = icmp ne i32 %srem_temp431, 0
    br i1 %icmp_ne_temp432, label %if_then_30, label %if_end_30
if_then_30:
    %load_temp433 = load i32, i32* %ans, align 4
    %load_temp434 = load i32, i32* %i, align 4
    %gep_temp435 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp434
    %load_temp436 = load i32, i32* %gep_temp435, align 4
    %mul_temp437 = mul i32 1, %load_temp436
    %add_temp438 = add i32 %load_temp433, %mul_temp437
    store i32 %add_temp438, i32* %ans, align 4
    br label %if_end_30
if_end_30:
    br label %if_end_28
if_end_28:
    %load_temp439 = load i32, i32* %x, align 4
    %sdiv_temp440 = sdiv i32 %load_temp439, 2
    store i32 %sdiv_temp440, i32* %x, align 4
    %load_temp441 = load i32, i32* %y, align 4
    %sdiv_temp442 = sdiv i32 %load_temp441, 2
    store i32 %sdiv_temp442, i32* %y, align 4
    %load_temp443 = load i32, i32* %i, align 4
    %add_temp444 = add i32 %load_temp443, 1
    store i32 %add_temp444, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp445 = load i32, i32* %ans, align 4
    store i32 %load_temp445, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp446 = load i32, i32* %al, align 4
    store i32 %load_temp446, i32* %x, align 4
    %load_temp447 = load i32, i32* %c, align 4
    store i32 %load_temp447, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp448 = load i32, i32* %i, align 4
    %icmp_slt_temp449 = icmp slt i32 %load_temp448, 16
    br i1 %icmp_slt_temp449, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp450 = load i32, i32* %x, align 4
    %srem_temp451 = srem i32 %load_temp450, 2
    %load_temp452 = load i32, i32* %y, align 4
    %srem_temp453 = srem i32 %load_temp452, 2
    %icmp_ne_temp454 = icmp ne i32 %srem_temp451, 0
    %icmp_ne_temp455 = icmp ne i32 %srem_temp453, 0
    %zext_temp456 = zext i1 %icmp_ne_temp454 to i32
    %zext_temp457 = zext i1 %icmp_ne_temp455 to i32
    %mul_temp458 = mul i32 %zext_temp456, %zext_temp457
    %icmp_ne_temp459 = icmp ne i32 %mul_temp458, 0
    br i1 %icmp_ne_temp459, label %if_then_31, label %if_end_31
if_then_31:
    %load_temp460 = load i32, i32* %ans, align 4
    %load_temp461 = load i32, i32* %i, align 4
    %gep_temp462 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp461
    %load_temp463 = load i32, i32* %gep_temp462, align 4
    %mul_temp464 = mul i32 1, %load_temp463
    %add_temp465 = add i32 %load_temp460, %mul_temp464
    store i32 %add_temp465, i32* %ans, align 4
    br label %if_end_31
if_end_31:
    %load_temp466 = load i32, i32* %x, align 4
    %sdiv_temp467 = sdiv i32 %load_temp466, 2
    store i32 %sdiv_temp467, i32* %x, align 4
    %load_temp468 = load i32, i32* %y, align 4
    %sdiv_temp469 = sdiv i32 %load_temp468, 2
    store i32 %sdiv_temp469, i32* %y, align 4
    %load_temp470 = load i32, i32* %i, align 4
    %add_temp471 = add i32 %load_temp470, 1
    store i32 %add_temp471, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp472 = load i32, i32* %ans, align 4
    store i32 %load_temp472, i32* %c, align 4
    %icmp_sgt_temp473 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp473, label %if_then_32, label %if_else_32
if_then_32:
    store i32 0, i32* %ans, align 4
    br label %if_end_32
if_else_32:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp474 = load i32, i32* %c, align 4
    %gep_temp475 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp476 = load i32, i32* %gep_temp475, align 4
    %mul_temp477 = mul i32 %load_temp474, %load_temp476
    store i32 %mul_temp477, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp478 = load i32, i32* %i, align 4
    %icmp_slt_temp479 = icmp slt i32 %load_temp478, 16
    br i1 %icmp_slt_temp479, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp480 = load i32, i32* %x, align 4
    %srem_temp481 = srem i32 %load_temp480, 2
    %load_temp482 = load i32, i32* %y, align 4
    %srem_temp483 = srem i32 %load_temp482, 2
    %icmp_ne_temp484 = icmp ne i32 %srem_temp481, 0
    %icmp_ne_temp485 = icmp ne i32 %srem_temp483, 0
    %zext_temp486 = zext i1 %icmp_ne_temp484 to i32
    %zext_temp487 = zext i1 %icmp_ne_temp485 to i32
    %mul_temp488 = mul i32 %zext_temp486, %zext_temp487
    %icmp_ne_temp489 = icmp ne i32 %mul_temp488, 0
    br i1 %icmp_ne_temp489, label %if_then_33, label %if_end_33
if_then_33:
    %load_temp490 = load i32, i32* %ans, align 4
    %load_temp491 = load i32, i32* %i, align 4
    %gep_temp492 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp491
    %load_temp493 = load i32, i32* %gep_temp492, align 4
    %mul_temp494 = mul i32 1, %load_temp493
    %add_temp495 = add i32 %load_temp490, %mul_temp494
    store i32 %add_temp495, i32* %ans, align 4
    br label %if_end_33
if_end_33:
    %load_temp496 = load i32, i32* %x, align 4
    %sdiv_temp497 = sdiv i32 %load_temp496, 2
    store i32 %sdiv_temp497, i32* %x, align 4
    %load_temp498 = load i32, i32* %y, align 4
    %sdiv_temp499 = sdiv i32 %load_temp498, 2
    store i32 %sdiv_temp499, i32* %y, align 4
    %load_temp500 = load i32, i32* %i, align 4
    %add_temp501 = add i32 %load_temp500, 1
    store i32 %add_temp501, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_32
if_end_32:
    %load_temp502 = load i32, i32* %ans, align 4
    store i32 %load_temp502, i32* %c, align 4
    %load_temp503 = load i32, i32* %sum, align 4
    store i32 %load_temp503, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp504 = load i32, i32* %al, align 4
    store i32 %load_temp504, i32* %ans, align 4
    %load_temp505 = load i32, i32* %ans, align 4
    store i32 %load_temp505, i32* %ml, align 4
    %load_temp506 = load i32, i32* %mr, align 4
    store i32 %load_temp506, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp507 = load i32, i32* %y, align 4
    %icmp_sge_temp508 = icmp sge i32 %load_temp507, 15
    br i1 %icmp_sge_temp508, label %if_then_34, label %if_else_34
if_then_34:
    %load_temp509 = load i32, i32* %x, align 4
    %icmp_slt_temp510 = icmp slt i32 %load_temp509, 0
    br i1 %icmp_slt_temp510, label %if_then_35, label %if_else_35
if_then_35:
    store i32 65535, i32* %ans, align 4
    br label %if_end_35
if_else_35:
    store i32 0, i32* %ans, align 4
    br label %if_end_35
if_end_35:
    br label %if_end_34
if_else_34:
    %load_temp511 = load i32, i32* %y, align 4
    %icmp_sgt_temp512 = icmp sgt i32 %load_temp511, 0
    br i1 %icmp_sgt_temp512, label %if_then_36, label %if_else_36
if_then_36:
    %load_temp513 = load i32, i32* %x, align 4
    %icmp_sgt_temp514 = icmp sgt i32 %load_temp513, 32767
    br i1 %icmp_sgt_temp514, label %if_then_37, label %if_else_37
if_then_37:
    %load_temp515 = load i32, i32* %x, align 4
    %load_temp516 = load i32, i32* %y, align 4
    %gep_temp517 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp516
    %load_temp518 = load i32, i32* %gep_temp517, align 4
    %sdiv_temp519 = sdiv i32 %load_temp515, %load_temp518
    store i32 %sdiv_temp519, i32* %x, align 4
    %load_temp520 = load i32, i32* %x, align 4
    %add_temp521 = add i32 %load_temp520, 65536
    %load_temp522 = load i32, i32* %y, align 4
    %sub_temp523 = sub i32 15, %load_temp522
    %add_temp524 = add i32 %sub_temp523, 1
    %gep_temp525 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp524
    %load_temp526 = load i32, i32* %gep_temp525, align 4
    %sub_temp527 = sub i32 %add_temp521, %load_temp526
    store i32 %sub_temp527, i32* %ans, align 4
    br label %if_end_37
if_else_37:
    %load_temp528 = load i32, i32* %x, align 4
    %load_temp529 = load i32, i32* %y, align 4
    %gep_temp530 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp529
    %load_temp531 = load i32, i32* %gep_temp530, align 4
    %sdiv_temp532 = sdiv i32 %load_temp528, %load_temp531
    store i32 %sdiv_temp532, i32* %ans, align 4
    br label %if_end_37
if_end_37:
    br label %if_end_36
if_else_36:
    %load_temp533 = load i32, i32* %x, align 4
    store i32 %load_temp533, i32* %ans, align 4
    br label %if_end_36
if_end_36:
    br label %if_end_34
if_end_34:
    %load_temp534 = load i32, i32* %ans, align 4
    store i32 %load_temp534, i32* %mr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp535 = load i32, i32* %mres, align 4
    store i32 %load_temp535, i32* %ans, align 4
    %load_temp536 = load i32, i32* %ans, align 4
    store i32 %load_temp536, i32* %pl, align 4
    %load_temp537 = load i32, i32* %pr, align 4
    store i32 %load_temp537, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp538 = load i32, i32* %y, align 4
    %icmp_sge_temp539 = icmp sge i32 %load_temp538, 15
    br i1 %icmp_sge_temp539, label %if_then_38, label %if_else_38
if_then_38:
    %load_temp540 = load i32, i32* %x, align 4
    %icmp_slt_temp541 = icmp slt i32 %load_temp540, 0
    br i1 %icmp_slt_temp541, label %if_then_39, label %if_else_39
if_then_39:
    store i32 65535, i32* %ans, align 4
    br label %if_end_39
if_else_39:
    store i32 0, i32* %ans, align 4
    br label %if_end_39
if_end_39:
    br label %if_end_38
if_else_38:
    %load_temp542 = load i32, i32* %y, align 4
    %icmp_sgt_temp543 = icmp sgt i32 %load_temp542, 0
    br i1 %icmp_sgt_temp543, label %if_then_40, label %if_else_40
if_then_40:
    %load_temp544 = load i32, i32* %x, align 4
    %icmp_sgt_temp545 = icmp sgt i32 %load_temp544, 32767
    br i1 %icmp_sgt_temp545, label %if_then_41, label %if_else_41
if_then_41:
    %load_temp546 = load i32, i32* %x, align 4
    %load_temp547 = load i32, i32* %y, align 4
    %gep_temp548 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp547
    %load_temp549 = load i32, i32* %gep_temp548, align 4
    %sdiv_temp550 = sdiv i32 %load_temp546, %load_temp549
    store i32 %sdiv_temp550, i32* %x, align 4
    %load_temp551 = load i32, i32* %x, align 4
    %add_temp552 = add i32 %load_temp551, 65536
    %load_temp553 = load i32, i32* %y, align 4
    %sub_temp554 = sub i32 15, %load_temp553
    %add_temp555 = add i32 %sub_temp554, 1
    %gep_temp556 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp555
    %load_temp557 = load i32, i32* %gep_temp556, align 4
    %sub_temp558 = sub i32 %add_temp552, %load_temp557
    store i32 %sub_temp558, i32* %ans, align 4
    br label %if_end_41
if_else_41:
    %load_temp559 = load i32, i32* %x, align 4
    %load_temp560 = load i32, i32* %y, align 4
    %gep_temp561 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp560
    %load_temp562 = load i32, i32* %gep_temp561, align 4
    %sdiv_temp563 = sdiv i32 %load_temp559, %load_temp562
    store i32 %sdiv_temp563, i32* %ans, align 4
    br label %if_end_41
if_end_41:
    br label %if_end_40
if_else_40:
    %load_temp564 = load i32, i32* %x, align 4
    store i32 %load_temp564, i32* %ans, align 4
    br label %if_end_40
if_end_40:
    br label %if_end_38
if_end_38:
    %load_temp565 = load i32, i32* %ans, align 4
    store i32 %load_temp565, i32* %pr, align 4
    br label %while_cond_0
while_end_0:
    %load_temp566 = load i32, i32* %pres, align 4
    store i32 %load_temp566, i32* %ans, align 4
    %load_temp567 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp567)
    call void @putch(i32 10)
    %pl = alloca i32, align 4
    store i32 2, i32* %pl, align 4
    %pr = alloca i32, align 4
    store i32 1, i32* %pr, align 4
    %pres = alloca i32, align 4
    store i32 1, i32* %pres, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp568 = load i32, i32* %pr, align 4
    %icmp_sgt_temp569 = icmp sgt i32 %load_temp568, 0
    br i1 %icmp_sgt_temp569, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp570 = load i32, i32* %pr, align 4
    store i32 %load_temp570, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp571 = load i32, i32* %i, align 4
    %icmp_slt_temp572 = icmp slt i32 %load_temp571, 16
    br i1 %icmp_slt_temp572, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp573 = load i32, i32* %x, align 4
    %srem_temp574 = srem i32 %load_temp573, 2
    %load_temp575 = load i32, i32* %y, align 4
    %srem_temp576 = srem i32 %load_temp575, 2
    %icmp_ne_temp577 = icmp ne i32 %srem_temp574, 0
    %icmp_ne_temp578 = icmp ne i32 %srem_temp576, 0
    %zext_temp579 = zext i1 %icmp_ne_temp577 to i32
    %zext_temp580 = zext i1 %icmp_ne_temp578 to i32
    %mul_temp581 = mul i32 %zext_temp579, %zext_temp580
    %icmp_ne_temp582 = icmp ne i32 %mul_temp581, 0
    br i1 %icmp_ne_temp582, label %if_then_42, label %if_end_42
if_then_42:
    %load_temp583 = load i32, i32* %ans, align 4
    %load_temp584 = load i32, i32* %i, align 4
    %gep_temp585 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp584
    %load_temp586 = load i32, i32* %gep_temp585, align 4
    %mul_temp587 = mul i32 1, %load_temp586
    %add_temp588 = add i32 %load_temp583, %mul_temp587
    store i32 %add_temp588, i32* %ans, align 4
    br label %if_end_42
if_end_42:
    %load_temp589 = load i32, i32* %x, align 4
    %sdiv_temp590 = sdiv i32 %load_temp589, 2
    store i32 %sdiv_temp590, i32* %x, align 4
    %load_temp591 = load i32, i32* %y, align 4
    %sdiv_temp592 = sdiv i32 %load_temp591, 2
    store i32 %sdiv_temp592, i32* %y, align 4
    %load_temp593 = load i32, i32* %i, align 4
    %add_temp594 = add i32 %load_temp593, 1
    store i32 %add_temp594, i32* %i, align 4
    br label %while_cond_1
while_end_1:
    %load_temp595 = load i32, i32* %ans, align 4
    %icmp_ne_temp596 = icmp ne i32 %load_temp595, 0
    br i1 %icmp_ne_temp596, label %if_then_43, label %if_end_43
if_then_43:
    %ml = alloca i32, align 4
    %load_temp597 = load i32, i32* %pres, align 4
    store i32 %load_temp597, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp598 = load i32, i32* %pl, align 4
    store i32 %load_temp598, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp599 = load i32, i32* %mr, align 4
    %icmp_ne_temp600 = icmp ne i32 %load_temp599, 0
    br i1 %icmp_ne_temp600, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp601 = load i32, i32* %mr, align 4
    store i32 %load_temp601, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp602 = load i32, i32* %i, align 4
    %icmp_slt_temp603 = icmp slt i32 %load_temp602, 16
    br i1 %icmp_slt_temp603, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp604 = load i32, i32* %x, align 4
    %srem_temp605 = srem i32 %load_temp604, 2
    %load_temp606 = load i32, i32* %y, align 4
    %srem_temp607 = srem i32 %load_temp606, 2
    %icmp_ne_temp608 = icmp ne i32 %srem_temp605, 0
    %icmp_ne_temp609 = icmp ne i32 %srem_temp607, 0
    %zext_temp610 = zext i1 %icmp_ne_temp608 to i32
    %zext_temp611 = zext i1 %icmp_ne_temp609 to i32
    %mul_temp612 = mul i32 %zext_temp610, %zext_temp611
    %icmp_ne_temp613 = icmp ne i32 %mul_temp612, 0
    br i1 %icmp_ne_temp613, label %if_then_44, label %if_end_44
if_then_44:
    %load_temp614 = load i32, i32* %ans, align 4
    %load_temp615 = load i32, i32* %i, align 4
    %gep_temp616 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp615
    %load_temp617 = load i32, i32* %gep_temp616, align 4
    %mul_temp618 = mul i32 1, %load_temp617
    %add_temp619 = add i32 %load_temp614, %mul_temp618
    store i32 %add_temp619, i32* %ans, align 4
    br label %if_end_44
if_end_44:
    %load_temp620 = load i32, i32* %x, align 4
    %sdiv_temp621 = sdiv i32 %load_temp620, 2
    store i32 %sdiv_temp621, i32* %x, align 4
    %load_temp622 = load i32, i32* %y, align 4
    %sdiv_temp623 = sdiv i32 %load_temp622, 2
    store i32 %sdiv_temp623, i32* %y, align 4
    %load_temp624 = load i32, i32* %i, align 4
    %add_temp625 = add i32 %load_temp624, 1
    store i32 %add_temp625, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp626 = load i32, i32* %ans, align 4
    %icmp_ne_temp627 = icmp ne i32 %load_temp626, 0
    br i1 %icmp_ne_temp627, label %if_then_45, label %if_end_45
if_then_45:
    %al = alloca i32, align 4
    %load_temp628 = load i32, i32* %mres, align 4
    store i32 %load_temp628, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp629 = load i32, i32* %ml, align 4
    store i32 %load_temp629, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp630 = load i32, i32* %c, align 4
    %icmp_ne_temp631 = icmp ne i32 %load_temp630, 0
    br i1 %icmp_ne_temp631, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp632 = load i32, i32* %al, align 4
    store i32 %load_temp632, i32* %x, align 4
    %load_temp633 = load i32, i32* %c, align 4
    store i32 %load_temp633, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp634 = load i32, i32* %i, align 4
    %icmp_slt_temp635 = icmp slt i32 %load_temp634, 16
    br i1 %icmp_slt_temp635, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp636 = load i32, i32* %x, align 4
    %srem_temp637 = srem i32 %load_temp636, 2
    %icmp_ne_temp638 = icmp ne i32 %srem_temp637, 0
    br i1 %icmp_ne_temp638, label %if_then_46, label %if_else_46
if_then_46:
    %load_temp639 = load i32, i32* %y, align 4
    %srem_temp640 = srem i32 %load_temp639, 2
    %icmp_eq_temp641 = icmp eq i32 %srem_temp640, 0
    br i1 %icmp_eq_temp641, label %if_then_47, label %if_end_47
if_then_47:
    %load_temp642 = load i32, i32* %ans, align 4
    %load_temp643 = load i32, i32* %i, align 4
    %gep_temp644 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp643
    %load_temp645 = load i32, i32* %gep_temp644, align 4
    %mul_temp646 = mul i32 1, %load_temp645
    %add_temp647 = add i32 %load_temp642, %mul_temp646
    store i32 %add_temp647, i32* %ans, align 4
    br label %if_end_47
if_end_47:
    br label %if_end_46
if_else_46:
    %load_temp648 = load i32, i32* %y, align 4
    %srem_temp649 = srem i32 %load_temp648, 2
    %icmp_ne_temp650 = icmp ne i32 %srem_temp649, 0
    br i1 %icmp_ne_temp650, label %if_then_48, label %if_end_48
if_then_48:
    %load_temp651 = load i32, i32* %ans, align 4
    %load_temp652 = load i32, i32* %i, align 4
    %gep_temp653 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp652
    %load_temp654 = load i32, i32* %gep_temp653, align 4
    %mul_temp655 = mul i32 1, %load_temp654
    %add_temp656 = add i32 %load_temp651, %mul_temp655
    store i32 %add_temp656, i32* %ans, align 4
    br label %if_end_48
if_end_48:
    br label %if_end_46
if_end_46:
    %load_temp657 = load i32, i32* %x, align 4
    %sdiv_temp658 = sdiv i32 %load_temp657, 2
    store i32 %sdiv_temp658, i32* %x, align 4
    %load_temp659 = load i32, i32* %y, align 4
    %sdiv_temp660 = sdiv i32 %load_temp659, 2
    store i32 %sdiv_temp660, i32* %y, align 4
    %load_temp661 = load i32, i32* %i, align 4
    %add_temp662 = add i32 %load_temp661, 1
    store i32 %add_temp662, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp663 = load i32, i32* %ans, align 4
    store i32 %load_temp663, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp664 = load i32, i32* %al, align 4
    store i32 %load_temp664, i32* %x, align 4
    %load_temp665 = load i32, i32* %c, align 4
    store i32 %load_temp665, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp666 = load i32, i32* %i, align 4
    %icmp_slt_temp667 = icmp slt i32 %load_temp666, 16
    br i1 %icmp_slt_temp667, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp668 = load i32, i32* %x, align 4
    %srem_temp669 = srem i32 %load_temp668, 2
    %load_temp670 = load i32, i32* %y, align 4
    %srem_temp671 = srem i32 %load_temp670, 2
    %icmp_ne_temp672 = icmp ne i32 %srem_temp669, 0
    %icmp_ne_temp673 = icmp ne i32 %srem_temp671, 0
    %zext_temp674 = zext i1 %icmp_ne_temp672 to i32
    %zext_temp675 = zext i1 %icmp_ne_temp673 to i32
    %mul_temp676 = mul i32 %zext_temp674, %zext_temp675
    %icmp_ne_temp677 = icmp ne i32 %mul_temp676, 0
    br i1 %icmp_ne_temp677, label %if_then_49, label %if_end_49
if_then_49:
    %load_temp678 = load i32, i32* %ans, align 4
    %load_temp679 = load i32, i32* %i, align 4
    %gep_temp680 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp679
    %load_temp681 = load i32, i32* %gep_temp680, align 4
    %mul_temp682 = mul i32 1, %load_temp681
    %add_temp683 = add i32 %load_temp678, %mul_temp682
    store i32 %add_temp683, i32* %ans, align 4
    br label %if_end_49
if_end_49:
    %load_temp684 = load i32, i32* %x, align 4
    %sdiv_temp685 = sdiv i32 %load_temp684, 2
    store i32 %sdiv_temp685, i32* %x, align 4
    %load_temp686 = load i32, i32* %y, align 4
    %sdiv_temp687 = sdiv i32 %load_temp686, 2
    store i32 %sdiv_temp687, i32* %y, align 4
    %load_temp688 = load i32, i32* %i, align 4
    %add_temp689 = add i32 %load_temp688, 1
    store i32 %add_temp689, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp690 = load i32, i32* %ans, align 4
    store i32 %load_temp690, i32* %c, align 4
    %icmp_sgt_temp691 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp691, label %if_then_50, label %if_else_50
if_then_50:
    store i32 0, i32* %ans, align 4
    br label %if_end_50
if_else_50:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp692 = load i32, i32* %c, align 4
    %gep_temp693 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp694 = load i32, i32* %gep_temp693, align 4
    %mul_temp695 = mul i32 %load_temp692, %load_temp694
    store i32 %mul_temp695, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp696 = load i32, i32* %i, align 4
    %icmp_slt_temp697 = icmp slt i32 %load_temp696, 16
    br i1 %icmp_slt_temp697, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp698 = load i32, i32* %x, align 4
    %srem_temp699 = srem i32 %load_temp698, 2
    %load_temp700 = load i32, i32* %y, align 4
    %srem_temp701 = srem i32 %load_temp700, 2
    %icmp_ne_temp702 = icmp ne i32 %srem_temp699, 0
    %icmp_ne_temp703 = icmp ne i32 %srem_temp701, 0
    %zext_temp704 = zext i1 %icmp_ne_temp702 to i32
    %zext_temp705 = zext i1 %icmp_ne_temp703 to i32
    %mul_temp706 = mul i32 %zext_temp704, %zext_temp705
    %icmp_ne_temp707 = icmp ne i32 %mul_temp706, 0
    br i1 %icmp_ne_temp707, label %if_then_51, label %if_end_51
if_then_51:
    %load_temp708 = load i32, i32* %ans, align 4
    %load_temp709 = load i32, i32* %i, align 4
    %gep_temp710 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp709
    %load_temp711 = load i32, i32* %gep_temp710, align 4
    %mul_temp712 = mul i32 1, %load_temp711
    %add_temp713 = add i32 %load_temp708, %mul_temp712
    store i32 %add_temp713, i32* %ans, align 4
    br label %if_end_51
if_end_51:
    %load_temp714 = load i32, i32* %x, align 4
    %sdiv_temp715 = sdiv i32 %load_temp714, 2
    store i32 %sdiv_temp715, i32* %x, align 4
    %load_temp716 = load i32, i32* %y, align 4
    %sdiv_temp717 = sdiv i32 %load_temp716, 2
    store i32 %sdiv_temp717, i32* %y, align 4
    %load_temp718 = load i32, i32* %i, align 4
    %add_temp719 = add i32 %load_temp718, 1
    store i32 %add_temp719, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_50
if_end_50:
    %load_temp720 = load i32, i32* %ans, align 4
    store i32 %load_temp720, i32* %c, align 4
    %load_temp721 = load i32, i32* %sum, align 4
    store i32 %load_temp721, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp722 = load i32, i32* %al, align 4
    store i32 %load_temp722, i32* %ans, align 4
    %load_temp723 = load i32, i32* %ans, align 4
    store i32 %load_temp723, i32* %mres, align 4
    br label %if_end_45
if_end_45:
    %al = alloca i32, align 4
    %load_temp724 = load i32, i32* %ml, align 4
    store i32 %load_temp724, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp725 = load i32, i32* %ml, align 4
    store i32 %load_temp725, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp726 = load i32, i32* %c, align 4
    %icmp_ne_temp727 = icmp ne i32 %load_temp726, 0
    br i1 %icmp_ne_temp727, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp728 = load i32, i32* %al, align 4
    store i32 %load_temp728, i32* %x, align 4
    %load_temp729 = load i32, i32* %c, align 4
    store i32 %load_temp729, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp730 = load i32, i32* %i, align 4
    %icmp_slt_temp731 = icmp slt i32 %load_temp730, 16
    br i1 %icmp_slt_temp731, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp732 = load i32, i32* %x, align 4
    %srem_temp733 = srem i32 %load_temp732, 2
    %icmp_ne_temp734 = icmp ne i32 %srem_temp733, 0
    br i1 %icmp_ne_temp734, label %if_then_52, label %if_else_52
if_then_52:
    %load_temp735 = load i32, i32* %y, align 4
    %srem_temp736 = srem i32 %load_temp735, 2
    %icmp_eq_temp737 = icmp eq i32 %srem_temp736, 0
    br i1 %icmp_eq_temp737, label %if_then_53, label %if_end_53
if_then_53:
    %load_temp738 = load i32, i32* %ans, align 4
    %load_temp739 = load i32, i32* %i, align 4
    %gep_temp740 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp739
    %load_temp741 = load i32, i32* %gep_temp740, align 4
    %mul_temp742 = mul i32 1, %load_temp741
    %add_temp743 = add i32 %load_temp738, %mul_temp742
    store i32 %add_temp743, i32* %ans, align 4
    br label %if_end_53
if_end_53:
    br label %if_end_52
if_else_52:
    %load_temp744 = load i32, i32* %y, align 4
    %srem_temp745 = srem i32 %load_temp744, 2
    %icmp_ne_temp746 = icmp ne i32 %srem_temp745, 0
    br i1 %icmp_ne_temp746, label %if_then_54, label %if_end_54
if_then_54:
    %load_temp747 = load i32, i32* %ans, align 4
    %load_temp748 = load i32, i32* %i, align 4
    %gep_temp749 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp748
    %load_temp750 = load i32, i32* %gep_temp749, align 4
    %mul_temp751 = mul i32 1, %load_temp750
    %add_temp752 = add i32 %load_temp747, %mul_temp751
    store i32 %add_temp752, i32* %ans, align 4
    br label %if_end_54
if_end_54:
    br label %if_end_52
if_end_52:
    %load_temp753 = load i32, i32* %x, align 4
    %sdiv_temp754 = sdiv i32 %load_temp753, 2
    store i32 %sdiv_temp754, i32* %x, align 4
    %load_temp755 = load i32, i32* %y, align 4
    %sdiv_temp756 = sdiv i32 %load_temp755, 2
    store i32 %sdiv_temp756, i32* %y, align 4
    %load_temp757 = load i32, i32* %i, align 4
    %add_temp758 = add i32 %load_temp757, 1
    store i32 %add_temp758, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp759 = load i32, i32* %ans, align 4
    store i32 %load_temp759, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp760 = load i32, i32* %al, align 4
    store i32 %load_temp760, i32* %x, align 4
    %load_temp761 = load i32, i32* %c, align 4
    store i32 %load_temp761, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp762 = load i32, i32* %i, align 4
    %icmp_slt_temp763 = icmp slt i32 %load_temp762, 16
    br i1 %icmp_slt_temp763, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp764 = load i32, i32* %x, align 4
    %srem_temp765 = srem i32 %load_temp764, 2
    %load_temp766 = load i32, i32* %y, align 4
    %srem_temp767 = srem i32 %load_temp766, 2
    %icmp_ne_temp768 = icmp ne i32 %srem_temp765, 0
    %icmp_ne_temp769 = icmp ne i32 %srem_temp767, 0
    %zext_temp770 = zext i1 %icmp_ne_temp768 to i32
    %zext_temp771 = zext i1 %icmp_ne_temp769 to i32
    %mul_temp772 = mul i32 %zext_temp770, %zext_temp771
    %icmp_ne_temp773 = icmp ne i32 %mul_temp772, 0
    br i1 %icmp_ne_temp773, label %if_then_55, label %if_end_55
if_then_55:
    %load_temp774 = load i32, i32* %ans, align 4
    %load_temp775 = load i32, i32* %i, align 4
    %gep_temp776 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp775
    %load_temp777 = load i32, i32* %gep_temp776, align 4
    %mul_temp778 = mul i32 1, %load_temp777
    %add_temp779 = add i32 %load_temp774, %mul_temp778
    store i32 %add_temp779, i32* %ans, align 4
    br label %if_end_55
if_end_55:
    %load_temp780 = load i32, i32* %x, align 4
    %sdiv_temp781 = sdiv i32 %load_temp780, 2
    store i32 %sdiv_temp781, i32* %x, align 4
    %load_temp782 = load i32, i32* %y, align 4
    %sdiv_temp783 = sdiv i32 %load_temp782, 2
    store i32 %sdiv_temp783, i32* %y, align 4
    %load_temp784 = load i32, i32* %i, align 4
    %add_temp785 = add i32 %load_temp784, 1
    store i32 %add_temp785, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp786 = load i32, i32* %ans, align 4
    store i32 %load_temp786, i32* %c, align 4
    %icmp_sgt_temp787 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp787, label %if_then_56, label %if_else_56
if_then_56:
    store i32 0, i32* %ans, align 4
    br label %if_end_56
if_else_56:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp788 = load i32, i32* %c, align 4
    %gep_temp789 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp790 = load i32, i32* %gep_temp789, align 4
    %mul_temp791 = mul i32 %load_temp788, %load_temp790
    store i32 %mul_temp791, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp792 = load i32, i32* %i, align 4
    %icmp_slt_temp793 = icmp slt i32 %load_temp792, 16
    br i1 %icmp_slt_temp793, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp794 = load i32, i32* %x, align 4
    %srem_temp795 = srem i32 %load_temp794, 2
    %load_temp796 = load i32, i32* %y, align 4
    %srem_temp797 = srem i32 %load_temp796, 2
    %icmp_ne_temp798 = icmp ne i32 %srem_temp795, 0
    %icmp_ne_temp799 = icmp ne i32 %srem_temp797, 0
    %zext_temp800 = zext i1 %icmp_ne_temp798 to i32
    %zext_temp801 = zext i1 %icmp_ne_temp799 to i32
    %mul_temp802 = mul i32 %zext_temp800, %zext_temp801
    %icmp_ne_temp803 = icmp ne i32 %mul_temp802, 0
    br i1 %icmp_ne_temp803, label %if_then_57, label %if_end_57
if_then_57:
    %load_temp804 = load i32, i32* %ans, align 4
    %load_temp805 = load i32, i32* %i, align 4
    %gep_temp806 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp805
    %load_temp807 = load i32, i32* %gep_temp806, align 4
    %mul_temp808 = mul i32 1, %load_temp807
    %add_temp809 = add i32 %load_temp804, %mul_temp808
    store i32 %add_temp809, i32* %ans, align 4
    br label %if_end_57
if_end_57:
    %load_temp810 = load i32, i32* %x, align 4
    %sdiv_temp811 = sdiv i32 %load_temp810, 2
    store i32 %sdiv_temp811, i32* %x, align 4
    %load_temp812 = load i32, i32* %y, align 4
    %sdiv_temp813 = sdiv i32 %load_temp812, 2
    store i32 %sdiv_temp813, i32* %y, align 4
    %load_temp814 = load i32, i32* %i, align 4
    %add_temp815 = add i32 %load_temp814, 1
    store i32 %add_temp815, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_56
if_end_56:
    %load_temp816 = load i32, i32* %ans, align 4
    store i32 %load_temp816, i32* %c, align 4
    %load_temp817 = load i32, i32* %sum, align 4
    store i32 %load_temp817, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp818 = load i32, i32* %al, align 4
    store i32 %load_temp818, i32* %ans, align 4
    %load_temp819 = load i32, i32* %ans, align 4
    store i32 %load_temp819, i32* %ml, align 4
    %load_temp820 = load i32, i32* %mr, align 4
    store i32 %load_temp820, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp821 = load i32, i32* %y, align 4
    %icmp_sge_temp822 = icmp sge i32 %load_temp821, 15
    br i1 %icmp_sge_temp822, label %if_then_58, label %if_else_58
if_then_58:
    %load_temp823 = load i32, i32* %x, align 4
    %icmp_slt_temp824 = icmp slt i32 %load_temp823, 0
    br i1 %icmp_slt_temp824, label %if_then_59, label %if_else_59
if_then_59:
    store i32 65535, i32* %ans, align 4
    br label %if_end_59
if_else_59:
    store i32 0, i32* %ans, align 4
    br label %if_end_59
if_end_59:
    br label %if_end_58
if_else_58:
    %load_temp825 = load i32, i32* %y, align 4
    %icmp_sgt_temp826 = icmp sgt i32 %load_temp825, 0
    br i1 %icmp_sgt_temp826, label %if_then_60, label %if_else_60
if_then_60:
    %load_temp827 = load i32, i32* %x, align 4
    %icmp_sgt_temp828 = icmp sgt i32 %load_temp827, 32767
    br i1 %icmp_sgt_temp828, label %if_then_61, label %if_else_61
if_then_61:
    %load_temp829 = load i32, i32* %x, align 4
    %load_temp830 = load i32, i32* %y, align 4
    %gep_temp831 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp830
    %load_temp832 = load i32, i32* %gep_temp831, align 4
    %sdiv_temp833 = sdiv i32 %load_temp829, %load_temp832
    store i32 %sdiv_temp833, i32* %x, align 4
    %load_temp834 = load i32, i32* %x, align 4
    %add_temp835 = add i32 %load_temp834, 65536
    %load_temp836 = load i32, i32* %y, align 4
    %sub_temp837 = sub i32 15, %load_temp836
    %add_temp838 = add i32 %sub_temp837, 1
    %gep_temp839 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp838
    %load_temp840 = load i32, i32* %gep_temp839, align 4
    %sub_temp841 = sub i32 %add_temp835, %load_temp840
    store i32 %sub_temp841, i32* %ans, align 4
    br label %if_end_61
if_else_61:
    %load_temp842 = load i32, i32* %x, align 4
    %load_temp843 = load i32, i32* %y, align 4
    %gep_temp844 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp843
    %load_temp845 = load i32, i32* %gep_temp844, align 4
    %sdiv_temp846 = sdiv i32 %load_temp842, %load_temp845
    store i32 %sdiv_temp846, i32* %ans, align 4
    br label %if_end_61
if_end_61:
    br label %if_end_60
if_else_60:
    %load_temp847 = load i32, i32* %x, align 4
    store i32 %load_temp847, i32* %ans, align 4
    br label %if_end_60
if_end_60:
    br label %if_end_58
if_end_58:
    %load_temp848 = load i32, i32* %ans, align 4
    store i32 %load_temp848, i32* %mr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp849 = load i32, i32* %mres, align 4
    store i32 %load_temp849, i32* %ans, align 4
    %load_temp850 = load i32, i32* %ans, align 4
    store i32 %load_temp850, i32* %pres, align 4
    br label %if_end_43
if_end_43:
    %ml = alloca i32, align 4
    %load_temp851 = load i32, i32* %pl, align 4
    store i32 %load_temp851, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp852 = load i32, i32* %pl, align 4
    store i32 %load_temp852, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp853 = load i32, i32* %mr, align 4
    %icmp_ne_temp854 = icmp ne i32 %load_temp853, 0
    br i1 %icmp_ne_temp854, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp855 = load i32, i32* %mr, align 4
    store i32 %load_temp855, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp856 = load i32, i32* %i, align 4
    %icmp_slt_temp857 = icmp slt i32 %load_temp856, 16
    br i1 %icmp_slt_temp857, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp858 = load i32, i32* %x, align 4
    %srem_temp859 = srem i32 %load_temp858, 2
    %load_temp860 = load i32, i32* %y, align 4
    %srem_temp861 = srem i32 %load_temp860, 2
    %icmp_ne_temp862 = icmp ne i32 %srem_temp859, 0
    %icmp_ne_temp863 = icmp ne i32 %srem_temp861, 0
    %zext_temp864 = zext i1 %icmp_ne_temp862 to i32
    %zext_temp865 = zext i1 %icmp_ne_temp863 to i32
    %mul_temp866 = mul i32 %zext_temp864, %zext_temp865
    %icmp_ne_temp867 = icmp ne i32 %mul_temp866, 0
    br i1 %icmp_ne_temp867, label %if_then_62, label %if_end_62
if_then_62:
    %load_temp868 = load i32, i32* %ans, align 4
    %load_temp869 = load i32, i32* %i, align 4
    %gep_temp870 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp869
    %load_temp871 = load i32, i32* %gep_temp870, align 4
    %mul_temp872 = mul i32 1, %load_temp871
    %add_temp873 = add i32 %load_temp868, %mul_temp872
    store i32 %add_temp873, i32* %ans, align 4
    br label %if_end_62
if_end_62:
    %load_temp874 = load i32, i32* %x, align 4
    %sdiv_temp875 = sdiv i32 %load_temp874, 2
    store i32 %sdiv_temp875, i32* %x, align 4
    %load_temp876 = load i32, i32* %y, align 4
    %sdiv_temp877 = sdiv i32 %load_temp876, 2
    store i32 %sdiv_temp877, i32* %y, align 4
    %load_temp878 = load i32, i32* %i, align 4
    %add_temp879 = add i32 %load_temp878, 1
    store i32 %add_temp879, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp880 = load i32, i32* %ans, align 4
    %icmp_ne_temp881 = icmp ne i32 %load_temp880, 0
    br i1 %icmp_ne_temp881, label %if_then_63, label %if_end_63
if_then_63:
    %al = alloca i32, align 4
    %load_temp882 = load i32, i32* %mres, align 4
    store i32 %load_temp882, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp883 = load i32, i32* %ml, align 4
    store i32 %load_temp883, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp884 = load i32, i32* %c, align 4
    %icmp_ne_temp885 = icmp ne i32 %load_temp884, 0
    br i1 %icmp_ne_temp885, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp886 = load i32, i32* %al, align 4
    store i32 %load_temp886, i32* %x, align 4
    %load_temp887 = load i32, i32* %c, align 4
    store i32 %load_temp887, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp888 = load i32, i32* %i, align 4
    %icmp_slt_temp889 = icmp slt i32 %load_temp888, 16
    br i1 %icmp_slt_temp889, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp890 = load i32, i32* %x, align 4
    %srem_temp891 = srem i32 %load_temp890, 2
    %icmp_ne_temp892 = icmp ne i32 %srem_temp891, 0
    br i1 %icmp_ne_temp892, label %if_then_64, label %if_else_64
if_then_64:
    %load_temp893 = load i32, i32* %y, align 4
    %srem_temp894 = srem i32 %load_temp893, 2
    %icmp_eq_temp895 = icmp eq i32 %srem_temp894, 0
    br i1 %icmp_eq_temp895, label %if_then_65, label %if_end_65
if_then_65:
    %load_temp896 = load i32, i32* %ans, align 4
    %load_temp897 = load i32, i32* %i, align 4
    %gep_temp898 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp897
    %load_temp899 = load i32, i32* %gep_temp898, align 4
    %mul_temp900 = mul i32 1, %load_temp899
    %add_temp901 = add i32 %load_temp896, %mul_temp900
    store i32 %add_temp901, i32* %ans, align 4
    br label %if_end_65
if_end_65:
    br label %if_end_64
if_else_64:
    %load_temp902 = load i32, i32* %y, align 4
    %srem_temp903 = srem i32 %load_temp902, 2
    %icmp_ne_temp904 = icmp ne i32 %srem_temp903, 0
    br i1 %icmp_ne_temp904, label %if_then_66, label %if_end_66
if_then_66:
    %load_temp905 = load i32, i32* %ans, align 4
    %load_temp906 = load i32, i32* %i, align 4
    %gep_temp907 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp906
    %load_temp908 = load i32, i32* %gep_temp907, align 4
    %mul_temp909 = mul i32 1, %load_temp908
    %add_temp910 = add i32 %load_temp905, %mul_temp909
    store i32 %add_temp910, i32* %ans, align 4
    br label %if_end_66
if_end_66:
    br label %if_end_64
if_end_64:
    %load_temp911 = load i32, i32* %x, align 4
    %sdiv_temp912 = sdiv i32 %load_temp911, 2
    store i32 %sdiv_temp912, i32* %x, align 4
    %load_temp913 = load i32, i32* %y, align 4
    %sdiv_temp914 = sdiv i32 %load_temp913, 2
    store i32 %sdiv_temp914, i32* %y, align 4
    %load_temp915 = load i32, i32* %i, align 4
    %add_temp916 = add i32 %load_temp915, 1
    store i32 %add_temp916, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp917 = load i32, i32* %ans, align 4
    store i32 %load_temp917, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp918 = load i32, i32* %al, align 4
    store i32 %load_temp918, i32* %x, align 4
    %load_temp919 = load i32, i32* %c, align 4
    store i32 %load_temp919, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp920 = load i32, i32* %i, align 4
    %icmp_slt_temp921 = icmp slt i32 %load_temp920, 16
    br i1 %icmp_slt_temp921, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp922 = load i32, i32* %x, align 4
    %srem_temp923 = srem i32 %load_temp922, 2
    %load_temp924 = load i32, i32* %y, align 4
    %srem_temp925 = srem i32 %load_temp924, 2
    %icmp_ne_temp926 = icmp ne i32 %srem_temp923, 0
    %icmp_ne_temp927 = icmp ne i32 %srem_temp925, 0
    %zext_temp928 = zext i1 %icmp_ne_temp926 to i32
    %zext_temp929 = zext i1 %icmp_ne_temp927 to i32
    %mul_temp930 = mul i32 %zext_temp928, %zext_temp929
    %icmp_ne_temp931 = icmp ne i32 %mul_temp930, 0
    br i1 %icmp_ne_temp931, label %if_then_67, label %if_end_67
if_then_67:
    %load_temp932 = load i32, i32* %ans, align 4
    %load_temp933 = load i32, i32* %i, align 4
    %gep_temp934 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp933
    %load_temp935 = load i32, i32* %gep_temp934, align 4
    %mul_temp936 = mul i32 1, %load_temp935
    %add_temp937 = add i32 %load_temp932, %mul_temp936
    store i32 %add_temp937, i32* %ans, align 4
    br label %if_end_67
if_end_67:
    %load_temp938 = load i32, i32* %x, align 4
    %sdiv_temp939 = sdiv i32 %load_temp938, 2
    store i32 %sdiv_temp939, i32* %x, align 4
    %load_temp940 = load i32, i32* %y, align 4
    %sdiv_temp941 = sdiv i32 %load_temp940, 2
    store i32 %sdiv_temp941, i32* %y, align 4
    %load_temp942 = load i32, i32* %i, align 4
    %add_temp943 = add i32 %load_temp942, 1
    store i32 %add_temp943, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp944 = load i32, i32* %ans, align 4
    store i32 %load_temp944, i32* %c, align 4
    %icmp_sgt_temp945 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp945, label %if_then_68, label %if_else_68
if_then_68:
    store i32 0, i32* %ans, align 4
    br label %if_end_68
if_else_68:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp946 = load i32, i32* %c, align 4
    %gep_temp947 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp948 = load i32, i32* %gep_temp947, align 4
    %mul_temp949 = mul i32 %load_temp946, %load_temp948
    store i32 %mul_temp949, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp950 = load i32, i32* %i, align 4
    %icmp_slt_temp951 = icmp slt i32 %load_temp950, 16
    br i1 %icmp_slt_temp951, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp952 = load i32, i32* %x, align 4
    %srem_temp953 = srem i32 %load_temp952, 2
    %load_temp954 = load i32, i32* %y, align 4
    %srem_temp955 = srem i32 %load_temp954, 2
    %icmp_ne_temp956 = icmp ne i32 %srem_temp953, 0
    %icmp_ne_temp957 = icmp ne i32 %srem_temp955, 0
    %zext_temp958 = zext i1 %icmp_ne_temp956 to i32
    %zext_temp959 = zext i1 %icmp_ne_temp957 to i32
    %mul_temp960 = mul i32 %zext_temp958, %zext_temp959
    %icmp_ne_temp961 = icmp ne i32 %mul_temp960, 0
    br i1 %icmp_ne_temp961, label %if_then_69, label %if_end_69
if_then_69:
    %load_temp962 = load i32, i32* %ans, align 4
    %load_temp963 = load i32, i32* %i, align 4
    %gep_temp964 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp963
    %load_temp965 = load i32, i32* %gep_temp964, align 4
    %mul_temp966 = mul i32 1, %load_temp965
    %add_temp967 = add i32 %load_temp962, %mul_temp966
    store i32 %add_temp967, i32* %ans, align 4
    br label %if_end_69
if_end_69:
    %load_temp968 = load i32, i32* %x, align 4
    %sdiv_temp969 = sdiv i32 %load_temp968, 2
    store i32 %sdiv_temp969, i32* %x, align 4
    %load_temp970 = load i32, i32* %y, align 4
    %sdiv_temp971 = sdiv i32 %load_temp970, 2
    store i32 %sdiv_temp971, i32* %y, align 4
    %load_temp972 = load i32, i32* %i, align 4
    %add_temp973 = add i32 %load_temp972, 1
    store i32 %add_temp973, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_68
if_end_68:
    %load_temp974 = load i32, i32* %ans, align 4
    store i32 %load_temp974, i32* %c, align 4
    %load_temp975 = load i32, i32* %sum, align 4
    store i32 %load_temp975, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp976 = load i32, i32* %al, align 4
    store i32 %load_temp976, i32* %ans, align 4
    %load_temp977 = load i32, i32* %ans, align 4
    store i32 %load_temp977, i32* %mres, align 4
    br label %if_end_63
if_end_63:
    %al = alloca i32, align 4
    %load_temp978 = load i32, i32* %ml, align 4
    store i32 %load_temp978, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp979 = load i32, i32* %ml, align 4
    store i32 %load_temp979, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp980 = load i32, i32* %c, align 4
    %icmp_ne_temp981 = icmp ne i32 %load_temp980, 0
    br i1 %icmp_ne_temp981, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp982 = load i32, i32* %al, align 4
    store i32 %load_temp982, i32* %x, align 4
    %load_temp983 = load i32, i32* %c, align 4
    store i32 %load_temp983, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp984 = load i32, i32* %i, align 4
    %icmp_slt_temp985 = icmp slt i32 %load_temp984, 16
    br i1 %icmp_slt_temp985, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp986 = load i32, i32* %x, align 4
    %srem_temp987 = srem i32 %load_temp986, 2
    %icmp_ne_temp988 = icmp ne i32 %srem_temp987, 0
    br i1 %icmp_ne_temp988, label %if_then_70, label %if_else_70
if_then_70:
    %load_temp989 = load i32, i32* %y, align 4
    %srem_temp990 = srem i32 %load_temp989, 2
    %icmp_eq_temp991 = icmp eq i32 %srem_temp990, 0
    br i1 %icmp_eq_temp991, label %if_then_71, label %if_end_71
if_then_71:
    %load_temp992 = load i32, i32* %ans, align 4
    %load_temp993 = load i32, i32* %i, align 4
    %gep_temp994 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp993
    %load_temp995 = load i32, i32* %gep_temp994, align 4
    %mul_temp996 = mul i32 1, %load_temp995
    %add_temp997 = add i32 %load_temp992, %mul_temp996
    store i32 %add_temp997, i32* %ans, align 4
    br label %if_end_71
if_end_71:
    br label %if_end_70
if_else_70:
    %load_temp998 = load i32, i32* %y, align 4
    %srem_temp999 = srem i32 %load_temp998, 2
    %icmp_ne_temp1000 = icmp ne i32 %srem_temp999, 0
    br i1 %icmp_ne_temp1000, label %if_then_72, label %if_end_72
if_then_72:
    %load_temp1001 = load i32, i32* %ans, align 4
    %load_temp1002 = load i32, i32* %i, align 4
    %gep_temp1003 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1002
    %load_temp1004 = load i32, i32* %gep_temp1003, align 4
    %mul_temp1005 = mul i32 1, %load_temp1004
    %add_temp1006 = add i32 %load_temp1001, %mul_temp1005
    store i32 %add_temp1006, i32* %ans, align 4
    br label %if_end_72
if_end_72:
    br label %if_end_70
if_end_70:
    %load_temp1007 = load i32, i32* %x, align 4
    %sdiv_temp1008 = sdiv i32 %load_temp1007, 2
    store i32 %sdiv_temp1008, i32* %x, align 4
    %load_temp1009 = load i32, i32* %y, align 4
    %sdiv_temp1010 = sdiv i32 %load_temp1009, 2
    store i32 %sdiv_temp1010, i32* %y, align 4
    %load_temp1011 = load i32, i32* %i, align 4
    %add_temp1012 = add i32 %load_temp1011, 1
    store i32 %add_temp1012, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1013 = load i32, i32* %ans, align 4
    store i32 %load_temp1013, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1014 = load i32, i32* %al, align 4
    store i32 %load_temp1014, i32* %x, align 4
    %load_temp1015 = load i32, i32* %c, align 4
    store i32 %load_temp1015, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1016 = load i32, i32* %i, align 4
    %icmp_slt_temp1017 = icmp slt i32 %load_temp1016, 16
    br i1 %icmp_slt_temp1017, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp1018 = load i32, i32* %x, align 4
    %srem_temp1019 = srem i32 %load_temp1018, 2
    %load_temp1020 = load i32, i32* %y, align 4
    %srem_temp1021 = srem i32 %load_temp1020, 2
    %icmp_ne_temp1022 = icmp ne i32 %srem_temp1019, 0
    %icmp_ne_temp1023 = icmp ne i32 %srem_temp1021, 0
    %zext_temp1024 = zext i1 %icmp_ne_temp1022 to i32
    %zext_temp1025 = zext i1 %icmp_ne_temp1023 to i32
    %mul_temp1026 = mul i32 %zext_temp1024, %zext_temp1025
    %icmp_ne_temp1027 = icmp ne i32 %mul_temp1026, 0
    br i1 %icmp_ne_temp1027, label %if_then_73, label %if_end_73
if_then_73:
    %load_temp1028 = load i32, i32* %ans, align 4
    %load_temp1029 = load i32, i32* %i, align 4
    %gep_temp1030 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1029
    %load_temp1031 = load i32, i32* %gep_temp1030, align 4
    %mul_temp1032 = mul i32 1, %load_temp1031
    %add_temp1033 = add i32 %load_temp1028, %mul_temp1032
    store i32 %add_temp1033, i32* %ans, align 4
    br label %if_end_73
if_end_73:
    %load_temp1034 = load i32, i32* %x, align 4
    %sdiv_temp1035 = sdiv i32 %load_temp1034, 2
    store i32 %sdiv_temp1035, i32* %x, align 4
    %load_temp1036 = load i32, i32* %y, align 4
    %sdiv_temp1037 = sdiv i32 %load_temp1036, 2
    store i32 %sdiv_temp1037, i32* %y, align 4
    %load_temp1038 = load i32, i32* %i, align 4
    %add_temp1039 = add i32 %load_temp1038, 1
    store i32 %add_temp1039, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1040 = load i32, i32* %ans, align 4
    store i32 %load_temp1040, i32* %c, align 4
    %icmp_sgt_temp1041 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1041, label %if_then_74, label %if_else_74
if_then_74:
    store i32 0, i32* %ans, align 4
    br label %if_end_74
if_else_74:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1042 = load i32, i32* %c, align 4
    %gep_temp1043 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1044 = load i32, i32* %gep_temp1043, align 4
    %mul_temp1045 = mul i32 %load_temp1042, %load_temp1044
    store i32 %mul_temp1045, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1046 = load i32, i32* %i, align 4
    %icmp_slt_temp1047 = icmp slt i32 %load_temp1046, 16
    br i1 %icmp_slt_temp1047, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp1048 = load i32, i32* %x, align 4
    %srem_temp1049 = srem i32 %load_temp1048, 2
    %load_temp1050 = load i32, i32* %y, align 4
    %srem_temp1051 = srem i32 %load_temp1050, 2
    %icmp_ne_temp1052 = icmp ne i32 %srem_temp1049, 0
    %icmp_ne_temp1053 = icmp ne i32 %srem_temp1051, 0
    %zext_temp1054 = zext i1 %icmp_ne_temp1052 to i32
    %zext_temp1055 = zext i1 %icmp_ne_temp1053 to i32
    %mul_temp1056 = mul i32 %zext_temp1054, %zext_temp1055
    %icmp_ne_temp1057 = icmp ne i32 %mul_temp1056, 0
    br i1 %icmp_ne_temp1057, label %if_then_75, label %if_end_75
if_then_75:
    %load_temp1058 = load i32, i32* %ans, align 4
    %load_temp1059 = load i32, i32* %i, align 4
    %gep_temp1060 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1059
    %load_temp1061 = load i32, i32* %gep_temp1060, align 4
    %mul_temp1062 = mul i32 1, %load_temp1061
    %add_temp1063 = add i32 %load_temp1058, %mul_temp1062
    store i32 %add_temp1063, i32* %ans, align 4
    br label %if_end_75
if_end_75:
    %load_temp1064 = load i32, i32* %x, align 4
    %sdiv_temp1065 = sdiv i32 %load_temp1064, 2
    store i32 %sdiv_temp1065, i32* %x, align 4
    %load_temp1066 = load i32, i32* %y, align 4
    %sdiv_temp1067 = sdiv i32 %load_temp1066, 2
    store i32 %sdiv_temp1067, i32* %y, align 4
    %load_temp1068 = load i32, i32* %i, align 4
    %add_temp1069 = add i32 %load_temp1068, 1
    store i32 %add_temp1069, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    br label %if_end_74
if_end_74:
    %load_temp1070 = load i32, i32* %ans, align 4
    store i32 %load_temp1070, i32* %c, align 4
    %load_temp1071 = load i32, i32* %sum, align 4
    store i32 %load_temp1071, i32* %al, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1072 = load i32, i32* %al, align 4
    store i32 %load_temp1072, i32* %ans, align 4
    %load_temp1073 = load i32, i32* %ans, align 4
    store i32 %load_temp1073, i32* %ml, align 4
    %load_temp1074 = load i32, i32* %mr, align 4
    store i32 %load_temp1074, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1075 = load i32, i32* %y, align 4
    %icmp_sge_temp1076 = icmp sge i32 %load_temp1075, 15
    br i1 %icmp_sge_temp1076, label %if_then_76, label %if_else_76
if_then_76:
    %load_temp1077 = load i32, i32* %x, align 4
    %icmp_slt_temp1078 = icmp slt i32 %load_temp1077, 0
    br i1 %icmp_slt_temp1078, label %if_then_77, label %if_else_77
if_then_77:
    store i32 65535, i32* %ans, align 4
    br label %if_end_77
if_else_77:
    store i32 0, i32* %ans, align 4
    br label %if_end_77
if_end_77:
    br label %if_end_76
if_else_76:
    %load_temp1079 = load i32, i32* %y, align 4
    %icmp_sgt_temp1080 = icmp sgt i32 %load_temp1079, 0
    br i1 %icmp_sgt_temp1080, label %if_then_78, label %if_else_78
if_then_78:
    %load_temp1081 = load i32, i32* %x, align 4
    %icmp_sgt_temp1082 = icmp sgt i32 %load_temp1081, 32767
    br i1 %icmp_sgt_temp1082, label %if_then_79, label %if_else_79
if_then_79:
    %load_temp1083 = load i32, i32* %x, align 4
    %load_temp1084 = load i32, i32* %y, align 4
    %gep_temp1085 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1084
    %load_temp1086 = load i32, i32* %gep_temp1085, align 4
    %sdiv_temp1087 = sdiv i32 %load_temp1083, %load_temp1086
    store i32 %sdiv_temp1087, i32* %x, align 4
    %load_temp1088 = load i32, i32* %x, align 4
    %add_temp1089 = add i32 %load_temp1088, 65536
    %load_temp1090 = load i32, i32* %y, align 4
    %sub_temp1091 = sub i32 15, %load_temp1090
    %add_temp1092 = add i32 %sub_temp1091, 1
    %gep_temp1093 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1092
    %load_temp1094 = load i32, i32* %gep_temp1093, align 4
    %sub_temp1095 = sub i32 %add_temp1089, %load_temp1094
    store i32 %sub_temp1095, i32* %ans, align 4
    br label %if_end_79
if_else_79:
    %load_temp1096 = load i32, i32* %x, align 4
    %load_temp1097 = load i32, i32* %y, align 4
    %gep_temp1098 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1097
    %load_temp1099 = load i32, i32* %gep_temp1098, align 4
    %sdiv_temp1100 = sdiv i32 %load_temp1096, %load_temp1099
    store i32 %sdiv_temp1100, i32* %ans, align 4
    br label %if_end_79
if_end_79:
    br label %if_end_78
if_else_78:
    %load_temp1101 = load i32, i32* %x, align 4
    store i32 %load_temp1101, i32* %ans, align 4
    br label %if_end_78
if_end_78:
    br label %if_end_76
if_end_76:
    %load_temp1102 = load i32, i32* %ans, align 4
    store i32 %load_temp1102, i32* %mr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp1103 = load i32, i32* %mres, align 4
    store i32 %load_temp1103, i32* %ans, align 4
    %load_temp1104 = load i32, i32* %ans, align 4
    store i32 %load_temp1104, i32* %pl, align 4
    %load_temp1105 = load i32, i32* %pr, align 4
    store i32 %load_temp1105, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1106 = load i32, i32* %y, align 4
    %icmp_sge_temp1107 = icmp sge i32 %load_temp1106, 15
    br i1 %icmp_sge_temp1107, label %if_then_80, label %if_else_80
if_then_80:
    %load_temp1108 = load i32, i32* %x, align 4
    %icmp_slt_temp1109 = icmp slt i32 %load_temp1108, 0
    br i1 %icmp_slt_temp1109, label %if_then_81, label %if_else_81
if_then_81:
    store i32 65535, i32* %ans, align 4
    br label %if_end_81
if_else_81:
    store i32 0, i32* %ans, align 4
    br label %if_end_81
if_end_81:
    br label %if_end_80
if_else_80:
    %load_temp1110 = load i32, i32* %y, align 4
    %icmp_sgt_temp1111 = icmp sgt i32 %load_temp1110, 0
    br i1 %icmp_sgt_temp1111, label %if_then_82, label %if_else_82
if_then_82:
    %load_temp1112 = load i32, i32* %x, align 4
    %icmp_sgt_temp1113 = icmp sgt i32 %load_temp1112, 32767
    br i1 %icmp_sgt_temp1113, label %if_then_83, label %if_else_83
if_then_83:
    %load_temp1114 = load i32, i32* %x, align 4
    %load_temp1115 = load i32, i32* %y, align 4
    %gep_temp1116 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1115
    %load_temp1117 = load i32, i32* %gep_temp1116, align 4
    %sdiv_temp1118 = sdiv i32 %load_temp1114, %load_temp1117
    store i32 %sdiv_temp1118, i32* %x, align 4
    %load_temp1119 = load i32, i32* %x, align 4
    %add_temp1120 = add i32 %load_temp1119, 65536
    %load_temp1121 = load i32, i32* %y, align 4
    %sub_temp1122 = sub i32 15, %load_temp1121
    %add_temp1123 = add i32 %sub_temp1122, 1
    %gep_temp1124 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1123
    %load_temp1125 = load i32, i32* %gep_temp1124, align 4
    %sub_temp1126 = sub i32 %add_temp1120, %load_temp1125
    store i32 %sub_temp1126, i32* %ans, align 4
    br label %if_end_83
if_else_83:
    %load_temp1127 = load i32, i32* %x, align 4
    %load_temp1128 = load i32, i32* %y, align 4
    %gep_temp1129 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1128
    %load_temp1130 = load i32, i32* %gep_temp1129, align 4
    %sdiv_temp1131 = sdiv i32 %load_temp1127, %load_temp1130
    store i32 %sdiv_temp1131, i32* %ans, align 4
    br label %if_end_83
if_end_83:
    br label %if_end_82
if_else_82:
    %load_temp1132 = load i32, i32* %x, align 4
    store i32 %load_temp1132, i32* %ans, align 4
    br label %if_end_82
if_end_82:
    br label %if_end_80
if_end_80:
    %load_temp1133 = load i32, i32* %ans, align 4
    store i32 %load_temp1133, i32* %pr, align 4
    br label %while_cond_0
while_end_0:
    %load_temp1134 = load i32, i32* %pres, align 4
    store i32 %load_temp1134, i32* %ans, align 4
    %load_temp1135 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp1135)
    call void @putch(i32 10)
    store i32 2, i32* %cur, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp1136 = load i32, i32* %cur, align 4
    %icmp_slt_temp1137 = icmp slt i32 %load_temp1136, 16
    br i1 %icmp_slt_temp1137, label %while_body_0, label %while_end_0
while_body_0:
    %pl = alloca i32, align 4
    store i32 2, i32* %pl, align 4
    %pr = alloca i32, align 4
    %load_temp1138 = load i32, i32* %cur, align 4
    store i32 %load_temp1138, i32* %pr, align 4
    %pres = alloca i32, align 4
    store i32 1, i32* %pres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp1139 = load i32, i32* %pr, align 4
    %icmp_sgt_temp1140 = icmp sgt i32 %load_temp1139, 0
    br i1 %icmp_sgt_temp1140, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1141 = load i32, i32* %pr, align 4
    store i32 %load_temp1141, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1142 = load i32, i32* %i, align 4
    %icmp_slt_temp1143 = icmp slt i32 %load_temp1142, 16
    br i1 %icmp_slt_temp1143, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp1144 = load i32, i32* %x, align 4
    %srem_temp1145 = srem i32 %load_temp1144, 2
    %load_temp1146 = load i32, i32* %y, align 4
    %srem_temp1147 = srem i32 %load_temp1146, 2
    %icmp_ne_temp1148 = icmp ne i32 %srem_temp1145, 0
    %icmp_ne_temp1149 = icmp ne i32 %srem_temp1147, 0
    %zext_temp1150 = zext i1 %icmp_ne_temp1148 to i32
    %zext_temp1151 = zext i1 %icmp_ne_temp1149 to i32
    %mul_temp1152 = mul i32 %zext_temp1150, %zext_temp1151
    %icmp_ne_temp1153 = icmp ne i32 %mul_temp1152, 0
    br i1 %icmp_ne_temp1153, label %if_then_84, label %if_end_84
if_then_84:
    %load_temp1154 = load i32, i32* %ans, align 4
    %load_temp1155 = load i32, i32* %i, align 4
    %gep_temp1156 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1155
    %load_temp1157 = load i32, i32* %gep_temp1156, align 4
    %mul_temp1158 = mul i32 1, %load_temp1157
    %add_temp1159 = add i32 %load_temp1154, %mul_temp1158
    store i32 %add_temp1159, i32* %ans, align 4
    br label %if_end_84
if_end_84:
    %load_temp1160 = load i32, i32* %x, align 4
    %sdiv_temp1161 = sdiv i32 %load_temp1160, 2
    store i32 %sdiv_temp1161, i32* %x, align 4
    %load_temp1162 = load i32, i32* %y, align 4
    %sdiv_temp1163 = sdiv i32 %load_temp1162, 2
    store i32 %sdiv_temp1163, i32* %y, align 4
    %load_temp1164 = load i32, i32* %i, align 4
    %add_temp1165 = add i32 %load_temp1164, 1
    store i32 %add_temp1165, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1166 = load i32, i32* %ans, align 4
    %icmp_ne_temp1167 = icmp ne i32 %load_temp1166, 0
    br i1 %icmp_ne_temp1167, label %if_then_85, label %if_end_85
if_then_85:
    %ml = alloca i32, align 4
    %load_temp1168 = load i32, i32* %pres, align 4
    store i32 %load_temp1168, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp1169 = load i32, i32* %pl, align 4
    store i32 %load_temp1169, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1170 = load i32, i32* %mr, align 4
    %icmp_ne_temp1171 = icmp ne i32 %load_temp1170, 0
    br i1 %icmp_ne_temp1171, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1172 = load i32, i32* %mr, align 4
    store i32 %load_temp1172, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1173 = load i32, i32* %i, align 4
    %icmp_slt_temp1174 = icmp slt i32 %load_temp1173, 16
    br i1 %icmp_slt_temp1174, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp1175 = load i32, i32* %x, align 4
    %srem_temp1176 = srem i32 %load_temp1175, 2
    %load_temp1177 = load i32, i32* %y, align 4
    %srem_temp1178 = srem i32 %load_temp1177, 2
    %icmp_ne_temp1179 = icmp ne i32 %srem_temp1176, 0
    %icmp_ne_temp1180 = icmp ne i32 %srem_temp1178, 0
    %zext_temp1181 = zext i1 %icmp_ne_temp1179 to i32
    %zext_temp1182 = zext i1 %icmp_ne_temp1180 to i32
    %mul_temp1183 = mul i32 %zext_temp1181, %zext_temp1182
    %icmp_ne_temp1184 = icmp ne i32 %mul_temp1183, 0
    br i1 %icmp_ne_temp1184, label %if_then_86, label %if_end_86
if_then_86:
    %load_temp1185 = load i32, i32* %ans, align 4
    %load_temp1186 = load i32, i32* %i, align 4
    %gep_temp1187 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1186
    %load_temp1188 = load i32, i32* %gep_temp1187, align 4
    %mul_temp1189 = mul i32 1, %load_temp1188
    %add_temp1190 = add i32 %load_temp1185, %mul_temp1189
    store i32 %add_temp1190, i32* %ans, align 4
    br label %if_end_86
if_end_86:
    %load_temp1191 = load i32, i32* %x, align 4
    %sdiv_temp1192 = sdiv i32 %load_temp1191, 2
    store i32 %sdiv_temp1192, i32* %x, align 4
    %load_temp1193 = load i32, i32* %y, align 4
    %sdiv_temp1194 = sdiv i32 %load_temp1193, 2
    store i32 %sdiv_temp1194, i32* %y, align 4
    %load_temp1195 = load i32, i32* %i, align 4
    %add_temp1196 = add i32 %load_temp1195, 1
    store i32 %add_temp1196, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1197 = load i32, i32* %ans, align 4
    %icmp_ne_temp1198 = icmp ne i32 %load_temp1197, 0
    br i1 %icmp_ne_temp1198, label %if_then_87, label %if_end_87
if_then_87:
    %al = alloca i32, align 4
    %load_temp1199 = load i32, i32* %mres, align 4
    store i32 %load_temp1199, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1200 = load i32, i32* %ml, align 4
    store i32 %load_temp1200, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1201 = load i32, i32* %c, align 4
    %icmp_ne_temp1202 = icmp ne i32 %load_temp1201, 0
    br i1 %icmp_ne_temp1202, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1203 = load i32, i32* %al, align 4
    store i32 %load_temp1203, i32* %x, align 4
    %load_temp1204 = load i32, i32* %c, align 4
    store i32 %load_temp1204, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1205 = load i32, i32* %i, align 4
    %icmp_slt_temp1206 = icmp slt i32 %load_temp1205, 16
    br i1 %icmp_slt_temp1206, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1207 = load i32, i32* %x, align 4
    %srem_temp1208 = srem i32 %load_temp1207, 2
    %icmp_ne_temp1209 = icmp ne i32 %srem_temp1208, 0
    br i1 %icmp_ne_temp1209, label %if_then_88, label %if_else_88
if_then_88:
    %load_temp1210 = load i32, i32* %y, align 4
    %srem_temp1211 = srem i32 %load_temp1210, 2
    %icmp_eq_temp1212 = icmp eq i32 %srem_temp1211, 0
    br i1 %icmp_eq_temp1212, label %if_then_89, label %if_end_89
if_then_89:
    %load_temp1213 = load i32, i32* %ans, align 4
    %load_temp1214 = load i32, i32* %i, align 4
    %gep_temp1215 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1214
    %load_temp1216 = load i32, i32* %gep_temp1215, align 4
    %mul_temp1217 = mul i32 1, %load_temp1216
    %add_temp1218 = add i32 %load_temp1213, %mul_temp1217
    store i32 %add_temp1218, i32* %ans, align 4
    br label %if_end_89
if_end_89:
    br label %if_end_88
if_else_88:
    %load_temp1219 = load i32, i32* %y, align 4
    %srem_temp1220 = srem i32 %load_temp1219, 2
    %icmp_ne_temp1221 = icmp ne i32 %srem_temp1220, 0
    br i1 %icmp_ne_temp1221, label %if_then_90, label %if_end_90
if_then_90:
    %load_temp1222 = load i32, i32* %ans, align 4
    %load_temp1223 = load i32, i32* %i, align 4
    %gep_temp1224 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1223
    %load_temp1225 = load i32, i32* %gep_temp1224, align 4
    %mul_temp1226 = mul i32 1, %load_temp1225
    %add_temp1227 = add i32 %load_temp1222, %mul_temp1226
    store i32 %add_temp1227, i32* %ans, align 4
    br label %if_end_90
if_end_90:
    br label %if_end_88
if_end_88:
    %load_temp1228 = load i32, i32* %x, align 4
    %sdiv_temp1229 = sdiv i32 %load_temp1228, 2
    store i32 %sdiv_temp1229, i32* %x, align 4
    %load_temp1230 = load i32, i32* %y, align 4
    %sdiv_temp1231 = sdiv i32 %load_temp1230, 2
    store i32 %sdiv_temp1231, i32* %y, align 4
    %load_temp1232 = load i32, i32* %i, align 4
    %add_temp1233 = add i32 %load_temp1232, 1
    store i32 %add_temp1233, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1234 = load i32, i32* %ans, align 4
    store i32 %load_temp1234, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1235 = load i32, i32* %al, align 4
    store i32 %load_temp1235, i32* %x, align 4
    %load_temp1236 = load i32, i32* %c, align 4
    store i32 %load_temp1236, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1237 = load i32, i32* %i, align 4
    %icmp_slt_temp1238 = icmp slt i32 %load_temp1237, 16
    br i1 %icmp_slt_temp1238, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1239 = load i32, i32* %x, align 4
    %srem_temp1240 = srem i32 %load_temp1239, 2
    %load_temp1241 = load i32, i32* %y, align 4
    %srem_temp1242 = srem i32 %load_temp1241, 2
    %icmp_ne_temp1243 = icmp ne i32 %srem_temp1240, 0
    %icmp_ne_temp1244 = icmp ne i32 %srem_temp1242, 0
    %zext_temp1245 = zext i1 %icmp_ne_temp1243 to i32
    %zext_temp1246 = zext i1 %icmp_ne_temp1244 to i32
    %mul_temp1247 = mul i32 %zext_temp1245, %zext_temp1246
    %icmp_ne_temp1248 = icmp ne i32 %mul_temp1247, 0
    br i1 %icmp_ne_temp1248, label %if_then_91, label %if_end_91
if_then_91:
    %load_temp1249 = load i32, i32* %ans, align 4
    %load_temp1250 = load i32, i32* %i, align 4
    %gep_temp1251 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1250
    %load_temp1252 = load i32, i32* %gep_temp1251, align 4
    %mul_temp1253 = mul i32 1, %load_temp1252
    %add_temp1254 = add i32 %load_temp1249, %mul_temp1253
    store i32 %add_temp1254, i32* %ans, align 4
    br label %if_end_91
if_end_91:
    %load_temp1255 = load i32, i32* %x, align 4
    %sdiv_temp1256 = sdiv i32 %load_temp1255, 2
    store i32 %sdiv_temp1256, i32* %x, align 4
    %load_temp1257 = load i32, i32* %y, align 4
    %sdiv_temp1258 = sdiv i32 %load_temp1257, 2
    store i32 %sdiv_temp1258, i32* %y, align 4
    %load_temp1259 = load i32, i32* %i, align 4
    %add_temp1260 = add i32 %load_temp1259, 1
    store i32 %add_temp1260, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1261 = load i32, i32* %ans, align 4
    store i32 %load_temp1261, i32* %c, align 4
    %icmp_sgt_temp1262 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1262, label %if_then_92, label %if_else_92
if_then_92:
    store i32 0, i32* %ans, align 4
    br label %if_end_92
if_else_92:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1263 = load i32, i32* %c, align 4
    %gep_temp1264 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1265 = load i32, i32* %gep_temp1264, align 4
    %mul_temp1266 = mul i32 %load_temp1263, %load_temp1265
    store i32 %mul_temp1266, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1267 = load i32, i32* %i, align 4
    %icmp_slt_temp1268 = icmp slt i32 %load_temp1267, 16
    br i1 %icmp_slt_temp1268, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1269 = load i32, i32* %x, align 4
    %srem_temp1270 = srem i32 %load_temp1269, 2
    %load_temp1271 = load i32, i32* %y, align 4
    %srem_temp1272 = srem i32 %load_temp1271, 2
    %icmp_ne_temp1273 = icmp ne i32 %srem_temp1270, 0
    %icmp_ne_temp1274 = icmp ne i32 %srem_temp1272, 0
    %zext_temp1275 = zext i1 %icmp_ne_temp1273 to i32
    %zext_temp1276 = zext i1 %icmp_ne_temp1274 to i32
    %mul_temp1277 = mul i32 %zext_temp1275, %zext_temp1276
    %icmp_ne_temp1278 = icmp ne i32 %mul_temp1277, 0
    br i1 %icmp_ne_temp1278, label %if_then_93, label %if_end_93
if_then_93:
    %load_temp1279 = load i32, i32* %ans, align 4
    %load_temp1280 = load i32, i32* %i, align 4
    %gep_temp1281 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1280
    %load_temp1282 = load i32, i32* %gep_temp1281, align 4
    %mul_temp1283 = mul i32 1, %load_temp1282
    %add_temp1284 = add i32 %load_temp1279, %mul_temp1283
    store i32 %add_temp1284, i32* %ans, align 4
    br label %if_end_93
if_end_93:
    %load_temp1285 = load i32, i32* %x, align 4
    %sdiv_temp1286 = sdiv i32 %load_temp1285, 2
    store i32 %sdiv_temp1286, i32* %x, align 4
    %load_temp1287 = load i32, i32* %y, align 4
    %sdiv_temp1288 = sdiv i32 %load_temp1287, 2
    store i32 %sdiv_temp1288, i32* %y, align 4
    %load_temp1289 = load i32, i32* %i, align 4
    %add_temp1290 = add i32 %load_temp1289, 1
    store i32 %add_temp1290, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_92
if_end_92:
    %load_temp1291 = load i32, i32* %ans, align 4
    store i32 %load_temp1291, i32* %c, align 4
    %load_temp1292 = load i32, i32* %sum, align 4
    store i32 %load_temp1292, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1293 = load i32, i32* %al, align 4
    store i32 %load_temp1293, i32* %ans, align 4
    %load_temp1294 = load i32, i32* %ans, align 4
    store i32 %load_temp1294, i32* %mres, align 4
    br label %if_end_87
if_end_87:
    %al = alloca i32, align 4
    %load_temp1295 = load i32, i32* %ml, align 4
    store i32 %load_temp1295, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1296 = load i32, i32* %ml, align 4
    store i32 %load_temp1296, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1297 = load i32, i32* %c, align 4
    %icmp_ne_temp1298 = icmp ne i32 %load_temp1297, 0
    br i1 %icmp_ne_temp1298, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1299 = load i32, i32* %al, align 4
    store i32 %load_temp1299, i32* %x, align 4
    %load_temp1300 = load i32, i32* %c, align 4
    store i32 %load_temp1300, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1301 = load i32, i32* %i, align 4
    %icmp_slt_temp1302 = icmp slt i32 %load_temp1301, 16
    br i1 %icmp_slt_temp1302, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1303 = load i32, i32* %x, align 4
    %srem_temp1304 = srem i32 %load_temp1303, 2
    %icmp_ne_temp1305 = icmp ne i32 %srem_temp1304, 0
    br i1 %icmp_ne_temp1305, label %if_then_94, label %if_else_94
if_then_94:
    %load_temp1306 = load i32, i32* %y, align 4
    %srem_temp1307 = srem i32 %load_temp1306, 2
    %icmp_eq_temp1308 = icmp eq i32 %srem_temp1307, 0
    br i1 %icmp_eq_temp1308, label %if_then_95, label %if_end_95
if_then_95:
    %load_temp1309 = load i32, i32* %ans, align 4
    %load_temp1310 = load i32, i32* %i, align 4
    %gep_temp1311 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1310
    %load_temp1312 = load i32, i32* %gep_temp1311, align 4
    %mul_temp1313 = mul i32 1, %load_temp1312
    %add_temp1314 = add i32 %load_temp1309, %mul_temp1313
    store i32 %add_temp1314, i32* %ans, align 4
    br label %if_end_95
if_end_95:
    br label %if_end_94
if_else_94:
    %load_temp1315 = load i32, i32* %y, align 4
    %srem_temp1316 = srem i32 %load_temp1315, 2
    %icmp_ne_temp1317 = icmp ne i32 %srem_temp1316, 0
    br i1 %icmp_ne_temp1317, label %if_then_96, label %if_end_96
if_then_96:
    %load_temp1318 = load i32, i32* %ans, align 4
    %load_temp1319 = load i32, i32* %i, align 4
    %gep_temp1320 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1319
    %load_temp1321 = load i32, i32* %gep_temp1320, align 4
    %mul_temp1322 = mul i32 1, %load_temp1321
    %add_temp1323 = add i32 %load_temp1318, %mul_temp1322
    store i32 %add_temp1323, i32* %ans, align 4
    br label %if_end_96
if_end_96:
    br label %if_end_94
if_end_94:
    %load_temp1324 = load i32, i32* %x, align 4
    %sdiv_temp1325 = sdiv i32 %load_temp1324, 2
    store i32 %sdiv_temp1325, i32* %x, align 4
    %load_temp1326 = load i32, i32* %y, align 4
    %sdiv_temp1327 = sdiv i32 %load_temp1326, 2
    store i32 %sdiv_temp1327, i32* %y, align 4
    %load_temp1328 = load i32, i32* %i, align 4
    %add_temp1329 = add i32 %load_temp1328, 1
    store i32 %add_temp1329, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1330 = load i32, i32* %ans, align 4
    store i32 %load_temp1330, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1331 = load i32, i32* %al, align 4
    store i32 %load_temp1331, i32* %x, align 4
    %load_temp1332 = load i32, i32* %c, align 4
    store i32 %load_temp1332, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1333 = load i32, i32* %i, align 4
    %icmp_slt_temp1334 = icmp slt i32 %load_temp1333, 16
    br i1 %icmp_slt_temp1334, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1335 = load i32, i32* %x, align 4
    %srem_temp1336 = srem i32 %load_temp1335, 2
    %load_temp1337 = load i32, i32* %y, align 4
    %srem_temp1338 = srem i32 %load_temp1337, 2
    %icmp_ne_temp1339 = icmp ne i32 %srem_temp1336, 0
    %icmp_ne_temp1340 = icmp ne i32 %srem_temp1338, 0
    %zext_temp1341 = zext i1 %icmp_ne_temp1339 to i32
    %zext_temp1342 = zext i1 %icmp_ne_temp1340 to i32
    %mul_temp1343 = mul i32 %zext_temp1341, %zext_temp1342
    %icmp_ne_temp1344 = icmp ne i32 %mul_temp1343, 0
    br i1 %icmp_ne_temp1344, label %if_then_97, label %if_end_97
if_then_97:
    %load_temp1345 = load i32, i32* %ans, align 4
    %load_temp1346 = load i32, i32* %i, align 4
    %gep_temp1347 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1346
    %load_temp1348 = load i32, i32* %gep_temp1347, align 4
    %mul_temp1349 = mul i32 1, %load_temp1348
    %add_temp1350 = add i32 %load_temp1345, %mul_temp1349
    store i32 %add_temp1350, i32* %ans, align 4
    br label %if_end_97
if_end_97:
    %load_temp1351 = load i32, i32* %x, align 4
    %sdiv_temp1352 = sdiv i32 %load_temp1351, 2
    store i32 %sdiv_temp1352, i32* %x, align 4
    %load_temp1353 = load i32, i32* %y, align 4
    %sdiv_temp1354 = sdiv i32 %load_temp1353, 2
    store i32 %sdiv_temp1354, i32* %y, align 4
    %load_temp1355 = load i32, i32* %i, align 4
    %add_temp1356 = add i32 %load_temp1355, 1
    store i32 %add_temp1356, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1357 = load i32, i32* %ans, align 4
    store i32 %load_temp1357, i32* %c, align 4
    %icmp_sgt_temp1358 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1358, label %if_then_98, label %if_else_98
if_then_98:
    store i32 0, i32* %ans, align 4
    br label %if_end_98
if_else_98:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1359 = load i32, i32* %c, align 4
    %gep_temp1360 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1361 = load i32, i32* %gep_temp1360, align 4
    %mul_temp1362 = mul i32 %load_temp1359, %load_temp1361
    store i32 %mul_temp1362, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1363 = load i32, i32* %i, align 4
    %icmp_slt_temp1364 = icmp slt i32 %load_temp1363, 16
    br i1 %icmp_slt_temp1364, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1365 = load i32, i32* %x, align 4
    %srem_temp1366 = srem i32 %load_temp1365, 2
    %load_temp1367 = load i32, i32* %y, align 4
    %srem_temp1368 = srem i32 %load_temp1367, 2
    %icmp_ne_temp1369 = icmp ne i32 %srem_temp1366, 0
    %icmp_ne_temp1370 = icmp ne i32 %srem_temp1368, 0
    %zext_temp1371 = zext i1 %icmp_ne_temp1369 to i32
    %zext_temp1372 = zext i1 %icmp_ne_temp1370 to i32
    %mul_temp1373 = mul i32 %zext_temp1371, %zext_temp1372
    %icmp_ne_temp1374 = icmp ne i32 %mul_temp1373, 0
    br i1 %icmp_ne_temp1374, label %if_then_99, label %if_end_99
if_then_99:
    %load_temp1375 = load i32, i32* %ans, align 4
    %load_temp1376 = load i32, i32* %i, align 4
    %gep_temp1377 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1376
    %load_temp1378 = load i32, i32* %gep_temp1377, align 4
    %mul_temp1379 = mul i32 1, %load_temp1378
    %add_temp1380 = add i32 %load_temp1375, %mul_temp1379
    store i32 %add_temp1380, i32* %ans, align 4
    br label %if_end_99
if_end_99:
    %load_temp1381 = load i32, i32* %x, align 4
    %sdiv_temp1382 = sdiv i32 %load_temp1381, 2
    store i32 %sdiv_temp1382, i32* %x, align 4
    %load_temp1383 = load i32, i32* %y, align 4
    %sdiv_temp1384 = sdiv i32 %load_temp1383, 2
    store i32 %sdiv_temp1384, i32* %y, align 4
    %load_temp1385 = load i32, i32* %i, align 4
    %add_temp1386 = add i32 %load_temp1385, 1
    store i32 %add_temp1386, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_98
if_end_98:
    %load_temp1387 = load i32, i32* %ans, align 4
    store i32 %load_temp1387, i32* %c, align 4
    %load_temp1388 = load i32, i32* %sum, align 4
    store i32 %load_temp1388, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1389 = load i32, i32* %al, align 4
    store i32 %load_temp1389, i32* %ans, align 4
    %load_temp1390 = load i32, i32* %ans, align 4
    store i32 %load_temp1390, i32* %ml, align 4
    %load_temp1391 = load i32, i32* %mr, align 4
    store i32 %load_temp1391, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1392 = load i32, i32* %y, align 4
    %icmp_sge_temp1393 = icmp sge i32 %load_temp1392, 15
    br i1 %icmp_sge_temp1393, label %if_then_100, label %if_else_100
if_then_100:
    %load_temp1394 = load i32, i32* %x, align 4
    %icmp_slt_temp1395 = icmp slt i32 %load_temp1394, 0
    br i1 %icmp_slt_temp1395, label %if_then_101, label %if_else_101
if_then_101:
    store i32 65535, i32* %ans, align 4
    br label %if_end_101
if_else_101:
    store i32 0, i32* %ans, align 4
    br label %if_end_101
if_end_101:
    br label %if_end_100
if_else_100:
    %load_temp1396 = load i32, i32* %y, align 4
    %icmp_sgt_temp1397 = icmp sgt i32 %load_temp1396, 0
    br i1 %icmp_sgt_temp1397, label %if_then_102, label %if_else_102
if_then_102:
    %load_temp1398 = load i32, i32* %x, align 4
    %icmp_sgt_temp1399 = icmp sgt i32 %load_temp1398, 32767
    br i1 %icmp_sgt_temp1399, label %if_then_103, label %if_else_103
if_then_103:
    %load_temp1400 = load i32, i32* %x, align 4
    %load_temp1401 = load i32, i32* %y, align 4
    %gep_temp1402 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1401
    %load_temp1403 = load i32, i32* %gep_temp1402, align 4
    %sdiv_temp1404 = sdiv i32 %load_temp1400, %load_temp1403
    store i32 %sdiv_temp1404, i32* %x, align 4
    %load_temp1405 = load i32, i32* %x, align 4
    %add_temp1406 = add i32 %load_temp1405, 65536
    %load_temp1407 = load i32, i32* %y, align 4
    %sub_temp1408 = sub i32 15, %load_temp1407
    %add_temp1409 = add i32 %sub_temp1408, 1
    %gep_temp1410 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1409
    %load_temp1411 = load i32, i32* %gep_temp1410, align 4
    %sub_temp1412 = sub i32 %add_temp1406, %load_temp1411
    store i32 %sub_temp1412, i32* %ans, align 4
    br label %if_end_103
if_else_103:
    %load_temp1413 = load i32, i32* %x, align 4
    %load_temp1414 = load i32, i32* %y, align 4
    %gep_temp1415 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1414
    %load_temp1416 = load i32, i32* %gep_temp1415, align 4
    %sdiv_temp1417 = sdiv i32 %load_temp1413, %load_temp1416
    store i32 %sdiv_temp1417, i32* %ans, align 4
    br label %if_end_103
if_end_103:
    br label %if_end_102
if_else_102:
    %load_temp1418 = load i32, i32* %x, align 4
    store i32 %load_temp1418, i32* %ans, align 4
    br label %if_end_102
if_end_102:
    br label %if_end_100
if_end_100:
    %load_temp1419 = load i32, i32* %ans, align 4
    store i32 %load_temp1419, i32* %mr, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1420 = load i32, i32* %mres, align 4
    store i32 %load_temp1420, i32* %ans, align 4
    %load_temp1421 = load i32, i32* %ans, align 4
    store i32 %load_temp1421, i32* %pres, align 4
    br label %if_end_85
if_end_85:
    %ml = alloca i32, align 4
    %load_temp1422 = load i32, i32* %pl, align 4
    store i32 %load_temp1422, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp1423 = load i32, i32* %pl, align 4
    store i32 %load_temp1423, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1424 = load i32, i32* %mr, align 4
    %icmp_ne_temp1425 = icmp ne i32 %load_temp1424, 0
    br i1 %icmp_ne_temp1425, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1426 = load i32, i32* %mr, align 4
    store i32 %load_temp1426, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1427 = load i32, i32* %i, align 4
    %icmp_slt_temp1428 = icmp slt i32 %load_temp1427, 16
    br i1 %icmp_slt_temp1428, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp1429 = load i32, i32* %x, align 4
    %srem_temp1430 = srem i32 %load_temp1429, 2
    %load_temp1431 = load i32, i32* %y, align 4
    %srem_temp1432 = srem i32 %load_temp1431, 2
    %icmp_ne_temp1433 = icmp ne i32 %srem_temp1430, 0
    %icmp_ne_temp1434 = icmp ne i32 %srem_temp1432, 0
    %zext_temp1435 = zext i1 %icmp_ne_temp1433 to i32
    %zext_temp1436 = zext i1 %icmp_ne_temp1434 to i32
    %mul_temp1437 = mul i32 %zext_temp1435, %zext_temp1436
    %icmp_ne_temp1438 = icmp ne i32 %mul_temp1437, 0
    br i1 %icmp_ne_temp1438, label %if_then_104, label %if_end_104
if_then_104:
    %load_temp1439 = load i32, i32* %ans, align 4
    %load_temp1440 = load i32, i32* %i, align 4
    %gep_temp1441 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1440
    %load_temp1442 = load i32, i32* %gep_temp1441, align 4
    %mul_temp1443 = mul i32 1, %load_temp1442
    %add_temp1444 = add i32 %load_temp1439, %mul_temp1443
    store i32 %add_temp1444, i32* %ans, align 4
    br label %if_end_104
if_end_104:
    %load_temp1445 = load i32, i32* %x, align 4
    %sdiv_temp1446 = sdiv i32 %load_temp1445, 2
    store i32 %sdiv_temp1446, i32* %x, align 4
    %load_temp1447 = load i32, i32* %y, align 4
    %sdiv_temp1448 = sdiv i32 %load_temp1447, 2
    store i32 %sdiv_temp1448, i32* %y, align 4
    %load_temp1449 = load i32, i32* %i, align 4
    %add_temp1450 = add i32 %load_temp1449, 1
    store i32 %add_temp1450, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1451 = load i32, i32* %ans, align 4
    %icmp_ne_temp1452 = icmp ne i32 %load_temp1451, 0
    br i1 %icmp_ne_temp1452, label %if_then_105, label %if_end_105
if_then_105:
    %al = alloca i32, align 4
    %load_temp1453 = load i32, i32* %mres, align 4
    store i32 %load_temp1453, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1454 = load i32, i32* %ml, align 4
    store i32 %load_temp1454, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1455 = load i32, i32* %c, align 4
    %icmp_ne_temp1456 = icmp ne i32 %load_temp1455, 0
    br i1 %icmp_ne_temp1456, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1457 = load i32, i32* %al, align 4
    store i32 %load_temp1457, i32* %x, align 4
    %load_temp1458 = load i32, i32* %c, align 4
    store i32 %load_temp1458, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1459 = load i32, i32* %i, align 4
    %icmp_slt_temp1460 = icmp slt i32 %load_temp1459, 16
    br i1 %icmp_slt_temp1460, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1461 = load i32, i32* %x, align 4
    %srem_temp1462 = srem i32 %load_temp1461, 2
    %icmp_ne_temp1463 = icmp ne i32 %srem_temp1462, 0
    br i1 %icmp_ne_temp1463, label %if_then_106, label %if_else_106
if_then_106:
    %load_temp1464 = load i32, i32* %y, align 4
    %srem_temp1465 = srem i32 %load_temp1464, 2
    %icmp_eq_temp1466 = icmp eq i32 %srem_temp1465, 0
    br i1 %icmp_eq_temp1466, label %if_then_107, label %if_end_107
if_then_107:
    %load_temp1467 = load i32, i32* %ans, align 4
    %load_temp1468 = load i32, i32* %i, align 4
    %gep_temp1469 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1468
    %load_temp1470 = load i32, i32* %gep_temp1469, align 4
    %mul_temp1471 = mul i32 1, %load_temp1470
    %add_temp1472 = add i32 %load_temp1467, %mul_temp1471
    store i32 %add_temp1472, i32* %ans, align 4
    br label %if_end_107
if_end_107:
    br label %if_end_106
if_else_106:
    %load_temp1473 = load i32, i32* %y, align 4
    %srem_temp1474 = srem i32 %load_temp1473, 2
    %icmp_ne_temp1475 = icmp ne i32 %srem_temp1474, 0
    br i1 %icmp_ne_temp1475, label %if_then_108, label %if_end_108
if_then_108:
    %load_temp1476 = load i32, i32* %ans, align 4
    %load_temp1477 = load i32, i32* %i, align 4
    %gep_temp1478 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1477
    %load_temp1479 = load i32, i32* %gep_temp1478, align 4
    %mul_temp1480 = mul i32 1, %load_temp1479
    %add_temp1481 = add i32 %load_temp1476, %mul_temp1480
    store i32 %add_temp1481, i32* %ans, align 4
    br label %if_end_108
if_end_108:
    br label %if_end_106
if_end_106:
    %load_temp1482 = load i32, i32* %x, align 4
    %sdiv_temp1483 = sdiv i32 %load_temp1482, 2
    store i32 %sdiv_temp1483, i32* %x, align 4
    %load_temp1484 = load i32, i32* %y, align 4
    %sdiv_temp1485 = sdiv i32 %load_temp1484, 2
    store i32 %sdiv_temp1485, i32* %y, align 4
    %load_temp1486 = load i32, i32* %i, align 4
    %add_temp1487 = add i32 %load_temp1486, 1
    store i32 %add_temp1487, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1488 = load i32, i32* %ans, align 4
    store i32 %load_temp1488, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1489 = load i32, i32* %al, align 4
    store i32 %load_temp1489, i32* %x, align 4
    %load_temp1490 = load i32, i32* %c, align 4
    store i32 %load_temp1490, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1491 = load i32, i32* %i, align 4
    %icmp_slt_temp1492 = icmp slt i32 %load_temp1491, 16
    br i1 %icmp_slt_temp1492, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1493 = load i32, i32* %x, align 4
    %srem_temp1494 = srem i32 %load_temp1493, 2
    %load_temp1495 = load i32, i32* %y, align 4
    %srem_temp1496 = srem i32 %load_temp1495, 2
    %icmp_ne_temp1497 = icmp ne i32 %srem_temp1494, 0
    %icmp_ne_temp1498 = icmp ne i32 %srem_temp1496, 0
    %zext_temp1499 = zext i1 %icmp_ne_temp1497 to i32
    %zext_temp1500 = zext i1 %icmp_ne_temp1498 to i32
    %mul_temp1501 = mul i32 %zext_temp1499, %zext_temp1500
    %icmp_ne_temp1502 = icmp ne i32 %mul_temp1501, 0
    br i1 %icmp_ne_temp1502, label %if_then_109, label %if_end_109
if_then_109:
    %load_temp1503 = load i32, i32* %ans, align 4
    %load_temp1504 = load i32, i32* %i, align 4
    %gep_temp1505 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1504
    %load_temp1506 = load i32, i32* %gep_temp1505, align 4
    %mul_temp1507 = mul i32 1, %load_temp1506
    %add_temp1508 = add i32 %load_temp1503, %mul_temp1507
    store i32 %add_temp1508, i32* %ans, align 4
    br label %if_end_109
if_end_109:
    %load_temp1509 = load i32, i32* %x, align 4
    %sdiv_temp1510 = sdiv i32 %load_temp1509, 2
    store i32 %sdiv_temp1510, i32* %x, align 4
    %load_temp1511 = load i32, i32* %y, align 4
    %sdiv_temp1512 = sdiv i32 %load_temp1511, 2
    store i32 %sdiv_temp1512, i32* %y, align 4
    %load_temp1513 = load i32, i32* %i, align 4
    %add_temp1514 = add i32 %load_temp1513, 1
    store i32 %add_temp1514, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1515 = load i32, i32* %ans, align 4
    store i32 %load_temp1515, i32* %c, align 4
    %icmp_sgt_temp1516 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1516, label %if_then_110, label %if_else_110
if_then_110:
    store i32 0, i32* %ans, align 4
    br label %if_end_110
if_else_110:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1517 = load i32, i32* %c, align 4
    %gep_temp1518 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1519 = load i32, i32* %gep_temp1518, align 4
    %mul_temp1520 = mul i32 %load_temp1517, %load_temp1519
    store i32 %mul_temp1520, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1521 = load i32, i32* %i, align 4
    %icmp_slt_temp1522 = icmp slt i32 %load_temp1521, 16
    br i1 %icmp_slt_temp1522, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1523 = load i32, i32* %x, align 4
    %srem_temp1524 = srem i32 %load_temp1523, 2
    %load_temp1525 = load i32, i32* %y, align 4
    %srem_temp1526 = srem i32 %load_temp1525, 2
    %icmp_ne_temp1527 = icmp ne i32 %srem_temp1524, 0
    %icmp_ne_temp1528 = icmp ne i32 %srem_temp1526, 0
    %zext_temp1529 = zext i1 %icmp_ne_temp1527 to i32
    %zext_temp1530 = zext i1 %icmp_ne_temp1528 to i32
    %mul_temp1531 = mul i32 %zext_temp1529, %zext_temp1530
    %icmp_ne_temp1532 = icmp ne i32 %mul_temp1531, 0
    br i1 %icmp_ne_temp1532, label %if_then_111, label %if_end_111
if_then_111:
    %load_temp1533 = load i32, i32* %ans, align 4
    %load_temp1534 = load i32, i32* %i, align 4
    %gep_temp1535 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1534
    %load_temp1536 = load i32, i32* %gep_temp1535, align 4
    %mul_temp1537 = mul i32 1, %load_temp1536
    %add_temp1538 = add i32 %load_temp1533, %mul_temp1537
    store i32 %add_temp1538, i32* %ans, align 4
    br label %if_end_111
if_end_111:
    %load_temp1539 = load i32, i32* %x, align 4
    %sdiv_temp1540 = sdiv i32 %load_temp1539, 2
    store i32 %sdiv_temp1540, i32* %x, align 4
    %load_temp1541 = load i32, i32* %y, align 4
    %sdiv_temp1542 = sdiv i32 %load_temp1541, 2
    store i32 %sdiv_temp1542, i32* %y, align 4
    %load_temp1543 = load i32, i32* %i, align 4
    %add_temp1544 = add i32 %load_temp1543, 1
    store i32 %add_temp1544, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_110
if_end_110:
    %load_temp1545 = load i32, i32* %ans, align 4
    store i32 %load_temp1545, i32* %c, align 4
    %load_temp1546 = load i32, i32* %sum, align 4
    store i32 %load_temp1546, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1547 = load i32, i32* %al, align 4
    store i32 %load_temp1547, i32* %ans, align 4
    %load_temp1548 = load i32, i32* %ans, align 4
    store i32 %load_temp1548, i32* %mres, align 4
    br label %if_end_105
if_end_105:
    %al = alloca i32, align 4
    %load_temp1549 = load i32, i32* %ml, align 4
    store i32 %load_temp1549, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1550 = load i32, i32* %ml, align 4
    store i32 %load_temp1550, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1551 = load i32, i32* %c, align 4
    %icmp_ne_temp1552 = icmp ne i32 %load_temp1551, 0
    br i1 %icmp_ne_temp1552, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1553 = load i32, i32* %al, align 4
    store i32 %load_temp1553, i32* %x, align 4
    %load_temp1554 = load i32, i32* %c, align 4
    store i32 %load_temp1554, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1555 = load i32, i32* %i, align 4
    %icmp_slt_temp1556 = icmp slt i32 %load_temp1555, 16
    br i1 %icmp_slt_temp1556, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1557 = load i32, i32* %x, align 4
    %srem_temp1558 = srem i32 %load_temp1557, 2
    %icmp_ne_temp1559 = icmp ne i32 %srem_temp1558, 0
    br i1 %icmp_ne_temp1559, label %if_then_112, label %if_else_112
if_then_112:
    %load_temp1560 = load i32, i32* %y, align 4
    %srem_temp1561 = srem i32 %load_temp1560, 2
    %icmp_eq_temp1562 = icmp eq i32 %srem_temp1561, 0
    br i1 %icmp_eq_temp1562, label %if_then_113, label %if_end_113
if_then_113:
    %load_temp1563 = load i32, i32* %ans, align 4
    %load_temp1564 = load i32, i32* %i, align 4
    %gep_temp1565 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1564
    %load_temp1566 = load i32, i32* %gep_temp1565, align 4
    %mul_temp1567 = mul i32 1, %load_temp1566
    %add_temp1568 = add i32 %load_temp1563, %mul_temp1567
    store i32 %add_temp1568, i32* %ans, align 4
    br label %if_end_113
if_end_113:
    br label %if_end_112
if_else_112:
    %load_temp1569 = load i32, i32* %y, align 4
    %srem_temp1570 = srem i32 %load_temp1569, 2
    %icmp_ne_temp1571 = icmp ne i32 %srem_temp1570, 0
    br i1 %icmp_ne_temp1571, label %if_then_114, label %if_end_114
if_then_114:
    %load_temp1572 = load i32, i32* %ans, align 4
    %load_temp1573 = load i32, i32* %i, align 4
    %gep_temp1574 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1573
    %load_temp1575 = load i32, i32* %gep_temp1574, align 4
    %mul_temp1576 = mul i32 1, %load_temp1575
    %add_temp1577 = add i32 %load_temp1572, %mul_temp1576
    store i32 %add_temp1577, i32* %ans, align 4
    br label %if_end_114
if_end_114:
    br label %if_end_112
if_end_112:
    %load_temp1578 = load i32, i32* %x, align 4
    %sdiv_temp1579 = sdiv i32 %load_temp1578, 2
    store i32 %sdiv_temp1579, i32* %x, align 4
    %load_temp1580 = load i32, i32* %y, align 4
    %sdiv_temp1581 = sdiv i32 %load_temp1580, 2
    store i32 %sdiv_temp1581, i32* %y, align 4
    %load_temp1582 = load i32, i32* %i, align 4
    %add_temp1583 = add i32 %load_temp1582, 1
    store i32 %add_temp1583, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1584 = load i32, i32* %ans, align 4
    store i32 %load_temp1584, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1585 = load i32, i32* %al, align 4
    store i32 %load_temp1585, i32* %x, align 4
    %load_temp1586 = load i32, i32* %c, align 4
    store i32 %load_temp1586, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1587 = load i32, i32* %i, align 4
    %icmp_slt_temp1588 = icmp slt i32 %load_temp1587, 16
    br i1 %icmp_slt_temp1588, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1589 = load i32, i32* %x, align 4
    %srem_temp1590 = srem i32 %load_temp1589, 2
    %load_temp1591 = load i32, i32* %y, align 4
    %srem_temp1592 = srem i32 %load_temp1591, 2
    %icmp_ne_temp1593 = icmp ne i32 %srem_temp1590, 0
    %icmp_ne_temp1594 = icmp ne i32 %srem_temp1592, 0
    %zext_temp1595 = zext i1 %icmp_ne_temp1593 to i32
    %zext_temp1596 = zext i1 %icmp_ne_temp1594 to i32
    %mul_temp1597 = mul i32 %zext_temp1595, %zext_temp1596
    %icmp_ne_temp1598 = icmp ne i32 %mul_temp1597, 0
    br i1 %icmp_ne_temp1598, label %if_then_115, label %if_end_115
if_then_115:
    %load_temp1599 = load i32, i32* %ans, align 4
    %load_temp1600 = load i32, i32* %i, align 4
    %gep_temp1601 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1600
    %load_temp1602 = load i32, i32* %gep_temp1601, align 4
    %mul_temp1603 = mul i32 1, %load_temp1602
    %add_temp1604 = add i32 %load_temp1599, %mul_temp1603
    store i32 %add_temp1604, i32* %ans, align 4
    br label %if_end_115
if_end_115:
    %load_temp1605 = load i32, i32* %x, align 4
    %sdiv_temp1606 = sdiv i32 %load_temp1605, 2
    store i32 %sdiv_temp1606, i32* %x, align 4
    %load_temp1607 = load i32, i32* %y, align 4
    %sdiv_temp1608 = sdiv i32 %load_temp1607, 2
    store i32 %sdiv_temp1608, i32* %y, align 4
    %load_temp1609 = load i32, i32* %i, align 4
    %add_temp1610 = add i32 %load_temp1609, 1
    store i32 %add_temp1610, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1611 = load i32, i32* %ans, align 4
    store i32 %load_temp1611, i32* %c, align 4
    %icmp_sgt_temp1612 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1612, label %if_then_116, label %if_else_116
if_then_116:
    store i32 0, i32* %ans, align 4
    br label %if_end_116
if_else_116:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1613 = load i32, i32* %c, align 4
    %gep_temp1614 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1615 = load i32, i32* %gep_temp1614, align 4
    %mul_temp1616 = mul i32 %load_temp1613, %load_temp1615
    store i32 %mul_temp1616, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1617 = load i32, i32* %i, align 4
    %icmp_slt_temp1618 = icmp slt i32 %load_temp1617, 16
    br i1 %icmp_slt_temp1618, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1619 = load i32, i32* %x, align 4
    %srem_temp1620 = srem i32 %load_temp1619, 2
    %load_temp1621 = load i32, i32* %y, align 4
    %srem_temp1622 = srem i32 %load_temp1621, 2
    %icmp_ne_temp1623 = icmp ne i32 %srem_temp1620, 0
    %icmp_ne_temp1624 = icmp ne i32 %srem_temp1622, 0
    %zext_temp1625 = zext i1 %icmp_ne_temp1623 to i32
    %zext_temp1626 = zext i1 %icmp_ne_temp1624 to i32
    %mul_temp1627 = mul i32 %zext_temp1625, %zext_temp1626
    %icmp_ne_temp1628 = icmp ne i32 %mul_temp1627, 0
    br i1 %icmp_ne_temp1628, label %if_then_117, label %if_end_117
if_then_117:
    %load_temp1629 = load i32, i32* %ans, align 4
    %load_temp1630 = load i32, i32* %i, align 4
    %gep_temp1631 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1630
    %load_temp1632 = load i32, i32* %gep_temp1631, align 4
    %mul_temp1633 = mul i32 1, %load_temp1632
    %add_temp1634 = add i32 %load_temp1629, %mul_temp1633
    store i32 %add_temp1634, i32* %ans, align 4
    br label %if_end_117
if_end_117:
    %load_temp1635 = load i32, i32* %x, align 4
    %sdiv_temp1636 = sdiv i32 %load_temp1635, 2
    store i32 %sdiv_temp1636, i32* %x, align 4
    %load_temp1637 = load i32, i32* %y, align 4
    %sdiv_temp1638 = sdiv i32 %load_temp1637, 2
    store i32 %sdiv_temp1638, i32* %y, align 4
    %load_temp1639 = load i32, i32* %i, align 4
    %add_temp1640 = add i32 %load_temp1639, 1
    store i32 %add_temp1640, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_116
if_end_116:
    %load_temp1641 = load i32, i32* %ans, align 4
    store i32 %load_temp1641, i32* %c, align 4
    %load_temp1642 = load i32, i32* %sum, align 4
    store i32 %load_temp1642, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1643 = load i32, i32* %al, align 4
    store i32 %load_temp1643, i32* %ans, align 4
    %load_temp1644 = load i32, i32* %ans, align 4
    store i32 %load_temp1644, i32* %ml, align 4
    %load_temp1645 = load i32, i32* %mr, align 4
    store i32 %load_temp1645, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1646 = load i32, i32* %y, align 4
    %icmp_sge_temp1647 = icmp sge i32 %load_temp1646, 15
    br i1 %icmp_sge_temp1647, label %if_then_118, label %if_else_118
if_then_118:
    %load_temp1648 = load i32, i32* %x, align 4
    %icmp_slt_temp1649 = icmp slt i32 %load_temp1648, 0
    br i1 %icmp_slt_temp1649, label %if_then_119, label %if_else_119
if_then_119:
    store i32 65535, i32* %ans, align 4
    br label %if_end_119
if_else_119:
    store i32 0, i32* %ans, align 4
    br label %if_end_119
if_end_119:
    br label %if_end_118
if_else_118:
    %load_temp1650 = load i32, i32* %y, align 4
    %icmp_sgt_temp1651 = icmp sgt i32 %load_temp1650, 0
    br i1 %icmp_sgt_temp1651, label %if_then_120, label %if_else_120
if_then_120:
    %load_temp1652 = load i32, i32* %x, align 4
    %icmp_sgt_temp1653 = icmp sgt i32 %load_temp1652, 32767
    br i1 %icmp_sgt_temp1653, label %if_then_121, label %if_else_121
if_then_121:
    %load_temp1654 = load i32, i32* %x, align 4
    %load_temp1655 = load i32, i32* %y, align 4
    %gep_temp1656 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1655
    %load_temp1657 = load i32, i32* %gep_temp1656, align 4
    %sdiv_temp1658 = sdiv i32 %load_temp1654, %load_temp1657
    store i32 %sdiv_temp1658, i32* %x, align 4
    %load_temp1659 = load i32, i32* %x, align 4
    %add_temp1660 = add i32 %load_temp1659, 65536
    %load_temp1661 = load i32, i32* %y, align 4
    %sub_temp1662 = sub i32 15, %load_temp1661
    %add_temp1663 = add i32 %sub_temp1662, 1
    %gep_temp1664 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1663
    %load_temp1665 = load i32, i32* %gep_temp1664, align 4
    %sub_temp1666 = sub i32 %add_temp1660, %load_temp1665
    store i32 %sub_temp1666, i32* %ans, align 4
    br label %if_end_121
if_else_121:
    %load_temp1667 = load i32, i32* %x, align 4
    %load_temp1668 = load i32, i32* %y, align 4
    %gep_temp1669 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1668
    %load_temp1670 = load i32, i32* %gep_temp1669, align 4
    %sdiv_temp1671 = sdiv i32 %load_temp1667, %load_temp1670
    store i32 %sdiv_temp1671, i32* %ans, align 4
    br label %if_end_121
if_end_121:
    br label %if_end_120
if_else_120:
    %load_temp1672 = load i32, i32* %x, align 4
    store i32 %load_temp1672, i32* %ans, align 4
    br label %if_end_120
if_end_120:
    br label %if_end_118
if_end_118:
    %load_temp1673 = load i32, i32* %ans, align 4
    store i32 %load_temp1673, i32* %mr, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1674 = load i32, i32* %mres, align 4
    store i32 %load_temp1674, i32* %ans, align 4
    %load_temp1675 = load i32, i32* %ans, align 4
    store i32 %load_temp1675, i32* %pl, align 4
    %load_temp1676 = load i32, i32* %pr, align 4
    store i32 %load_temp1676, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1677 = load i32, i32* %y, align 4
    %icmp_sge_temp1678 = icmp sge i32 %load_temp1677, 15
    br i1 %icmp_sge_temp1678, label %if_then_122, label %if_else_122
if_then_122:
    %load_temp1679 = load i32, i32* %x, align 4
    %icmp_slt_temp1680 = icmp slt i32 %load_temp1679, 0
    br i1 %icmp_slt_temp1680, label %if_then_123, label %if_else_123
if_then_123:
    store i32 65535, i32* %ans, align 4
    br label %if_end_123
if_else_123:
    store i32 0, i32* %ans, align 4
    br label %if_end_123
if_end_123:
    br label %if_end_122
if_else_122:
    %load_temp1681 = load i32, i32* %y, align 4
    %icmp_sgt_temp1682 = icmp sgt i32 %load_temp1681, 0
    br i1 %icmp_sgt_temp1682, label %if_then_124, label %if_else_124
if_then_124:
    %load_temp1683 = load i32, i32* %x, align 4
    %icmp_sgt_temp1684 = icmp sgt i32 %load_temp1683, 32767
    br i1 %icmp_sgt_temp1684, label %if_then_125, label %if_else_125
if_then_125:
    %load_temp1685 = load i32, i32* %x, align 4
    %load_temp1686 = load i32, i32* %y, align 4
    %gep_temp1687 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1686
    %load_temp1688 = load i32, i32* %gep_temp1687, align 4
    %sdiv_temp1689 = sdiv i32 %load_temp1685, %load_temp1688
    store i32 %sdiv_temp1689, i32* %x, align 4
    %load_temp1690 = load i32, i32* %x, align 4
    %add_temp1691 = add i32 %load_temp1690, 65536
    %load_temp1692 = load i32, i32* %y, align 4
    %sub_temp1693 = sub i32 15, %load_temp1692
    %add_temp1694 = add i32 %sub_temp1693, 1
    %gep_temp1695 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1694
    %load_temp1696 = load i32, i32* %gep_temp1695, align 4
    %sub_temp1697 = sub i32 %add_temp1691, %load_temp1696
    store i32 %sub_temp1697, i32* %ans, align 4
    br label %if_end_125
if_else_125:
    %load_temp1698 = load i32, i32* %x, align 4
    %load_temp1699 = load i32, i32* %y, align 4
    %gep_temp1700 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1699
    %load_temp1701 = load i32, i32* %gep_temp1700, align 4
    %sdiv_temp1702 = sdiv i32 %load_temp1698, %load_temp1701
    store i32 %sdiv_temp1702, i32* %ans, align 4
    br label %if_end_125
if_end_125:
    br label %if_end_124
if_else_124:
    %load_temp1703 = load i32, i32* %x, align 4
    store i32 %load_temp1703, i32* %ans, align 4
    br label %if_end_124
if_end_124:
    br label %if_end_122
if_end_122:
    %load_temp1704 = load i32, i32* %ans, align 4
    store i32 %load_temp1704, i32* %pr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp1705 = load i32, i32* %pres, align 4
    store i32 %load_temp1705, i32* %ans, align 4
    %load_temp1706 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp1706)
    call void @putch(i32 10)
    %load_temp1707 = load i32, i32* %cur, align 4
    %add_temp1708 = add i32 %load_temp1707, 1
    store i32 %add_temp1708, i32* %cur, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %cur, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp1709 = load i32, i32* %cur, align 4
    %icmp_slt_temp1710 = icmp slt i32 %load_temp1709, 16
    br i1 %icmp_slt_temp1710, label %while_body_0, label %while_end_0
while_body_0:
    %pl = alloca i32, align 4
    store i32 2, i32* %pl, align 4
    %pr = alloca i32, align 4
    %load_temp1711 = load i32, i32* %cur, align 4
    store i32 %load_temp1711, i32* %pr, align 4
    %pres = alloca i32, align 4
    store i32 1, i32* %pres, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp1712 = load i32, i32* %pr, align 4
    %icmp_sgt_temp1713 = icmp sgt i32 %load_temp1712, 0
    br i1 %icmp_sgt_temp1713, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1714 = load i32, i32* %pr, align 4
    store i32 %load_temp1714, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1715 = load i32, i32* %i, align 4
    %icmp_slt_temp1716 = icmp slt i32 %load_temp1715, 16
    br i1 %icmp_slt_temp1716, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp1717 = load i32, i32* %x, align 4
    %srem_temp1718 = srem i32 %load_temp1717, 2
    %load_temp1719 = load i32, i32* %y, align 4
    %srem_temp1720 = srem i32 %load_temp1719, 2
    %icmp_ne_temp1721 = icmp ne i32 %srem_temp1718, 0
    %icmp_ne_temp1722 = icmp ne i32 %srem_temp1720, 0
    %zext_temp1723 = zext i1 %icmp_ne_temp1721 to i32
    %zext_temp1724 = zext i1 %icmp_ne_temp1722 to i32
    %mul_temp1725 = mul i32 %zext_temp1723, %zext_temp1724
    %icmp_ne_temp1726 = icmp ne i32 %mul_temp1725, 0
    br i1 %icmp_ne_temp1726, label %if_then_126, label %if_end_126
if_then_126:
    %load_temp1727 = load i32, i32* %ans, align 4
    %load_temp1728 = load i32, i32* %i, align 4
    %gep_temp1729 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1728
    %load_temp1730 = load i32, i32* %gep_temp1729, align 4
    %mul_temp1731 = mul i32 1, %load_temp1730
    %add_temp1732 = add i32 %load_temp1727, %mul_temp1731
    store i32 %add_temp1732, i32* %ans, align 4
    br label %if_end_126
if_end_126:
    %load_temp1733 = load i32, i32* %x, align 4
    %sdiv_temp1734 = sdiv i32 %load_temp1733, 2
    store i32 %sdiv_temp1734, i32* %x, align 4
    %load_temp1735 = load i32, i32* %y, align 4
    %sdiv_temp1736 = sdiv i32 %load_temp1735, 2
    store i32 %sdiv_temp1736, i32* %y, align 4
    %load_temp1737 = load i32, i32* %i, align 4
    %add_temp1738 = add i32 %load_temp1737, 1
    store i32 %add_temp1738, i32* %i, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1739 = load i32, i32* %ans, align 4
    %icmp_ne_temp1740 = icmp ne i32 %load_temp1739, 0
    br i1 %icmp_ne_temp1740, label %if_then_127, label %if_end_127
if_then_127:
    %ml = alloca i32, align 4
    %load_temp1741 = load i32, i32* %pres, align 4
    store i32 %load_temp1741, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp1742 = load i32, i32* %pl, align 4
    store i32 %load_temp1742, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1743 = load i32, i32* %mr, align 4
    %icmp_ne_temp1744 = icmp ne i32 %load_temp1743, 0
    br i1 %icmp_ne_temp1744, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1745 = load i32, i32* %mr, align 4
    store i32 %load_temp1745, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1746 = load i32, i32* %i, align 4
    %icmp_slt_temp1747 = icmp slt i32 %load_temp1746, 16
    br i1 %icmp_slt_temp1747, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp1748 = load i32, i32* %x, align 4
    %srem_temp1749 = srem i32 %load_temp1748, 2
    %load_temp1750 = load i32, i32* %y, align 4
    %srem_temp1751 = srem i32 %load_temp1750, 2
    %icmp_ne_temp1752 = icmp ne i32 %srem_temp1749, 0
    %icmp_ne_temp1753 = icmp ne i32 %srem_temp1751, 0
    %zext_temp1754 = zext i1 %icmp_ne_temp1752 to i32
    %zext_temp1755 = zext i1 %icmp_ne_temp1753 to i32
    %mul_temp1756 = mul i32 %zext_temp1754, %zext_temp1755
    %icmp_ne_temp1757 = icmp ne i32 %mul_temp1756, 0
    br i1 %icmp_ne_temp1757, label %if_then_128, label %if_end_128
if_then_128:
    %load_temp1758 = load i32, i32* %ans, align 4
    %load_temp1759 = load i32, i32* %i, align 4
    %gep_temp1760 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1759
    %load_temp1761 = load i32, i32* %gep_temp1760, align 4
    %mul_temp1762 = mul i32 1, %load_temp1761
    %add_temp1763 = add i32 %load_temp1758, %mul_temp1762
    store i32 %add_temp1763, i32* %ans, align 4
    br label %if_end_128
if_end_128:
    %load_temp1764 = load i32, i32* %x, align 4
    %sdiv_temp1765 = sdiv i32 %load_temp1764, 2
    store i32 %sdiv_temp1765, i32* %x, align 4
    %load_temp1766 = load i32, i32* %y, align 4
    %sdiv_temp1767 = sdiv i32 %load_temp1766, 2
    store i32 %sdiv_temp1767, i32* %y, align 4
    %load_temp1768 = load i32, i32* %i, align 4
    %add_temp1769 = add i32 %load_temp1768, 1
    store i32 %add_temp1769, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1770 = load i32, i32* %ans, align 4
    %icmp_ne_temp1771 = icmp ne i32 %load_temp1770, 0
    br i1 %icmp_ne_temp1771, label %if_then_129, label %if_end_129
if_then_129:
    %al = alloca i32, align 4
    %load_temp1772 = load i32, i32* %mres, align 4
    store i32 %load_temp1772, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1773 = load i32, i32* %ml, align 4
    store i32 %load_temp1773, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1774 = load i32, i32* %c, align 4
    %icmp_ne_temp1775 = icmp ne i32 %load_temp1774, 0
    br i1 %icmp_ne_temp1775, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1776 = load i32, i32* %al, align 4
    store i32 %load_temp1776, i32* %x, align 4
    %load_temp1777 = load i32, i32* %c, align 4
    store i32 %load_temp1777, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1778 = load i32, i32* %i, align 4
    %icmp_slt_temp1779 = icmp slt i32 %load_temp1778, 16
    br i1 %icmp_slt_temp1779, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1780 = load i32, i32* %x, align 4
    %srem_temp1781 = srem i32 %load_temp1780, 2
    %icmp_ne_temp1782 = icmp ne i32 %srem_temp1781, 0
    br i1 %icmp_ne_temp1782, label %if_then_130, label %if_else_130
if_then_130:
    %load_temp1783 = load i32, i32* %y, align 4
    %srem_temp1784 = srem i32 %load_temp1783, 2
    %icmp_eq_temp1785 = icmp eq i32 %srem_temp1784, 0
    br i1 %icmp_eq_temp1785, label %if_then_131, label %if_end_131
if_then_131:
    %load_temp1786 = load i32, i32* %ans, align 4
    %load_temp1787 = load i32, i32* %i, align 4
    %gep_temp1788 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1787
    %load_temp1789 = load i32, i32* %gep_temp1788, align 4
    %mul_temp1790 = mul i32 1, %load_temp1789
    %add_temp1791 = add i32 %load_temp1786, %mul_temp1790
    store i32 %add_temp1791, i32* %ans, align 4
    br label %if_end_131
if_end_131:
    br label %if_end_130
if_else_130:
    %load_temp1792 = load i32, i32* %y, align 4
    %srem_temp1793 = srem i32 %load_temp1792, 2
    %icmp_ne_temp1794 = icmp ne i32 %srem_temp1793, 0
    br i1 %icmp_ne_temp1794, label %if_then_132, label %if_end_132
if_then_132:
    %load_temp1795 = load i32, i32* %ans, align 4
    %load_temp1796 = load i32, i32* %i, align 4
    %gep_temp1797 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1796
    %load_temp1798 = load i32, i32* %gep_temp1797, align 4
    %mul_temp1799 = mul i32 1, %load_temp1798
    %add_temp1800 = add i32 %load_temp1795, %mul_temp1799
    store i32 %add_temp1800, i32* %ans, align 4
    br label %if_end_132
if_end_132:
    br label %if_end_130
if_end_130:
    %load_temp1801 = load i32, i32* %x, align 4
    %sdiv_temp1802 = sdiv i32 %load_temp1801, 2
    store i32 %sdiv_temp1802, i32* %x, align 4
    %load_temp1803 = load i32, i32* %y, align 4
    %sdiv_temp1804 = sdiv i32 %load_temp1803, 2
    store i32 %sdiv_temp1804, i32* %y, align 4
    %load_temp1805 = load i32, i32* %i, align 4
    %add_temp1806 = add i32 %load_temp1805, 1
    store i32 %add_temp1806, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1807 = load i32, i32* %ans, align 4
    store i32 %load_temp1807, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1808 = load i32, i32* %al, align 4
    store i32 %load_temp1808, i32* %x, align 4
    %load_temp1809 = load i32, i32* %c, align 4
    store i32 %load_temp1809, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1810 = load i32, i32* %i, align 4
    %icmp_slt_temp1811 = icmp slt i32 %load_temp1810, 16
    br i1 %icmp_slt_temp1811, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1812 = load i32, i32* %x, align 4
    %srem_temp1813 = srem i32 %load_temp1812, 2
    %load_temp1814 = load i32, i32* %y, align 4
    %srem_temp1815 = srem i32 %load_temp1814, 2
    %icmp_ne_temp1816 = icmp ne i32 %srem_temp1813, 0
    %icmp_ne_temp1817 = icmp ne i32 %srem_temp1815, 0
    %zext_temp1818 = zext i1 %icmp_ne_temp1816 to i32
    %zext_temp1819 = zext i1 %icmp_ne_temp1817 to i32
    %mul_temp1820 = mul i32 %zext_temp1818, %zext_temp1819
    %icmp_ne_temp1821 = icmp ne i32 %mul_temp1820, 0
    br i1 %icmp_ne_temp1821, label %if_then_133, label %if_end_133
if_then_133:
    %load_temp1822 = load i32, i32* %ans, align 4
    %load_temp1823 = load i32, i32* %i, align 4
    %gep_temp1824 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1823
    %load_temp1825 = load i32, i32* %gep_temp1824, align 4
    %mul_temp1826 = mul i32 1, %load_temp1825
    %add_temp1827 = add i32 %load_temp1822, %mul_temp1826
    store i32 %add_temp1827, i32* %ans, align 4
    br label %if_end_133
if_end_133:
    %load_temp1828 = load i32, i32* %x, align 4
    %sdiv_temp1829 = sdiv i32 %load_temp1828, 2
    store i32 %sdiv_temp1829, i32* %x, align 4
    %load_temp1830 = load i32, i32* %y, align 4
    %sdiv_temp1831 = sdiv i32 %load_temp1830, 2
    store i32 %sdiv_temp1831, i32* %y, align 4
    %load_temp1832 = load i32, i32* %i, align 4
    %add_temp1833 = add i32 %load_temp1832, 1
    store i32 %add_temp1833, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1834 = load i32, i32* %ans, align 4
    store i32 %load_temp1834, i32* %c, align 4
    %icmp_sgt_temp1835 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1835, label %if_then_134, label %if_else_134
if_then_134:
    store i32 0, i32* %ans, align 4
    br label %if_end_134
if_else_134:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1836 = load i32, i32* %c, align 4
    %gep_temp1837 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1838 = load i32, i32* %gep_temp1837, align 4
    %mul_temp1839 = mul i32 %load_temp1836, %load_temp1838
    store i32 %mul_temp1839, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1840 = load i32, i32* %i, align 4
    %icmp_slt_temp1841 = icmp slt i32 %load_temp1840, 16
    br i1 %icmp_slt_temp1841, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1842 = load i32, i32* %x, align 4
    %srem_temp1843 = srem i32 %load_temp1842, 2
    %load_temp1844 = load i32, i32* %y, align 4
    %srem_temp1845 = srem i32 %load_temp1844, 2
    %icmp_ne_temp1846 = icmp ne i32 %srem_temp1843, 0
    %icmp_ne_temp1847 = icmp ne i32 %srem_temp1845, 0
    %zext_temp1848 = zext i1 %icmp_ne_temp1846 to i32
    %zext_temp1849 = zext i1 %icmp_ne_temp1847 to i32
    %mul_temp1850 = mul i32 %zext_temp1848, %zext_temp1849
    %icmp_ne_temp1851 = icmp ne i32 %mul_temp1850, 0
    br i1 %icmp_ne_temp1851, label %if_then_135, label %if_end_135
if_then_135:
    %load_temp1852 = load i32, i32* %ans, align 4
    %load_temp1853 = load i32, i32* %i, align 4
    %gep_temp1854 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1853
    %load_temp1855 = load i32, i32* %gep_temp1854, align 4
    %mul_temp1856 = mul i32 1, %load_temp1855
    %add_temp1857 = add i32 %load_temp1852, %mul_temp1856
    store i32 %add_temp1857, i32* %ans, align 4
    br label %if_end_135
if_end_135:
    %load_temp1858 = load i32, i32* %x, align 4
    %sdiv_temp1859 = sdiv i32 %load_temp1858, 2
    store i32 %sdiv_temp1859, i32* %x, align 4
    %load_temp1860 = load i32, i32* %y, align 4
    %sdiv_temp1861 = sdiv i32 %load_temp1860, 2
    store i32 %sdiv_temp1861, i32* %y, align 4
    %load_temp1862 = load i32, i32* %i, align 4
    %add_temp1863 = add i32 %load_temp1862, 1
    store i32 %add_temp1863, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_134
if_end_134:
    %load_temp1864 = load i32, i32* %ans, align 4
    store i32 %load_temp1864, i32* %c, align 4
    %load_temp1865 = load i32, i32* %sum, align 4
    store i32 %load_temp1865, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1866 = load i32, i32* %al, align 4
    store i32 %load_temp1866, i32* %ans, align 4
    %load_temp1867 = load i32, i32* %ans, align 4
    store i32 %load_temp1867, i32* %mres, align 4
    br label %if_end_129
if_end_129:
    %al = alloca i32, align 4
    %load_temp1868 = load i32, i32* %ml, align 4
    store i32 %load_temp1868, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp1869 = load i32, i32* %ml, align 4
    store i32 %load_temp1869, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp1870 = load i32, i32* %c, align 4
    %icmp_ne_temp1871 = icmp ne i32 %load_temp1870, 0
    br i1 %icmp_ne_temp1871, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1872 = load i32, i32* %al, align 4
    store i32 %load_temp1872, i32* %x, align 4
    %load_temp1873 = load i32, i32* %c, align 4
    store i32 %load_temp1873, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1874 = load i32, i32* %i, align 4
    %icmp_slt_temp1875 = icmp slt i32 %load_temp1874, 16
    br i1 %icmp_slt_temp1875, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1876 = load i32, i32* %x, align 4
    %srem_temp1877 = srem i32 %load_temp1876, 2
    %icmp_ne_temp1878 = icmp ne i32 %srem_temp1877, 0
    br i1 %icmp_ne_temp1878, label %if_then_136, label %if_else_136
if_then_136:
    %load_temp1879 = load i32, i32* %y, align 4
    %srem_temp1880 = srem i32 %load_temp1879, 2
    %icmp_eq_temp1881 = icmp eq i32 %srem_temp1880, 0
    br i1 %icmp_eq_temp1881, label %if_then_137, label %if_end_137
if_then_137:
    %load_temp1882 = load i32, i32* %ans, align 4
    %load_temp1883 = load i32, i32* %i, align 4
    %gep_temp1884 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1883
    %load_temp1885 = load i32, i32* %gep_temp1884, align 4
    %mul_temp1886 = mul i32 1, %load_temp1885
    %add_temp1887 = add i32 %load_temp1882, %mul_temp1886
    store i32 %add_temp1887, i32* %ans, align 4
    br label %if_end_137
if_end_137:
    br label %if_end_136
if_else_136:
    %load_temp1888 = load i32, i32* %y, align 4
    %srem_temp1889 = srem i32 %load_temp1888, 2
    %icmp_ne_temp1890 = icmp ne i32 %srem_temp1889, 0
    br i1 %icmp_ne_temp1890, label %if_then_138, label %if_end_138
if_then_138:
    %load_temp1891 = load i32, i32* %ans, align 4
    %load_temp1892 = load i32, i32* %i, align 4
    %gep_temp1893 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1892
    %load_temp1894 = load i32, i32* %gep_temp1893, align 4
    %mul_temp1895 = mul i32 1, %load_temp1894
    %add_temp1896 = add i32 %load_temp1891, %mul_temp1895
    store i32 %add_temp1896, i32* %ans, align 4
    br label %if_end_138
if_end_138:
    br label %if_end_136
if_end_136:
    %load_temp1897 = load i32, i32* %x, align 4
    %sdiv_temp1898 = sdiv i32 %load_temp1897, 2
    store i32 %sdiv_temp1898, i32* %x, align 4
    %load_temp1899 = load i32, i32* %y, align 4
    %sdiv_temp1900 = sdiv i32 %load_temp1899, 2
    store i32 %sdiv_temp1900, i32* %y, align 4
    %load_temp1901 = load i32, i32* %i, align 4
    %add_temp1902 = add i32 %load_temp1901, 1
    store i32 %add_temp1902, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1903 = load i32, i32* %ans, align 4
    store i32 %load_temp1903, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1904 = load i32, i32* %al, align 4
    store i32 %load_temp1904, i32* %x, align 4
    %load_temp1905 = load i32, i32* %c, align 4
    store i32 %load_temp1905, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1906 = load i32, i32* %i, align 4
    %icmp_slt_temp1907 = icmp slt i32 %load_temp1906, 16
    br i1 %icmp_slt_temp1907, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1908 = load i32, i32* %x, align 4
    %srem_temp1909 = srem i32 %load_temp1908, 2
    %load_temp1910 = load i32, i32* %y, align 4
    %srem_temp1911 = srem i32 %load_temp1910, 2
    %icmp_ne_temp1912 = icmp ne i32 %srem_temp1909, 0
    %icmp_ne_temp1913 = icmp ne i32 %srem_temp1911, 0
    %zext_temp1914 = zext i1 %icmp_ne_temp1912 to i32
    %zext_temp1915 = zext i1 %icmp_ne_temp1913 to i32
    %mul_temp1916 = mul i32 %zext_temp1914, %zext_temp1915
    %icmp_ne_temp1917 = icmp ne i32 %mul_temp1916, 0
    br i1 %icmp_ne_temp1917, label %if_then_139, label %if_end_139
if_then_139:
    %load_temp1918 = load i32, i32* %ans, align 4
    %load_temp1919 = load i32, i32* %i, align 4
    %gep_temp1920 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1919
    %load_temp1921 = load i32, i32* %gep_temp1920, align 4
    %mul_temp1922 = mul i32 1, %load_temp1921
    %add_temp1923 = add i32 %load_temp1918, %mul_temp1922
    store i32 %add_temp1923, i32* %ans, align 4
    br label %if_end_139
if_end_139:
    %load_temp1924 = load i32, i32* %x, align 4
    %sdiv_temp1925 = sdiv i32 %load_temp1924, 2
    store i32 %sdiv_temp1925, i32* %x, align 4
    %load_temp1926 = load i32, i32* %y, align 4
    %sdiv_temp1927 = sdiv i32 %load_temp1926, 2
    store i32 %sdiv_temp1927, i32* %y, align 4
    %load_temp1928 = load i32, i32* %i, align 4
    %add_temp1929 = add i32 %load_temp1928, 1
    store i32 %add_temp1929, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp1930 = load i32, i32* %ans, align 4
    store i32 %load_temp1930, i32* %c, align 4
    %icmp_sgt_temp1931 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp1931, label %if_then_140, label %if_else_140
if_then_140:
    store i32 0, i32* %ans, align 4
    br label %if_end_140
if_else_140:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1932 = load i32, i32* %c, align 4
    %gep_temp1933 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp1934 = load i32, i32* %gep_temp1933, align 4
    %mul_temp1935 = mul i32 %load_temp1932, %load_temp1934
    store i32 %mul_temp1935, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp1936 = load i32, i32* %i, align 4
    %icmp_slt_temp1937 = icmp slt i32 %load_temp1936, 16
    br i1 %icmp_slt_temp1937, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp1938 = load i32, i32* %x, align 4
    %srem_temp1939 = srem i32 %load_temp1938, 2
    %load_temp1940 = load i32, i32* %y, align 4
    %srem_temp1941 = srem i32 %load_temp1940, 2
    %icmp_ne_temp1942 = icmp ne i32 %srem_temp1939, 0
    %icmp_ne_temp1943 = icmp ne i32 %srem_temp1941, 0
    %zext_temp1944 = zext i1 %icmp_ne_temp1942 to i32
    %zext_temp1945 = zext i1 %icmp_ne_temp1943 to i32
    %mul_temp1946 = mul i32 %zext_temp1944, %zext_temp1945
    %icmp_ne_temp1947 = icmp ne i32 %mul_temp1946, 0
    br i1 %icmp_ne_temp1947, label %if_then_141, label %if_end_141
if_then_141:
    %load_temp1948 = load i32, i32* %ans, align 4
    %load_temp1949 = load i32, i32* %i, align 4
    %gep_temp1950 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1949
    %load_temp1951 = load i32, i32* %gep_temp1950, align 4
    %mul_temp1952 = mul i32 1, %load_temp1951
    %add_temp1953 = add i32 %load_temp1948, %mul_temp1952
    store i32 %add_temp1953, i32* %ans, align 4
    br label %if_end_141
if_end_141:
    %load_temp1954 = load i32, i32* %x, align 4
    %sdiv_temp1955 = sdiv i32 %load_temp1954, 2
    store i32 %sdiv_temp1955, i32* %x, align 4
    %load_temp1956 = load i32, i32* %y, align 4
    %sdiv_temp1957 = sdiv i32 %load_temp1956, 2
    store i32 %sdiv_temp1957, i32* %y, align 4
    %load_temp1958 = load i32, i32* %i, align 4
    %add_temp1959 = add i32 %load_temp1958, 1
    store i32 %add_temp1959, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_140
if_end_140:
    %load_temp1960 = load i32, i32* %ans, align 4
    store i32 %load_temp1960, i32* %c, align 4
    %load_temp1961 = load i32, i32* %sum, align 4
    store i32 %load_temp1961, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp1962 = load i32, i32* %al, align 4
    store i32 %load_temp1962, i32* %ans, align 4
    %load_temp1963 = load i32, i32* %ans, align 4
    store i32 %load_temp1963, i32* %ml, align 4
    %load_temp1964 = load i32, i32* %mr, align 4
    store i32 %load_temp1964, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp1965 = load i32, i32* %y, align 4
    %icmp_sge_temp1966 = icmp sge i32 %load_temp1965, 15
    br i1 %icmp_sge_temp1966, label %if_then_142, label %if_else_142
if_then_142:
    %load_temp1967 = load i32, i32* %x, align 4
    %icmp_slt_temp1968 = icmp slt i32 %load_temp1967, 0
    br i1 %icmp_slt_temp1968, label %if_then_143, label %if_else_143
if_then_143:
    store i32 65535, i32* %ans, align 4
    br label %if_end_143
if_else_143:
    store i32 0, i32* %ans, align 4
    br label %if_end_143
if_end_143:
    br label %if_end_142
if_else_142:
    %load_temp1969 = load i32, i32* %y, align 4
    %icmp_sgt_temp1970 = icmp sgt i32 %load_temp1969, 0
    br i1 %icmp_sgt_temp1970, label %if_then_144, label %if_else_144
if_then_144:
    %load_temp1971 = load i32, i32* %x, align 4
    %icmp_sgt_temp1972 = icmp sgt i32 %load_temp1971, 32767
    br i1 %icmp_sgt_temp1972, label %if_then_145, label %if_else_145
if_then_145:
    %load_temp1973 = load i32, i32* %x, align 4
    %load_temp1974 = load i32, i32* %y, align 4
    %gep_temp1975 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1974
    %load_temp1976 = load i32, i32* %gep_temp1975, align 4
    %sdiv_temp1977 = sdiv i32 %load_temp1973, %load_temp1976
    store i32 %sdiv_temp1977, i32* %x, align 4
    %load_temp1978 = load i32, i32* %x, align 4
    %add_temp1979 = add i32 %load_temp1978, 65536
    %load_temp1980 = load i32, i32* %y, align 4
    %sub_temp1981 = sub i32 15, %load_temp1980
    %add_temp1982 = add i32 %sub_temp1981, 1
    %gep_temp1983 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp1982
    %load_temp1984 = load i32, i32* %gep_temp1983, align 4
    %sub_temp1985 = sub i32 %add_temp1979, %load_temp1984
    store i32 %sub_temp1985, i32* %ans, align 4
    br label %if_end_145
if_else_145:
    %load_temp1986 = load i32, i32* %x, align 4
    %load_temp1987 = load i32, i32* %y, align 4
    %gep_temp1988 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp1987
    %load_temp1989 = load i32, i32* %gep_temp1988, align 4
    %sdiv_temp1990 = sdiv i32 %load_temp1986, %load_temp1989
    store i32 %sdiv_temp1990, i32* %ans, align 4
    br label %if_end_145
if_end_145:
    br label %if_end_144
if_else_144:
    %load_temp1991 = load i32, i32* %x, align 4
    store i32 %load_temp1991, i32* %ans, align 4
    br label %if_end_144
if_end_144:
    br label %if_end_142
if_end_142:
    %load_temp1992 = load i32, i32* %ans, align 4
    store i32 %load_temp1992, i32* %mr, align 4
    br label %while_cond_2
while_end_2:
    %load_temp1993 = load i32, i32* %mres, align 4
    store i32 %load_temp1993, i32* %ans, align 4
    %load_temp1994 = load i32, i32* %ans, align 4
    store i32 %load_temp1994, i32* %pres, align 4
    br label %if_end_127
if_end_127:
    %ml = alloca i32, align 4
    %load_temp1995 = load i32, i32* %pl, align 4
    store i32 %load_temp1995, i32* %ml, align 4
    %mr = alloca i32, align 4
    %load_temp1996 = load i32, i32* %pl, align 4
    store i32 %load_temp1996, i32* %mr, align 4
    %mres = alloca i32, align 4
    store i32 0, i32* %mres, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp1997 = load i32, i32* %mr, align 4
    %icmp_ne_temp1998 = icmp ne i32 %load_temp1997, 0
    br i1 %icmp_ne_temp1998, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp1999 = load i32, i32* %mr, align 4
    store i32 %load_temp1999, i32* %x, align 4
    store i32 1, i32* %y, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp2000 = load i32, i32* %i, align 4
    %icmp_slt_temp2001 = icmp slt i32 %load_temp2000, 16
    br i1 %icmp_slt_temp2001, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp2002 = load i32, i32* %x, align 4
    %srem_temp2003 = srem i32 %load_temp2002, 2
    %load_temp2004 = load i32, i32* %y, align 4
    %srem_temp2005 = srem i32 %load_temp2004, 2
    %icmp_ne_temp2006 = icmp ne i32 %srem_temp2003, 0
    %icmp_ne_temp2007 = icmp ne i32 %srem_temp2005, 0
    %zext_temp2008 = zext i1 %icmp_ne_temp2006 to i32
    %zext_temp2009 = zext i1 %icmp_ne_temp2007 to i32
    %mul_temp2010 = mul i32 %zext_temp2008, %zext_temp2009
    %icmp_ne_temp2011 = icmp ne i32 %mul_temp2010, 0
    br i1 %icmp_ne_temp2011, label %if_then_146, label %if_end_146
if_then_146:
    %load_temp2012 = load i32, i32* %ans, align 4
    %load_temp2013 = load i32, i32* %i, align 4
    %gep_temp2014 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2013
    %load_temp2015 = load i32, i32* %gep_temp2014, align 4
    %mul_temp2016 = mul i32 1, %load_temp2015
    %add_temp2017 = add i32 %load_temp2012, %mul_temp2016
    store i32 %add_temp2017, i32* %ans, align 4
    br label %if_end_146
if_end_146:
    %load_temp2018 = load i32, i32* %x, align 4
    %sdiv_temp2019 = sdiv i32 %load_temp2018, 2
    store i32 %sdiv_temp2019, i32* %x, align 4
    %load_temp2020 = load i32, i32* %y, align 4
    %sdiv_temp2021 = sdiv i32 %load_temp2020, 2
    store i32 %sdiv_temp2021, i32* %y, align 4
    %load_temp2022 = load i32, i32* %i, align 4
    %add_temp2023 = add i32 %load_temp2022, 1
    store i32 %add_temp2023, i32* %i, align 4
    br label %while_cond_3
while_end_3:
    %load_temp2024 = load i32, i32* %ans, align 4
    %icmp_ne_temp2025 = icmp ne i32 %load_temp2024, 0
    br i1 %icmp_ne_temp2025, label %if_then_147, label %if_end_147
if_then_147:
    %al = alloca i32, align 4
    %load_temp2026 = load i32, i32* %mres, align 4
    store i32 %load_temp2026, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp2027 = load i32, i32* %ml, align 4
    store i32 %load_temp2027, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp2028 = load i32, i32* %c, align 4
    %icmp_ne_temp2029 = icmp ne i32 %load_temp2028, 0
    br i1 %icmp_ne_temp2029, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2030 = load i32, i32* %al, align 4
    store i32 %load_temp2030, i32* %x, align 4
    %load_temp2031 = load i32, i32* %c, align 4
    store i32 %load_temp2031, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2032 = load i32, i32* %i, align 4
    %icmp_slt_temp2033 = icmp slt i32 %load_temp2032, 16
    br i1 %icmp_slt_temp2033, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2034 = load i32, i32* %x, align 4
    %srem_temp2035 = srem i32 %load_temp2034, 2
    %icmp_ne_temp2036 = icmp ne i32 %srem_temp2035, 0
    br i1 %icmp_ne_temp2036, label %if_then_148, label %if_else_148
if_then_148:
    %load_temp2037 = load i32, i32* %y, align 4
    %srem_temp2038 = srem i32 %load_temp2037, 2
    %icmp_eq_temp2039 = icmp eq i32 %srem_temp2038, 0
    br i1 %icmp_eq_temp2039, label %if_then_149, label %if_end_149
if_then_149:
    %load_temp2040 = load i32, i32* %ans, align 4
    %load_temp2041 = load i32, i32* %i, align 4
    %gep_temp2042 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2041
    %load_temp2043 = load i32, i32* %gep_temp2042, align 4
    %mul_temp2044 = mul i32 1, %load_temp2043
    %add_temp2045 = add i32 %load_temp2040, %mul_temp2044
    store i32 %add_temp2045, i32* %ans, align 4
    br label %if_end_149
if_end_149:
    br label %if_end_148
if_else_148:
    %load_temp2046 = load i32, i32* %y, align 4
    %srem_temp2047 = srem i32 %load_temp2046, 2
    %icmp_ne_temp2048 = icmp ne i32 %srem_temp2047, 0
    br i1 %icmp_ne_temp2048, label %if_then_150, label %if_end_150
if_then_150:
    %load_temp2049 = load i32, i32* %ans, align 4
    %load_temp2050 = load i32, i32* %i, align 4
    %gep_temp2051 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2050
    %load_temp2052 = load i32, i32* %gep_temp2051, align 4
    %mul_temp2053 = mul i32 1, %load_temp2052
    %add_temp2054 = add i32 %load_temp2049, %mul_temp2053
    store i32 %add_temp2054, i32* %ans, align 4
    br label %if_end_150
if_end_150:
    br label %if_end_148
if_end_148:
    %load_temp2055 = load i32, i32* %x, align 4
    %sdiv_temp2056 = sdiv i32 %load_temp2055, 2
    store i32 %sdiv_temp2056, i32* %x, align 4
    %load_temp2057 = load i32, i32* %y, align 4
    %sdiv_temp2058 = sdiv i32 %load_temp2057, 2
    store i32 %sdiv_temp2058, i32* %y, align 4
    %load_temp2059 = load i32, i32* %i, align 4
    %add_temp2060 = add i32 %load_temp2059, 1
    store i32 %add_temp2060, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp2061 = load i32, i32* %ans, align 4
    store i32 %load_temp2061, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2062 = load i32, i32* %al, align 4
    store i32 %load_temp2062, i32* %x, align 4
    %load_temp2063 = load i32, i32* %c, align 4
    store i32 %load_temp2063, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2064 = load i32, i32* %i, align 4
    %icmp_slt_temp2065 = icmp slt i32 %load_temp2064, 16
    br i1 %icmp_slt_temp2065, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2066 = load i32, i32* %x, align 4
    %srem_temp2067 = srem i32 %load_temp2066, 2
    %load_temp2068 = load i32, i32* %y, align 4
    %srem_temp2069 = srem i32 %load_temp2068, 2
    %icmp_ne_temp2070 = icmp ne i32 %srem_temp2067, 0
    %icmp_ne_temp2071 = icmp ne i32 %srem_temp2069, 0
    %zext_temp2072 = zext i1 %icmp_ne_temp2070 to i32
    %zext_temp2073 = zext i1 %icmp_ne_temp2071 to i32
    %mul_temp2074 = mul i32 %zext_temp2072, %zext_temp2073
    %icmp_ne_temp2075 = icmp ne i32 %mul_temp2074, 0
    br i1 %icmp_ne_temp2075, label %if_then_151, label %if_end_151
if_then_151:
    %load_temp2076 = load i32, i32* %ans, align 4
    %load_temp2077 = load i32, i32* %i, align 4
    %gep_temp2078 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2077
    %load_temp2079 = load i32, i32* %gep_temp2078, align 4
    %mul_temp2080 = mul i32 1, %load_temp2079
    %add_temp2081 = add i32 %load_temp2076, %mul_temp2080
    store i32 %add_temp2081, i32* %ans, align 4
    br label %if_end_151
if_end_151:
    %load_temp2082 = load i32, i32* %x, align 4
    %sdiv_temp2083 = sdiv i32 %load_temp2082, 2
    store i32 %sdiv_temp2083, i32* %x, align 4
    %load_temp2084 = load i32, i32* %y, align 4
    %sdiv_temp2085 = sdiv i32 %load_temp2084, 2
    store i32 %sdiv_temp2085, i32* %y, align 4
    %load_temp2086 = load i32, i32* %i, align 4
    %add_temp2087 = add i32 %load_temp2086, 1
    store i32 %add_temp2087, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp2088 = load i32, i32* %ans, align 4
    store i32 %load_temp2088, i32* %c, align 4
    %icmp_sgt_temp2089 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp2089, label %if_then_152, label %if_else_152
if_then_152:
    store i32 0, i32* %ans, align 4
    br label %if_end_152
if_else_152:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2090 = load i32, i32* %c, align 4
    %gep_temp2091 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp2092 = load i32, i32* %gep_temp2091, align 4
    %mul_temp2093 = mul i32 %load_temp2090, %load_temp2092
    store i32 %mul_temp2093, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2094 = load i32, i32* %i, align 4
    %icmp_slt_temp2095 = icmp slt i32 %load_temp2094, 16
    br i1 %icmp_slt_temp2095, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2096 = load i32, i32* %x, align 4
    %srem_temp2097 = srem i32 %load_temp2096, 2
    %load_temp2098 = load i32, i32* %y, align 4
    %srem_temp2099 = srem i32 %load_temp2098, 2
    %icmp_ne_temp2100 = icmp ne i32 %srem_temp2097, 0
    %icmp_ne_temp2101 = icmp ne i32 %srem_temp2099, 0
    %zext_temp2102 = zext i1 %icmp_ne_temp2100 to i32
    %zext_temp2103 = zext i1 %icmp_ne_temp2101 to i32
    %mul_temp2104 = mul i32 %zext_temp2102, %zext_temp2103
    %icmp_ne_temp2105 = icmp ne i32 %mul_temp2104, 0
    br i1 %icmp_ne_temp2105, label %if_then_153, label %if_end_153
if_then_153:
    %load_temp2106 = load i32, i32* %ans, align 4
    %load_temp2107 = load i32, i32* %i, align 4
    %gep_temp2108 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2107
    %load_temp2109 = load i32, i32* %gep_temp2108, align 4
    %mul_temp2110 = mul i32 1, %load_temp2109
    %add_temp2111 = add i32 %load_temp2106, %mul_temp2110
    store i32 %add_temp2111, i32* %ans, align 4
    br label %if_end_153
if_end_153:
    %load_temp2112 = load i32, i32* %x, align 4
    %sdiv_temp2113 = sdiv i32 %load_temp2112, 2
    store i32 %sdiv_temp2113, i32* %x, align 4
    %load_temp2114 = load i32, i32* %y, align 4
    %sdiv_temp2115 = sdiv i32 %load_temp2114, 2
    store i32 %sdiv_temp2115, i32* %y, align 4
    %load_temp2116 = load i32, i32* %i, align 4
    %add_temp2117 = add i32 %load_temp2116, 1
    store i32 %add_temp2117, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_152
if_end_152:
    %load_temp2118 = load i32, i32* %ans, align 4
    store i32 %load_temp2118, i32* %c, align 4
    %load_temp2119 = load i32, i32* %sum, align 4
    store i32 %load_temp2119, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp2120 = load i32, i32* %al, align 4
    store i32 %load_temp2120, i32* %ans, align 4
    %load_temp2121 = load i32, i32* %ans, align 4
    store i32 %load_temp2121, i32* %mres, align 4
    br label %if_end_147
if_end_147:
    %al = alloca i32, align 4
    %load_temp2122 = load i32, i32* %ml, align 4
    store i32 %load_temp2122, i32* %al, align 4
    %c = alloca i32, align 4
    %load_temp2123 = load i32, i32* %ml, align 4
    store i32 %load_temp2123, i32* %c, align 4
    %sum = alloca i32, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp2124 = load i32, i32* %c, align 4
    %icmp_ne_temp2125 = icmp ne i32 %load_temp2124, 0
    br i1 %icmp_ne_temp2125, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2126 = load i32, i32* %al, align 4
    store i32 %load_temp2126, i32* %x, align 4
    %load_temp2127 = load i32, i32* %c, align 4
    store i32 %load_temp2127, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2128 = load i32, i32* %i, align 4
    %icmp_slt_temp2129 = icmp slt i32 %load_temp2128, 16
    br i1 %icmp_slt_temp2129, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2130 = load i32, i32* %x, align 4
    %srem_temp2131 = srem i32 %load_temp2130, 2
    %icmp_ne_temp2132 = icmp ne i32 %srem_temp2131, 0
    br i1 %icmp_ne_temp2132, label %if_then_154, label %if_else_154
if_then_154:
    %load_temp2133 = load i32, i32* %y, align 4
    %srem_temp2134 = srem i32 %load_temp2133, 2
    %icmp_eq_temp2135 = icmp eq i32 %srem_temp2134, 0
    br i1 %icmp_eq_temp2135, label %if_then_155, label %if_end_155
if_then_155:
    %load_temp2136 = load i32, i32* %ans, align 4
    %load_temp2137 = load i32, i32* %i, align 4
    %gep_temp2138 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2137
    %load_temp2139 = load i32, i32* %gep_temp2138, align 4
    %mul_temp2140 = mul i32 1, %load_temp2139
    %add_temp2141 = add i32 %load_temp2136, %mul_temp2140
    store i32 %add_temp2141, i32* %ans, align 4
    br label %if_end_155
if_end_155:
    br label %if_end_154
if_else_154:
    %load_temp2142 = load i32, i32* %y, align 4
    %srem_temp2143 = srem i32 %load_temp2142, 2
    %icmp_ne_temp2144 = icmp ne i32 %srem_temp2143, 0
    br i1 %icmp_ne_temp2144, label %if_then_156, label %if_end_156
if_then_156:
    %load_temp2145 = load i32, i32* %ans, align 4
    %load_temp2146 = load i32, i32* %i, align 4
    %gep_temp2147 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2146
    %load_temp2148 = load i32, i32* %gep_temp2147, align 4
    %mul_temp2149 = mul i32 1, %load_temp2148
    %add_temp2150 = add i32 %load_temp2145, %mul_temp2149
    store i32 %add_temp2150, i32* %ans, align 4
    br label %if_end_156
if_end_156:
    br label %if_end_154
if_end_154:
    %load_temp2151 = load i32, i32* %x, align 4
    %sdiv_temp2152 = sdiv i32 %load_temp2151, 2
    store i32 %sdiv_temp2152, i32* %x, align 4
    %load_temp2153 = load i32, i32* %y, align 4
    %sdiv_temp2154 = sdiv i32 %load_temp2153, 2
    store i32 %sdiv_temp2154, i32* %y, align 4
    %load_temp2155 = load i32, i32* %i, align 4
    %add_temp2156 = add i32 %load_temp2155, 1
    store i32 %add_temp2156, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp2157 = load i32, i32* %ans, align 4
    store i32 %load_temp2157, i32* %sum, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2158 = load i32, i32* %al, align 4
    store i32 %load_temp2158, i32* %x, align 4
    %load_temp2159 = load i32, i32* %c, align 4
    store i32 %load_temp2159, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2160 = load i32, i32* %i, align 4
    %icmp_slt_temp2161 = icmp slt i32 %load_temp2160, 16
    br i1 %icmp_slt_temp2161, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2162 = load i32, i32* %x, align 4
    %srem_temp2163 = srem i32 %load_temp2162, 2
    %load_temp2164 = load i32, i32* %y, align 4
    %srem_temp2165 = srem i32 %load_temp2164, 2
    %icmp_ne_temp2166 = icmp ne i32 %srem_temp2163, 0
    %icmp_ne_temp2167 = icmp ne i32 %srem_temp2165, 0
    %zext_temp2168 = zext i1 %icmp_ne_temp2166 to i32
    %zext_temp2169 = zext i1 %icmp_ne_temp2167 to i32
    %mul_temp2170 = mul i32 %zext_temp2168, %zext_temp2169
    %icmp_ne_temp2171 = icmp ne i32 %mul_temp2170, 0
    br i1 %icmp_ne_temp2171, label %if_then_157, label %if_end_157
if_then_157:
    %load_temp2172 = load i32, i32* %ans, align 4
    %load_temp2173 = load i32, i32* %i, align 4
    %gep_temp2174 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2173
    %load_temp2175 = load i32, i32* %gep_temp2174, align 4
    %mul_temp2176 = mul i32 1, %load_temp2175
    %add_temp2177 = add i32 %load_temp2172, %mul_temp2176
    store i32 %add_temp2177, i32* %ans, align 4
    br label %if_end_157
if_end_157:
    %load_temp2178 = load i32, i32* %x, align 4
    %sdiv_temp2179 = sdiv i32 %load_temp2178, 2
    store i32 %sdiv_temp2179, i32* %x, align 4
    %load_temp2180 = load i32, i32* %y, align 4
    %sdiv_temp2181 = sdiv i32 %load_temp2180, 2
    store i32 %sdiv_temp2181, i32* %y, align 4
    %load_temp2182 = load i32, i32* %i, align 4
    %add_temp2183 = add i32 %load_temp2182, 1
    store i32 %add_temp2183, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    %load_temp2184 = load i32, i32* %ans, align 4
    store i32 %load_temp2184, i32* %c, align 4
    %icmp_sgt_temp2185 = icmp sgt i32 1, 15
    br i1 %icmp_sgt_temp2185, label %if_then_158, label %if_else_158
if_then_158:
    store i32 0, i32* %ans, align 4
    br label %if_end_158
if_else_158:
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %i, align 4
    %load_temp2186 = load i32, i32* %c, align 4
    %gep_temp2187 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 1
    %load_temp2188 = load i32, i32* %gep_temp2187, align 4
    %mul_temp2189 = mul i32 %load_temp2186, %load_temp2188
    store i32 %mul_temp2189, i32* %x, align 4
    store i32 65535, i32* %y, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp2190 = load i32, i32* %i, align 4
    %icmp_slt_temp2191 = icmp slt i32 %load_temp2190, 16
    br i1 %icmp_slt_temp2191, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp2192 = load i32, i32* %x, align 4
    %srem_temp2193 = srem i32 %load_temp2192, 2
    %load_temp2194 = load i32, i32* %y, align 4
    %srem_temp2195 = srem i32 %load_temp2194, 2
    %icmp_ne_temp2196 = icmp ne i32 %srem_temp2193, 0
    %icmp_ne_temp2197 = icmp ne i32 %srem_temp2195, 0
    %zext_temp2198 = zext i1 %icmp_ne_temp2196 to i32
    %zext_temp2199 = zext i1 %icmp_ne_temp2197 to i32
    %mul_temp2200 = mul i32 %zext_temp2198, %zext_temp2199
    %icmp_ne_temp2201 = icmp ne i32 %mul_temp2200, 0
    br i1 %icmp_ne_temp2201, label %if_then_159, label %if_end_159
if_then_159:
    %load_temp2202 = load i32, i32* %ans, align 4
    %load_temp2203 = load i32, i32* %i, align 4
    %gep_temp2204 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2203
    %load_temp2205 = load i32, i32* %gep_temp2204, align 4
    %mul_temp2206 = mul i32 1, %load_temp2205
    %add_temp2207 = add i32 %load_temp2202, %mul_temp2206
    store i32 %add_temp2207, i32* %ans, align 4
    br label %if_end_159
if_end_159:
    %load_temp2208 = load i32, i32* %x, align 4
    %sdiv_temp2209 = sdiv i32 %load_temp2208, 2
    store i32 %sdiv_temp2209, i32* %x, align 4
    %load_temp2210 = load i32, i32* %y, align 4
    %sdiv_temp2211 = sdiv i32 %load_temp2210, 2
    store i32 %sdiv_temp2211, i32* %y, align 4
    %load_temp2212 = load i32, i32* %i, align 4
    %add_temp2213 = add i32 %load_temp2212, 1
    store i32 %add_temp2213, i32* %i, align 4
    br label %while_cond_4
while_end_4:
    br label %if_end_158
if_end_158:
    %load_temp2214 = load i32, i32* %ans, align 4
    store i32 %load_temp2214, i32* %c, align 4
    %load_temp2215 = load i32, i32* %sum, align 4
    store i32 %load_temp2215, i32* %al, align 4
    br label %while_cond_3
while_end_3:
    %load_temp2216 = load i32, i32* %al, align 4
    store i32 %load_temp2216, i32* %ans, align 4
    %load_temp2217 = load i32, i32* %ans, align 4
    store i32 %load_temp2217, i32* %ml, align 4
    %load_temp2218 = load i32, i32* %mr, align 4
    store i32 %load_temp2218, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp2219 = load i32, i32* %y, align 4
    %icmp_sge_temp2220 = icmp sge i32 %load_temp2219, 15
    br i1 %icmp_sge_temp2220, label %if_then_160, label %if_else_160
if_then_160:
    %load_temp2221 = load i32, i32* %x, align 4
    %icmp_slt_temp2222 = icmp slt i32 %load_temp2221, 0
    br i1 %icmp_slt_temp2222, label %if_then_161, label %if_else_161
if_then_161:
    store i32 65535, i32* %ans, align 4
    br label %if_end_161
if_else_161:
    store i32 0, i32* %ans, align 4
    br label %if_end_161
if_end_161:
    br label %if_end_160
if_else_160:
    %load_temp2223 = load i32, i32* %y, align 4
    %icmp_sgt_temp2224 = icmp sgt i32 %load_temp2223, 0
    br i1 %icmp_sgt_temp2224, label %if_then_162, label %if_else_162
if_then_162:
    %load_temp2225 = load i32, i32* %x, align 4
    %icmp_sgt_temp2226 = icmp sgt i32 %load_temp2225, 32767
    br i1 %icmp_sgt_temp2226, label %if_then_163, label %if_else_163
if_then_163:
    %load_temp2227 = load i32, i32* %x, align 4
    %load_temp2228 = load i32, i32* %y, align 4
    %gep_temp2229 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2228
    %load_temp2230 = load i32, i32* %gep_temp2229, align 4
    %sdiv_temp2231 = sdiv i32 %load_temp2227, %load_temp2230
    store i32 %sdiv_temp2231, i32* %x, align 4
    %load_temp2232 = load i32, i32* %x, align 4
    %add_temp2233 = add i32 %load_temp2232, 65536
    %load_temp2234 = load i32, i32* %y, align 4
    %sub_temp2235 = sub i32 15, %load_temp2234
    %add_temp2236 = add i32 %sub_temp2235, 1
    %gep_temp2237 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp2236
    %load_temp2238 = load i32, i32* %gep_temp2237, align 4
    %sub_temp2239 = sub i32 %add_temp2233, %load_temp2238
    store i32 %sub_temp2239, i32* %ans, align 4
    br label %if_end_163
if_else_163:
    %load_temp2240 = load i32, i32* %x, align 4
    %load_temp2241 = load i32, i32* %y, align 4
    %gep_temp2242 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2241
    %load_temp2243 = load i32, i32* %gep_temp2242, align 4
    %sdiv_temp2244 = sdiv i32 %load_temp2240, %load_temp2243
    store i32 %sdiv_temp2244, i32* %ans, align 4
    br label %if_end_163
if_end_163:
    br label %if_end_162
if_else_162:
    %load_temp2245 = load i32, i32* %x, align 4
    store i32 %load_temp2245, i32* %ans, align 4
    br label %if_end_162
if_end_162:
    br label %if_end_160
if_end_160:
    %load_temp2246 = load i32, i32* %ans, align 4
    store i32 %load_temp2246, i32* %mr, align 4
    br label %while_cond_2
while_end_2:
    %load_temp2247 = load i32, i32* %mres, align 4
    store i32 %load_temp2247, i32* %ans, align 4
    %load_temp2248 = load i32, i32* %ans, align 4
    store i32 %load_temp2248, i32* %pl, align 4
    %load_temp2249 = load i32, i32* %pr, align 4
    store i32 %load_temp2249, i32* %x, align 4
    store i32 1, i32* %y, align 4
    %load_temp2250 = load i32, i32* %y, align 4
    %icmp_sge_temp2251 = icmp sge i32 %load_temp2250, 15
    br i1 %icmp_sge_temp2251, label %if_then_164, label %if_else_164
if_then_164:
    %load_temp2252 = load i32, i32* %x, align 4
    %icmp_slt_temp2253 = icmp slt i32 %load_temp2252, 0
    br i1 %icmp_slt_temp2253, label %if_then_165, label %if_else_165
if_then_165:
    store i32 65535, i32* %ans, align 4
    br label %if_end_165
if_else_165:
    store i32 0, i32* %ans, align 4
    br label %if_end_165
if_end_165:
    br label %if_end_164
if_else_164:
    %load_temp2254 = load i32, i32* %y, align 4
    %icmp_sgt_temp2255 = icmp sgt i32 %load_temp2254, 0
    br i1 %icmp_sgt_temp2255, label %if_then_166, label %if_else_166
if_then_166:
    %load_temp2256 = load i32, i32* %x, align 4
    %icmp_sgt_temp2257 = icmp sgt i32 %load_temp2256, 32767
    br i1 %icmp_sgt_temp2257, label %if_then_167, label %if_else_167
if_then_167:
    %load_temp2258 = load i32, i32* %x, align 4
    %load_temp2259 = load i32, i32* %y, align 4
    %gep_temp2260 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2259
    %load_temp2261 = load i32, i32* %gep_temp2260, align 4
    %sdiv_temp2262 = sdiv i32 %load_temp2258, %load_temp2261
    store i32 %sdiv_temp2262, i32* %x, align 4
    %load_temp2263 = load i32, i32* %x, align 4
    %add_temp2264 = add i32 %load_temp2263, 65536
    %load_temp2265 = load i32, i32* %y, align 4
    %sub_temp2266 = sub i32 15, %load_temp2265
    %add_temp2267 = add i32 %sub_temp2266, 1
    %gep_temp2268 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %add_temp2267
    %load_temp2269 = load i32, i32* %gep_temp2268, align 4
    %sub_temp2270 = sub i32 %add_temp2264, %load_temp2269
    store i32 %sub_temp2270, i32* %ans, align 4
    br label %if_end_167
if_else_167:
    %load_temp2271 = load i32, i32* %x, align 4
    %load_temp2272 = load i32, i32* %y, align 4
    %gep_temp2273 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2272
    %load_temp2274 = load i32, i32* %gep_temp2273, align 4
    %sdiv_temp2275 = sdiv i32 %load_temp2271, %load_temp2274
    store i32 %sdiv_temp2275, i32* %ans, align 4
    br label %if_end_167
if_end_167:
    br label %if_end_166
if_else_166:
    %load_temp2276 = load i32, i32* %x, align 4
    store i32 %load_temp2276, i32* %ans, align 4
    br label %if_end_166
if_end_166:
    br label %if_end_164
if_end_164:
    %load_temp2277 = load i32, i32* %ans, align 4
    store i32 %load_temp2277, i32* %pr, align 4
    br label %while_cond_1
while_end_1:
    %load_temp2278 = load i32, i32* %pres, align 4
    store i32 %load_temp2278, i32* %ans, align 4
    %load_temp2279 = load i32, i32* %cur, align 4
    %gep_temp2280 = getelementptr [16 x i32], [16 x i32]* @SHIFT_TABLE, i32 0, i32 %load_temp2279
    %load_temp2281 = load i32, i32* %gep_temp2280, align 4
    %load_temp2282 = load i32, i32* %ans, align 4
    %icmp_ne_temp2283 = icmp ne i32 %load_temp2281, %load_temp2282
    br i1 %icmp_ne_temp2283, label %if_then_168, label %if_end_168
if_then_168:
    ret i32 1
if_end_168:
    %load_temp2284 = load i32, i32* %cur, align 4
    %add_temp2285 = add i32 %load_temp2284, 1
    store i32 %add_temp2285, i32* %cur, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    %call_temp2286 = call i32 @long_func()
    ret i32 %call_temp2286
}

