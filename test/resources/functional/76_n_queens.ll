; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@ans = global [50 x i32] zeroinitializer, align 4
@sum = global i32 0, align 4
@n = global i32 0, align 4
@row = global [50 x i32] zeroinitializer, align 4
@line1 = global [50 x i32] zeroinitializer, align 4
@line2 = global [100 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @printans() {
entry:
    %load_temp0 = load i32, i32* @sum, align 4
    %add_temp1 = add i32 %load_temp0, 1
    store i32 %add_temp1, i32* @sum, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp2 = load i32, i32* %i, align 4
    %load_temp3 = load i32, i32* @n, align 4
    %icmp_sle_temp4 = icmp sle i32 %load_temp2, %load_temp3
    br i1 %icmp_sle_temp4, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp5 = load i32, i32* %i, align 4
    %gep_temp6 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %load_temp5
    %load_temp7 = load i32, i32* %gep_temp6, align 4
    call void @putint(i32 %load_temp7)
    %load_temp8 = load i32, i32* %i, align 4
    %load_temp9 = load i32, i32* @n, align 4
    %icmp_eq_temp10 = icmp eq i32 %load_temp8, %load_temp9
    br i1 %icmp_eq_temp10, label %if_then_0, label %if_else_0
if_then_0:
    call void @putch(i32 10)
    ret void
if_else_0:
    call void @putch(i32 32)
    br label %if_end_0
if_end_0:
    %load_temp11 = load i32, i32* %i, align 4
    %add_temp12 = add i32 %load_temp11, 1
    store i32 %add_temp12, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define void @f(i32 %step) {
entry:
    %step_local = alloca i32, align 4
    store i32 %step, i32* %step_local, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp13 = load i32, i32* %i, align 4
    %load_temp14 = load i32, i32* @n, align 4
    %icmp_sle_temp15 = icmp sle i32 %load_temp13, %load_temp14
    br i1 %icmp_sle_temp15, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp16 = load i32, i32* %i, align 4
    %gep_temp17 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %load_temp16
    %load_temp18 = load i32, i32* %gep_temp17, align 4
    %icmp_ne_temp19 = icmp ne i32 %load_temp18, 1
    %load_temp20 = load i32, i32* %step_local, align 4
    %load_temp21 = load i32, i32* %i, align 4
    %add_temp22 = add i32 %load_temp20, %load_temp21
    %gep_temp23 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %add_temp22
    %load_temp24 = load i32, i32* %gep_temp23, align 4
    %icmp_eq_temp25 = icmp eq i32 %load_temp24, 0
    %zext_temp26 = zext i1 %icmp_ne_temp19 to i32
    %zext_temp27 = zext i1 %icmp_eq_temp25 to i32
    %mul_temp28 = mul i32 %zext_temp26, %zext_temp27
    %icmp_ne_temp29 = icmp ne i32 %mul_temp28, 0
    %load_temp30 = load i32, i32* @n, align 4
    %load_temp31 = load i32, i32* %step_local, align 4
    %add_temp32 = add i32 %load_temp30, %load_temp31
    %load_temp33 = load i32, i32* %i, align 4
    %sub_temp34 = sub i32 %add_temp32, %load_temp33
    %gep_temp35 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %sub_temp34
    %load_temp36 = load i32, i32* %gep_temp35, align 4
    %icmp_eq_temp37 = icmp eq i32 %load_temp36, 0
    %zext_temp38 = zext i1 %icmp_ne_temp29 to i32
    %zext_temp39 = zext i1 %icmp_eq_temp37 to i32
    %mul_temp40 = mul i32 %zext_temp38, %zext_temp39
    %icmp_ne_temp41 = icmp ne i32 %mul_temp40, 0
    br i1 %icmp_ne_temp41, label %if_then_1, label %if_end_1
if_then_1:
    %load_temp42 = load i32, i32* %step_local, align 4
    %gep_temp43 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %load_temp42
    %load_temp44 = load i32, i32* %i, align 4
    store i32 %load_temp44, i32* %gep_temp43, align 4
    %load_temp45 = load i32, i32* %step_local, align 4
    %load_temp46 = load i32, i32* @n, align 4
    %icmp_eq_temp47 = icmp eq i32 %load_temp45, %load_temp46
    br i1 %icmp_eq_temp47, label %if_then_2, label %if_end_2
if_then_2:
    call void @printans()
    br label %if_end_2
if_end_2:
    %load_temp48 = load i32, i32* %i, align 4
    %gep_temp49 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %load_temp48
    store i32 1, i32* %gep_temp49, align 4
    %load_temp50 = load i32, i32* %step_local, align 4
    %load_temp51 = load i32, i32* %i, align 4
    %add_temp52 = add i32 %load_temp50, %load_temp51
    %gep_temp53 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %add_temp52
    store i32 1, i32* %gep_temp53, align 4
    %load_temp54 = load i32, i32* @n, align 4
    %load_temp55 = load i32, i32* %step_local, align 4
    %add_temp56 = add i32 %load_temp54, %load_temp55
    %load_temp57 = load i32, i32* %i, align 4
    %sub_temp58 = sub i32 %add_temp56, %load_temp57
    %gep_temp59 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %sub_temp58
    store i32 1, i32* %gep_temp59, align 4
    %load_temp60 = load i32, i32* %step_local, align 4
    %add_temp61 = add i32 %load_temp60, 1
    call void @f(i32 %add_temp61)
    %load_temp62 = load i32, i32* %i, align 4
    %gep_temp63 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %load_temp62
    store i32 0, i32* %gep_temp63, align 4
    %load_temp64 = load i32, i32* %step_local, align 4
    %load_temp65 = load i32, i32* %i, align 4
    %add_temp66 = add i32 %load_temp64, %load_temp65
    %gep_temp67 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %add_temp66
    store i32 0, i32* %gep_temp67, align 4
    %load_temp68 = load i32, i32* @n, align 4
    %load_temp69 = load i32, i32* %step_local, align 4
    %add_temp70 = add i32 %load_temp68, %load_temp69
    %load_temp71 = load i32, i32* %i, align 4
    %sub_temp72 = sub i32 %add_temp70, %load_temp71
    %gep_temp73 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %sub_temp72
    store i32 0, i32* %gep_temp73, align 4
    br label %if_end_1
if_end_1:
    %load_temp74 = load i32, i32* %i, align 4
    %add_temp75 = add i32 %load_temp74, 1
    store i32 %add_temp75, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    %N = alloca i32, align 4
    %call_temp76 = call i32 @getint()
    store i32 %call_temp76, i32* %N, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp77 = load i32, i32* %N, align 4
    %icmp_sgt_temp78 = icmp sgt i32 %load_temp77, 0
    br i1 %icmp_sgt_temp78, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp79 = call i32 @getint()
    store i32 %call_temp79, i32* @n, align 4
    call void @f(i32 1)
    %load_temp80 = load i32, i32* %N, align 4
    %sub_temp81 = sub i32 %load_temp80, 1
    store i32 %sub_temp81, i32* %N, align 4
    br label %while_cond_0
while_end_0:
    %load_temp82 = load i32, i32* @sum, align 4
    ret i32 %load_temp82
}

