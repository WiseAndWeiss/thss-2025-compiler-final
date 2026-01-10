; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 0, align 4
@b = global i32 0, align 4
@c = global i32 0, align 4
@d = global i32 0, align 4
@e = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %call_temp0 = call i32 @getint()
    store i32 %call_temp0, i32* @a, align 4
    %call_temp1 = call i32 @getint()
    store i32 %call_temp1, i32* @b, align 4
    %call_temp2 = call i32 @getint()
    store i32 %call_temp2, i32* @c, align 4
    %call_temp3 = call i32 @getint()
    store i32 %call_temp3, i32* @d, align 4
    %call_temp4 = call i32 @getint()
    store i32 %call_temp4, i32* @e, align 4
    %flag = alloca i32, align 4
    store i32 0, i32* %flag, align 4
    %load_temp5 = load i32, i32* @a, align 4
    %load_temp6 = load i32, i32* @b, align 4
    %load_temp7 = load i32, i32* @c, align 4
    %mul_temp8 = mul i32 %load_temp6, %load_temp7
    %sub_temp9 = sub i32 %load_temp5, %mul_temp8
    %load_temp10 = load i32, i32* @d, align 4
    %load_temp11 = load i32, i32* @a, align 4
    %load_temp12 = load i32, i32* @c, align 4
    %sdiv_temp13 = sdiv i32 %load_temp11, %load_temp12
    %sub_temp14 = sub i32 %load_temp10, %sdiv_temp13
    %icmp_ne_temp15 = icmp ne i32 %sub_temp9, %sub_temp14
    %load_temp16 = load i32, i32* @a, align 4
    %load_temp17 = load i32, i32* @b, align 4
    %mul_temp18 = mul i32 %load_temp16, %load_temp17
    %load_temp19 = load i32, i32* @c, align 4
    %sdiv_temp20 = sdiv i32 %mul_temp18, %load_temp19
    %load_temp21 = load i32, i32* @e, align 4
    %load_temp22 = load i32, i32* @d, align 4
    %add_temp23 = add i32 %load_temp21, %load_temp22
    %icmp_eq_temp24 = icmp eq i32 %sdiv_temp20, %add_temp23
    %zext_temp25 = zext i1 %icmp_ne_temp15 to i32
    %zext_temp26 = zext i1 %icmp_eq_temp24 to i32
    %add_temp27 = add i32 %zext_temp25, %zext_temp26
    %icmp_ne_temp28 = icmp ne i32 %add_temp27, 0
    %load_temp29 = load i32, i32* @a, align 4
    %load_temp30 = load i32, i32* @b, align 4
    %add_temp31 = add i32 %load_temp29, %load_temp30
    %load_temp32 = load i32, i32* @c, align 4
    %add_temp33 = add i32 %add_temp31, %load_temp32
    %load_temp34 = load i32, i32* @d, align 4
    %load_temp35 = load i32, i32* @e, align 4
    %add_temp36 = add i32 %load_temp34, %load_temp35
    %icmp_eq_temp37 = icmp eq i32 %add_temp33, %add_temp36
    %zext_temp38 = zext i1 %icmp_ne_temp28 to i32
    %zext_temp39 = zext i1 %icmp_eq_temp37 to i32
    %add_temp40 = add i32 %zext_temp38, %zext_temp39
    %icmp_ne_temp41 = icmp ne i32 %add_temp40, 0
    br i1 %icmp_ne_temp41, label %if_then_0, label %if_end_0
if_then_0:
    store i32 1, i32* %flag, align 4
    br label %if_end_0
if_end_0:
    %load_temp42 = load i32, i32* %flag, align 4
    ret i32 %load_temp42
}

