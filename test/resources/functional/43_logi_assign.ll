; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 0, align 4
@b = global i32 0, align 4
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
    %c = alloca i32, align 4
    %load_temp2 = load i32, i32* @a, align 4
    %load_temp3 = load i32, i32* @b, align 4
    %icmp_eq_temp4 = icmp eq i32 %load_temp2, %load_temp3
    %load_temp5 = load i32, i32* @a, align 4
    %icmp_ne_temp6 = icmp ne i32 %load_temp5, 3
    %zext_temp7 = zext i1 %icmp_eq_temp4 to i32
    %zext_temp8 = zext i1 %icmp_ne_temp6 to i32
    %mul_temp9 = mul i32 %zext_temp7, %zext_temp8
    %icmp_ne_temp10 = icmp ne i32 %mul_temp9, 0
    br i1 %icmp_ne_temp10, label %if_then_0, label %if_else_0
if_then_0:
    store i32 1, i32* %c, align 4
    br label %if_end_0
if_else_0:
    store i32 0, i32* %c, align 4
    br label %if_end_0
if_end_0:
    %load_temp11 = load i32, i32* %c, align 4
    ret i32 %load_temp11
}

