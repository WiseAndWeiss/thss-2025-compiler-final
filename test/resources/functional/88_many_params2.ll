; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func(i32 %a, i32** %b, i32 %c, i32* %d, i32 %e, i32 %f, i32* %g, i32 %h, i32 %i) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32**, align 4
    store i32** %b, i32*** %b_local, align 4
    %c_local = alloca i32, align 4
    store i32 %c, i32* %c_local, align 4
    %d_local = alloca i32*, align 4
    store i32* %d, i32** %d_local, align 4
    %e_local = alloca i32, align 4
    store i32 %e, i32* %e_local, align 4
    %f_local = alloca i32, align 4
    store i32 %f, i32* %f_local, align 4
    %g_local = alloca i32*, align 4
    store i32* %g, i32** %g_local, align 4
    %h_local = alloca i32, align 4
    store i32 %h, i32* %h_local, align 4
    %i_local = alloca i32, align 4
    store i32 %i, i32* %i_local, align 4
    %index = alloca i32, align 4
    store i32 0, i32* %index, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %index, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 10
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %a_local, align 4
    %load_temp3 = load i32, i32* %index, align 4
    %gep_temp4 = getelementptr i32**, i32*** %b_local, i32 0, i32 %load_temp2, i32 %load_temp3
    %load_temp5 = load i32**, i32*** %gep_temp4, align 4
    call void @putint(i32** %load_temp5)
    %load_temp6 = load i32, i32* %index, align 4
    %add_temp7 = add i32 %load_temp6, 1
    store i32 %add_temp7, i32* %index, align 4
    br label %while_cond_0
while_end_0:
    call void @putch(i32 10)
    %load_temp8 = load i32, i32* %c_local, align 4
    %gep_temp9 = getelementptr i32*, i32** %d_local, i32 0, i32 %load_temp8
    %load_temp10 = load i32*, i32** %gep_temp9, align 4
    call void @putint(i32* %load_temp10)
    call void @putch(i32 10)
    br label %while_cond_0
while_cond_0:
    %load_temp11 = load i32, i32* %i_local, align 4
    %icmp_slt_temp12 = icmp slt i32 %load_temp11, 10
    br i1 %icmp_slt_temp12, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp13 = load i32, i32* %i_local, align 4
    %gep_temp14 = getelementptr i32*, i32** %g_local, i32 0, i32 %load_temp13
    %load_temp15 = load i32, i32* %h_local, align 4
    %mul_temp16 = mul i32 %load_temp15, 128875
    %srem_temp17 = srem i32 %mul_temp16, 3724
    store i32 %srem_temp17, i32** %gep_temp14, align 4
    %load_temp18 = load i32, i32* %i_local, align 4
    %add_temp19 = add i32 %load_temp18, 1
    store i32 %add_temp19, i32* %i_local, align 4
    %load_temp20 = load i32, i32* %h_local, align 4
    %add_temp21 = add i32 %load_temp20, 7
    store i32 %add_temp21, i32* %h_local, align 4
    br label %while_cond_0
while_end_0:
    %load_temp22 = load i32, i32* %e_local, align 4
    %load_temp23 = load i32, i32* %f_local, align 4
    %add_temp24 = add i32 %load_temp22, %load_temp23
    ret i32 %add_temp24
}

define i32 @main() {
entry:
    %a = alloca [61 x [67 x i32]], align 4
    %b = alloca [53 x [59 x i32]], align 4
    %gep_temp25 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 1
    store i32 6, i32* %gep_temp25, align 4
    %gep_temp26 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 3
    store i32 7, i32* %gep_temp26, align 4
    %gep_temp27 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 4
    store i32 4, i32* %gep_temp27, align 4
    %gep_temp28 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 7
    store i32 9, i32* %gep_temp28, align 4
    %gep_temp29 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 11
    store i32 11, i32* %gep_temp29, align 4
    %gep_temp30 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 1
    store i32 1, i32* %gep_temp30, align 4
    %gep_temp31 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 2
    store i32 2, i32* %gep_temp31, align 4
    %gep_temp32 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 3
    store i32 3, i32* %gep_temp32, align 4
    %gep_temp33 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 9
    store i32 9, i32* %gep_temp33, align 4
    %ret = alloca i32, align 4
    %gep_temp34 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 1
    %load_temp35 = load i32, i32* %gep_temp34, align 4
    %load_temp36 = load [53 x [59 x i32]], [53 x [59 x i32]]* %b, align 4
    %gep_temp37 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17, i32 3
    %load_temp38 = load i32, i32* %gep_temp37, align 4
    %gep_temp39 = getelementptr [61 x [67 x i32]], [61 x [67 x i32]]* %a, i32 0, i32 17
    %load_temp40 = load [67 x i32], [67 x i32]* %gep_temp39, align 4
    %gep_temp41 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 3
    %load_temp42 = load i32, i32* %gep_temp41, align 4
    %gep_temp43 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 0
    %load_temp44 = load i32, i32* %gep_temp43, align 4
    %gep_temp45 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6
    %load_temp46 = load [59 x i32], [59 x i32]* %gep_temp45, align 4
    %gep_temp47 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 34, i32 4
    %load_temp48 = load i32, i32* %gep_temp47, align 4
    %gep_temp49 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 51, i32 18
    %load_temp50 = load i32, i32* %gep_temp49, align 4
    %call_temp51 = call i32 @func(i32 %load_temp35, [53 x [59 x i32]] %load_temp36, i32 %load_temp38, [67 x i32] %load_temp40, i32 %load_temp42, i32 %load_temp44, [59 x i32] %load_temp46, i32 %load_temp48, i32 %load_temp50)
    %mul_temp52 = mul i32 %call_temp51, 3
    store i32 %mul_temp52, i32* %ret, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp53 = load i32, i32* %ret, align 4
    %icmp_sge_temp54 = icmp sge i32 %load_temp53, 0
    br i1 %icmp_sge_temp54, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp55 = load i32, i32* %ret, align 4
    %gep_temp56 = getelementptr [53 x [59 x i32]], [53 x [59 x i32]]* %b, i32 0, i32 6, i32 %load_temp55
    %load_temp57 = load i32, i32* %gep_temp56, align 4
    call void @putint(i32 %load_temp57)
    call void @putch(i32 32)
    %load_temp58 = load i32, i32* %ret, align 4
    %sub_temp59 = sub i32 %load_temp58, 1
    store i32 %sub_temp59, i32* %ret, align 4
    br label %while_cond_0
while_end_0:
    call void @putch(i32 10)
    ret i32 0
}

