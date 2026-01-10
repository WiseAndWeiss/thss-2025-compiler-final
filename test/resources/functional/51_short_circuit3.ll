; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 0, align 4
@b = global i32 0, align 4
@d = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @set_a(i32 %val) {
entry:
    %val_local = alloca i32, align 4
    store i32 %val, i32* %val_local, align 4
    %load_temp0 = load i32, i32* %val_local, align 4
    store i32 %load_temp0, i32* @a, align 4
    %load_temp1 = load i32, i32* @a, align 4
    ret i32 %load_temp1
}

define i32 @set_b(i32 %val) {
entry:
    %val_local = alloca i32, align 4
    store i32 %val, i32* %val_local, align 4
    %load_temp2 = load i32, i32* %val_local, align 4
    store i32 %load_temp2, i32* @b, align 4
    %load_temp3 = load i32, i32* @b, align 4
    ret i32 %load_temp3
}

define i32 @set_d(i32 %val) {
entry:
    %val_local = alloca i32, align 4
    store i32 %val, i32* %val_local, align 4
    %load_temp4 = load i32, i32* %val_local, align 4
    store i32 %load_temp4, i32* @d, align 4
    %load_temp5 = load i32, i32* @d, align 4
    ret i32 %load_temp5
}

define i32 @main() {
entry:
    store i32 2, i32* @a, align 4
    store i32 3, i32* @b, align 4
    %call_temp6 = call i32 @set_a(i32 0)
    %call_temp7 = call i32 @set_b(i32 1)
    %icmp_ne_temp8 = icmp ne i32 %call_temp6, 0
    %icmp_ne_temp9 = icmp ne i32 %call_temp7, 0
    %zext_temp10 = zext i1 %icmp_ne_temp8 to i32
    %zext_temp11 = zext i1 %icmp_ne_temp9 to i32
    %mul_temp12 = mul i32 %zext_temp10, %zext_temp11
    %icmp_ne_temp13 = icmp ne i32 %mul_temp12, 0
    br i1 %icmp_ne_temp13, label %if_then_0, label %if_end_0
if_then_0:
    br label %if_end_0
if_end_0:
    %load_temp14 = load i32, i32* @a, align 4
    call void @putint(i32 %load_temp14)
    call void @putch(i32 32)
    %load_temp15 = load i32, i32* @b, align 4
    call void @putint(i32 %load_temp15)
    call void @putch(i32 32)
    store i32 2, i32* @a, align 4
    store i32 3, i32* @b, align 4
    %call_temp16 = call i32 @set_a(i32 0)
    %call_temp17 = call i32 @set_b(i32 1)
    %icmp_ne_temp18 = icmp ne i32 %call_temp16, 0
    %icmp_ne_temp19 = icmp ne i32 %call_temp17, 0
    %zext_temp20 = zext i1 %icmp_ne_temp18 to i32
    %zext_temp21 = zext i1 %icmp_ne_temp19 to i32
    %mul_temp22 = mul i32 %zext_temp20, %zext_temp21
    %icmp_ne_temp23 = icmp ne i32 %mul_temp22, 0
    br i1 %icmp_ne_temp23, label %if_then_1, label %if_end_1
if_then_1:
    br label %if_end_1
if_end_1:
    %load_temp24 = load i32, i32* @a, align 4
    call void @putint(i32 %load_temp24)
    call void @putch(i32 32)
    %load_temp25 = load i32, i32* @b, align 4
    call void @putint(i32 %load_temp25)
    call void @putch(i32 10)
    %c = alloca i32, align 4
    store i32 1, i32* %c, align 4
    store i32 2, i32* @d, align 4
    %load_temp26 = load i32, i32* %c, align 4
    %icmp_sge_temp27 = icmp sge i32 %load_temp26, 1
    %call_temp28 = call i32 @set_d(i32 3)
    %icmp_ne_temp29 = icmp ne i1 %icmp_sge_temp27, 0
    %icmp_ne_temp30 = icmp ne i32 %call_temp28, 0
    %zext_temp31 = zext i1 %icmp_ne_temp29 to i32
    %zext_temp32 = zext i1 %icmp_ne_temp30 to i32
    %mul_temp33 = mul i32 %zext_temp31, %zext_temp32
    %icmp_ne_temp34 = icmp ne i32 %mul_temp33, 0
    br i1 %icmp_ne_temp34, label %if_then_2, label %if_end_2
if_then_2:
    br label %if_end_2
if_end_2:
    %load_temp35 = load i32, i32* @d, align 4
    call void @putint(i32 %load_temp35)
    call void @putch(i32 32)
    %load_temp36 = load i32, i32* %c, align 4
    %icmp_sle_temp37 = icmp sle i32 %load_temp36, 1
    %call_temp38 = call i32 @set_d(i32 4)
    %icmp_ne_temp39 = icmp ne i1 %icmp_sle_temp37, 0
    %icmp_ne_temp40 = icmp ne i32 %call_temp38, 0
    %zext_temp41 = zext i1 %icmp_ne_temp39 to i32
    %zext_temp42 = zext i1 %icmp_ne_temp40 to i32
    %add_temp43 = add i32 %zext_temp41, %zext_temp42
    %icmp_ne_temp44 = icmp ne i32 %add_temp43, 0
    br i1 %icmp_ne_temp44, label %if_then_3, label %if_end_3
if_then_3:
    br label %if_end_3
if_end_3:
    %load_temp45 = load i32, i32* @d, align 4
    call void @putint(i32 %load_temp45)
    call void @putch(i32 10)
    %add_temp46 = add i32 2, 1
    %sub_temp47 = sub i32 3, %add_temp46
    %icmp_sge_temp48 = icmp sge i32 16, %sub_temp47
    br i1 %icmp_sge_temp48, label %if_then_4, label %if_end_4
if_then_4:
    call void @putch(i32 65)
    br label %if_end_4
if_end_4:
    %sub_temp49 = sub i32 25, 7
    %mul_temp50 = mul i32 6, 3
    %sub_temp51 = sub i32 36, %mul_temp50
    %icmp_ne_temp52 = icmp ne i32 %sub_temp49, %sub_temp51
    br i1 %icmp_ne_temp52, label %if_then_5, label %if_end_5
if_then_5:
    call void @putch(i32 66)
    br label %if_end_5
if_end_5:
    %icmp_slt_temp53 = icmp slt i32 1, 8
    %srem_temp54 = srem i32 7, 2
    %icmp_ne_temp55 = icmp ne i1 %icmp_slt_temp53, %srem_temp54
    br i1 %icmp_ne_temp55, label %if_then_6, label %if_end_6
if_then_6:
    call void @putch(i32 67)
    br label %if_end_6
if_end_6:
    %icmp_sgt_temp56 = icmp sgt i32 3, 4
    %icmp_eq_temp57 = icmp eq i1 %icmp_sgt_temp56, 0
    br i1 %icmp_eq_temp57, label %if_then_7, label %if_end_7
if_then_7:
    call void @putch(i32 68)
    br label %if_end_7
if_end_7:
    %icmp_sle_temp58 = icmp sle i32 102, 63
    %icmp_eq_temp59 = icmp eq i32 1, %icmp_sle_temp58
    br i1 %icmp_eq_temp59, label %if_then_8, label %if_end_8
if_then_8:
    call void @putch(i32 69)
    br label %if_end_8
if_end_8:
    %sub_temp60 = sub i32 5, 6
    %icmp_eq_temp61 = icmp eq i32 0, 0
    %zext_temp62 = zext i1 %icmp_eq_temp61 to i32
    %sub_temp63 = sub i32 0, %zext_temp62
    %icmp_eq_temp64 = icmp eq i32 %sub_temp60, %sub_temp63
    br i1 %icmp_eq_temp64, label %if_then_9, label %if_end_9
if_then_9:
    call void @putch(i32 70)
    br label %if_end_9
if_end_9:
    call void @putch(i32 10)
    %i0 = alloca i32, align 4
    store i32 0, i32* %i0, align 4
    %i1 = alloca i32, align 4
    store i32 1, i32* %i1, align 4
    %i2 = alloca i32, align 4
    store i32 2, i32* %i2, align 4
    %i3 = alloca i32, align 4
    store i32 3, i32* %i3, align 4
    %i4 = alloca i32, align 4
    store i32 4, i32* %i4, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp65 = load i32, i32* %i0, align 4
    %load_temp66 = load i32, i32* %i1, align 4
    %icmp_ne_temp67 = icmp ne i32 %load_temp65, 0
    %icmp_ne_temp68 = icmp ne i32 %load_temp66, 0
    %zext_temp69 = zext i1 %icmp_ne_temp67 to i32
    %zext_temp70 = zext i1 %icmp_ne_temp68 to i32
    %mul_temp71 = mul i32 %zext_temp69, %zext_temp70
    %icmp_ne_temp72 = icmp ne i32 %mul_temp71, 0
    br i1 %icmp_ne_temp72, label %while_body_0, label %while_end_0
while_body_0:
    call void @putch(i32 32)
    br label %while_cond_0
while_end_0:
    %load_temp73 = load i32, i32* %i0, align 4
    %load_temp74 = load i32, i32* %i1, align 4
    %icmp_ne_temp75 = icmp ne i32 %load_temp73, 0
    %icmp_ne_temp76 = icmp ne i32 %load_temp74, 0
    %zext_temp77 = zext i1 %icmp_ne_temp75 to i32
    %zext_temp78 = zext i1 %icmp_ne_temp76 to i32
    %add_temp79 = add i32 %zext_temp77, %zext_temp78
    %icmp_ne_temp80 = icmp ne i32 %add_temp79, 0
    br i1 %icmp_ne_temp80, label %if_then_10, label %if_end_10
if_then_10:
    call void @putch(i32 67)
    br label %if_end_10
if_end_10:
    %load_temp81 = load i32, i32* %i0, align 4
    %load_temp82 = load i32, i32* %i1, align 4
    %icmp_sge_temp83 = icmp sge i32 %load_temp81, %load_temp82
    %load_temp84 = load i32, i32* %i1, align 4
    %load_temp85 = load i32, i32* %i0, align 4
    %icmp_sle_temp86 = icmp sle i32 %load_temp84, %load_temp85
    %zext_temp87 = zext i1 %icmp_sge_temp83 to i32
    %zext_temp88 = zext i1 %icmp_sle_temp86 to i32
    %add_temp89 = add i32 %zext_temp87, %zext_temp88
    %icmp_ne_temp90 = icmp ne i32 %add_temp89, 0
    br i1 %icmp_ne_temp90, label %if_then_11, label %if_end_11
if_then_11:
    call void @putch(i32 72)
    br label %if_end_11
if_end_11:
    %load_temp91 = load i32, i32* %i2, align 4
    %load_temp92 = load i32, i32* %i1, align 4
    %icmp_sge_temp93 = icmp sge i32 %load_temp91, %load_temp92
    %load_temp94 = load i32, i32* %i4, align 4
    %load_temp95 = load i32, i32* %i3, align 4
    %icmp_ne_temp96 = icmp ne i32 %load_temp94, %load_temp95
    %zext_temp97 = zext i1 %icmp_sge_temp93 to i32
    %zext_temp98 = zext i1 %icmp_ne_temp96 to i32
    %mul_temp99 = mul i32 %zext_temp97, %zext_temp98
    %icmp_ne_temp100 = icmp ne i32 %mul_temp99, 0
    br i1 %icmp_ne_temp100, label %if_then_12, label %if_end_12
if_then_12:
    call void @putch(i32 73)
    br label %if_end_12
if_end_12:
    %load_temp101 = load i32, i32* %i0, align 4
    %load_temp102 = load i32, i32* %i1, align 4
    %icmp_eq_temp103 = icmp eq i32 %load_temp102, 0
    %icmp_eq_temp104 = icmp eq i32 %load_temp101, %icmp_eq_temp103
    %load_temp105 = load i32, i32* %i3, align 4
    %load_temp106 = load i32, i32* %i3, align 4
    %icmp_slt_temp107 = icmp slt i32 %load_temp105, %load_temp106
    %zext_temp108 = zext i1 %icmp_eq_temp104 to i32
    %zext_temp109 = zext i1 %icmp_slt_temp107 to i32
    %mul_temp110 = mul i32 %zext_temp108, %zext_temp109
    %icmp_ne_temp111 = icmp ne i32 %mul_temp110, 0
    %load_temp112 = load i32, i32* %i4, align 4
    %load_temp113 = load i32, i32* %i4, align 4
    %icmp_sge_temp114 = icmp sge i32 %load_temp112, %load_temp113
    %zext_temp115 = zext i1 %icmp_ne_temp111 to i32
    %zext_temp116 = zext i1 %icmp_sge_temp114 to i32
    %add_temp117 = add i32 %zext_temp115, %zext_temp116
    %icmp_ne_temp118 = icmp ne i32 %add_temp117, 0
    br i1 %icmp_ne_temp118, label %if_then_13, label %if_end_13
if_then_13:
    call void @putch(i32 74)
    br label %if_end_13
if_end_13:
    %load_temp119 = load i32, i32* %i0, align 4
    %load_temp120 = load i32, i32* %i1, align 4
    %icmp_eq_temp121 = icmp eq i32 %load_temp120, 0
    %icmp_eq_temp122 = icmp eq i32 %load_temp119, %icmp_eq_temp121
    %load_temp123 = load i32, i32* %i3, align 4
    %load_temp124 = load i32, i32* %i3, align 4
    %icmp_slt_temp125 = icmp slt i32 %load_temp123, %load_temp124
    %load_temp126 = load i32, i32* %i4, align 4
    %load_temp127 = load i32, i32* %i4, align 4
    %icmp_sge_temp128 = icmp sge i32 %load_temp126, %load_temp127
    %zext_temp129 = zext i1 %icmp_slt_temp125 to i32
    %zext_temp130 = zext i1 %icmp_sge_temp128 to i32
    %mul_temp131 = mul i32 %zext_temp129, %zext_temp130
    %icmp_ne_temp132 = icmp ne i32 %mul_temp131, 0
    %zext_temp133 = zext i1 %icmp_eq_temp122 to i32
    %zext_temp134 = zext i1 %icmp_ne_temp132 to i32
    %add_temp135 = add i32 %zext_temp133, %zext_temp134
    %icmp_ne_temp136 = icmp ne i32 %add_temp135, 0
    br i1 %icmp_ne_temp136, label %if_then_14, label %if_end_14
if_then_14:
    call void @putch(i32 75)
    br label %if_end_14
if_end_14:
    call void @putch(i32 10)
    ret i32 0
}

