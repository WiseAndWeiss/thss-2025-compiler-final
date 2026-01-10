; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@g = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func(i32 %n) {
entry:
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %load_temp0 = load i32, i32* @g, align 4
    %load_temp1 = load i32, i32* %n_local, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    store i32 %add_temp2, i32* @g, align 4
    %load_temp3 = load i32, i32* @g, align 4
    call void @putint(i32 %load_temp3)
    %load_temp4 = load i32, i32* @g, align 4
    ret i32 %load_temp4
}

define i32 @main() {
entry:
    %i = alloca i32, align 4
    %call_temp5 = call i32 @getint()
    store i32 %call_temp5, i32* %i, align 4
    %load_temp6 = load i32, i32* %i, align 4
    %icmp_sgt_temp7 = icmp sgt i32 %load_temp6, 10
    %load_temp8 = load i32, i32* %i, align 4
    %call_temp9 = call i32 @func(i32 %load_temp8)
    %icmp_ne_temp10 = icmp ne i1 %icmp_sgt_temp7, 0
    %icmp_ne_temp11 = icmp ne i32 %call_temp9, 0
    %zext_temp12 = zext i1 %icmp_ne_temp10 to i32
    %zext_temp13 = zext i1 %icmp_ne_temp11 to i32
    %mul_temp14 = mul i32 %zext_temp12, %zext_temp13
    %icmp_ne_temp15 = icmp ne i32 %mul_temp14, 0
    br i1 %icmp_ne_temp15, label %if_then_0, label %if_else_0
if_then_0:
    store i32 1, i32* %i, align 4
    br label %if_end_0
if_else_0:
    store i32 0, i32* %i, align 4
    br label %if_end_0
if_end_0:
    %call_temp16 = call i32 @getint()
    store i32 %call_temp16, i32* %i, align 4
    %load_temp17 = load i32, i32* %i, align 4
    %icmp_sgt_temp18 = icmp sgt i32 %load_temp17, 11
    %load_temp19 = load i32, i32* %i, align 4
    %call_temp20 = call i32 @func(i32 %load_temp19)
    %icmp_ne_temp21 = icmp ne i1 %icmp_sgt_temp18, 0
    %icmp_ne_temp22 = icmp ne i32 %call_temp20, 0
    %zext_temp23 = zext i1 %icmp_ne_temp21 to i32
    %zext_temp24 = zext i1 %icmp_ne_temp22 to i32
    %mul_temp25 = mul i32 %zext_temp23, %zext_temp24
    %icmp_ne_temp26 = icmp ne i32 %mul_temp25, 0
    br i1 %icmp_ne_temp26, label %if_then_1, label %if_else_1
if_then_1:
    store i32 1, i32* %i, align 4
    br label %if_end_1
if_else_1:
    store i32 0, i32* %i, align 4
    br label %if_end_1
if_end_1:
    %call_temp27 = call i32 @getint()
    store i32 %call_temp27, i32* %i, align 4
    %load_temp28 = load i32, i32* %i, align 4
    %icmp_sle_temp29 = icmp sle i32 %load_temp28, 99
    %load_temp30 = load i32, i32* %i, align 4
    %call_temp31 = call i32 @func(i32 %load_temp30)
    %icmp_ne_temp32 = icmp ne i1 %icmp_sle_temp29, 0
    %icmp_ne_temp33 = icmp ne i32 %call_temp31, 0
    %zext_temp34 = zext i1 %icmp_ne_temp32 to i32
    %zext_temp35 = zext i1 %icmp_ne_temp33 to i32
    %add_temp36 = add i32 %zext_temp34, %zext_temp35
    %icmp_ne_temp37 = icmp ne i32 %add_temp36, 0
    br i1 %icmp_ne_temp37, label %if_then_2, label %if_else_2
if_then_2:
    store i32 1, i32* %i, align 4
    br label %if_end_2
if_else_2:
    store i32 0, i32* %i, align 4
    br label %if_end_2
if_end_2:
    %call_temp38 = call i32 @getint()
    store i32 %call_temp38, i32* %i, align 4
    %load_temp39 = load i32, i32* %i, align 4
    %icmp_sle_temp40 = icmp sle i32 %load_temp39, 100
    %load_temp41 = load i32, i32* %i, align 4
    %call_temp42 = call i32 @func(i32 %load_temp41)
    %icmp_ne_temp43 = icmp ne i1 %icmp_sle_temp40, 0
    %icmp_ne_temp44 = icmp ne i32 %call_temp42, 0
    %zext_temp45 = zext i1 %icmp_ne_temp43 to i32
    %zext_temp46 = zext i1 %icmp_ne_temp44 to i32
    %add_temp47 = add i32 %zext_temp45, %zext_temp46
    %icmp_ne_temp48 = icmp ne i32 %add_temp47, 0
    br i1 %icmp_ne_temp48, label %if_then_3, label %if_else_3
if_then_3:
    store i32 1, i32* %i, align 4
    br label %if_end_3
if_else_3:
    store i32 0, i32* %i, align 4
    br label %if_end_3
if_end_3:
    %call_temp49 = call i32 @func(i32 99)
    %icmp_eq_temp50 = icmp eq i32 %call_temp49, 0
    %call_temp51 = call i32 @func(i32 100)
    %icmp_ne_temp52 = icmp ne i1 %icmp_eq_temp50, 0
    %icmp_ne_temp53 = icmp ne i32 %call_temp51, 0
    %zext_temp54 = zext i1 %icmp_ne_temp52 to i32
    %zext_temp55 = zext i1 %icmp_ne_temp53 to i32
    %mul_temp56 = mul i32 %zext_temp54, %zext_temp55
    %icmp_ne_temp57 = icmp ne i32 %mul_temp56, 0
    br i1 %icmp_ne_temp57, label %if_then_4, label %if_else_4
if_then_4:
    store i32 1, i32* %i, align 4
    br label %if_end_4
if_else_4:
    store i32 0, i32* %i, align 4
    br label %if_end_4
if_end_4:
    ret i32 0
}

