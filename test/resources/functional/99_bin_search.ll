; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %i = alloca i32, align 4
    %sum = alloca i32, align 4
    %a = alloca [10 x i32], align 4
    store i32 0, i32* %sum, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 10
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %i, align 4
    %gep_temp3 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp2
    %load_temp4 = load i32, i32* %i, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %gep_temp3, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %add_temp7 = add i32 %load_temp6, 1
    store i32 %add_temp7, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %x = alloca i32, align 4
    %high = alloca i32, align 4
    %low = alloca i32, align 4
    %mid = alloca i32, align 4
    %n = alloca i32, align 4
    store i32 10, i32* %n, align 4
    %call_temp8 = call i32 @getint()
    store i32 %call_temp8, i32* %x, align 4
    %load_temp9 = load i32, i32* %n, align 4
    %sub_temp10 = sub i32 %load_temp9, 1
    store i32 %sub_temp10, i32* %high, align 4
    store i32 0, i32* %low, align 4
    %load_temp11 = load i32, i32* %high, align 4
    %load_temp12 = load i32, i32* %low, align 4
    %add_temp13 = add i32 %load_temp11, %load_temp12
    %sdiv_temp14 = sdiv i32 %add_temp13, 2
    store i32 %sdiv_temp14, i32* %mid, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp15 = load i32, i32* %mid, align 4
    %gep_temp16 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp15
    %load_temp17 = load i32, i32* %gep_temp16, align 4
    %load_temp18 = load i32, i32* %x, align 4
    %icmp_ne_temp19 = icmp ne i32 %load_temp17, %load_temp18
    %load_temp20 = load i32, i32* %low, align 4
    %load_temp21 = load i32, i32* %high, align 4
    %icmp_slt_temp22 = icmp slt i32 %load_temp20, %load_temp21
    %zext_temp23 = zext i1 %icmp_ne_temp19 to i32
    %zext_temp24 = zext i1 %icmp_slt_temp22 to i32
    %mul_temp25 = mul i32 %zext_temp23, %zext_temp24
    %icmp_ne_temp26 = icmp ne i32 %mul_temp25, 0
    br i1 %icmp_ne_temp26, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp27 = load i32, i32* %high, align 4
    %load_temp28 = load i32, i32* %low, align 4
    %add_temp29 = add i32 %load_temp27, %load_temp28
    %sdiv_temp30 = sdiv i32 %add_temp29, 2
    store i32 %sdiv_temp30, i32* %mid, align 4
    %load_temp31 = load i32, i32* %x, align 4
    %load_temp32 = load i32, i32* %mid, align 4
    %gep_temp33 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp32
    %load_temp34 = load i32, i32* %gep_temp33, align 4
    %icmp_slt_temp35 = icmp slt i32 %load_temp31, %load_temp34
    br i1 %icmp_slt_temp35, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp36 = load i32, i32* %mid, align 4
    %sub_temp37 = sub i32 %load_temp36, 1
    store i32 %sub_temp37, i32* %high, align 4
    br label %if_end_0
if_else_0:
    %load_temp38 = load i32, i32* %mid, align 4
    %add_temp39 = add i32 %load_temp38, 1
    store i32 %add_temp39, i32* %low, align 4
    br label %if_end_0
if_end_0:
    br label %while_cond_0
while_end_0:
    %load_temp40 = load i32, i32* %x, align 4
    %load_temp41 = load i32, i32* %mid, align 4
    %gep_temp42 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 %load_temp41
    %load_temp43 = load i32, i32* %gep_temp42, align 4
    %icmp_eq_temp44 = icmp eq i32 %load_temp40, %load_temp43
    br i1 %icmp_eq_temp44, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp45 = load i32, i32* %x, align 4
    call void @putint(i32 %load_temp45)
    br label %if_end_1
if_else_1:
    store i32 0, i32* %x, align 4
    %load_temp46 = load i32, i32* %x, align 4
    call void @putint(i32 %load_temp46)
    br label %if_end_1
if_end_1:
    store i32 10, i32* %x, align 4
    %load_temp47 = load i32, i32* %x, align 4
    call void @putch(i32 %load_temp47)
    ret i32 0
}

