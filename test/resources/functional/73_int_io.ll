; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@ascii_0 = constant i32 48, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @my_getint() {
entry:
    %sum = alloca i32, align 4
    store i32 0, i32* %sum, align 4
    %c = alloca i32, align 4
    br label %while_cond_0
while_cond_0:
    %icmp_ne_temp0 = icmp ne i32 1, 0
    br i1 %icmp_ne_temp0, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp1 = call i32 @getch()
    %load_temp2 = load i32, i32* @ascii_0, align 4
    %sub_temp3 = sub i32 %call_temp1, %load_temp2
    store i32 %sub_temp3, i32* %c, align 4
    %load_temp4 = load i32, i32* %c, align 4
    %icmp_slt_temp5 = icmp slt i32 %load_temp4, 0
    %load_temp6 = load i32, i32* %c, align 4
    %icmp_sgt_temp7 = icmp sgt i32 %load_temp6, 9
    %zext_temp8 = zext i1 %icmp_slt_temp5 to i32
    %zext_temp9 = zext i1 %icmp_sgt_temp7 to i32
    %add_temp10 = add i32 %zext_temp8, %zext_temp9
    %icmp_ne_temp11 = icmp ne i32 %add_temp10, 0
    br i1 %icmp_ne_temp11, label %if_then_0, label %if_else_0
if_then_0:
    br label %while_cond_0
if_else_0:
    br label %while_end_0
if_end_0:
    br label %while_cond_0
while_end_0:
    %load_temp12 = load i32, i32* %c, align 4
    store i32 %load_temp12, i32* %sum, align 4
    br label %while_cond_0
while_cond_0:
    %icmp_ne_temp13 = icmp ne i32 1, 0
    br i1 %icmp_ne_temp13, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp14 = call i32 @getch()
    %load_temp15 = load i32, i32* @ascii_0, align 4
    %sub_temp16 = sub i32 %call_temp14, %load_temp15
    store i32 %sub_temp16, i32* %c, align 4
    %load_temp17 = load i32, i32* %c, align 4
    %icmp_sge_temp18 = icmp sge i32 %load_temp17, 0
    %load_temp19 = load i32, i32* %c, align 4
    %icmp_sle_temp20 = icmp sle i32 %load_temp19, 9
    %zext_temp21 = zext i1 %icmp_sge_temp18 to i32
    %zext_temp22 = zext i1 %icmp_sle_temp20 to i32
    %mul_temp23 = mul i32 %zext_temp21, %zext_temp22
    %icmp_ne_temp24 = icmp ne i32 %mul_temp23, 0
    br i1 %icmp_ne_temp24, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp25 = load i32, i32* %sum, align 4
    %mul_temp26 = mul i32 %load_temp25, 10
    %load_temp27 = load i32, i32* %c, align 4
    %add_temp28 = add i32 %mul_temp26, %load_temp27
    store i32 %add_temp28, i32* %sum, align 4
    br label %if_end_1
if_else_1:
    br label %while_end_0
if_end_1:
    br label %while_cond_0
while_end_0:
    %load_temp29 = load i32, i32* %sum, align 4
    ret i32 %load_temp29
}

define void @my_putint(i32 %a) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b = alloca [16 x i32], align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp30 = load i32, i32* %a_local, align 4
    %icmp_sgt_temp31 = icmp sgt i32 %load_temp30, 0
    br i1 %icmp_sgt_temp31, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp32 = load i32, i32* %i, align 4
    %gep_temp33 = getelementptr [16 x i32], [16 x i32]* %b, i32 0, i32 %load_temp32
    %load_temp34 = load i32, i32* %a_local, align 4
    %srem_temp35 = srem i32 %load_temp34, 10
    %load_temp36 = load i32, i32* @ascii_0, align 4
    %add_temp37 = add i32 %srem_temp35, %load_temp36
    store i32 %add_temp37, i32* %gep_temp33, align 4
    %load_temp38 = load i32, i32* %a_local, align 4
    %sdiv_temp39 = sdiv i32 %load_temp38, 10
    store i32 %sdiv_temp39, i32* %a_local, align 4
    %load_temp40 = load i32, i32* %i, align 4
    %add_temp41 = add i32 %load_temp40, 1
    store i32 %add_temp41, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp42 = load i32, i32* %i, align 4
    %icmp_sgt_temp43 = icmp sgt i32 %load_temp42, 0
    br i1 %icmp_sgt_temp43, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp44 = load i32, i32* %i, align 4
    %sub_temp45 = sub i32 %load_temp44, 1
    store i32 %sub_temp45, i32* %i, align 4
    %load_temp46 = load i32, i32* %i, align 4
    %gep_temp47 = getelementptr [16 x i32], [16 x i32]* %b, i32 0, i32 %load_temp46
    %load_temp48 = load i32, i32* %gep_temp47, align 4
    call void @putch(i32 %load_temp48)
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    %n = alloca i32, align 4
    %call_temp49 = call i32 @my_getint()
    store i32 %call_temp49, i32* %n, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp50 = load i32, i32* %n, align 4
    %icmp_sgt_temp51 = icmp sgt i32 %load_temp50, 0
    br i1 %icmp_sgt_temp51, label %while_body_0, label %while_end_0
while_body_0:
    %m = alloca i32, align 4
    %call_temp52 = call i32 @my_getint()
    store i32 %call_temp52, i32* %m, align 4
    %load_temp53 = load i32, i32* %m, align 4
    call void @my_putint(i32 %load_temp53)
    call void @putch(i32 10)
    %load_temp54 = load i32, i32* %n, align 4
    %sub_temp55 = sub i32 %load_temp54, 1
    store i32 %sub_temp55, i32* %n, align 4
    br label %while_cond_0
while_end_0:
    ret i32 0
}

