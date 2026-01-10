; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@arr1 = global [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]] zeroinitializer, align 4
@arr2 = global [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @loop1(i32 %x, i32 %y) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    %e = alloca i32, align 4
    %f = alloca i32, align 4
    %g = alloca i32, align 4
    store i32 0, i32* %a, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %a, align 4
    %load_temp1 = load i32, i32* %x_local, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    %load_temp3 = load i32, i32* %a, align 4
    %load_temp4 = load i32, i32* %y_local, align 4
    %icmp_slt_temp5 = icmp slt i32 %load_temp3, %load_temp4
    %zext_temp6 = zext i1 %icmp_slt_temp2 to i32
    %zext_temp7 = zext i1 %icmp_slt_temp5 to i32
    %mul_temp8 = mul i32 %zext_temp6, %zext_temp7
    %icmp_ne_temp9 = icmp ne i32 %mul_temp8, 0
    br i1 %icmp_ne_temp9, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %b, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp10 = load i32, i32* %b, align 4
    %icmp_slt_temp11 = icmp slt i32 %load_temp10, 2
    br i1 %icmp_slt_temp11, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %c, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp12 = load i32, i32* %c, align 4
    %icmp_slt_temp13 = icmp slt i32 %load_temp12, 3
    br i1 %icmp_slt_temp13, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %d, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp14 = load i32, i32* %d, align 4
    %icmp_slt_temp15 = icmp slt i32 %load_temp14, 4
    br i1 %icmp_slt_temp15, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %e, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp16 = load i32, i32* %e, align 4
    %icmp_slt_temp17 = icmp slt i32 %load_temp16, 5
    br i1 %icmp_slt_temp17, label %while_body_4, label %while_end_4
while_body_4:
    store i32 0, i32* %f, align 4
    br label %while_cond_5
while_cond_5:
    %load_temp18 = load i32, i32* %f, align 4
    %icmp_slt_temp19 = icmp slt i32 %load_temp18, 6
    br i1 %icmp_slt_temp19, label %while_body_5, label %while_end_5
while_body_5:
    store i32 0, i32* %g, align 4
    br label %while_cond_6
while_cond_6:
    %load_temp20 = load i32, i32* %g, align 4
    %icmp_slt_temp21 = icmp slt i32 %load_temp20, 2
    br i1 %icmp_slt_temp21, label %while_body_6, label %while_end_6
while_body_6:
    %load_temp22 = load i32, i32* %a, align 4
    %load_temp23 = load i32, i32* %b, align 4
    %load_temp24 = load i32, i32* %c, align 4
    %load_temp25 = load i32, i32* %d, align 4
    %load_temp26 = load i32, i32* %e, align 4
    %load_temp27 = load i32, i32* %f, align 4
    %load_temp28 = load i32, i32* %g, align 4
    %gep_temp29 = getelementptr [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]], [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]]* @arr1, i32 0, i32 %load_temp22, i32 %load_temp23, i32 %load_temp24, i32 %load_temp25, i32 %load_temp26, i32 %load_temp27, i32 %load_temp28
    %load_temp30 = load i32, i32* %a, align 4
    %load_temp31 = load i32, i32* %b, align 4
    %add_temp32 = add i32 %load_temp30, %load_temp31
    %load_temp33 = load i32, i32* %c, align 4
    %add_temp34 = add i32 %add_temp32, %load_temp33
    %load_temp35 = load i32, i32* %d, align 4
    %add_temp36 = add i32 %add_temp34, %load_temp35
    %load_temp37 = load i32, i32* %e, align 4
    %add_temp38 = add i32 %add_temp36, %load_temp37
    %load_temp39 = load i32, i32* %f, align 4
    %add_temp40 = add i32 %add_temp38, %load_temp39
    %load_temp41 = load i32, i32* %g, align 4
    %add_temp42 = add i32 %add_temp40, %load_temp41
    %load_temp43 = load i32, i32* %x_local, align 4
    %add_temp44 = add i32 %add_temp42, %load_temp43
    %load_temp45 = load i32, i32* %y_local, align 4
    %add_temp46 = add i32 %add_temp44, %load_temp45
    store i32 %add_temp46, i32* %gep_temp29, align 4
    %load_temp47 = load i32, i32* %g, align 4
    %add_temp48 = add i32 %load_temp47, 1
    store i32 %add_temp48, i32* %g, align 4
    br label %while_cond_6
while_end_6:
    %load_temp49 = load i32, i32* %f, align 4
    %add_temp50 = add i32 %load_temp49, 1
    store i32 %add_temp50, i32* %f, align 4
    br label %while_cond_5
while_end_5:
    %load_temp51 = load i32, i32* %e, align 4
    %add_temp52 = add i32 %load_temp51, 1
    store i32 %add_temp52, i32* %e, align 4
    br label %while_cond_4
while_end_4:
    %load_temp53 = load i32, i32* %d, align 4
    %add_temp54 = add i32 %load_temp53, 1
    store i32 %add_temp54, i32* %d, align 4
    br label %while_cond_3
while_end_3:
    %load_temp55 = load i32, i32* %c, align 4
    %add_temp56 = add i32 %load_temp55, 1
    store i32 %add_temp56, i32* %c, align 4
    br label %while_cond_2
while_end_2:
    %load_temp57 = load i32, i32* %b, align 4
    %add_temp58 = add i32 %load_temp57, 1
    store i32 %add_temp58, i32* %b, align 4
    br label %while_cond_1
while_end_1:
    %load_temp59 = load i32, i32* %a, align 4
    %add_temp60 = add i32 %load_temp59, 1
    store i32 %add_temp60, i32* %a, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define void @loop2() {
entry:
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    %e = alloca i32, align 4
    %f = alloca i32, align 4
    %g = alloca i32, align 4
    store i32 0, i32* %a, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp61 = load i32, i32* %a, align 4
    %icmp_slt_temp62 = icmp slt i32 %load_temp61, 10
    br i1 %icmp_slt_temp62, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %b, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp63 = load i32, i32* %b, align 4
    %icmp_slt_temp64 = icmp slt i32 %load_temp63, 2
    br i1 %icmp_slt_temp64, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %c, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp65 = load i32, i32* %c, align 4
    %icmp_slt_temp66 = icmp slt i32 %load_temp65, 3
    br i1 %icmp_slt_temp66, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %d, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp67 = load i32, i32* %d, align 4
    %icmp_slt_temp68 = icmp slt i32 %load_temp67, 2
    br i1 %icmp_slt_temp68, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %e, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp69 = load i32, i32* %e, align 4
    %icmp_slt_temp70 = icmp slt i32 %load_temp69, 4
    br i1 %icmp_slt_temp70, label %while_body_4, label %while_end_4
while_body_4:
    store i32 0, i32* %f, align 4
    br label %while_cond_5
while_cond_5:
    %load_temp71 = load i32, i32* %f, align 4
    %icmp_slt_temp72 = icmp slt i32 %load_temp71, 8
    br i1 %icmp_slt_temp72, label %while_body_5, label %while_end_5
while_body_5:
    store i32 0, i32* %g, align 4
    br label %while_cond_6
while_cond_6:
    %load_temp73 = load i32, i32* %g, align 4
    %icmp_slt_temp74 = icmp slt i32 %load_temp73, 7
    br i1 %icmp_slt_temp74, label %while_body_6, label %while_end_6
while_body_6:
    %load_temp75 = load i32, i32* %a, align 4
    %load_temp76 = load i32, i32* %b, align 4
    %load_temp77 = load i32, i32* %c, align 4
    %load_temp78 = load i32, i32* %d, align 4
    %load_temp79 = load i32, i32* %e, align 4
    %load_temp80 = load i32, i32* %f, align 4
    %load_temp81 = load i32, i32* %g, align 4
    %gep_temp82 = getelementptr [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]], [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]]* @arr2, i32 0, i32 %load_temp75, i32 %load_temp76, i32 %load_temp77, i32 %load_temp78, i32 %load_temp79, i32 %load_temp80, i32 %load_temp81
    %load_temp83 = load i32, i32* %a, align 4
    %load_temp84 = load i32, i32* %b, align 4
    %add_temp85 = add i32 %load_temp83, %load_temp84
    %load_temp86 = load i32, i32* %d, align 4
    %add_temp87 = add i32 %add_temp85, %load_temp86
    %load_temp88 = load i32, i32* %g, align 4
    %add_temp89 = add i32 %add_temp87, %load_temp88
    store i32 %add_temp89, i32* %gep_temp82, align 4
    %load_temp90 = load i32, i32* %g, align 4
    %add_temp91 = add i32 %load_temp90, 1
    store i32 %add_temp91, i32* %g, align 4
    br label %while_cond_6
while_end_6:
    %load_temp92 = load i32, i32* %f, align 4
    %add_temp93 = add i32 %load_temp92, 1
    store i32 %add_temp93, i32* %f, align 4
    br label %while_cond_5
while_end_5:
    %load_temp94 = load i32, i32* %e, align 4
    %add_temp95 = add i32 %load_temp94, 1
    store i32 %add_temp95, i32* %e, align 4
    br label %while_cond_4
while_end_4:
    %load_temp96 = load i32, i32* %d, align 4
    %add_temp97 = add i32 %load_temp96, 1
    store i32 %add_temp97, i32* %d, align 4
    br label %while_cond_3
while_end_3:
    %load_temp98 = load i32, i32* %c, align 4
    %add_temp99 = add i32 %load_temp98, 1
    store i32 %add_temp99, i32* %c, align 4
    br label %while_cond_2
while_end_2:
    %load_temp100 = load i32, i32* %b, align 4
    %add_temp101 = add i32 %load_temp100, 1
    store i32 %add_temp101, i32* %b, align 4
    br label %while_cond_1
while_end_1:
    %load_temp102 = load i32, i32* %a, align 4
    %add_temp103 = add i32 %load_temp102, 1
    store i32 %add_temp103, i32* %a, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @loop3(i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %n) {
entry:
    %h_local = alloca i32, align 4
    store i32 %h, i32* %h_local, align 4
    %i_local = alloca i32, align 4
    store i32 %i, i32* %i_local, align 4
    %j_local = alloca i32, align 4
    store i32 %j, i32* %j_local, align 4
    %k_local = alloca i32, align 4
    store i32 %k, i32* %k_local, align 4
    %l_local = alloca i32, align 4
    store i32 %l, i32* %l_local, align 4
    %m_local = alloca i32, align 4
    store i32 %m, i32* %m_local, align 4
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    %e = alloca i32, align 4
    %f = alloca i32, align 4
    %g = alloca i32, align 4
    %ans = alloca i32, align 4
    store i32 0, i32* %ans, align 4
    store i32 0, i32* %a, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp104 = load i32, i32* %a, align 4
    %icmp_slt_temp105 = icmp slt i32 %load_temp104, 10
    br i1 %icmp_slt_temp105, label %while_body_0, label %while_end_0
while_body_0:
    store i32 0, i32* %b, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp106 = load i32, i32* %b, align 4
    %icmp_slt_temp107 = icmp slt i32 %load_temp106, 100
    br i1 %icmp_slt_temp107, label %while_body_1, label %while_end_1
while_body_1:
    store i32 0, i32* %c, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp108 = load i32, i32* %c, align 4
    %icmp_slt_temp109 = icmp slt i32 %load_temp108, 1000
    br i1 %icmp_slt_temp109, label %while_body_2, label %while_end_2
while_body_2:
    store i32 0, i32* %d, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp110 = load i32, i32* %d, align 4
    %icmp_slt_temp111 = icmp slt i32 %load_temp110, 10000
    br i1 %icmp_slt_temp111, label %while_body_3, label %while_end_3
while_body_3:
    store i32 0, i32* %e, align 4
    br label %while_cond_4
while_cond_4:
    %load_temp112 = load i32, i32* %e, align 4
    %icmp_slt_temp113 = icmp slt i32 %load_temp112, 100000
    br i1 %icmp_slt_temp113, label %while_body_4, label %while_end_4
while_body_4:
    store i32 0, i32* %f, align 4
    br label %while_cond_5
while_cond_5:
    %load_temp114 = load i32, i32* %f, align 4
    %icmp_slt_temp115 = icmp slt i32 %load_temp114, 1000000
    br i1 %icmp_slt_temp115, label %while_body_5, label %while_end_5
while_body_5:
    store i32 0, i32* %g, align 4
    br label %while_cond_6
while_cond_6:
    %load_temp116 = load i32, i32* %g, align 4
    %icmp_slt_temp117 = icmp slt i32 %load_temp116, 10000000
    br i1 %icmp_slt_temp117, label %while_body_6, label %while_end_6
while_body_6:
    %load_temp118 = load i32, i32* %ans, align 4
    %srem_temp119 = srem i32 %load_temp118, 817
    %load_temp120 = load i32, i32* %a, align 4
    %load_temp121 = load i32, i32* %b, align 4
    %load_temp122 = load i32, i32* %c, align 4
    %load_temp123 = load i32, i32* %d, align 4
    %load_temp124 = load i32, i32* %e, align 4
    %load_temp125 = load i32, i32* %f, align 4
    %load_temp126 = load i32, i32* %g, align 4
    %gep_temp127 = getelementptr [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]], [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]]* @arr1, i32 0, i32 %load_temp120, i32 %load_temp121, i32 %load_temp122, i32 %load_temp123, i32 %load_temp124, i32 %load_temp125, i32 %load_temp126
    %load_temp128 = load i32, i32* %gep_temp127, align 4
    %add_temp129 = add i32 %srem_temp119, %load_temp128
    %load_temp130 = load i32, i32* %a, align 4
    %load_temp131 = load i32, i32* %b, align 4
    %load_temp132 = load i32, i32* %c, align 4
    %load_temp133 = load i32, i32* %d, align 4
    %load_temp134 = load i32, i32* %e, align 4
    %load_temp135 = load i32, i32* %f, align 4
    %load_temp136 = load i32, i32* %g, align 4
    %gep_temp137 = getelementptr [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]], [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]]* @arr2, i32 0, i32 %load_temp130, i32 %load_temp131, i32 %load_temp132, i32 %load_temp133, i32 %load_temp134, i32 %load_temp135, i32 %load_temp136
    %load_temp138 = load i32, i32* %gep_temp137, align 4
    %add_temp139 = add i32 %add_temp129, %load_temp138
    store i32 %add_temp139, i32* %ans, align 4
    %load_temp140 = load i32, i32* %g, align 4
    %add_temp141 = add i32 %load_temp140, 1
    store i32 %add_temp141, i32* %g, align 4
    %load_temp142 = load i32, i32* %g, align 4
    %load_temp143 = load i32, i32* %n_local, align 4
    %icmp_sge_temp144 = icmp sge i32 %load_temp142, %load_temp143
    br i1 %icmp_sge_temp144, label %if_then_0, label %if_end_0
if_then_0:
    br label %while_end_6
if_end_0:
    br label %while_cond_6
while_end_6:
    %load_temp145 = load i32, i32* %f, align 4
    %add_temp146 = add i32 %load_temp145, 1
    store i32 %add_temp146, i32* %f, align 4
    %load_temp147 = load i32, i32* %f, align 4
    %load_temp148 = load i32, i32* %m_local, align 4
    %icmp_sge_temp149 = icmp sge i32 %load_temp147, %load_temp148
    br i1 %icmp_sge_temp149, label %if_then_1, label %if_end_1
if_then_1:
    br label %while_end_5
if_end_1:
    br label %while_cond_5
while_end_5:
    %load_temp150 = load i32, i32* %e, align 4
    %add_temp151 = add i32 %load_temp150, 1
    store i32 %add_temp151, i32* %e, align 4
    %load_temp152 = load i32, i32* %e, align 4
    %load_temp153 = load i32, i32* %l_local, align 4
    %icmp_sge_temp154 = icmp sge i32 %load_temp152, %load_temp153
    br i1 %icmp_sge_temp154, label %if_then_2, label %if_end_2
if_then_2:
    br label %while_end_4
if_end_2:
    br label %while_cond_4
while_end_4:
    %load_temp155 = load i32, i32* %d, align 4
    %add_temp156 = add i32 %load_temp155, 1
    store i32 %add_temp156, i32* %d, align 4
    %load_temp157 = load i32, i32* %d, align 4
    %load_temp158 = load i32, i32* %k_local, align 4
    %icmp_sge_temp159 = icmp sge i32 %load_temp157, %load_temp158
    br i1 %icmp_sge_temp159, label %if_then_3, label %if_end_3
if_then_3:
    br label %while_end_3
if_end_3:
    br label %while_cond_3
while_end_3:
    %load_temp160 = load i32, i32* %c, align 4
    %add_temp161 = add i32 %load_temp160, 1
    store i32 %add_temp161, i32* %c, align 4
    %load_temp162 = load i32, i32* %c, align 4
    %load_temp163 = load i32, i32* %j_local, align 4
    %icmp_sge_temp164 = icmp sge i32 %load_temp162, %load_temp163
    br i1 %icmp_sge_temp164, label %if_then_4, label %if_end_4
if_then_4:
    br label %while_end_2
if_end_4:
    br label %while_cond_2
while_end_2:
    %load_temp165 = load i32, i32* %b, align 4
    %add_temp166 = add i32 %load_temp165, 1
    store i32 %add_temp166, i32* %b, align 4
    %load_temp167 = load i32, i32* %b, align 4
    %load_temp168 = load i32, i32* %i_local, align 4
    %icmp_sge_temp169 = icmp sge i32 %load_temp167, %load_temp168
    br i1 %icmp_sge_temp169, label %if_then_5, label %if_end_5
if_then_5:
    br label %while_end_1
if_end_5:
    br label %while_cond_1
while_end_1:
    %load_temp170 = load i32, i32* %a, align 4
    %add_temp171 = add i32 %load_temp170, 1
    store i32 %add_temp171, i32* %a, align 4
    %load_temp172 = load i32, i32* %a, align 4
    %load_temp173 = load i32, i32* %h_local, align 4
    %icmp_sge_temp174 = icmp sge i32 %load_temp172, %load_temp173
    br i1 %icmp_sge_temp174, label %if_then_6, label %if_end_6
if_then_6:
    br label %while_end_0
if_end_6:
    br label %while_cond_0
while_end_0:
    %load_temp175 = load i32, i32* %ans, align 4
    ret i32 %load_temp175
}

define i32 @main() {
entry:
    %x = alloca i32, align 4
    %call_temp176 = call i32 @getint()
    store i32 %call_temp176, i32* %x, align 4
    %y = alloca i32, align 4
    %call_temp177 = call i32 @getint()
    store i32 %call_temp177, i32* %y, align 4
    %h = alloca i32, align 4
    %call_temp178 = call i32 @getint()
    store i32 %call_temp178, i32* %h, align 4
    %i = alloca i32, align 4
    %call_temp179 = call i32 @getint()
    store i32 %call_temp179, i32* %i, align 4
    %j = alloca i32, align 4
    %call_temp180 = call i32 @getint()
    store i32 %call_temp180, i32* %j, align 4
    %k = alloca i32, align 4
    %call_temp181 = call i32 @getint()
    store i32 %call_temp181, i32* %k, align 4
    %l = alloca i32, align 4
    %call_temp182 = call i32 @getint()
    store i32 %call_temp182, i32* %l, align 4
    %m = alloca i32, align 4
    %call_temp183 = call i32 @getint()
    store i32 %call_temp183, i32* %m, align 4
    %n = alloca i32, align 4
    %call_temp184 = call i32 @getint()
    store i32 %call_temp184, i32* %n, align 4
    %load_temp185 = load i32, i32* %x, align 4
    %load_temp186 = load i32, i32* %y, align 4
    call void @loop1(i32 %load_temp185, i32 %load_temp186)
    call void @loop2()
    %load_temp187 = load i32, i32* %h, align 4
    %load_temp188 = load i32, i32* %i, align 4
    %load_temp189 = load i32, i32* %j, align 4
    %load_temp190 = load i32, i32* %k, align 4
    %load_temp191 = load i32, i32* %l, align 4
    %load_temp192 = load i32, i32* %m, align 4
    %load_temp193 = load i32, i32* %n, align 4
    %call_temp194 = call i32 @loop3(i32 %load_temp187, i32 %load_temp188, i32 %load_temp189, i32 %load_temp190, i32 %load_temp191, i32 %load_temp192, i32 %load_temp193)
    ret i32 %call_temp194
}

