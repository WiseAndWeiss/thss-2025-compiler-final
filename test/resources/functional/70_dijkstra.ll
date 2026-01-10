; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@INF = constant i32 65535, align 4
@e = global [16 x [16 x i32]] zeroinitializer, align 4
@book = global [16 x i32] zeroinitializer, align 4
@dis = global [16 x i32] zeroinitializer, align 4
@n = global i32 0, align 4
@m = global i32 0, align 4
@v1 = global i32 0, align 4
@v2 = global i32 0, align 4
@w = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @Dijkstra() {
entry:
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* @n, align 4
    %icmp_sle_temp2 = icmp sle i32 %load_temp0, %load_temp1
    br i1 %icmp_sle_temp2, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp3
    %load_temp5 = load i32, i32* %i, align 4
    %gep_temp6 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 1, i32 %load_temp5
    %load_temp7 = load i32, i32* %gep_temp6, align 4
    store i32 %load_temp7, i32* %gep_temp4, align 4
    %load_temp8 = load i32, i32* %i, align 4
    %gep_temp9 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %load_temp8
    store i32 0, i32* %gep_temp9, align 4
    %load_temp10 = load i32, i32* %i, align 4
    %add_temp11 = add i32 %load_temp10, 1
    store i32 %add_temp11, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %gep_temp12 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 1
    store i32 1, i32* %gep_temp12, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp13 = load i32, i32* %i, align 4
    %load_temp14 = load i32, i32* @n, align 4
    %sub_temp15 = sub i32 %load_temp14, 1
    %icmp_sle_temp16 = icmp sle i32 %load_temp13, %sub_temp15
    br i1 %icmp_sle_temp16, label %while_body_0, label %while_end_0
while_body_0:
    %min_num = alloca i32, align 4
    %load_temp17 = load i32, i32* @INF, align 4
    store i32 %load_temp17, i32* %min_num, align 4
    %min_index = alloca i32, align 4
    store i32 0, i32* %min_index, align 4
    %k = alloca i32, align 4
    store i32 1, i32* %k, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp18 = load i32, i32* %k, align 4
    %load_temp19 = load i32, i32* @n, align 4
    %icmp_sle_temp20 = icmp sle i32 %load_temp18, %load_temp19
    br i1 %icmp_sle_temp20, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp21 = load i32, i32* %min_num, align 4
    %load_temp22 = load i32, i32* %k, align 4
    %gep_temp23 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp22
    %load_temp24 = load i32, i32* %gep_temp23, align 4
    %icmp_sgt_temp25 = icmp sgt i32 %load_temp21, %load_temp24
    %load_temp26 = load i32, i32* %k, align 4
    %gep_temp27 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %load_temp26
    %load_temp28 = load i32, i32* %gep_temp27, align 4
    %icmp_eq_temp29 = icmp eq i32 %load_temp28, 0
    %zext_temp30 = zext i1 %icmp_sgt_temp25 to i32
    %zext_temp31 = zext i1 %icmp_eq_temp29 to i32
    %mul_temp32 = mul i32 %zext_temp30, %zext_temp31
    %icmp_ne_temp33 = icmp ne i32 %mul_temp32, 0
    br i1 %icmp_ne_temp33, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp34 = load i32, i32* %k, align 4
    %gep_temp35 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp34
    %load_temp36 = load i32, i32* %gep_temp35, align 4
    store i32 %load_temp36, i32* %min_num, align 4
    %load_temp37 = load i32, i32* %k, align 4
    store i32 %load_temp37, i32* %min_index, align 4
    br label %if_end_0
if_end_0:
    %load_temp38 = load i32, i32* %k, align 4
    %add_temp39 = add i32 %load_temp38, 1
    store i32 %add_temp39, i32* %k, align 4
    br label %while_cond_1
while_end_1:
    %load_temp40 = load i32, i32* %min_index, align 4
    %gep_temp41 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %load_temp40
    store i32 1, i32* %gep_temp41, align 4
    %j = alloca i32, align 4
    store i32 1, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp42 = load i32, i32* %j, align 4
    %load_temp43 = load i32, i32* @n, align 4
    %icmp_sle_temp44 = icmp sle i32 %load_temp42, %load_temp43
    br i1 %icmp_sle_temp44, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp45 = load i32, i32* %min_index, align 4
    %load_temp46 = load i32, i32* %j, align 4
    %gep_temp47 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp45, i32 %load_temp46
    %load_temp48 = load i32, i32* %gep_temp47, align 4
    %load_temp49 = load i32, i32* @INF, align 4
    %icmp_slt_temp50 = icmp slt i32 %load_temp48, %load_temp49
    br i1 %icmp_slt_temp50, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp51 = load i32, i32* %j, align 4
    %gep_temp52 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp51
    %load_temp53 = load i32, i32* %gep_temp52, align 4
    %load_temp54 = load i32, i32* %min_index, align 4
    %gep_temp55 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp54
    %load_temp56 = load i32, i32* %gep_temp55, align 4
    %load_temp57 = load i32, i32* %min_index, align 4
    %load_temp58 = load i32, i32* %j, align 4
    %gep_temp59 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp57, i32 %load_temp58
    %load_temp60 = load i32, i32* %gep_temp59, align 4
    %add_temp61 = add i32 %load_temp56, %load_temp60
    %icmp_sgt_temp62 = icmp sgt i32 %load_temp53, %add_temp61
    br i1 %icmp_sgt_temp62, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp63 = load i32, i32* %j, align 4
    %gep_temp64 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp63
    %load_temp65 = load i32, i32* %min_index, align 4
    %gep_temp66 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp65
    %load_temp67 = load i32, i32* %gep_temp66, align 4
    %load_temp68 = load i32, i32* %min_index, align 4
    %load_temp69 = load i32, i32* %j, align 4
    %gep_temp70 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp68, i32 %load_temp69
    %load_temp71 = load i32, i32* %gep_temp70, align 4
    %add_temp72 = add i32 %load_temp67, %load_temp71
    store i32 %add_temp72, i32* %gep_temp64, align 4
    br label %if_end_2
if_end_2:
    br label %if_end_1
if_end_1:
    %load_temp73 = load i32, i32* %j, align 4
    %add_temp74 = add i32 %load_temp73, 1
    store i32 %add_temp74, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp75 = load i32, i32* %i, align 4
    %add_temp76 = add i32 %load_temp75, 1
    store i32 %add_temp76, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    %i = alloca i32, align 4
    %call_temp77 = call i32 @getint()
    store i32 %call_temp77, i32* @n, align 4
    %call_temp78 = call i32 @getint()
    store i32 %call_temp78, i32* @m, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp79 = load i32, i32* %i, align 4
    %load_temp80 = load i32, i32* @n, align 4
    %icmp_sle_temp81 = icmp sle i32 %load_temp79, %load_temp80
    br i1 %icmp_sle_temp81, label %while_body_0, label %while_end_0
while_body_0:
    %j = alloca i32, align 4
    store i32 1, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp82 = load i32, i32* %j, align 4
    %load_temp83 = load i32, i32* @n, align 4
    %icmp_sle_temp84 = icmp sle i32 %load_temp82, %load_temp83
    br i1 %icmp_sle_temp84, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp85 = load i32, i32* %i, align 4
    %load_temp86 = load i32, i32* %j, align 4
    %icmp_eq_temp87 = icmp eq i32 %load_temp85, %load_temp86
    br i1 %icmp_eq_temp87, label %if_then_3, label %if_else_3
if_then_3:
    %load_temp88 = load i32, i32* %i, align 4
    %load_temp89 = load i32, i32* %j, align 4
    %gep_temp90 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp88, i32 %load_temp89
    store i32 0, i32* %gep_temp90, align 4
    br label %if_end_3
if_else_3:
    %load_temp91 = load i32, i32* %i, align 4
    %load_temp92 = load i32, i32* %j, align 4
    %gep_temp93 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp91, i32 %load_temp92
    %load_temp94 = load i32, i32* @INF, align 4
    store i32 %load_temp94, i32* %gep_temp93, align 4
    br label %if_end_3
if_end_3:
    %load_temp95 = load i32, i32* %j, align 4
    %add_temp96 = add i32 %load_temp95, 1
    store i32 %add_temp96, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp97 = load i32, i32* %i, align 4
    %add_temp98 = add i32 %load_temp97, 1
    store i32 %add_temp98, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp99 = load i32, i32* %i, align 4
    %load_temp100 = load i32, i32* @m, align 4
    %icmp_sle_temp101 = icmp sle i32 %load_temp99, %load_temp100
    br i1 %icmp_sle_temp101, label %while_body_0, label %while_end_0
while_body_0:
    %u = alloca i32, align 4
    %call_temp102 = call i32 @getint()
    store i32 %call_temp102, i32* %u, align 4
    %v = alloca i32, align 4
    %call_temp103 = call i32 @getint()
    store i32 %call_temp103, i32* %v, align 4
    %load_temp104 = load i32, i32* %u, align 4
    %load_temp105 = load i32, i32* %v, align 4
    %gep_temp106 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %load_temp104, i32 %load_temp105
    %call_temp107 = call i32 @getint()
    store i32 %call_temp107, i32* %gep_temp106, align 4
    %load_temp108 = load i32, i32* %i, align 4
    %add_temp109 = add i32 %load_temp108, 1
    store i32 %add_temp109, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    call void @Dijkstra()
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp110 = load i32, i32* %i, align 4
    %load_temp111 = load i32, i32* @n, align 4
    %icmp_sle_temp112 = icmp sle i32 %load_temp110, %load_temp111
    br i1 %icmp_sle_temp112, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp113 = load i32, i32* %i, align 4
    %gep_temp114 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %load_temp113
    %load_temp115 = load i32, i32* %gep_temp114, align 4
    call void @putint(i32 %load_temp115)
    call void @putch(i32 32)
    %load_temp116 = load i32, i32* %i, align 4
    %add_temp117 = add i32 %load_temp116, 1
    store i32 %add_temp117, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    call void @putch(i32 10)
    ret i32 0
}

