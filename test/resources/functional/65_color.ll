; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@maxn = constant i32 18, align 4
@mod = constant i32 1000000007, align 4
@dp = global [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]] zeroinitializer, align 4
@list = global [200 x i32] zeroinitializer, align 4
@cns = global [20 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @equal(i32 %a, i32 %b) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %load_temp0 = load i32, i32* %a_local, align 4
    %load_temp1 = load i32, i32* %b_local, align 4
    %icmp_eq_temp2 = icmp eq i32 %load_temp0, %load_temp1
    br i1 %icmp_eq_temp2, label %if_then_0, label %if_end_0
if_then_0:
    ret i32 1
if_end_0:
    ret i32 0
}

define i32 @dfs(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %last) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %c_local = alloca i32, align 4
    store i32 %c, i32* %c_local, align 4
    %d_local = alloca i32, align 4
    store i32 %d, i32* %d_local, align 4
    %e_local = alloca i32, align 4
    store i32 %e, i32* %e_local, align 4
    %last_local = alloca i32, align 4
    store i32 %last, i32* %last_local, align 4
    %load_temp3 = load i32, i32* %a_local, align 4
    %load_temp4 = load i32, i32* %b_local, align 4
    %load_temp5 = load i32, i32* %c_local, align 4
    %load_temp6 = load i32, i32* %d_local, align 4
    %load_temp7 = load i32, i32* %e_local, align 4
    %load_temp8 = load i32, i32* %last_local, align 4
    %gep_temp9 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %load_temp3, i32 %load_temp4, i32 %load_temp5, i32 %load_temp6, i32 %load_temp7, i32 %load_temp8
    %load_temp10 = load i32, i32* %gep_temp9, align 4
    %sub_temp11 = sub i32 0, 1
    %icmp_ne_temp12 = icmp ne i32 %load_temp10, %sub_temp11
    br i1 %icmp_ne_temp12, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp13 = load i32, i32* %a_local, align 4
    %load_temp14 = load i32, i32* %b_local, align 4
    %load_temp15 = load i32, i32* %c_local, align 4
    %load_temp16 = load i32, i32* %d_local, align 4
    %load_temp17 = load i32, i32* %e_local, align 4
    %load_temp18 = load i32, i32* %last_local, align 4
    %gep_temp19 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %load_temp13, i32 %load_temp14, i32 %load_temp15, i32 %load_temp16, i32 %load_temp17, i32 %load_temp18
    %load_temp20 = load i32, i32* %gep_temp19, align 4
    ret i32 %load_temp20
if_end_1:
    %load_temp21 = load i32, i32* %a_local, align 4
    %load_temp22 = load i32, i32* %b_local, align 4
    %add_temp23 = add i32 %load_temp21, %load_temp22
    %load_temp24 = load i32, i32* %c_local, align 4
    %add_temp25 = add i32 %add_temp23, %load_temp24
    %load_temp26 = load i32, i32* %d_local, align 4
    %add_temp27 = add i32 %add_temp25, %load_temp26
    %load_temp28 = load i32, i32* %e_local, align 4
    %add_temp29 = add i32 %add_temp27, %load_temp28
    %icmp_eq_temp30 = icmp eq i32 %add_temp29, 0
    br i1 %icmp_eq_temp30, label %if_then_2, label %if_end_2
if_then_2:
    ret i32 1
if_end_2:
    %ans = alloca i32, align 4
    store i32 0, i32* %ans, align 4
    %load_temp31 = load i32, i32* %a_local, align 4
    %icmp_ne_temp32 = icmp ne i32 %load_temp31, 0
    br i1 %icmp_ne_temp32, label %if_then_3, label %if_end_3
if_then_3:
    %load_temp33 = load i32, i32* %ans, align 4
    %load_temp34 = load i32, i32* %a_local, align 4
    %load_temp35 = load i32, i32* %last_local, align 4
    %call_temp36 = call i32 @equal(i32 %load_temp35, i32 2)
    %sub_temp37 = sub i32 %load_temp34, %call_temp36
    %load_temp38 = load i32, i32* %a_local, align 4
    %sub_temp39 = sub i32 %load_temp38, 1
    %load_temp40 = load i32, i32* %b_local, align 4
    %load_temp41 = load i32, i32* %c_local, align 4
    %load_temp42 = load i32, i32* %d_local, align 4
    %load_temp43 = load i32, i32* %e_local, align 4
    %call_temp44 = call i32 @dfs(i32 %sub_temp39, i32 %load_temp40, i32 %load_temp41, i32 %load_temp42, i32 %load_temp43, i32 1)
    %mul_temp45 = mul i32 %sub_temp37, %call_temp44
    %add_temp46 = add i32 %load_temp33, %mul_temp45
    %load_temp47 = load i32, i32* @mod, align 4
    %srem_temp48 = srem i32 %add_temp46, %load_temp47
    store i32 %srem_temp48, i32* %ans, align 4
    br label %if_end_3
if_end_3:
    %load_temp49 = load i32, i32* %b_local, align 4
    %icmp_ne_temp50 = icmp ne i32 %load_temp49, 0
    br i1 %icmp_ne_temp50, label %if_then_4, label %if_end_4
if_then_4:
    %load_temp51 = load i32, i32* %ans, align 4
    %load_temp52 = load i32, i32* %b_local, align 4
    %load_temp53 = load i32, i32* %last_local, align 4
    %call_temp54 = call i32 @equal(i32 %load_temp53, i32 3)
    %sub_temp55 = sub i32 %load_temp52, %call_temp54
    %load_temp56 = load i32, i32* %a_local, align 4
    %add_temp57 = add i32 %load_temp56, 1
    %load_temp58 = load i32, i32* %b_local, align 4
    %sub_temp59 = sub i32 %load_temp58, 1
    %load_temp60 = load i32, i32* %c_local, align 4
    %load_temp61 = load i32, i32* %d_local, align 4
    %load_temp62 = load i32, i32* %e_local, align 4
    %call_temp63 = call i32 @dfs(i32 %add_temp57, i32 %sub_temp59, i32 %load_temp60, i32 %load_temp61, i32 %load_temp62, i32 2)
    %mul_temp64 = mul i32 %sub_temp55, %call_temp63
    %add_temp65 = add i32 %load_temp51, %mul_temp64
    %load_temp66 = load i32, i32* @mod, align 4
    %srem_temp67 = srem i32 %add_temp65, %load_temp66
    store i32 %srem_temp67, i32* %ans, align 4
    br label %if_end_4
if_end_4:
    %load_temp68 = load i32, i32* %c_local, align 4
    %icmp_ne_temp69 = icmp ne i32 %load_temp68, 0
    br i1 %icmp_ne_temp69, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp70 = load i32, i32* %ans, align 4
    %load_temp71 = load i32, i32* %c_local, align 4
    %load_temp72 = load i32, i32* %last_local, align 4
    %call_temp73 = call i32 @equal(i32 %load_temp72, i32 4)
    %sub_temp74 = sub i32 %load_temp71, %call_temp73
    %load_temp75 = load i32, i32* %a_local, align 4
    %load_temp76 = load i32, i32* %b_local, align 4
    %add_temp77 = add i32 %load_temp76, 1
    %load_temp78 = load i32, i32* %c_local, align 4
    %sub_temp79 = sub i32 %load_temp78, 1
    %load_temp80 = load i32, i32* %d_local, align 4
    %load_temp81 = load i32, i32* %e_local, align 4
    %call_temp82 = call i32 @dfs(i32 %load_temp75, i32 %add_temp77, i32 %sub_temp79, i32 %load_temp80, i32 %load_temp81, i32 3)
    %mul_temp83 = mul i32 %sub_temp74, %call_temp82
    %add_temp84 = add i32 %load_temp70, %mul_temp83
    %load_temp85 = load i32, i32* @mod, align 4
    %srem_temp86 = srem i32 %add_temp84, %load_temp85
    store i32 %srem_temp86, i32* %ans, align 4
    br label %if_end_5
if_end_5:
    %load_temp87 = load i32, i32* %d_local, align 4
    %icmp_ne_temp88 = icmp ne i32 %load_temp87, 0
    br i1 %icmp_ne_temp88, label %if_then_6, label %if_end_6
if_then_6:
    %load_temp89 = load i32, i32* %ans, align 4
    %load_temp90 = load i32, i32* %d_local, align 4
    %load_temp91 = load i32, i32* %last_local, align 4
    %call_temp92 = call i32 @equal(i32 %load_temp91, i32 5)
    %sub_temp93 = sub i32 %load_temp90, %call_temp92
    %load_temp94 = load i32, i32* %a_local, align 4
    %load_temp95 = load i32, i32* %b_local, align 4
    %load_temp96 = load i32, i32* %c_local, align 4
    %add_temp97 = add i32 %load_temp96, 1
    %load_temp98 = load i32, i32* %d_local, align 4
    %sub_temp99 = sub i32 %load_temp98, 1
    %load_temp100 = load i32, i32* %e_local, align 4
    %call_temp101 = call i32 @dfs(i32 %load_temp94, i32 %load_temp95, i32 %add_temp97, i32 %sub_temp99, i32 %load_temp100, i32 4)
    %mul_temp102 = mul i32 %sub_temp93, %call_temp101
    %add_temp103 = add i32 %load_temp89, %mul_temp102
    %load_temp104 = load i32, i32* @mod, align 4
    %srem_temp105 = srem i32 %add_temp103, %load_temp104
    store i32 %srem_temp105, i32* %ans, align 4
    br label %if_end_6
if_end_6:
    %load_temp106 = load i32, i32* %e_local, align 4
    %icmp_ne_temp107 = icmp ne i32 %load_temp106, 0
    br i1 %icmp_ne_temp107, label %if_then_7, label %if_end_7
if_then_7:
    %load_temp108 = load i32, i32* %ans, align 4
    %load_temp109 = load i32, i32* %e_local, align 4
    %load_temp110 = load i32, i32* %a_local, align 4
    %load_temp111 = load i32, i32* %b_local, align 4
    %load_temp112 = load i32, i32* %c_local, align 4
    %load_temp113 = load i32, i32* %d_local, align 4
    %add_temp114 = add i32 %load_temp113, 1
    %load_temp115 = load i32, i32* %e_local, align 4
    %sub_temp116 = sub i32 %load_temp115, 1
    %call_temp117 = call i32 @dfs(i32 %load_temp110, i32 %load_temp111, i32 %load_temp112, i32 %add_temp114, i32 %sub_temp116, i32 5)
    %mul_temp118 = mul i32 %load_temp109, %call_temp117
    %add_temp119 = add i32 %load_temp108, %mul_temp118
    %load_temp120 = load i32, i32* @mod, align 4
    %srem_temp121 = srem i32 %add_temp119, %load_temp120
    store i32 %srem_temp121, i32* %ans, align 4
    br label %if_end_7
if_end_7:
    %load_temp122 = load i32, i32* %a_local, align 4
    %load_temp123 = load i32, i32* %b_local, align 4
    %load_temp124 = load i32, i32* %c_local, align 4
    %load_temp125 = load i32, i32* %d_local, align 4
    %load_temp126 = load i32, i32* %e_local, align 4
    %load_temp127 = load i32, i32* %last_local, align 4
    %gep_temp128 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %load_temp122, i32 %load_temp123, i32 %load_temp124, i32 %load_temp125, i32 %load_temp126, i32 %load_temp127
    %load_temp129 = load i32, i32* %ans, align 4
    %load_temp130 = load i32, i32* @mod, align 4
    %srem_temp131 = srem i32 %load_temp129, %load_temp130
    store i32 %srem_temp131, i32* %gep_temp128, align 4
    %load_temp132 = load i32, i32* %a_local, align 4
    %load_temp133 = load i32, i32* %b_local, align 4
    %load_temp134 = load i32, i32* %c_local, align 4
    %load_temp135 = load i32, i32* %d_local, align 4
    %load_temp136 = load i32, i32* %e_local, align 4
    %load_temp137 = load i32, i32* %last_local, align 4
    %gep_temp138 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %load_temp132, i32 %load_temp133, i32 %load_temp134, i32 %load_temp135, i32 %load_temp136, i32 %load_temp137
    %load_temp139 = load i32, i32* %gep_temp138, align 4
    ret i32 %load_temp139
}

define i32 @main() {
entry:
    %n = alloca i32, align 4
    %call_temp140 = call i32 @getint()
    store i32 %call_temp140, i32* %n, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp141 = load i32, i32* %i, align 4
    %load_temp142 = load i32, i32* @maxn, align 4
    %icmp_slt_temp143 = icmp slt i32 %load_temp141, %load_temp142
    br i1 %icmp_slt_temp143, label %while_body_0, label %while_end_0
while_body_0:
    %j = alloca i32, align 4
    store i32 0, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp144 = load i32, i32* %j, align 4
    %load_temp145 = load i32, i32* @maxn, align 4
    %icmp_slt_temp146 = icmp slt i32 %load_temp144, %load_temp145
    br i1 %icmp_slt_temp146, label %while_body_1, label %while_end_1
while_body_1:
    %k = alloca i32, align 4
    store i32 0, i32* %k, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp147 = load i32, i32* %k, align 4
    %load_temp148 = load i32, i32* @maxn, align 4
    %icmp_slt_temp149 = icmp slt i32 %load_temp147, %load_temp148
    br i1 %icmp_slt_temp149, label %while_body_2, label %while_end_2
while_body_2:
    %l = alloca i32, align 4
    store i32 0, i32* %l, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp150 = load i32, i32* %l, align 4
    %load_temp151 = load i32, i32* @maxn, align 4
    %icmp_slt_temp152 = icmp slt i32 %load_temp150, %load_temp151
    br i1 %icmp_slt_temp152, label %while_body_3, label %while_end_3
while_body_3:
    %m = alloca i32, align 4
    store i32 0, i32* %m, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp153 = load i32, i32* %m, align 4
    %load_temp154 = load i32, i32* @maxn, align 4
    %icmp_slt_temp155 = icmp slt i32 %load_temp153, %load_temp154
    br i1 %icmp_slt_temp155, label %while_body_4, label %while_end_4
while_body_4:
    %h = alloca i32, align 4
    store i32 0, i32* %h, align 4
    br label %while_cond_5
while_cond_5:
    %load_temp156 = load i32, i32* %h, align 4
    %icmp_slt_temp157 = icmp slt i32 %load_temp156, 7
    br i1 %icmp_slt_temp157, label %while_body_5, label %while_end_5
while_body_5:
    %load_temp158 = load i32, i32* %i, align 4
    %load_temp159 = load i32, i32* %j, align 4
    %load_temp160 = load i32, i32* %k, align 4
    %load_temp161 = load i32, i32* %l, align 4
    %load_temp162 = load i32, i32* %m, align 4
    %load_temp163 = load i32, i32* %h, align 4
    %gep_temp164 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %load_temp158, i32 %load_temp159, i32 %load_temp160, i32 %load_temp161, i32 %load_temp162, i32 %load_temp163
    %sub_temp165 = sub i32 0, 1
    store i32 %sub_temp165, i32* %gep_temp164, align 4
    %load_temp166 = load i32, i32* %h, align 4
    %add_temp167 = add i32 %load_temp166, 1
    store i32 %add_temp167, i32* %h, align 4
    br label %while_cond_5
while_end_5:
    %load_temp168 = load i32, i32* %m, align 4
    %add_temp169 = add i32 %load_temp168, 1
    store i32 %add_temp169, i32* %m, align 4
    br label %while_cond_4
while_end_4:
    %load_temp170 = load i32, i32* %l, align 4
    %add_temp171 = add i32 %load_temp170, 1
    store i32 %add_temp171, i32* %l, align 4
    br label %while_cond_3
while_end_3:
    %load_temp172 = load i32, i32* %k, align 4
    %add_temp173 = add i32 %load_temp172, 1
    store i32 %add_temp173, i32* %k, align 4
    br label %while_cond_2
while_end_2:
    %load_temp174 = load i32, i32* %j, align 4
    %add_temp175 = add i32 %load_temp174, 1
    store i32 %add_temp175, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp176 = load i32, i32* %i, align 4
    %add_temp177 = add i32 %load_temp176, 1
    store i32 %add_temp177, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp178 = load i32, i32* %i, align 4
    %load_temp179 = load i32, i32* %n, align 4
    %icmp_slt_temp180 = icmp slt i32 %load_temp178, %load_temp179
    br i1 %icmp_slt_temp180, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp181 = load i32, i32* %i, align 4
    %gep_temp182 = getelementptr [200 x i32], [200 x i32]* @list, i32 0, i32 %load_temp181
    %call_temp183 = call i32 @getint()
    store i32 %call_temp183, i32* %gep_temp182, align 4
    %load_temp184 = load i32, i32* %i, align 4
    %gep_temp185 = getelementptr [200 x i32], [200 x i32]* @list, i32 0, i32 %load_temp184
    %load_temp186 = load i32, i32* %gep_temp185, align 4
    %gep_temp187 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 %load_temp186
    %load_temp188 = load i32, i32* %i, align 4
    %gep_temp189 = getelementptr [200 x i32], [200 x i32]* @list, i32 0, i32 %load_temp188
    %load_temp190 = load i32, i32* %gep_temp189, align 4
    %gep_temp191 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 %load_temp190
    %load_temp192 = load i32, i32* %gep_temp191, align 4
    %add_temp193 = add i32 %load_temp192, 1
    store i32 %add_temp193, i32* %gep_temp187, align 4
    %load_temp194 = load i32, i32* %i, align 4
    %add_temp195 = add i32 %load_temp194, 1
    store i32 %add_temp195, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %ans = alloca i32, align 4
    %gep_temp196 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 1
    %load_temp197 = load i32, i32* %gep_temp196, align 4
    %gep_temp198 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 2
    %load_temp199 = load i32, i32* %gep_temp198, align 4
    %gep_temp200 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 3
    %load_temp201 = load i32, i32* %gep_temp200, align 4
    %gep_temp202 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 4
    %load_temp203 = load i32, i32* %gep_temp202, align 4
    %gep_temp204 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 5
    %load_temp205 = load i32, i32* %gep_temp204, align 4
    %call_temp206 = call i32 @dfs(i32 %load_temp197, i32 %load_temp199, i32 %load_temp201, i32 %load_temp203, i32 %load_temp205, i32 0)
    store i32 %call_temp206, i32* %ans, align 4
    %load_temp207 = load i32, i32* %ans, align 4
    call void @putint(i32 %load_temp207)
    %load_temp208 = load i32, i32* %ans, align 4
    ret i32 %load_temp208
}

