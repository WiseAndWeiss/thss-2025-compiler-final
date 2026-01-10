; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 -1, align 4
@b = global i32 1, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @inc_a() {
entry:
    %b = alloca i32, align 4
    %load_temp0 = load i32, i32* @a, align 4
    store i32 %load_temp0, i32* %b, align 4
    %load_temp1 = load i32, i32* %b, align 4
    %add_temp2 = add i32 %load_temp1, 1
    store i32 %add_temp2, i32* %b, align 4
    %load_temp3 = load i32, i32* %b, align 4
    store i32 %load_temp3, i32* @a, align 4
    %load_temp4 = load i32, i32* @a, align 4
    ret i32 %load_temp4
}

define i32 @main() {
entry:
    %k = alloca i32, align 4
    store i32 5, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp5 = load i32, i32* %k, align 4
    %icmp_sge_temp6 = icmp sge i32 %load_temp5, 0
    br i1 %icmp_sge_temp6, label %while_body_0, label %while_end_0
while_body_0:
    %call_temp7 = call i32 @inc_a()
    %call_temp8 = call i32 @inc_a()
    %icmp_ne_temp9 = icmp ne i32 %call_temp7, 0
    %icmp_ne_temp10 = icmp ne i32 %call_temp8, 0
    %zext_temp11 = zext i1 %icmp_ne_temp9 to i32
    %zext_temp12 = zext i1 %icmp_ne_temp10 to i32
    %mul_temp13 = mul i32 %zext_temp11, %zext_temp12
    %icmp_ne_temp14 = icmp ne i32 %mul_temp13, 0
    %call_temp15 = call i32 @inc_a()
    %icmp_ne_temp16 = icmp ne i1 %icmp_ne_temp14, 0
    %icmp_ne_temp17 = icmp ne i32 %call_temp15, 0
    %zext_temp18 = zext i1 %icmp_ne_temp16 to i32
    %zext_temp19 = zext i1 %icmp_ne_temp17 to i32
    %mul_temp20 = mul i32 %zext_temp18, %zext_temp19
    %icmp_ne_temp21 = icmp ne i32 %mul_temp20, 0
    br i1 %icmp_ne_temp21, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp22 = load i32, i32* @a, align 4
    call void @putint(i32 %load_temp22)
    call void @putch(i32 32)
    %load_temp23 = load i32, i32* @b, align 4
    call void @putint(i32 %load_temp23)
    call void @putch(i32 10)
    br label %if_end_0
if_end_0:
    %call_temp24 = call i32 @inc_a()
    %icmp_slt_temp25 = icmp slt i32 %call_temp24, 14
    %call_temp26 = call i32 @inc_a()
    %call_temp27 = call i32 @inc_a()
    %call_temp28 = call i32 @inc_a()
    %sub_temp29 = sub i32 %call_temp27, %call_temp28
    %add_temp30 = add i32 %sub_temp29, 1
    %icmp_ne_temp31 = icmp ne i32 %call_temp26, 0
    %icmp_ne_temp32 = icmp ne i32 %add_temp30, 0
    %zext_temp33 = zext i1 %icmp_ne_temp31 to i32
    %zext_temp34 = zext i1 %icmp_ne_temp32 to i32
    %mul_temp35 = mul i32 %zext_temp33, %zext_temp34
    %icmp_ne_temp36 = icmp ne i32 %mul_temp35, 0
    %zext_temp37 = zext i1 %icmp_slt_temp25 to i32
    %zext_temp38 = zext i1 %icmp_ne_temp36 to i32
    %add_temp39 = add i32 %zext_temp37, %zext_temp38
    %icmp_ne_temp40 = icmp ne i32 %add_temp39, 0
    br i1 %icmp_ne_temp40, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp41 = load i32, i32* @a, align 4
    call void @putint(i32 %load_temp41)
    call void @putch(i32 10)
    %load_temp42 = load i32, i32* @b, align 4
    %mul_temp43 = mul i32 %load_temp42, 2
    store i32 %mul_temp43, i32* @b, align 4
    br label %if_end_1
if_else_1:
    %call_temp44 = call i32 @inc_a()
    br label %if_end_1
if_end_1:
    %load_temp45 = load i32, i32* %k, align 4
    %sub_temp46 = sub i32 %load_temp45, 1
    store i32 %sub_temp46, i32* %k, align 4
    br label %while_cond_0
while_end_0:
    %load_temp47 = load i32, i32* @a, align 4
    call void @putint(i32 %load_temp47)
    call void @putch(i32 32)
    %load_temp48 = load i32, i32* @b, align 4
    call void @putint(i32 %load_temp48)
    call void @putch(i32 10)
    %load_temp49 = load i32, i32* @a, align 4
    ret i32 %load_temp49
}

