; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@buf = global [2 x [100 x i32]] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @merge_sort(i32 %l, i32 %r) {
entry:
    %l_local = alloca i32, align 4
    store i32 %l, i32* %l_local, align 4
    %r_local = alloca i32, align 4
    store i32 %r, i32* %r_local, align 4
    %load_temp0 = load i32, i32* %l_local, align 4
    %add_temp1 = add i32 %load_temp0, 1
    %load_temp2 = load i32, i32* %r_local, align 4
    %icmp_sge_temp3 = icmp sge i32 %add_temp1, %load_temp2
    br i1 %icmp_sge_temp3, label %if_then_0, label %if_end_0
if_then_0:
    ret void
if_end_0:
    %mid = alloca i32, align 4
    %load_temp4 = load i32, i32* %l_local, align 4
    %load_temp5 = load i32, i32* %r_local, align 4
    %add_temp6 = add i32 %load_temp4, %load_temp5
    %sdiv_temp7 = sdiv i32 %add_temp6, 2
    store i32 %sdiv_temp7, i32* %mid, align 4
    %load_temp8 = load i32, i32* %l_local, align 4
    %load_temp9 = load i32, i32* %mid, align 4
    call void @merge_sort(i32 %load_temp8, i32 %load_temp9)
    %load_temp10 = load i32, i32* %mid, align 4
    %load_temp11 = load i32, i32* %r_local, align 4
    call void @merge_sort(i32 %load_temp10, i32 %load_temp11)
    %i = alloca i32, align 4
    %load_temp12 = load i32, i32* %l_local, align 4
    store i32 %load_temp12, i32* %i, align 4
    %j = alloca i32, align 4
    %load_temp13 = load i32, i32* %mid, align 4
    store i32 %load_temp13, i32* %j, align 4
    %k = alloca i32, align 4
    %load_temp14 = load i32, i32* %l_local, align 4
    store i32 %load_temp14, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp15 = load i32, i32* %i, align 4
    %load_temp16 = load i32, i32* %mid, align 4
    %icmp_slt_temp17 = icmp slt i32 %load_temp15, %load_temp16
    %load_temp18 = load i32, i32* %j, align 4
    %load_temp19 = load i32, i32* %r_local, align 4
    %icmp_slt_temp20 = icmp slt i32 %load_temp18, %load_temp19
    %zext_temp21 = zext i1 %icmp_slt_temp17 to i32
    %zext_temp22 = zext i1 %icmp_slt_temp20 to i32
    %mul_temp23 = mul i32 %zext_temp21, %zext_temp22
    %icmp_ne_temp24 = icmp ne i32 %mul_temp23, 0
    br i1 %icmp_ne_temp24, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp25 = load i32, i32* %i, align 4
    %gep_temp26 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp25
    %load_temp27 = load i32, i32* %gep_temp26, align 4
    %load_temp28 = load i32, i32* %j, align 4
    %gep_temp29 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp28
    %load_temp30 = load i32, i32* %gep_temp29, align 4
    %icmp_slt_temp31 = icmp slt i32 %load_temp27, %load_temp30
    br i1 %icmp_slt_temp31, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp32 = load i32, i32* %k, align 4
    %gep_temp33 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %load_temp32
    %load_temp34 = load i32, i32* %i, align 4
    %gep_temp35 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp34
    %load_temp36 = load i32, i32* %gep_temp35, align 4
    store i32 %load_temp36, i32* %gep_temp33, align 4
    %load_temp37 = load i32, i32* %i, align 4
    %add_temp38 = add i32 %load_temp37, 1
    store i32 %add_temp38, i32* %i, align 4
    br label %if_end_1
if_else_1:
    %load_temp39 = load i32, i32* %k, align 4
    %gep_temp40 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %load_temp39
    %load_temp41 = load i32, i32* %j, align 4
    %gep_temp42 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp41
    %load_temp43 = load i32, i32* %gep_temp42, align 4
    store i32 %load_temp43, i32* %gep_temp40, align 4
    %load_temp44 = load i32, i32* %j, align 4
    %add_temp45 = add i32 %load_temp44, 1
    store i32 %add_temp45, i32* %j, align 4
    br label %if_end_1
if_end_1:
    %load_temp46 = load i32, i32* %k, align 4
    %add_temp47 = add i32 %load_temp46, 1
    store i32 %add_temp47, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp48 = load i32, i32* %i, align 4
    %load_temp49 = load i32, i32* %mid, align 4
    %icmp_slt_temp50 = icmp slt i32 %load_temp48, %load_temp49
    br i1 %icmp_slt_temp50, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp51 = load i32, i32* %k, align 4
    %gep_temp52 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %load_temp51
    %load_temp53 = load i32, i32* %i, align 4
    %gep_temp54 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp53
    %load_temp55 = load i32, i32* %gep_temp54, align 4
    store i32 %load_temp55, i32* %gep_temp52, align 4
    %load_temp56 = load i32, i32* %i, align 4
    %add_temp57 = add i32 %load_temp56, 1
    store i32 %add_temp57, i32* %i, align 4
    %load_temp58 = load i32, i32* %k, align 4
    %add_temp59 = add i32 %load_temp58, 1
    store i32 %add_temp59, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp60 = load i32, i32* %j, align 4
    %load_temp61 = load i32, i32* %r_local, align 4
    %icmp_slt_temp62 = icmp slt i32 %load_temp60, %load_temp61
    br i1 %icmp_slt_temp62, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp63 = load i32, i32* %k, align 4
    %gep_temp64 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %load_temp63
    %load_temp65 = load i32, i32* %j, align 4
    %gep_temp66 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp65
    %load_temp67 = load i32, i32* %gep_temp66, align 4
    store i32 %load_temp67, i32* %gep_temp64, align 4
    %load_temp68 = load i32, i32* %j, align 4
    %add_temp69 = add i32 %load_temp68, 1
    store i32 %add_temp69, i32* %j, align 4
    %load_temp70 = load i32, i32* %k, align 4
    %add_temp71 = add i32 %load_temp70, 1
    store i32 %add_temp71, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp72 = load i32, i32* %l_local, align 4
    %load_temp73 = load i32, i32* %r_local, align 4
    %icmp_slt_temp74 = icmp slt i32 %load_temp72, %load_temp73
    br i1 %icmp_slt_temp74, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp75 = load i32, i32* %l_local, align 4
    %gep_temp76 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0, i32 %load_temp75
    %load_temp77 = load i32, i32* %l_local, align 4
    %gep_temp78 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1, i32 %load_temp77
    %load_temp79 = load i32, i32* %gep_temp78, align 4
    store i32 %load_temp79, i32* %gep_temp76, align 4
    %load_temp80 = load i32, i32* %l_local, align 4
    %add_temp81 = add i32 %load_temp80, 1
    store i32 %add_temp81, i32* %l_local, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    %n = alloca i32, align 4
    %gep_temp82 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
    %load_temp83 = load [100 x i32], [100 x i32]* %gep_temp82, align 4
    %call_temp84 = call i32 @getarray([100 x i32] %load_temp83)
    store i32 %call_temp84, i32* %n, align 4
    %load_temp85 = load i32, i32* %n, align 4
    call void @merge_sort(i32 0, i32 %load_temp85)
    %load_temp86 = load i32, i32* %n, align 4
    %gep_temp87 = getelementptr [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
    %load_temp88 = load [100 x i32], [100 x i32]* %gep_temp87, align 4
    call void @putarray(i32 %load_temp86, [100 x i32] %load_temp88)
    ret i32 0
}

