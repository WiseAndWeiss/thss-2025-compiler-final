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

define i32 @insertsort(i32* %a) {
entry:
    %a_local = alloca i32*, align 4
    store i32* %a, i32** %a_local, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp35 = load i32, i32* %i, align 4
    %load_temp36 = load i32, i32* @n, align 4
    %icmp_slt_temp37 = icmp slt i32 %load_temp35, %load_temp36
    br i1 %icmp_slt_temp37, label %while_body_0, label %while_end_0
while_body_0:
    %temp = alloca i32, align 4
    %load_temp38 = load i32, i32* %i, align 4
    %gep_temp39 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp38
    %load_temp40 = load i32*, i32** %gep_temp39, align 4
    store i32* %load_temp40, i32* %temp, align 4
    %j = alloca i32, align 4
    %load_temp41 = load i32, i32* %i, align 4
    %sub_temp42 = sub i32 %load_temp41, 1
    store i32 %sub_temp42, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp43 = load i32, i32* %j, align 4
    %sub_temp44 = sub i32 0, 1
    %icmp_sgt_temp45 = icmp sgt i32 %load_temp43, %sub_temp44
    %load_temp46 = load i32, i32* %temp, align 4
    %load_temp47 = load i32, i32* %j, align 4
    %gep_temp48 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp47
    %load_temp49 = load i32*, i32** %gep_temp48, align 4
    %icmp_slt_temp50 = icmp slt i32 %load_temp46, %load_temp49
    %zext_temp51 = zext i1 %icmp_sgt_temp45 to i32
    %zext_temp52 = zext i1 %icmp_slt_temp50 to i32
    %mul_temp53 = mul i32 %zext_temp51, %zext_temp52
    %icmp_ne_temp54 = icmp ne i32 %mul_temp53, 0
    br i1 %icmp_ne_temp54, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp55 = load i32, i32* %j, align 4
    %add_temp56 = add i32 %load_temp55, 1
    %gep_temp57 = getelementptr i32*, i32** %a_local, i32 0, i32 %add_temp56
    %load_temp58 = load i32, i32* %j, align 4
    %gep_temp59 = getelementptr i32*, i32** %a_local, i32 0, i32 %load_temp58
    %load_temp60 = load i32*, i32** %gep_temp59, align 4
    store i32* %load_temp60, i32** %gep_temp57, align 4
    %load_temp61 = load i32, i32* %j, align 4
    %sub_temp62 = sub i32 %load_temp61, 1
    store i32 %sub_temp62, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp63 = load i32, i32* %j, align 4
    %add_temp64 = add i32 %load_temp63, 1
    %gep_temp65 = getelementptr i32*, i32** %a_local, i32 0, i32 %add_temp64
    %load_temp66 = load i32, i32* %temp, align 4
    store i32 %load_temp66, i32** %gep_temp65, align 4
    %load_temp67 = load i32, i32* %i, align 4
    %add_temp68 = add i32 %load_temp67, 1
    store i32 %add_temp68, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @QuickSort(i32* %arr, i32 %low, i32 %high) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %low_local = alloca i32, align 4
    store i32 %low, i32* %low_local, align 4
    %high_local = alloca i32, align 4
    store i32 %high, i32* %high_local, align 4
    %load_temp69 = load i32, i32* %low_local, align 4
    %load_temp70 = load i32, i32* %high_local, align 4
    %icmp_slt_temp71 = icmp slt i32 %load_temp69, %load_temp70
    br i1 %icmp_slt_temp71, label %if_then_1, label %if_end_1
if_then_1:
    %i = alloca i32, align 4
    %load_temp72 = load i32, i32* %low_local, align 4
    store i32 %load_temp72, i32* %i, align 4
    %j = alloca i32, align 4
    %load_temp73 = load i32, i32* %high_local, align 4
    store i32 %load_temp73, i32* %j, align 4
    %k = alloca i32, align 4
    %load_temp74 = load i32, i32* %low_local, align 4
    %gep_temp75 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp74
    %load_temp76 = load i32*, i32** %gep_temp75, align 4
    store i32* %load_temp76, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp77 = load i32, i32* %i, align 4
    %load_temp78 = load i32, i32* %j, align 4
    %icmp_slt_temp79 = icmp slt i32 %load_temp77, %load_temp78
    br i1 %icmp_slt_temp79, label %while_body_0, label %while_end_0
while_body_0:
    br label %while_cond_1
while_cond_1:
    %load_temp80 = load i32, i32* %i, align 4
    %load_temp81 = load i32, i32* %j, align 4
    %icmp_slt_temp82 = icmp slt i32 %load_temp80, %load_temp81
    %load_temp83 = load i32, i32* %j, align 4
    %gep_temp84 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp83
    %load_temp85 = load i32*, i32** %gep_temp84, align 4
    %load_temp86 = load i32, i32* %k, align 4
    %sub_temp87 = sub i32 %load_temp86, 1
    %icmp_sgt_temp88 = icmp sgt i32* %load_temp85, %sub_temp87
    %zext_temp89 = zext i1 %icmp_slt_temp82 to i32
    %zext_temp90 = zext i1 %icmp_sgt_temp88 to i32
    %mul_temp91 = mul i32 %zext_temp89, %zext_temp90
    %icmp_ne_temp92 = icmp ne i32 %mul_temp91, 0
    br i1 %icmp_ne_temp92, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp93 = load i32, i32* %j, align 4
    %sub_temp94 = sub i32 %load_temp93, 1
    store i32 %sub_temp94, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp95 = load i32, i32* %i, align 4
    %load_temp96 = load i32, i32* %j, align 4
    %icmp_slt_temp97 = icmp slt i32 %load_temp95, %load_temp96
    br i1 %icmp_slt_temp97, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp98 = load i32, i32* %i, align 4
    %gep_temp99 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp98
    %load_temp100 = load i32, i32* %j, align 4
    %gep_temp101 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp100
    %load_temp102 = load i32*, i32** %gep_temp101, align 4
    store i32* %load_temp102, i32** %gep_temp99, align 4
    %load_temp103 = load i32, i32* %i, align 4
    %add_temp104 = add i32 %load_temp103, 1
    store i32 %add_temp104, i32* %i, align 4
    br label %if_end_2
if_end_2:
    br label %while_cond_1
while_cond_1:
    %load_temp105 = load i32, i32* %i, align 4
    %load_temp106 = load i32, i32* %j, align 4
    %icmp_slt_temp107 = icmp slt i32 %load_temp105, %load_temp106
    %load_temp108 = load i32, i32* %i, align 4
    %gep_temp109 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp108
    %load_temp110 = load i32*, i32** %gep_temp109, align 4
    %load_temp111 = load i32, i32* %k, align 4
    %icmp_slt_temp112 = icmp slt i32* %load_temp110, %load_temp111
    %zext_temp113 = zext i1 %icmp_slt_temp107 to i32
    %zext_temp114 = zext i1 %icmp_slt_temp112 to i32
    %mul_temp115 = mul i32 %zext_temp113, %zext_temp114
    %icmp_ne_temp116 = icmp ne i32 %mul_temp115, 0
    br i1 %icmp_ne_temp116, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp117 = load i32, i32* %i, align 4
    %add_temp118 = add i32 %load_temp117, 1
    store i32 %add_temp118, i32* %i, align 4
    br label %while_cond_1
while_end_1:
    %load_temp119 = load i32, i32* %i, align 4
    %load_temp120 = load i32, i32* %j, align 4
    %icmp_slt_temp121 = icmp slt i32 %load_temp119, %load_temp120
    br i1 %icmp_slt_temp121, label %if_then_3, label %if_end_3
if_then_3:
    %load_temp122 = load i32, i32* %j, align 4
    %gep_temp123 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp122
    %load_temp124 = load i32, i32* %i, align 4
    %gep_temp125 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp124
    %load_temp126 = load i32*, i32** %gep_temp125, align 4
    store i32* %load_temp126, i32** %gep_temp123, align 4
    %load_temp127 = load i32, i32* %j, align 4
    %sub_temp128 = sub i32 %load_temp127, 1
    store i32 %sub_temp128, i32* %j, align 4
    br label %if_end_3
if_end_3:
    br label %while_cond_0
while_end_0:
    %load_temp129 = load i32, i32* %i, align 4
    %gep_temp130 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp129
    %load_temp131 = load i32, i32* %k, align 4
    store i32 %load_temp131, i32** %gep_temp130, align 4
    %tmp = alloca i32, align 4
    %load_temp132 = load i32, i32* %i, align 4
    %sub_temp133 = sub i32 %load_temp132, 1
    store i32 %sub_temp133, i32* %tmp, align 4
    %load_temp134 = load i32*, i32** %arr_local, align 4
    %load_temp135 = load i32, i32* %low_local, align 4
    %load_temp136 = load i32, i32* %tmp, align 4
    %call_temp137 = call i32 @QuickSort(i32* %load_temp134, i32 %load_temp135, i32 %load_temp136)
    store i32 %call_temp137, i32* %tmp, align 4
    %load_temp138 = load i32, i32* %i, align 4
    %add_temp139 = add i32 %load_temp138, 1
    store i32 %add_temp139, i32* %tmp, align 4
    %load_temp140 = load i32*, i32** %arr_local, align 4
    %load_temp141 = load i32, i32* %tmp, align 4
    %load_temp142 = load i32, i32* %high_local, align 4
    %call_temp143 = call i32 @QuickSort(i32* %load_temp140, i32 %load_temp141, i32 %load_temp142)
    store i32 %call_temp143, i32* %tmp, align 4
    br label %if_end_1
if_end_1:
    ret i32 0
}

define i32 @getMid(i32* %arr) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %mid = alloca i32, align 4
    %load_temp144 = load i32, i32* @n, align 4
    %srem_temp145 = srem i32 %load_temp144, 2
    %icmp_eq_temp146 = icmp eq i32 %srem_temp145, 0
    br i1 %icmp_eq_temp146, label %if_then_4, label %if_else_4
if_then_4:
    %load_temp147 = load i32, i32* @n, align 4
    %sdiv_temp148 = sdiv i32 %load_temp147, 2
    store i32 %sdiv_temp148, i32* %mid, align 4
    %load_temp149 = load i32, i32* %mid, align 4
    %gep_temp150 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp149
    %load_temp151 = load i32*, i32** %gep_temp150, align 4
    %load_temp152 = load i32, i32* %mid, align 4
    %sub_temp153 = sub i32 %load_temp152, 1
    %gep_temp154 = getelementptr i32*, i32** %arr_local, i32 0, i32 %sub_temp153
    %load_temp155 = load i32*, i32** %gep_temp154, align 4
    %add_temp156 = add i32* %load_temp151, %load_temp155
    %sdiv_temp157 = sdiv i32* %add_temp156, 2
    ret i32* %sdiv_temp157
if_else_4:
    %load_temp158 = load i32, i32* @n, align 4
    %sdiv_temp159 = sdiv i32 %load_temp158, 2
    store i32 %sdiv_temp159, i32* %mid, align 4
    %load_temp160 = load i32, i32* %mid, align 4
    %gep_temp161 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp160
    %load_temp162 = load i32*, i32** %gep_temp161, align 4
    ret i32* %load_temp162
if_end_4:
    ret void
}

define i32 @getMost(i32* %arr) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %count = alloca [1000 x i32], align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp163 = load i32, i32* %i, align 4
    %icmp_slt_temp164 = icmp slt i32 %load_temp163, 1000
    br i1 %icmp_slt_temp164, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp165 = load i32, i32* %i, align 4
    %gep_temp166 = getelementptr [1000 x i32], [1000 x i32]* %count, i32 0, i32 %load_temp165
    store i32 0, i32* %gep_temp166, align 4
    %load_temp167 = load i32, i32* %i, align 4
    %add_temp168 = add i32 %load_temp167, 1
    store i32 %add_temp168, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %i, align 4
    %max = alloca i32, align 4
    %number = alloca i32, align 4
    store i32 0, i32* %max, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp169 = load i32, i32* %i, align 4
    %load_temp170 = load i32, i32* @n, align 4
    %icmp_slt_temp171 = icmp slt i32 %load_temp169, %load_temp170
    br i1 %icmp_slt_temp171, label %while_body_0, label %while_end_0
while_body_0:
    %num = alloca i32, align 4
    %load_temp172 = load i32, i32* %i, align 4
    %gep_temp173 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp172
    %load_temp174 = load i32*, i32** %gep_temp173, align 4
    store i32* %load_temp174, i32* %num, align 4
    %load_temp175 = load i32, i32* %num, align 4
    %gep_temp176 = getelementptr [1000 x i32], [1000 x i32]* %count, i32 0, i32 %load_temp175
    %load_temp177 = load i32, i32* %num, align 4
    %gep_temp178 = getelementptr [1000 x i32], [1000 x i32]* %count, i32 0, i32 %load_temp177
    %load_temp179 = load i32, i32* %gep_temp178, align 4
    %add_temp180 = add i32 %load_temp179, 1
    store i32 %add_temp180, i32* %gep_temp176, align 4
    %load_temp181 = load i32, i32* %num, align 4
    %gep_temp182 = getelementptr [1000 x i32], [1000 x i32]* %count, i32 0, i32 %load_temp181
    %load_temp183 = load i32, i32* %gep_temp182, align 4
    %load_temp184 = load i32, i32* %max, align 4
    %icmp_sgt_temp185 = icmp sgt i32 %load_temp183, %load_temp184
    br i1 %icmp_sgt_temp185, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp186 = load i32, i32* %num, align 4
    %gep_temp187 = getelementptr [1000 x i32], [1000 x i32]* %count, i32 0, i32 %load_temp186
    %load_temp188 = load i32, i32* %gep_temp187, align 4
    store i32 %load_temp188, i32* %max, align 4
    %load_temp189 = load i32, i32* %num, align 4
    store i32 %load_temp189, i32* %number, align 4
    br label %if_end_5
if_end_5:
    %load_temp190 = load i32, i32* %i, align 4
    %add_temp191 = add i32 %load_temp190, 1
    store i32 %add_temp191, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp192 = load i32, i32* %number, align 4
    ret i32 %load_temp192
}

define i32 @revert(i32* %arr) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %temp = alloca i32, align 4
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    store i32 0, i32* %i, align 4
    store i32 0, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp193 = load i32, i32* %i, align 4
    %load_temp194 = load i32, i32* %j, align 4
    %icmp_slt_temp195 = icmp slt i32 %load_temp193, %load_temp194
    br i1 %icmp_slt_temp195, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp196 = load i32, i32* %i, align 4
    %gep_temp197 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp196
    %load_temp198 = load i32*, i32** %gep_temp197, align 4
    store i32* %load_temp198, i32* %temp, align 4
    %load_temp199 = load i32, i32* %i, align 4
    %gep_temp200 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp199
    %load_temp201 = load i32, i32* %j, align 4
    %gep_temp202 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp201
    %load_temp203 = load i32*, i32** %gep_temp202, align 4
    store i32* %load_temp203, i32** %gep_temp200, align 4
    %load_temp204 = load i32, i32* %j, align 4
    %gep_temp205 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp204
    %load_temp206 = load i32, i32* %temp, align 4
    store i32 %load_temp206, i32** %gep_temp205, align 4
    %load_temp207 = load i32, i32* %i, align 4
    %add_temp208 = add i32 %load_temp207, 1
    store i32 %add_temp208, i32* %i, align 4
    %load_temp209 = load i32, i32* %j, align 4
    %sub_temp210 = sub i32 %load_temp209, 1
    store i32 %sub_temp210, i32* %j, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @arrCopy(i32* %src, i32* %target) {
entry:
    %src_local = alloca i32*, align 4
    store i32* %src, i32** %src_local, align 4
    %target_local = alloca i32*, align 4
    store i32* %target, i32** %target_local, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp211 = load i32, i32* %i, align 4
    %load_temp212 = load i32, i32* @n, align 4
    %icmp_slt_temp213 = icmp slt i32 %load_temp211, %load_temp212
    br i1 %icmp_slt_temp213, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp214 = load i32, i32* %i, align 4
    %gep_temp215 = getelementptr i32*, i32** %target_local, i32 0, i32 %load_temp214
    %load_temp216 = load i32, i32* %i, align 4
    %gep_temp217 = getelementptr i32*, i32** %src_local, i32 0, i32 %load_temp216
    %load_temp218 = load i32*, i32** %gep_temp217, align 4
    store i32* %load_temp218, i32** %gep_temp215, align 4
    %load_temp219 = load i32, i32* %i, align 4
    %add_temp220 = add i32 %load_temp219, 1
    store i32 %add_temp220, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @calSum(i32* %arr, i32 %stride) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %stride_local = alloca i32, align 4
    store i32 %stride, i32* %stride_local, align 4
    %sum = alloca i32, align 4
    store i32 0, i32* %sum, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp221 = load i32, i32* %i, align 4
    %load_temp222 = load i32, i32* @n, align 4
    %icmp_slt_temp223 = icmp slt i32 %load_temp221, %load_temp222
    br i1 %icmp_slt_temp223, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp224 = load i32, i32* %sum, align 4
    %load_temp225 = load i32, i32* %i, align 4
    %gep_temp226 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp225
    %load_temp227 = load i32*, i32** %gep_temp226, align 4
    %add_temp228 = add i32 %load_temp224, %load_temp227
    store i32 %add_temp228, i32* %sum, align 4
    %load_temp229 = load i32, i32* %i, align 4
    %load_temp230 = load i32, i32* %stride_local, align 4
    %srem_temp231 = srem i32 %load_temp229, %load_temp230
    %load_temp232 = load i32, i32* %stride_local, align 4
    %sub_temp233 = sub i32 %load_temp232, 1
    %icmp_ne_temp234 = icmp ne i32 %srem_temp231, %sub_temp233
    br i1 %icmp_ne_temp234, label %if_then_6, label %if_else_6
if_then_6:
    %load_temp235 = load i32, i32* %i, align 4
    %gep_temp236 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp235
    store i32 0, i32** %gep_temp236, align 4
    br label %if_end_6
if_else_6:
    %load_temp237 = load i32, i32* %i, align 4
    %gep_temp238 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp237
    %load_temp239 = load i32, i32* %sum, align 4
    store i32 %load_temp239, i32** %gep_temp238, align 4
    store i32 0, i32* %sum, align 4
    br label %if_end_6
if_end_6:
    %load_temp240 = load i32, i32* %i, align 4
    %add_temp241 = add i32 %load_temp240, 1
    store i32 %add_temp241, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @avgPooling(i32* %arr, i32 %stride) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %stride_local = alloca i32, align 4
    store i32 %stride, i32* %stride_local, align 4
    %sum = alloca i32, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    store i32 0, i32* %sum, align 4
    %lastnum = alloca i32, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp242 = load i32, i32* %i, align 4
    %load_temp243 = load i32, i32* @n, align 4
    %icmp_slt_temp244 = icmp slt i32 %load_temp242, %load_temp243
    br i1 %icmp_slt_temp244, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp245 = load i32, i32* %i, align 4
    %load_temp246 = load i32, i32* %stride_local, align 4
    %sub_temp247 = sub i32 %load_temp246, 1
    %icmp_slt_temp248 = icmp slt i32 %load_temp245, %sub_temp247
    br i1 %icmp_slt_temp248, label %if_then_7, label %if_else_7
if_then_7:
    %load_temp249 = load i32, i32* %sum, align 4
    %load_temp250 = load i32, i32* %i, align 4
    %gep_temp251 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp250
    %load_temp252 = load i32*, i32** %gep_temp251, align 4
    %add_temp253 = add i32 %load_temp249, %load_temp252
    store i32 %add_temp253, i32* %sum, align 4
    br label %if_end_7
if_else_7:
    %load_temp254 = load i32, i32* %i, align 4
    %load_temp255 = load i32, i32* %stride_local, align 4
    %sub_temp256 = sub i32 %load_temp255, 1
    %icmp_eq_temp257 = icmp eq i32 %load_temp254, %sub_temp256
    br i1 %icmp_eq_temp257, label %if_then_8, label %if_else_8
if_then_8:
    %gep_temp258 = getelementptr i32*, i32** %arr_local, i32 0, i32 0
    %load_temp259 = load i32*, i32** %gep_temp258, align 4
    store i32* %load_temp259, i32* %lastnum, align 4
    %gep_temp260 = getelementptr i32*, i32** %arr_local, i32 0, i32 0
    %load_temp261 = load i32, i32* %sum, align 4
    %load_temp262 = load i32, i32* %stride_local, align 4
    %sdiv_temp263 = sdiv i32 %load_temp261, %load_temp262
    store i32 %sdiv_temp263, i32** %gep_temp260, align 4
    br label %if_end_8
if_else_8:
    %load_temp264 = load i32, i32* %sum, align 4
    %load_temp265 = load i32, i32* %i, align 4
    %gep_temp266 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp265
    %load_temp267 = load i32*, i32** %gep_temp266, align 4
    %add_temp268 = add i32 %load_temp264, %load_temp267
    %load_temp269 = load i32, i32* %lastnum, align 4
    %sub_temp270 = sub i32 %add_temp268, %load_temp269
    store i32 %sub_temp270, i32* %sum, align 4
    %load_temp271 = load i32, i32* %i, align 4
    %load_temp272 = load i32, i32* %stride_local, align 4
    %sub_temp273 = sub i32 %load_temp271, %load_temp272
    %add_temp274 = add i32 %sub_temp273, 1
    %gep_temp275 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp274
    %load_temp276 = load i32*, i32** %gep_temp275, align 4
    store i32* %load_temp276, i32* %lastnum, align 4
    %load_temp277 = load i32, i32* %i, align 4
    %load_temp278 = load i32, i32* %stride_local, align 4
    %sub_temp279 = sub i32 %load_temp277, %load_temp278
    %add_temp280 = add i32 %sub_temp279, 1
    %gep_temp281 = getelementptr i32*, i32** %arr_local, i32 0, i32 %add_temp280
    %load_temp282 = load i32, i32* %sum, align 4
    %load_temp283 = load i32, i32* %stride_local, align 4
    %sdiv_temp284 = sdiv i32 %load_temp282, %load_temp283
    store i32 %sdiv_temp284, i32** %gep_temp281, align 4
    br label %if_end_8
if_end_8:
    br label %if_end_7
if_end_7:
    %load_temp285 = load i32, i32* %i, align 4
    %add_temp286 = add i32 %load_temp285, 1
    store i32 %add_temp286, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp287 = load i32, i32* @n, align 4
    %load_temp288 = load i32, i32* %stride_local, align 4
    %sub_temp289 = sub i32 %load_temp287, %load_temp288
    %add_temp290 = add i32 %sub_temp289, 1
    store i32 %add_temp290, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp291 = load i32, i32* %i, align 4
    %load_temp292 = load i32, i32* @n, align 4
    %icmp_slt_temp293 = icmp slt i32 %load_temp291, %load_temp292
    br i1 %icmp_slt_temp293, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp294 = load i32, i32* %i, align 4
    %gep_temp295 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp294
    store i32 0, i32** %gep_temp295, align 4
    %load_temp296 = load i32, i32* %i, align 4
    %add_temp297 = add i32 %load_temp296, 1
    store i32 %add_temp297, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @main() {
entry:
    store i32 32, i32* @n, align 4
    %arr = alloca [32 x i32], align 4
    %result = alloca [32 x i32], align 4
    %gep_temp298 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 0
    store i32 7, i32* %gep_temp298, align 4
    %gep_temp299 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 1
    store i32 23, i32* %gep_temp299, align 4
    %gep_temp300 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 2
    store i32 89, i32* %gep_temp300, align 4
    %gep_temp301 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 3
    store i32 26, i32* %gep_temp301, align 4
    %gep_temp302 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 4
    store i32 282, i32* %gep_temp302, align 4
    %gep_temp303 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 5
    store i32 254, i32* %gep_temp303, align 4
    %gep_temp304 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 6
    store i32 27, i32* %gep_temp304, align 4
    %gep_temp305 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 7
    store i32 5, i32* %gep_temp305, align 4
    %gep_temp306 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 8
    store i32 83, i32* %gep_temp306, align 4
    %gep_temp307 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 9
    store i32 273, i32* %gep_temp307, align 4
    %gep_temp308 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 10
    store i32 574, i32* %gep_temp308, align 4
    %gep_temp309 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 11
    store i32 905, i32* %gep_temp309, align 4
    %gep_temp310 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 12
    store i32 354, i32* %gep_temp310, align 4
    %gep_temp311 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 13
    store i32 657, i32* %gep_temp311, align 4
    %gep_temp312 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 14
    store i32 935, i32* %gep_temp312, align 4
    %gep_temp313 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 15
    store i32 264, i32* %gep_temp313, align 4
    %gep_temp314 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 16
    store i32 639, i32* %gep_temp314, align 4
    %gep_temp315 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 17
    store i32 459, i32* %gep_temp315, align 4
    %gep_temp316 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 18
    store i32 29, i32* %gep_temp316, align 4
    %gep_temp317 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 19
    store i32 68, i32* %gep_temp317, align 4
    %gep_temp318 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 20
    store i32 929, i32* %gep_temp318, align 4
    %gep_temp319 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 21
    store i32 756, i32* %gep_temp319, align 4
    %gep_temp320 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 22
    store i32 452, i32* %gep_temp320, align 4
    %gep_temp321 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 23
    store i32 279, i32* %gep_temp321, align 4
    %gep_temp322 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 24
    store i32 58, i32* %gep_temp322, align 4
    %gep_temp323 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 25
    store i32 87, i32* %gep_temp323, align 4
    %gep_temp324 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 26
    store i32 96, i32* %gep_temp324, align 4
    %gep_temp325 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 27
    store i32 36, i32* %gep_temp325, align 4
    %gep_temp326 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 28
    store i32 39, i32* %gep_temp326, align 4
    %gep_temp327 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 29
    store i32 28, i32* %gep_temp327, align 4
    %gep_temp328 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 30
    store i32 1, i32* %gep_temp328, align 4
    %gep_temp329 = getelementptr [32 x i32], [32 x i32]* %arr, i32 0, i32 31
    store i32 290, i32* %gep_temp329, align 4
    %t = alloca i32, align 4
    %load_temp330 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp331 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp332 = call i32 @arrCopy([32 x i32] %load_temp330, [32 x i32] %load_temp331)
    store i32 %call_temp332, i32* %t, align 4
    %load_temp333 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp334 = call i32 @revert([32 x i32] %load_temp333)
    store i32 %call_temp334, i32* %t, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp335 = load i32, i32* %i, align 4
    %icmp_slt_temp336 = icmp slt i32 %load_temp335, 32
    br i1 %icmp_slt_temp336, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp337 = load i32, i32* %i, align 4
    %gep_temp338 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp337
    %load_temp339 = load i32, i32* %gep_temp338, align 4
    store i32 %load_temp339, i32* %t, align 4
    %load_temp340 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp340)
    %load_temp341 = load i32, i32* %i, align 4
    %add_temp342 = add i32 %load_temp341, 1
    store i32 %add_temp342, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp343 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp344 = call i32 @bubblesort([32 x i32] %load_temp343)
    store i32 %call_temp344, i32* %t, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp345 = load i32, i32* %i, align 4
    %icmp_slt_temp346 = icmp slt i32 %load_temp345, 32
    br i1 %icmp_slt_temp346, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp347 = load i32, i32* %i, align 4
    %gep_temp348 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp347
    %load_temp349 = load i32, i32* %gep_temp348, align 4
    store i32 %load_temp349, i32* %t, align 4
    %load_temp350 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp350)
    %load_temp351 = load i32, i32* %i, align 4
    %add_temp352 = add i32 %load_temp351, 1
    store i32 %add_temp352, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp353 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp354 = call i32 @getMid([32 x i32] %load_temp353)
    store i32 %call_temp354, i32* %t, align 4
    %load_temp355 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp355)
    %load_temp356 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp357 = call i32 @getMost([32 x i32] %load_temp356)
    store i32 %call_temp357, i32* %t, align 4
    %load_temp358 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp358)
    %load_temp359 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp360 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp361 = call i32 @arrCopy([32 x i32] %load_temp359, [32 x i32] %load_temp360)
    store i32 %call_temp361, i32* %t, align 4
    %load_temp362 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp363 = call i32 @bubblesort([32 x i32] %load_temp362)
    store i32 %call_temp363, i32* %t, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp364 = load i32, i32* %i, align 4
    %icmp_slt_temp365 = icmp slt i32 %load_temp364, 32
    br i1 %icmp_slt_temp365, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp366 = load i32, i32* %i, align 4
    %gep_temp367 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp366
    %load_temp368 = load i32, i32* %gep_temp367, align 4
    store i32 %load_temp368, i32* %t, align 4
    %load_temp369 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp369)
    %load_temp370 = load i32, i32* %i, align 4
    %add_temp371 = add i32 %load_temp370, 1
    store i32 %add_temp371, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp372 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp373 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp374 = call i32 @arrCopy([32 x i32] %load_temp372, [32 x i32] %load_temp373)
    store i32 %call_temp374, i32* %t, align 4
    %load_temp375 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp376 = call i32 @insertsort([32 x i32] %load_temp375)
    store i32 %call_temp376, i32* %t, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp377 = load i32, i32* %i, align 4
    %icmp_slt_temp378 = icmp slt i32 %load_temp377, 32
    br i1 %icmp_slt_temp378, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp379 = load i32, i32* %i, align 4
    %gep_temp380 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp379
    %load_temp381 = load i32, i32* %gep_temp380, align 4
    store i32 %load_temp381, i32* %t, align 4
    %load_temp382 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp382)
    %load_temp383 = load i32, i32* %i, align 4
    %add_temp384 = add i32 %load_temp383, 1
    store i32 %add_temp384, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp385 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp386 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp387 = call i32 @arrCopy([32 x i32] %load_temp385, [32 x i32] %load_temp386)
    store i32 %call_temp387, i32* %t, align 4
    store i32 0, i32* %i, align 4
    store i32 31, i32* %t, align 4
    %load_temp388 = load [32 x i32], [32 x i32]* %result, align 4
    %load_temp389 = load i32, i32* %i, align 4
    %load_temp390 = load i32, i32* %t, align 4
    %call_temp391 = call i32 @QuickSort([32 x i32] %load_temp388, i32 %load_temp389, i32 %load_temp390)
    store i32 %call_temp391, i32* %t, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp392 = load i32, i32* %i, align 4
    %icmp_slt_temp393 = icmp slt i32 %load_temp392, 32
    br i1 %icmp_slt_temp393, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp394 = load i32, i32* %i, align 4
    %gep_temp395 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp394
    %load_temp396 = load i32, i32* %gep_temp395, align 4
    store i32 %load_temp396, i32* %t, align 4
    %load_temp397 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp397)
    %load_temp398 = load i32, i32* %i, align 4
    %add_temp399 = add i32 %load_temp398, 1
    store i32 %add_temp399, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp400 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp401 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp402 = call i32 @arrCopy([32 x i32] %load_temp400, [32 x i32] %load_temp401)
    store i32 %call_temp402, i32* %t, align 4
    %load_temp403 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp404 = call i32 @calSum([32 x i32] %load_temp403, i32 4)
    store i32 %call_temp404, i32* %t, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp405 = load i32, i32* %i, align 4
    %icmp_slt_temp406 = icmp slt i32 %load_temp405, 32
    br i1 %icmp_slt_temp406, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp407 = load i32, i32* %i, align 4
    %gep_temp408 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp407
    %load_temp409 = load i32, i32* %gep_temp408, align 4
    store i32 %load_temp409, i32* %t, align 4
    %load_temp410 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp410)
    %load_temp411 = load i32, i32* %i, align 4
    %add_temp412 = add i32 %load_temp411, 1
    store i32 %add_temp412, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp413 = load [32 x i32], [32 x i32]* %arr, align 4
    %load_temp414 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp415 = call i32 @arrCopy([32 x i32] %load_temp413, [32 x i32] %load_temp414)
    store i32 %call_temp415, i32* %t, align 4
    %load_temp416 = load [32 x i32], [32 x i32]* %result, align 4
    %call_temp417 = call i32 @avgPooling([32 x i32] %load_temp416, i32 3)
    store i32 %call_temp417, i32* %t, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp418 = load i32, i32* %i, align 4
    %icmp_slt_temp419 = icmp slt i32 %load_temp418, 32
    br i1 %icmp_slt_temp419, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp420 = load i32, i32* %i, align 4
    %gep_temp421 = getelementptr [32 x i32], [32 x i32]* %result, i32 0, i32 %load_temp420
    %load_temp422 = load i32, i32* %gep_temp421, align 4
    store i32 %load_temp422, i32* %t, align 4
    %load_temp423 = load i32, i32* %t, align 4
    call void @putint(i32 %load_temp423)
    %load_temp424 = load i32, i32* %i, align 4
    %add_temp425 = add i32 %load_temp424, 1
    store i32 %add_temp425, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

