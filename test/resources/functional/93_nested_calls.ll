; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func1(i32 %x, i32 %y, i32 %z) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %z_local = alloca i32, align 4
    store i32 %z, i32* %z_local, align 4
    %load_temp0 = load i32, i32* %z_local, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 0
    br i1 %icmp_eq_temp1, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp2 = load i32, i32* %x_local, align 4
    %load_temp3 = load i32, i32* %y_local, align 4
    %mul_temp4 = mul i32 %load_temp2, %load_temp3
    ret i32 %mul_temp4
if_else_0:
    %load_temp5 = load i32, i32* %x_local, align 4
    %load_temp6 = load i32, i32* %y_local, align 4
    %load_temp7 = load i32, i32* %z_local, align 4
    %sub_temp8 = sub i32 %load_temp6, %load_temp7
    %call_temp9 = call i32 @func1(i32 %load_temp5, i32 %sub_temp8, i32 0)
    ret i32 %call_temp9
if_end_0:
    ret void
}

define i32 @func2(i32 %x, i32 %y) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %load_temp10 = load i32, i32* %y_local, align 4
    %icmp_ne_temp11 = icmp ne i32 %load_temp10, 0
    br i1 %icmp_ne_temp11, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp12 = load i32, i32* %x_local, align 4
    %load_temp13 = load i32, i32* %y_local, align 4
    %srem_temp14 = srem i32 %load_temp12, %load_temp13
    %call_temp15 = call i32 @func2(i32 %srem_temp14, i32 0)
    ret i32 %call_temp15
if_else_1:
    %load_temp16 = load i32, i32* %x_local, align 4
    ret i32 %load_temp16
if_end_1:
    ret void
}

define i32 @func3(i32 %x, i32 %y) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %load_temp17 = load i32, i32* %y_local, align 4
    %icmp_eq_temp18 = icmp eq i32 %load_temp17, 0
    br i1 %icmp_eq_temp18, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp19 = load i32, i32* %x_local, align 4
    %add_temp20 = add i32 %load_temp19, 1
    ret i32 %add_temp20
if_else_2:
    %load_temp21 = load i32, i32* %x_local, align 4
    %load_temp22 = load i32, i32* %y_local, align 4
    %add_temp23 = add i32 %load_temp21, %load_temp22
    %call_temp24 = call i32 @func3(i32 %add_temp23, i32 0)
    ret i32 %call_temp24
if_end_2:
    ret void
}

define i32 @func4(i32 %x, i32 %y, i32 %z) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %z_local = alloca i32, align 4
    store i32 %z, i32* %z_local, align 4
    %load_temp25 = load i32, i32* %x_local, align 4
    %icmp_ne_temp26 = icmp ne i32 %load_temp25, 0
    br i1 %icmp_ne_temp26, label %if_then_3, label %if_else_3
if_then_3:
    %load_temp27 = load i32, i32* %y_local, align 4
    ret i32 %load_temp27
if_else_3:
    %load_temp28 = load i32, i32* %z_local, align 4
    ret i32 %load_temp28
if_end_3:
    ret void
}

define i32 @func5(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp29 = load i32, i32* %x_local, align 4
    %sub_temp30 = sub i32 0, %load_temp29
    ret i32 %sub_temp30
}

define i32 @func6(i32 %x, i32 %y) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %y_local = alloca i32, align 4
    store i32 %y, i32* %y_local, align 4
    %load_temp31 = load i32, i32* %x_local, align 4
    %load_temp32 = load i32, i32* %y_local, align 4
    %icmp_ne_temp33 = icmp ne i32 %load_temp31, 0
    %icmp_ne_temp34 = icmp ne i32 %load_temp32, 0
    %zext_temp35 = zext i1 %icmp_ne_temp33 to i32
    %zext_temp36 = zext i1 %icmp_ne_temp34 to i32
    %mul_temp37 = mul i32 %zext_temp35, %zext_temp36
    %icmp_ne_temp38 = icmp ne i32 %mul_temp37, 0
    br i1 %icmp_ne_temp38, label %if_then_4, label %if_else_4
if_then_4:
    ret i32 1
if_else_4:
    ret i32 0
if_end_4:
    ret void
}

define i32 @func7(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp39 = load i32, i32* %x_local, align 4
    %icmp_eq_temp40 = icmp eq i32 %load_temp39, 0
    br i1 %icmp_eq_temp40, label %if_then_5, label %if_else_5
if_then_5:
    ret i32 1
if_else_5:
    ret i32 0
if_end_5:
    ret void
}

define i32 @main() {
entry:
    %i1 = alloca i32, align 4
    %call_temp41 = call i32 @getint()
    store i32 %call_temp41, i32* %i1, align 4
    %i2 = alloca i32, align 4
    %call_temp42 = call i32 @getint()
    store i32 %call_temp42, i32* %i2, align 4
    %i3 = alloca i32, align 4
    %call_temp43 = call i32 @getint()
    store i32 %call_temp43, i32* %i3, align 4
    %i4 = alloca i32, align 4
    %call_temp44 = call i32 @getint()
    store i32 %call_temp44, i32* %i4, align 4
    %arr = alloca [10 x i32], align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp45 = load i32, i32* %i, align 4
    %icmp_slt_temp46 = icmp slt i32 %load_temp45, 10
    br i1 %icmp_slt_temp46, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp47 = load i32, i32* %i, align 4
    %gep_temp48 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 %load_temp47
    %call_temp49 = call i32 @getint()
    store i32 %call_temp49, i32* %gep_temp48, align 4
    %load_temp50 = load i32, i32* %i, align 4
    %add_temp51 = add i32 %load_temp50, 1
    store i32 %add_temp51, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %a = alloca i32, align 4
    %load_temp52 = load i32, i32* %i1, align 4
    %call_temp53 = call i32 @func7(i32 %load_temp52)
    %load_temp54 = load i32, i32* %i2, align 4
    %call_temp55 = call i32 @func5(i32 %load_temp54)
    %call_temp56 = call i32 @func6(i32 %call_temp53, i32 %call_temp55)
    %load_temp57 = load i32, i32* %i3, align 4
    %call_temp58 = call i32 @func2(i32 %call_temp56, i32 %load_temp57)
    %load_temp59 = load i32, i32* %i4, align 4
    %call_temp60 = call i32 @func3(i32 %call_temp58, i32 %load_temp59)
    %call_temp61 = call i32 @func5(i32 %call_temp60)
    %gep_temp62 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 0
    %load_temp63 = load i32, i32* %gep_temp62, align 4
    %gep_temp64 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 1
    %load_temp65 = load i32, i32* %gep_temp64, align 4
    %call_temp66 = call i32 @func5(i32 %load_temp65)
    %gep_temp67 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 2
    %load_temp68 = load i32, i32* %gep_temp67, align 4
    %gep_temp69 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 3
    %load_temp70 = load i32, i32* %gep_temp69, align 4
    %call_temp71 = call i32 @func7(i32 %load_temp70)
    %call_temp72 = call i32 @func6(i32 %load_temp68, i32 %call_temp71)
    %gep_temp73 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 4
    %load_temp74 = load i32, i32* %gep_temp73, align 4
    %gep_temp75 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 5
    %load_temp76 = load i32, i32* %gep_temp75, align 4
    %call_temp77 = call i32 @func7(i32 %load_temp76)
    %call_temp78 = call i32 @func2(i32 %load_temp74, i32 %call_temp77)
    %call_temp79 = call i32 @func4(i32 %call_temp66, i32 %call_temp72, i32 %call_temp78)
    %gep_temp80 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 6
    %load_temp81 = load i32, i32* %gep_temp80, align 4
    %call_temp82 = call i32 @func3(i32 %call_temp79, i32 %load_temp81)
    %gep_temp83 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 7
    %load_temp84 = load i32, i32* %gep_temp83, align 4
    %call_temp85 = call i32 @func2(i32 %call_temp82, i32 %load_temp84)
    %gep_temp86 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 8
    %load_temp87 = load i32, i32* %gep_temp86, align 4
    %gep_temp88 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 9
    %load_temp89 = load i32, i32* %gep_temp88, align 4
    %call_temp90 = call i32 @func7(i32 %load_temp89)
    %call_temp91 = call i32 @func3(i32 %load_temp87, i32 %call_temp90)
    %load_temp92 = load i32, i32* %i1, align 4
    %call_temp93 = call i32 @func1(i32 %call_temp85, i32 %call_temp91, i32 %load_temp92)
    %call_temp94 = call i32 @func4(i32 %call_temp61, i32 %load_temp63, i32 %call_temp93)
    %load_temp95 = load i32, i32* %i2, align 4
    %load_temp96 = load i32, i32* %i3, align 4
    %call_temp97 = call i32 @func7(i32 %load_temp96)
    %load_temp98 = load i32, i32* %i4, align 4
    %call_temp99 = call i32 @func3(i32 %call_temp97, i32 %load_temp98)
    %call_temp100 = call i32 @func2(i32 %load_temp95, i32 %call_temp99)
    %call_temp101 = call i32 @func3(i32 %call_temp94, i32 %call_temp100)
    %gep_temp102 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 0
    %load_temp103 = load i32, i32* %gep_temp102, align 4
    %gep_temp104 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 1
    %load_temp105 = load i32, i32* %gep_temp104, align 4
    %call_temp106 = call i32 @func1(i32 %call_temp101, i32 %load_temp103, i32 %load_temp105)
    %gep_temp107 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 2
    %load_temp108 = load i32, i32* %gep_temp107, align 4
    %call_temp109 = call i32 @func2(i32 %call_temp106, i32 %load_temp108)
    %gep_temp110 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 3
    %load_temp111 = load i32, i32* %gep_temp110, align 4
    %gep_temp112 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 4
    %load_temp113 = load i32, i32* %gep_temp112, align 4
    %gep_temp114 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 5
    %load_temp115 = load i32, i32* %gep_temp114, align 4
    %call_temp116 = call i32 @func5(i32 %load_temp115)
    %call_temp117 = call i32 @func3(i32 %load_temp113, i32 %call_temp116)
    %gep_temp118 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 6
    %load_temp119 = load i32, i32* %gep_temp118, align 4
    %call_temp120 = call i32 @func5(i32 %load_temp119)
    %call_temp121 = call i32 @func2(i32 %call_temp117, i32 %call_temp120)
    %gep_temp122 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 7
    %load_temp123 = load i32, i32* %gep_temp122, align 4
    %gep_temp124 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 8
    %load_temp125 = load i32, i32* %gep_temp124, align 4
    %call_temp126 = call i32 @func7(i32 %load_temp125)
    %call_temp127 = call i32 @func1(i32 %call_temp121, i32 %load_temp123, i32 %call_temp126)
    %gep_temp128 = getelementptr [10 x i32], [10 x i32]* %arr, i32 0, i32 9
    %load_temp129 = load i32, i32* %gep_temp128, align 4
    %call_temp130 = call i32 @func5(i32 %load_temp129)
    %call_temp131 = call i32 @func2(i32 %call_temp127, i32 %call_temp130)
    %load_temp132 = load i32, i32* %i1, align 4
    %call_temp133 = call i32 @func3(i32 %call_temp131, i32 %load_temp132)
    %call_temp134 = call i32 @func1(i32 %call_temp109, i32 %load_temp111, i32 %call_temp133)
    store i32 %call_temp134, i32* %a, align 4
    %load_temp135 = load i32, i32* %a, align 4
    ret i32 %load_temp135
}

