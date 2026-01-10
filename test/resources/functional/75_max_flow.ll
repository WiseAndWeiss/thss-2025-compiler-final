; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@INF = constant i32 1879048192, align 4
@size = global [10 x i32] zeroinitializer, align 4
@to = global [10 x [10 x i32]] zeroinitializer, align 4
@cap = global [10 x [10 x i32]] zeroinitializer, align 4
@rev = global [10 x [10 x i32]] zeroinitializer, align 4
@used = global [10 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @my_memset(i32* %arr, i32 %val, i32 %n) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %val_local = alloca i32, align 4
    store i32 %val, i32* %val_local, align 4
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* %n_local, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    br i1 %icmp_slt_temp2, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp3
    %load_temp5 = load i32, i32* %val_local, align 4
    store i32 %load_temp5, i32** %gep_temp4, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %add_temp7 = add i32 %load_temp6, 1
    store i32 %add_temp7, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define void @add_node(i32 %u, i32 %v, i32 %c) {
entry:
    %u_local = alloca i32, align 4
    store i32 %u, i32* %u_local, align 4
    %v_local = alloca i32, align 4
    store i32 %v, i32* %v_local, align 4
    %c_local = alloca i32, align 4
    store i32 %c, i32* %c_local, align 4
    %load_temp8 = load i32, i32* %u_local, align 4
    %load_temp9 = load i32, i32* %u_local, align 4
    %gep_temp10 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp9
    %load_temp11 = load i32, i32* %gep_temp10, align 4
    %gep_temp12 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp8, i32 %load_temp11
    %load_temp13 = load i32, i32* %v_local, align 4
    store i32 %load_temp13, i32* %gep_temp12, align 4
    %load_temp14 = load i32, i32* %u_local, align 4
    %load_temp15 = load i32, i32* %u_local, align 4
    %gep_temp16 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp15
    %load_temp17 = load i32, i32* %gep_temp16, align 4
    %gep_temp18 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp14, i32 %load_temp17
    %load_temp19 = load i32, i32* %c_local, align 4
    store i32 %load_temp19, i32* %gep_temp18, align 4
    %load_temp20 = load i32, i32* %u_local, align 4
    %load_temp21 = load i32, i32* %u_local, align 4
    %gep_temp22 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp21
    %load_temp23 = load i32, i32* %gep_temp22, align 4
    %gep_temp24 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %load_temp20, i32 %load_temp23
    %load_temp25 = load i32, i32* %v_local, align 4
    %gep_temp26 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp25
    %load_temp27 = load i32, i32* %gep_temp26, align 4
    store i32 %load_temp27, i32* %gep_temp24, align 4
    %load_temp28 = load i32, i32* %v_local, align 4
    %load_temp29 = load i32, i32* %v_local, align 4
    %gep_temp30 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp29
    %load_temp31 = load i32, i32* %gep_temp30, align 4
    %gep_temp32 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp28, i32 %load_temp31
    %load_temp33 = load i32, i32* %u_local, align 4
    store i32 %load_temp33, i32* %gep_temp32, align 4
    %load_temp34 = load i32, i32* %v_local, align 4
    %load_temp35 = load i32, i32* %v_local, align 4
    %gep_temp36 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp35
    %load_temp37 = load i32, i32* %gep_temp36, align 4
    %gep_temp38 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp34, i32 %load_temp37
    store i32 0, i32* %gep_temp38, align 4
    %load_temp39 = load i32, i32* %v_local, align 4
    %load_temp40 = load i32, i32* %v_local, align 4
    %gep_temp41 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp40
    %load_temp42 = load i32, i32* %gep_temp41, align 4
    %gep_temp43 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %load_temp39, i32 %load_temp42
    %load_temp44 = load i32, i32* %u_local, align 4
    %gep_temp45 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp44
    %load_temp46 = load i32, i32* %gep_temp45, align 4
    store i32 %load_temp46, i32* %gep_temp43, align 4
    %load_temp47 = load i32, i32* %u_local, align 4
    %gep_temp48 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp47
    %load_temp49 = load i32, i32* %u_local, align 4
    %gep_temp50 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp49
    %load_temp51 = load i32, i32* %gep_temp50, align 4
    %add_temp52 = add i32 %load_temp51, 1
    store i32 %add_temp52, i32* %gep_temp48, align 4
    %load_temp53 = load i32, i32* %v_local, align 4
    %gep_temp54 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp53
    %load_temp55 = load i32, i32* %v_local, align 4
    %gep_temp56 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp55
    %load_temp57 = load i32, i32* %gep_temp56, align 4
    %add_temp58 = add i32 %load_temp57, 1
    store i32 %add_temp58, i32* %gep_temp54, align 4
    ret void
}

define i32 @dfs(i32 %s, i32 %t, i32 %f) {
entry:
    %s_local = alloca i32, align 4
    store i32 %s, i32* %s_local, align 4
    %t_local = alloca i32, align 4
    store i32 %t, i32* %t_local, align 4
    %f_local = alloca i32, align 4
    store i32 %f, i32* %f_local, align 4
    %load_temp59 = load i32, i32* %s_local, align 4
    %load_temp60 = load i32, i32* %t_local, align 4
    %icmp_eq_temp61 = icmp eq i32 %load_temp59, %load_temp60
    br i1 %icmp_eq_temp61, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp62 = load i32, i32* %f_local, align 4
    ret i32 %load_temp62
if_end_0:
    %load_temp63 = load i32, i32* %s_local, align 4
    %gep_temp64 = getelementptr [10 x i32], [10 x i32]* @used, i32 0, i32 %load_temp63
    store i32 1, i32* %gep_temp64, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp65 = load i32, i32* %i, align 4
    %load_temp66 = load i32, i32* %s_local, align 4
    %gep_temp67 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %load_temp66
    %load_temp68 = load i32, i32* %gep_temp67, align 4
    %icmp_slt_temp69 = icmp slt i32 %load_temp65, %load_temp68
    br i1 %icmp_slt_temp69, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp70 = load i32, i32* %s_local, align 4
    %load_temp71 = load i32, i32* %i, align 4
    %gep_temp72 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp70, i32 %load_temp71
    %load_temp73 = load i32, i32* %gep_temp72, align 4
    %gep_temp74 = getelementptr [10 x i32], [10 x i32]* @used, i32 0, i32 %load_temp73
    %load_temp75 = load i32, i32* %gep_temp74, align 4
    %icmp_ne_temp76 = icmp ne i32 %load_temp75, 0
    br i1 %icmp_ne_temp76, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp77 = load i32, i32* %i, align 4
    %add_temp78 = add i32 %load_temp77, 1
    store i32 %add_temp78, i32* %i, align 4
    br label %while_cond_0
if_end_1:
    %load_temp79 = load i32, i32* %s_local, align 4
    %load_temp80 = load i32, i32* %i, align 4
    %gep_temp81 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp79, i32 %load_temp80
    %load_temp82 = load i32, i32* %gep_temp81, align 4
    %icmp_sle_temp83 = icmp sle i32 %load_temp82, 0
    br i1 %icmp_sle_temp83, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp84 = load i32, i32* %i, align 4
    %add_temp85 = add i32 %load_temp84, 1
    store i32 %add_temp85, i32* %i, align 4
    br label %while_cond_0
if_end_2:
    %min_f = alloca i32, align 4
    %load_temp86 = load i32, i32* %f_local, align 4
    %load_temp87 = load i32, i32* %s_local, align 4
    %load_temp88 = load i32, i32* %i, align 4
    %gep_temp89 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp87, i32 %load_temp88
    %load_temp90 = load i32, i32* %gep_temp89, align 4
    %icmp_slt_temp91 = icmp slt i32 %load_temp86, %load_temp90
    br i1 %icmp_slt_temp91, label %if_then_3, label %if_else_3
if_then_3:
    %load_temp92 = load i32, i32* %f_local, align 4
    store i32 %load_temp92, i32* %min_f, align 4
    br label %if_end_3
if_else_3:
    %load_temp93 = load i32, i32* %s_local, align 4
    %load_temp94 = load i32, i32* %i, align 4
    %gep_temp95 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp93, i32 %load_temp94
    %load_temp96 = load i32, i32* %gep_temp95, align 4
    store i32 %load_temp96, i32* %min_f, align 4
    br label %if_end_3
if_end_3:
    %d = alloca i32, align 4
    %load_temp97 = load i32, i32* %s_local, align 4
    %load_temp98 = load i32, i32* %i, align 4
    %gep_temp99 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp97, i32 %load_temp98
    %load_temp100 = load i32, i32* %gep_temp99, align 4
    %load_temp101 = load i32, i32* %t_local, align 4
    %load_temp102 = load i32, i32* %min_f, align 4
    %call_temp103 = call i32 @dfs(i32 %load_temp100, i32 %load_temp101, i32 %load_temp102)
    store i32 %call_temp103, i32* %d, align 4
    %load_temp104 = load i32, i32* %d, align 4
    %icmp_sgt_temp105 = icmp sgt i32 %load_temp104, 0
    br i1 %icmp_sgt_temp105, label %if_then_4, label %if_end_4
if_then_4:
    %load_temp106 = load i32, i32* %s_local, align 4
    %load_temp107 = load i32, i32* %i, align 4
    %gep_temp108 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp106, i32 %load_temp107
    %load_temp109 = load i32, i32* %s_local, align 4
    %load_temp110 = load i32, i32* %i, align 4
    %gep_temp111 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp109, i32 %load_temp110
    %load_temp112 = load i32, i32* %gep_temp111, align 4
    %load_temp113 = load i32, i32* %d, align 4
    %sub_temp114 = sub i32 %load_temp112, %load_temp113
    store i32 %sub_temp114, i32* %gep_temp108, align 4
    %load_temp115 = load i32, i32* %s_local, align 4
    %load_temp116 = load i32, i32* %i, align 4
    %gep_temp117 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp115, i32 %load_temp116
    %load_temp118 = load i32, i32* %gep_temp117, align 4
    %load_temp119 = load i32, i32* %s_local, align 4
    %load_temp120 = load i32, i32* %i, align 4
    %gep_temp121 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %load_temp119, i32 %load_temp120
    %load_temp122 = load i32, i32* %gep_temp121, align 4
    %gep_temp123 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp118, i32 %load_temp122
    %load_temp124 = load i32, i32* %s_local, align 4
    %load_temp125 = load i32, i32* %i, align 4
    %gep_temp126 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %load_temp124, i32 %load_temp125
    %load_temp127 = load i32, i32* %gep_temp126, align 4
    %load_temp128 = load i32, i32* %s_local, align 4
    %load_temp129 = load i32, i32* %i, align 4
    %gep_temp130 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %load_temp128, i32 %load_temp129
    %load_temp131 = load i32, i32* %gep_temp130, align 4
    %gep_temp132 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %load_temp127, i32 %load_temp131
    %load_temp133 = load i32, i32* %gep_temp132, align 4
    %load_temp134 = load i32, i32* %d, align 4
    %add_temp135 = add i32 %load_temp133, %load_temp134
    store i32 %add_temp135, i32* %gep_temp123, align 4
    %load_temp136 = load i32, i32* %d, align 4
    ret i32 %load_temp136
if_end_4:
    %load_temp137 = load i32, i32* %i, align 4
    %add_temp138 = add i32 %load_temp137, 1
    store i32 %add_temp138, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

define i32 @max_flow(i32 %s, i32 %t) {
entry:
    %s_local = alloca i32, align 4
    store i32 %s, i32* %s_local, align 4
    %t_local = alloca i32, align 4
    store i32 %t, i32* %t_local, align 4
    %flow = alloca i32, align 4
    store i32 0, i32* %flow, align 4
    br label %while_cond_0
while_cond_0:
    %icmp_ne_temp139 = icmp ne i32 1, 0
    br i1 %icmp_ne_temp139, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp140 = load [10 x i32], [10 x i32]* @used, align 4
    call void @my_memset([10 x i32] %load_temp140, i32 0, i32 10)
    %f = alloca i32, align 4
    %load_temp141 = load i32, i32* %s_local, align 4
    %load_temp142 = load i32, i32* %t_local, align 4
    %load_temp143 = load i32, i32* @INF, align 4
    %call_temp144 = call i32 @dfs(i32 %load_temp141, i32 %load_temp142, i32 %load_temp143)
    store i32 %call_temp144, i32* %f, align 4
    %load_temp145 = load i32, i32* %f, align 4
    %icmp_eq_temp146 = icmp eq i32 %load_temp145, 0
    br i1 %icmp_eq_temp146, label %if_then_5, label %if_end_5
if_then_5:
    %load_temp147 = load i32, i32* %flow, align 4
    ret i32 %load_temp147
if_end_5:
    %load_temp148 = load i32, i32* %flow, align 4
    %load_temp149 = load i32, i32* %f, align 4
    %add_temp150 = add i32 %load_temp148, %load_temp149
    store i32 %add_temp150, i32* %flow, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    %V = alloca i32, align 4
    %E = alloca i32, align 4
    %call_temp151 = call i32 @getint()
    store i32 %call_temp151, i32* %V, align 4
    %call_temp152 = call i32 @getint()
    store i32 %call_temp152, i32* %E, align 4
    %load_temp153 = load [10 x i32], [10 x i32]* @size, align 4
    call void @my_memset([10 x i32] %load_temp153, i32 0, i32 10)
    br label %while_cond_0
while_cond_0:
    %load_temp154 = load i32, i32* %E, align 4
    %icmp_sgt_temp155 = icmp sgt i32 %load_temp154, 0
    br i1 %icmp_sgt_temp155, label %while_body_0, label %while_end_0
while_body_0:
    %u = alloca i32, align 4
    %v = alloca i32, align 4
    %call_temp156 = call i32 @getint()
    store i32 %call_temp156, i32* %u, align 4
    %call_temp157 = call i32 @getint()
    store i32 %call_temp157, i32* %v, align 4
    %c = alloca i32, align 4
    %call_temp158 = call i32 @getint()
    store i32 %call_temp158, i32* %c, align 4
    %load_temp159 = load i32, i32* %u, align 4
    %load_temp160 = load i32, i32* %v, align 4
    %load_temp161 = load i32, i32* %c, align 4
    call void @add_node(i32 %load_temp159, i32 %load_temp160, i32 %load_temp161)
    %load_temp162 = load i32, i32* %E, align 4
    %sub_temp163 = sub i32 %load_temp162, 1
    store i32 %sub_temp163, i32* %E, align 4
    br label %while_cond_0
while_end_0:
    %load_temp164 = load i32, i32* %V, align 4
    %call_temp165 = call i32 @max_flow(i32 1, i32 %load_temp164)
    call void @putint(i32 %call_temp165)
    call void @putch(i32 10)
    ret i32 0
}

