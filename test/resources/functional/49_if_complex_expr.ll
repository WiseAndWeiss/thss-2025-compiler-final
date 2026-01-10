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
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    %result = alloca i32, align 4
    store i32 5, i32* %a, align 4
    store i32 5, i32* %b, align 4
    store i32 1, i32* %c, align 4
    %sub_temp0 = sub i32 0, 2
    store i32 %sub_temp0, i32* %d, align 4
    store i32 2, i32* %result, align 4
    %load_temp1 = load i32, i32* %d, align 4
    %mul_temp2 = mul i32 %load_temp1, 1
    %sdiv_temp3 = sdiv i32 %mul_temp2, 2
    %icmp_slt_temp4 = icmp slt i32 %sdiv_temp3, 0
    %load_temp5 = load i32, i32* %a, align 4
    %load_temp6 = load i32, i32* %b, align 4
    %sub_temp7 = sub i32 %load_temp5, %load_temp6
    %icmp_ne_temp8 = icmp ne i32 %sub_temp7, 0
    %load_temp9 = load i32, i32* %c, align 4
    %add_temp10 = add i32 %load_temp9, 3
    %srem_temp11 = srem i32 %add_temp10, 2
    %icmp_ne_temp12 = icmp ne i32 %srem_temp11, 0
    %zext_temp13 = zext i1 %icmp_ne_temp8 to i32
    %zext_temp14 = zext i1 %icmp_ne_temp12 to i32
    %mul_temp15 = mul i32 %zext_temp13, %zext_temp14
    %icmp_ne_temp16 = icmp ne i32 %mul_temp15, 0
    %zext_temp17 = zext i1 %icmp_slt_temp4 to i32
    %zext_temp18 = zext i1 %icmp_ne_temp16 to i32
    %add_temp19 = add i32 %zext_temp17, %zext_temp18
    %icmp_ne_temp20 = icmp ne i32 %add_temp19, 0
    br i1 %icmp_ne_temp20, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp21 = load i32, i32* %result, align 4
    call void @putint(i32 %load_temp21)
    br label %if_end_0
if_end_0:
    %load_temp22 = load i32, i32* %d, align 4
    %srem_temp23 = srem i32 %load_temp22, 2
    %add_temp24 = add i32 %srem_temp23, 67
    %icmp_slt_temp25 = icmp slt i32 %add_temp24, 0
    %load_temp26 = load i32, i32* %a, align 4
    %load_temp27 = load i32, i32* %b, align 4
    %sub_temp28 = sub i32 %load_temp26, %load_temp27
    %icmp_ne_temp29 = icmp ne i32 %sub_temp28, 0
    %load_temp30 = load i32, i32* %c, align 4
    %add_temp31 = add i32 %load_temp30, 2
    %srem_temp32 = srem i32 %add_temp31, 2
    %icmp_ne_temp33 = icmp ne i32 %srem_temp32, 0
    %zext_temp34 = zext i1 %icmp_ne_temp29 to i32
    %zext_temp35 = zext i1 %icmp_ne_temp33 to i32
    %mul_temp36 = mul i32 %zext_temp34, %zext_temp35
    %icmp_ne_temp37 = icmp ne i32 %mul_temp36, 0
    %zext_temp38 = zext i1 %icmp_slt_temp25 to i32
    %zext_temp39 = zext i1 %icmp_ne_temp37 to i32
    %add_temp40 = add i32 %zext_temp38, %zext_temp39
    %icmp_ne_temp41 = icmp ne i32 %add_temp40, 0
    br i1 %icmp_ne_temp41, label %if_then_1, label %if_end_1
if_then_1:
    store i32 4, i32* %result, align 4
    %load_temp42 = load i32, i32* %result, align 4
    call void @putint(i32 %load_temp42)
    br label %if_end_1
if_end_1:
    ret i32 0
}

