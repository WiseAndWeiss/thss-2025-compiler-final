; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 1, align 4
@b = global i32 0, align 4
@c = global i32 1, align 4
@d = global i32 2, align 4
@e = global i32 4, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %flag = alloca i32, align 4
    store i32 0, i32* %flag, align 4
    %load_temp0 = load i32, i32* @a, align 4
    %load_temp1 = load i32, i32* @b, align 4
    %mul_temp2 = mul i32 %load_temp0, %load_temp1
    %load_temp3 = load i32, i32* @c, align 4
    %sdiv_temp4 = sdiv i32 %mul_temp2, %load_temp3
    %load_temp5 = load i32, i32* @e, align 4
    %load_temp6 = load i32, i32* @d, align 4
    %add_temp7 = add i32 %load_temp5, %load_temp6
    %icmp_eq_temp8 = icmp eq i32 %sdiv_temp4, %add_temp7
    %load_temp9 = load i32, i32* @a, align 4
    %load_temp10 = load i32, i32* @a, align 4
    %load_temp11 = load i32, i32* @b, align 4
    %add_temp12 = add i32 %load_temp10, %load_temp11
    %mul_temp13 = mul i32 %load_temp9, %add_temp12
    %load_temp14 = load i32, i32* @c, align 4
    %add_temp15 = add i32 %mul_temp13, %load_temp14
    %load_temp16 = load i32, i32* @d, align 4
    %load_temp17 = load i32, i32* @e, align 4
    %add_temp18 = add i32 %load_temp16, %load_temp17
    %icmp_sle_temp19 = icmp sle i32 %add_temp15, %add_temp18
    %zext_temp20 = zext i1 %icmp_eq_temp8 to i32
    %zext_temp21 = zext i1 %icmp_sle_temp19 to i32
    %mul_temp22 = mul i32 %zext_temp20, %zext_temp21
    %icmp_ne_temp23 = icmp ne i32 %mul_temp22, 0
    %load_temp24 = load i32, i32* @a, align 4
    %load_temp25 = load i32, i32* @b, align 4
    %load_temp26 = load i32, i32* @c, align 4
    %mul_temp27 = mul i32 %load_temp25, %load_temp26
    %sub_temp28 = sub i32 %load_temp24, %mul_temp27
    %load_temp29 = load i32, i32* @d, align 4
    %load_temp30 = load i32, i32* @a, align 4
    %load_temp31 = load i32, i32* @c, align 4
    %sdiv_temp32 = sdiv i32 %load_temp30, %load_temp31
    %sub_temp33 = sub i32 %load_temp29, %sdiv_temp32
    %icmp_eq_temp34 = icmp eq i32 %sub_temp28, %sub_temp33
    %zext_temp35 = zext i1 %icmp_ne_temp23 to i32
    %zext_temp36 = zext i1 %icmp_eq_temp34 to i32
    %add_temp37 = add i32 %zext_temp35, %zext_temp36
    %icmp_ne_temp38 = icmp ne i32 %add_temp37, 0
    br i1 %icmp_ne_temp38, label %if_then_0, label %if_end_0
if_then_0:
    store i32 1, i32* %flag, align 4
    br label %if_end_0
if_end_0:
    %load_temp39 = load i32, i32* %flag, align 4
    call void @putint(i32 %load_temp39)
    %load_temp40 = load i32, i32* %flag, align 4
    ret i32 %load_temp40
}

