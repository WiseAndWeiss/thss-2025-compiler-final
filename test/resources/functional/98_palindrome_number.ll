; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @palindrome(i32 %n) {
entry:
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %a = alloca [4 x i32], align 4
    %j = alloca i32, align 4
    %flag = alloca i32, align 4
    store i32 0, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %j, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 4
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %j, align 4
    %gep_temp3 = getelementptr [4 x i32], [4 x i32]* %a, i32 0, i32 %load_temp2
    %load_temp4 = load i32, i32* %n_local, align 4
    %srem_temp5 = srem i32 %load_temp4, 10
    store i32 %srem_temp5, i32* %gep_temp3, align 4
    %load_temp6 = load i32, i32* %n_local, align 4
    %sdiv_temp7 = sdiv i32 %load_temp6, 10
    store i32 %sdiv_temp7, i32* %n_local, align 4
    %load_temp8 = load i32, i32* %j, align 4
    %add_temp9 = add i32 %load_temp8, 1
    store i32 %add_temp9, i32* %j, align 4
    br label %while_cond_0
while_end_0:
    %gep_temp10 = getelementptr [4 x i32], [4 x i32]* %a, i32 0, i32 0
    %load_temp11 = load i32, i32* %gep_temp10, align 4
    %gep_temp12 = getelementptr [4 x i32], [4 x i32]* %a, i32 0, i32 3
    %load_temp13 = load i32, i32* %gep_temp12, align 4
    %icmp_eq_temp14 = icmp eq i32 %load_temp11, %load_temp13
    %gep_temp15 = getelementptr [4 x i32], [4 x i32]* %a, i32 0, i32 1
    %load_temp16 = load i32, i32* %gep_temp15, align 4
    %gep_temp17 = getelementptr [4 x i32], [4 x i32]* %a, i32 0, i32 2
    %load_temp18 = load i32, i32* %gep_temp17, align 4
    %icmp_eq_temp19 = icmp eq i32 %load_temp16, %load_temp18
    %zext_temp20 = zext i1 %icmp_eq_temp14 to i32
    %zext_temp21 = zext i1 %icmp_eq_temp19 to i32
    %mul_temp22 = mul i32 %zext_temp20, %zext_temp21
    %icmp_ne_temp23 = icmp ne i32 %mul_temp22, 0
    br i1 %icmp_ne_temp23, label %if_then_0, label %if_else_0
if_then_0:
    store i32 1, i32* %flag, align 4
    br label %if_end_0
if_else_0:
    store i32 0, i32* %flag, align 4
    br label %if_end_0
if_end_0:
    %load_temp24 = load i32, i32* %flag, align 4
    ret i32 %load_temp24
}

define i32 @main() {
entry:
    %test = alloca i32, align 4
    store i32 1221, i32* %test, align 4
    %flag = alloca i32, align 4
    %load_temp25 = load i32, i32* %test, align 4
    %call_temp26 = call i32 @palindrome(i32 %load_temp25)
    store i32 %call_temp26, i32* %flag, align 4
    %load_temp27 = load i32, i32* %flag, align 4
    %icmp_eq_temp28 = icmp eq i32 %load_temp27, 1
    br i1 %icmp_eq_temp28, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp29 = load i32, i32* %test, align 4
    call void @putint(i32 %load_temp29)
    br label %if_end_1
if_else_1:
    store i32 0, i32* %flag, align 4
    %load_temp30 = load i32, i32* %flag, align 4
    call void @putint(i32 %load_temp30)
    br label %if_end_1
if_end_1:
    store i32 10, i32* %flag, align 4
    %load_temp31 = load i32, i32* %flag, align 4
    call void @putch(i32 %load_temp31)
    ret i32 0
}

