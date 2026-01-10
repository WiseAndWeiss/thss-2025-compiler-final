; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@TOKEN_NUM = constant i32 0, align 4
@TOKEN_OTHER = constant i32 1, align 4
@last_char = global i32 32, align 4
@num = global i32 0, align 4
@other = global i32 0, align 4
@cur_token = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @next_char() {
entry:
    %call_temp0 = call i32 @getch()
    store i32 %call_temp0, i32* @last_char, align 4
    %load_temp1 = load i32, i32* @last_char, align 4
    ret i32 %load_temp1
}

define i32 @is_space(i32 %c) {
entry:
    %c_local = alloca i32, align 4
    store i32 %c, i32* %c_local, align 4
    %load_temp2 = load i32, i32* %c_local, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 32
    %load_temp4 = load i32, i32* %c_local, align 4
    %icmp_eq_temp5 = icmp eq i32 %load_temp4, 10
    %zext_temp6 = zext i1 %icmp_eq_temp3 to i32
    %zext_temp7 = zext i1 %icmp_eq_temp5 to i32
    %add_temp8 = add i32 %zext_temp6, %zext_temp7
    %icmp_ne_temp9 = icmp ne i32 %add_temp8, 0
    br i1 %icmp_ne_temp9, label %if_then_0, label %if_else_0
if_then_0:
    ret i32 1
if_else_0:
    ret i32 0
if_end_0:
    ret void
}

define i32 @is_num(i32 %c) {
entry:
    %c_local = alloca i32, align 4
    store i32 %c, i32* %c_local, align 4
    %load_temp10 = load i32, i32* %c_local, align 4
    %icmp_sge_temp11 = icmp sge i32 %load_temp10, 48
    %load_temp12 = load i32, i32* %c_local, align 4
    %icmp_sle_temp13 = icmp sle i32 %load_temp12, 57
    %zext_temp14 = zext i1 %icmp_sge_temp11 to i32
    %zext_temp15 = zext i1 %icmp_sle_temp13 to i32
    %mul_temp16 = mul i32 %zext_temp14, %zext_temp15
    %icmp_ne_temp17 = icmp ne i32 %mul_temp16, 0
    br i1 %icmp_ne_temp17, label %if_then_1, label %if_else_1
if_then_1:
    ret i32 1
if_else_1:
    ret i32 0
if_end_1:
    ret void
}

define i32 @next_token() {
entry:
    br label %while_cond_0
while_cond_0:
    %load_temp18 = load i32, i32* @last_char, align 4
    %call_temp19 = call i32 @is_space(i32 %load_temp18)
    %icmp_ne_temp20 = icmp ne i32 %call_temp19, 0
    br i1 %icmp_ne_temp20, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp21 = call i32 @next_char()
    br label %while_cond_0
while_end_0:
    %load_temp22 = load i32, i32* @last_char, align 4
    %call_temp23 = call i32 @is_num(i32 %load_temp22)
    %icmp_ne_temp24 = icmp ne i32 %call_temp23, 0
    br i1 %icmp_ne_temp24, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp25 = load i32, i32* @last_char, align 4
    %sub_temp26 = sub i32 %load_temp25, 48
    store i32 %sub_temp26, i32* @num, align 4
    br label %while_cond_0
while_cond_0:
    %call_temp27 = call i32 @next_char()
    %call_temp28 = call i32 @is_num(i32 %call_temp27)
    %icmp_ne_temp29 = icmp ne i32 %call_temp28, 0
    br i1 %icmp_ne_temp29, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp30 = load i32, i32* @num, align 4
    %mul_temp31 = mul i32 %load_temp30, 10
    %load_temp32 = load i32, i32* @last_char, align 4
    %add_temp33 = add i32 %mul_temp31, %load_temp32
    %sub_temp34 = sub i32 %add_temp33, 48
    store i32 %sub_temp34, i32* @num, align 4
    br label %while_cond_0
while_end_0:
    %load_temp35 = load i32, i32* @TOKEN_NUM, align 4
    store i32 %load_temp35, i32* @cur_token, align 4
    br label %if_end_2
if_else_2:
    %load_temp36 = load i32, i32* @last_char, align 4
    store i32 %load_temp36, i32* @other, align 4
    %call_temp37 = call i32 @next_char()
    %load_temp38 = load i32, i32* @TOKEN_OTHER, align 4
    store i32 %load_temp38, i32* @cur_token, align 4
    br label %if_end_2
if_end_2:
    %load_temp39 = load i32, i32* @cur_token, align 4
    ret i32 %load_temp39
}

define i32 @panic() {
entry:
    call void @putch(i32 112)
    call void @putch(i32 97)
    call void @putch(i32 110)
    call void @putch(i32 105)
    call void @putch(i32 99)
    call void @putch(i32 33)
    call void @putch(i32 10)
    %sub_temp40 = sub i32 0, 1
    ret i32 %sub_temp40
}

define i32 @get_op_prec(i32 %op) {
entry:
    %op_local = alloca i32, align 4
    store i32 %op, i32* %op_local, align 4
    %load_temp41 = load i32, i32* %op_local, align 4
    %icmp_eq_temp42 = icmp eq i32 %load_temp41, 43
    %load_temp43 = load i32, i32* %op_local, align 4
    %icmp_eq_temp44 = icmp eq i32 %load_temp43, 45
    %zext_temp45 = zext i1 %icmp_eq_temp42 to i32
    %zext_temp46 = zext i1 %icmp_eq_temp44 to i32
    %add_temp47 = add i32 %zext_temp45, %zext_temp46
    %icmp_ne_temp48 = icmp ne i32 %add_temp47, 0
    br i1 %icmp_ne_temp48, label %if_then_3, label %if_end_3
if_then_3:
    ret i32 10
if_end_3:
    %load_temp49 = load i32, i32* %op_local, align 4
    %icmp_eq_temp50 = icmp eq i32 %load_temp49, 42
    %load_temp51 = load i32, i32* %op_local, align 4
    %icmp_eq_temp52 = icmp eq i32 %load_temp51, 47
    %zext_temp53 = zext i1 %icmp_eq_temp50 to i32
    %zext_temp54 = zext i1 %icmp_eq_temp52 to i32
    %add_temp55 = add i32 %zext_temp53, %zext_temp54
    %icmp_ne_temp56 = icmp ne i32 %add_temp55, 0
    %load_temp57 = load i32, i32* %op_local, align 4
    %icmp_eq_temp58 = icmp eq i32 %load_temp57, 37
    %zext_temp59 = zext i1 %icmp_ne_temp56 to i32
    %zext_temp60 = zext i1 %icmp_eq_temp58 to i32
    %add_temp61 = add i32 %zext_temp59, %zext_temp60
    %icmp_ne_temp62 = icmp ne i32 %add_temp61, 0
    br i1 %icmp_ne_temp62, label %if_then_4, label %if_end_4
if_then_4:
    ret i32 20
if_end_4:
    ret i32 0
}

define void @stack_push(i32* %s, i32 %v) {
entry:
    %s_local = alloca i32*, align 4
    store i32* %s, i32** %s_local, align 4
    %v_local = alloca i32, align 4
    store i32 %v, i32* %v_local, align 4
    %gep_temp63 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %gep_temp64 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp65 = load i32*, i32** %gep_temp64, align 4
    %add_temp66 = add i32* %load_temp65, 1
    store i32* %add_temp66, i32** %gep_temp63, align 4
    %gep_temp67 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp68 = load i32*, i32** %gep_temp67, align 4
    %gep_temp69 = getelementptr i32*, i32** %s_local, i32 0, i32 %load_temp68
    %load_temp70 = load i32, i32* %v_local, align 4
    store i32 %load_temp70, i32** %gep_temp69, align 4
    ret void
}

define i32 @stack_pop(i32* %s) {
entry:
    %s_local = alloca i32*, align 4
    store i32* %s, i32** %s_local, align 4
    %last = alloca i32, align 4
    %gep_temp71 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp72 = load i32*, i32** %gep_temp71, align 4
    %gep_temp73 = getelementptr i32*, i32** %s_local, i32 0, i32 %load_temp72
    %load_temp74 = load i32*, i32** %gep_temp73, align 4
    store i32* %load_temp74, i32* %last, align 4
    %gep_temp75 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %gep_temp76 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp77 = load i32*, i32** %gep_temp76, align 4
    %sub_temp78 = sub i32* %load_temp77, 1
    store i32* %sub_temp78, i32** %gep_temp75, align 4
    %load_temp79 = load i32, i32* %last, align 4
    ret i32 %load_temp79
}

define i32 @stack_peek(i32* %s) {
entry:
    %s_local = alloca i32*, align 4
    store i32* %s, i32** %s_local, align 4
    %gep_temp80 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp81 = load i32*, i32** %gep_temp80, align 4
    %gep_temp82 = getelementptr i32*, i32** %s_local, i32 0, i32 %load_temp81
    %load_temp83 = load i32*, i32** %gep_temp82, align 4
    ret i32* %load_temp83
}

define i32 @stack_size(i32* %s) {
entry:
    %s_local = alloca i32*, align 4
    store i32* %s, i32** %s_local, align 4
    %gep_temp84 = getelementptr i32*, i32** %s_local, i32 0, i32 0
    %load_temp85 = load i32*, i32** %gep_temp84, align 4
    ret i32* %load_temp85
}

define i32 @eval_op(i32 %op, i32 %lhs, i32 %rhs) {
entry:
    %op_local = alloca i32, align 4
    store i32 %op, i32* %op_local, align 4
    %lhs_local = alloca i32, align 4
    store i32 %lhs, i32* %lhs_local, align 4
    %rhs_local = alloca i32, align 4
    store i32 %rhs, i32* %rhs_local, align 4
    %load_temp86 = load i32, i32* %op_local, align 4
    %icmp_eq_temp87 = icmp eq i32 %load_temp86, 43
    br i1 %icmp_eq_temp87, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp88 = load i32, i32* %lhs_local, align 4
    %load_temp89 = load i32, i32* %rhs_local, align 4
    %add_temp90 = add i32 %load_temp88, %load_temp89
    ret i32 %add_temp90
if_end_5:
    %load_temp91 = load i32, i32* %op_local, align 4
    %icmp_eq_temp92 = icmp eq i32 %load_temp91, 45
    br i1 %icmp_eq_temp92, label %if_then_6, label %if_end_6
if_then_6:
    %load_temp93 = load i32, i32* %lhs_local, align 4
    %load_temp94 = load i32, i32* %rhs_local, align 4
    %sub_temp95 = sub i32 %load_temp93, %load_temp94
    ret i32 %sub_temp95
if_end_6:
    %load_temp96 = load i32, i32* %op_local, align 4
    %icmp_eq_temp97 = icmp eq i32 %load_temp96, 42
    br i1 %icmp_eq_temp97, label %if_then_7, label %if_end_7
if_then_7:
    %load_temp98 = load i32, i32* %lhs_local, align 4
    %load_temp99 = load i32, i32* %rhs_local, align 4
    %mul_temp100 = mul i32 %load_temp98, %load_temp99
    ret i32 %mul_temp100
if_end_7:
    %load_temp101 = load i32, i32* %op_local, align 4
    %icmp_eq_temp102 = icmp eq i32 %load_temp101, 47
    br i1 %icmp_eq_temp102, label %if_then_8, label %if_end_8
if_then_8:
    %load_temp103 = load i32, i32* %lhs_local, align 4
    %load_temp104 = load i32, i32* %rhs_local, align 4
    %sdiv_temp105 = sdiv i32 %load_temp103, %load_temp104
    ret i32 %sdiv_temp105
if_end_8:
    %load_temp106 = load i32, i32* %op_local, align 4
    %icmp_eq_temp107 = icmp eq i32 %load_temp106, 37
    br i1 %icmp_eq_temp107, label %if_then_9, label %if_end_9
if_then_9:
    %load_temp108 = load i32, i32* %lhs_local, align 4
    %load_temp109 = load i32, i32* %rhs_local, align 4
    %srem_temp110 = srem i32 %load_temp108, %load_temp109
    ret i32 %srem_temp110
if_end_9:
    ret i32 0
}

define i32 @eval() {
entry:
    %oprs = alloca [256 x i32], align 4
    %ops = alloca [256 x i32], align 4
    %load_temp111 = load i32, i32* @cur_token, align 4
    %load_temp112 = load i32, i32* @TOKEN_NUM, align 4
    %icmp_ne_temp113 = icmp ne i32 %load_temp111, %load_temp112
    br i1 %icmp_ne_temp113, label %if_then_10, label %if_end_10
if_then_10:
    %call_temp114 = call i32 @panic()
    ret i32 %call_temp114
if_end_10:
    %load_temp115 = load [256 x i32], [256 x i32]* %oprs, align 4
    %load_temp116 = load i32, i32* @num, align 4
    call void @stack_push([256 x i32] %load_temp115, i32 %load_temp116)
    %call_temp117 = call i32 @next_token()
    br label %while_cond_0
while_cond_0:
    %load_temp118 = load i32, i32* @cur_token, align 4
    %load_temp119 = load i32, i32* @TOKEN_OTHER, align 4
    %icmp_eq_temp120 = icmp eq i32 %load_temp118, %load_temp119
    br i1 %icmp_eq_temp120, label %while_body_0, label %while_end_0
while_body_0:
    %op = alloca i32, align 4
    %load_temp121 = load i32, i32* @other, align 4
    store i32 %load_temp121, i32* %op, align 4
    %load_temp122 = load i32, i32* %op, align 4
    %call_temp123 = call i32 @get_op_prec(i32 %load_temp122)
    %icmp_eq_temp124 = icmp eq i32 %call_temp123, 0
    br i1 %icmp_eq_temp124, label %if_then_11, label %if_end_11
if_then_11:
    br label %while_end_0
if_end_11:
    %call_temp125 = call i32 @next_token()
    br label %while_cond_1
while_cond_1:
    %load_temp126 = load [256 x i32], [256 x i32]* %ops, align 4
    %call_temp127 = call i32 @stack_size([256 x i32] %load_temp126)
    %load_temp128 = load [256 x i32], [256 x i32]* %ops, align 4
    %call_temp129 = call i32 @stack_peek([256 x i32] %load_temp128)
    %call_temp130 = call i32 @get_op_prec(i32 %call_temp129)
    %load_temp131 = load i32, i32* %op, align 4
    %call_temp132 = call i32 @get_op_prec(i32 %load_temp131)
    %icmp_sge_temp133 = icmp sge i32 %call_temp130, %call_temp132
    %icmp_ne_temp134 = icmp ne i32 %call_temp127, 0
    %icmp_ne_temp135 = icmp ne i1 %icmp_sge_temp133, 0
    %zext_temp136 = zext i1 %icmp_ne_temp134 to i32
    %zext_temp137 = zext i1 %icmp_ne_temp135 to i32
    %mul_temp138 = mul i32 %zext_temp136, %zext_temp137
    %icmp_ne_temp139 = icmp ne i32 %mul_temp138, 0
    br i1 %icmp_ne_temp139, label %while_body_1, label %while_end_1
while_body_1:
    %cur_op = alloca i32, align 4
    %load_temp140 = load [256 x i32], [256 x i32]* %ops, align 4
    %call_temp141 = call i32 @stack_pop([256 x i32] %load_temp140)
    store i32 %call_temp141, i32* %cur_op, align 4
    %rhs = alloca i32, align 4
    %load_temp142 = load [256 x i32], [256 x i32]* %oprs, align 4
    %call_temp143 = call i32 @stack_pop([256 x i32] %load_temp142)
    store i32 %call_temp143, i32* %rhs, align 4
    %lhs = alloca i32, align 4
    %load_temp144 = load [256 x i32], [256 x i32]* %oprs, align 4
    %call_temp145 = call i32 @stack_pop([256 x i32] %load_temp144)
    store i32 %call_temp145, i32* %lhs, align 4
    %load_temp146 = load [256 x i32], [256 x i32]* %oprs, align 4
    %load_temp147 = load i32, i32* %cur_op, align 4
    %load_temp148 = load i32, i32* %lhs, align 4
    %load_temp149 = load i32, i32* %rhs, align 4
    %call_temp150 = call i32 @eval_op(i32 %load_temp147, i32 %load_temp148, i32 %load_temp149)
    call void @stack_push([256 x i32] %load_temp146, i32 %call_temp150)
    br label %while_cond_1
while_end_1:
    %load_temp151 = load [256 x i32], [256 x i32]* %ops, align 4
    %load_temp152 = load i32, i32* %op, align 4
    call void @stack_push([256 x i32] %load_temp151, i32 %load_temp152)
    %load_temp153 = load i32, i32* @cur_token, align 4
    %load_temp154 = load i32, i32* @TOKEN_NUM, align 4
    %icmp_ne_temp155 = icmp ne i32 %load_temp153, %load_temp154
    br i1 %icmp_ne_temp155, label %if_then_12, label %if_end_12
if_then_12:
    %call_temp156 = call i32 @panic()
    ret i32 %call_temp156
if_end_12:
    %load_temp157 = load [256 x i32], [256 x i32]* %oprs, align 4
    %load_temp158 = load i32, i32* @num, align 4
    call void @stack_push([256 x i32] %load_temp157, i32 %load_temp158)
    %call_temp159 = call i32 @next_token()
    br label %while_cond_0
while_end_0:
    %call_temp160 = call i32 @next_token()
    br label %while_cond_0
while_cond_0:
    %load_temp161 = load [256 x i32], [256 x i32]* %ops, align 4
    %call_temp162 = call i32 @stack_size([256 x i32] %load_temp161)
    %icmp_ne_temp163 = icmp ne i32 %call_temp162, 0
    br i1 %icmp_ne_temp163, label %while_body_0, label %while_end_0
while_body_0:
    %cur_op = alloca i32, align 4
    %load_temp164 = load [256 x i32], [256 x i32]* %ops, align 4
    %call_temp165 = call i32 @stack_pop([256 x i32] %load_temp164)
    store i32 %call_temp165, i32* %cur_op, align 4
    %rhs = alloca i32, align 4
    %load_temp166 = load [256 x i32], [256 x i32]* %oprs, align 4
    %call_temp167 = call i32 @stack_pop([256 x i32] %load_temp166)
    store i32 %call_temp167, i32* %rhs, align 4
    %lhs = alloca i32, align 4
    %load_temp168 = load [256 x i32], [256 x i32]* %oprs, align 4
    %call_temp169 = call i32 @stack_pop([256 x i32] %load_temp168)
    store i32 %call_temp169, i32* %lhs, align 4
    %load_temp170 = load [256 x i32], [256 x i32]* %oprs, align 4
    %load_temp171 = load i32, i32* %cur_op, align 4
    %load_temp172 = load i32, i32* %lhs, align 4
    %load_temp173 = load i32, i32* %rhs, align 4
    %call_temp174 = call i32 @eval_op(i32 %load_temp171, i32 %load_temp172, i32 %load_temp173)
    call void @stack_push([256 x i32] %load_temp170, i32 %call_temp174)
    br label %while_cond_0
while_end_0:
    %load_temp175 = load [256 x i32], [256 x i32]* %oprs, align 4
    %call_temp176 = call i32 @stack_peek([256 x i32] %load_temp175)
    ret i32 %call_temp176
}

define i32 @main() {
entry:
    %count = alloca i32, align 4
    %call_temp177 = call i32 @getint()
    store i32 %call_temp177, i32* %count, align 4
    %call_temp178 = call i32 @getch()
    %call_temp179 = call i32 @next_token()
    br label %while_cond_0
while_cond_0:
    %load_temp180 = load i32, i32* %count, align 4
    %icmp_ne_temp181 = icmp ne i32 %load_temp180, 0
    br i1 %icmp_ne_temp181, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp182 = call i32 @eval()
    call void @putint(i32 %call_temp182)
    call void @putch(i32 10)
    %load_temp183 = load i32, i32* %count, align 4
    %sub_temp184 = sub i32 %load_temp183, 1
    store i32 %sub_temp184, i32* %count, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

