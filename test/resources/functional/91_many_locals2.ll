; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@n = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a0 = alloca i32, align 4
    %a1 = alloca i32, align 4
    %a2 = alloca i32, align 4
    %a3 = alloca i32, align 4
    %a4 = alloca i32, align 4
    %a5 = alloca i32, align 4
    %a6 = alloca i32, align 4
    %a7 = alloca i32, align 4
    %a8 = alloca i32, align 4
    %a9 = alloca i32, align 4
    %a10 = alloca i32, align 4
    %a11 = alloca i32, align 4
    %a12 = alloca i32, align 4
    %a13 = alloca i32, align 4
    %a14 = alloca i32, align 4
    %a15 = alloca i32, align 4
    %a16 = alloca i32, align 4
    %a17 = alloca i32, align 4
    %a18 = alloca i32, align 4
    %a19 = alloca i32, align 4
    %a20 = alloca i32, align 4
    %a21 = alloca i32, align 4
    %a22 = alloca i32, align 4
    %a23 = alloca i32, align 4
    %a24 = alloca i32, align 4
    %a25 = alloca i32, align 4
    %a26 = alloca i32, align 4
    %a27 = alloca i32, align 4
    %a28 = alloca i32, align 4
    %a29 = alloca i32, align 4
    %b = alloca i32, align 4
    %call_temp0 = call i32 @getint()
    store i32 %call_temp0, i32* %b, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp1 = load i32, i32* %b, align 4
    %icmp_eq_temp2 = icmp eq i32 %load_temp1, 5
    br i1 %icmp_eq_temp2, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp3 = load i32, i32* %b, align 4
    %add_temp4 = add i32 %load_temp3, 1
    store i32 %add_temp4, i32* %b, align 4
    br label %while_cond_0
while_end_0:
    store i32 0, i32* %a0, align 4
    %load_temp5 = load i32, i32* %a0, align 4
    %add_temp6 = add i32 %load_temp5, 1
    store i32 %add_temp6, i32* %a1, align 4
    %load_temp7 = load i32, i32* %a1, align 4
    %add_temp8 = add i32 %load_temp7, 1
    store i32 %add_temp8, i32* %a2, align 4
    %load_temp9 = load i32, i32* %a2, align 4
    %add_temp10 = add i32 %load_temp9, 1
    store i32 %add_temp10, i32* %a3, align 4
    %load_temp11 = load i32, i32* %a3, align 4
    %add_temp12 = add i32 %load_temp11, 1
    store i32 %add_temp12, i32* %a4, align 4
    %load_temp13 = load i32, i32* %a4, align 4
    %add_temp14 = add i32 %load_temp13, 1
    store i32 %add_temp14, i32* %a5, align 4
    %load_temp15 = load i32, i32* %a5, align 4
    %add_temp16 = add i32 %load_temp15, 1
    store i32 %add_temp16, i32* %a6, align 4
    %load_temp17 = load i32, i32* %a6, align 4
    %add_temp18 = add i32 %load_temp17, 1
    store i32 %add_temp18, i32* %a7, align 4
    %load_temp19 = load i32, i32* %a7, align 4
    %add_temp20 = add i32 %load_temp19, 1
    store i32 %add_temp20, i32* %a8, align 4
    %load_temp21 = load i32, i32* %a8, align 4
    %add_temp22 = add i32 %load_temp21, 1
    store i32 %add_temp22, i32* %a9, align 4
    %load_temp23 = load i32, i32* %a9, align 4
    %add_temp24 = add i32 %load_temp23, 1
    store i32 %add_temp24, i32* %a10, align 4
    %load_temp25 = load i32, i32* %a10, align 4
    %add_temp26 = add i32 %load_temp25, 1
    store i32 %add_temp26, i32* %a11, align 4
    %load_temp27 = load i32, i32* %a11, align 4
    %add_temp28 = add i32 %load_temp27, 1
    store i32 %add_temp28, i32* %a12, align 4
    %load_temp29 = load i32, i32* %a12, align 4
    %add_temp30 = add i32 %load_temp29, 1
    store i32 %add_temp30, i32* %a13, align 4
    %load_temp31 = load i32, i32* %a13, align 4
    %add_temp32 = add i32 %load_temp31, 1
    store i32 %add_temp32, i32* %a14, align 4
    %load_temp33 = load i32, i32* %a14, align 4
    %add_temp34 = add i32 %load_temp33, 1
    store i32 %add_temp34, i32* %a15, align 4
    %load_temp35 = load i32, i32* %a15, align 4
    %add_temp36 = add i32 %load_temp35, 1
    store i32 %add_temp36, i32* %a16, align 4
    %load_temp37 = load i32, i32* %a16, align 4
    %add_temp38 = add i32 %load_temp37, 1
    store i32 %add_temp38, i32* %a17, align 4
    %load_temp39 = load i32, i32* %a17, align 4
    %add_temp40 = add i32 %load_temp39, 1
    store i32 %add_temp40, i32* %a18, align 4
    %load_temp41 = load i32, i32* %a18, align 4
    %add_temp42 = add i32 %load_temp41, 1
    store i32 %add_temp42, i32* %a19, align 4
    %load_temp43 = load i32, i32* %a19, align 4
    %add_temp44 = add i32 %load_temp43, 1
    store i32 %add_temp44, i32* %a20, align 4
    %load_temp45 = load i32, i32* %a20, align 4
    %add_temp46 = add i32 %load_temp45, 1
    store i32 %add_temp46, i32* %a21, align 4
    %load_temp47 = load i32, i32* %a21, align 4
    %add_temp48 = add i32 %load_temp47, 1
    store i32 %add_temp48, i32* %a22, align 4
    %load_temp49 = load i32, i32* %a22, align 4
    %add_temp50 = add i32 %load_temp49, 1
    store i32 %add_temp50, i32* %a23, align 4
    %load_temp51 = load i32, i32* %a23, align 4
    %add_temp52 = add i32 %load_temp51, 1
    store i32 %add_temp52, i32* %a24, align 4
    %load_temp53 = load i32, i32* %a24, align 4
    %add_temp54 = add i32 %load_temp53, 1
    store i32 %add_temp54, i32* %a25, align 4
    %load_temp55 = load i32, i32* %a25, align 4
    %add_temp56 = add i32 %load_temp55, 1
    store i32 %add_temp56, i32* %a26, align 4
    %load_temp57 = load i32, i32* %a26, align 4
    %add_temp58 = add i32 %load_temp57, 1
    store i32 %add_temp58, i32* %a27, align 4
    %load_temp59 = load i32, i32* %a27, align 4
    %add_temp60 = add i32 %load_temp59, 1
    store i32 %add_temp60, i32* %a28, align 4
    %load_temp61 = load i32, i32* %a28, align 4
    %add_temp62 = add i32 %load_temp61, 1
    store i32 %add_temp62, i32* %a29, align 4
    %t = alloca i32, align 4
    %load_temp63 = load i32, i32* %a0, align 4
    call void @putint(i32 %load_temp63)
    %load_temp64 = load i32, i32* %a1, align 4
    call void @putint(i32 %load_temp64)
    %load_temp65 = load i32, i32* %a2, align 4
    call void @putint(i32 %load_temp65)
    %load_temp66 = load i32, i32* %a3, align 4
    call void @putint(i32 %load_temp66)
    %load_temp67 = load i32, i32* %a4, align 4
    call void @putint(i32 %load_temp67)
    %load_temp68 = load i32, i32* %a5, align 4
    call void @putint(i32 %load_temp68)
    %load_temp69 = load i32, i32* %a6, align 4
    call void @putint(i32 %load_temp69)
    %load_temp70 = load i32, i32* %a7, align 4
    call void @putint(i32 %load_temp70)
    %load_temp71 = load i32, i32* %a8, align 4
    call void @putint(i32 %load_temp71)
    %load_temp72 = load i32, i32* %a9, align 4
    call void @putint(i32 %load_temp72)
    %load_temp73 = load i32, i32* %a10, align 4
    call void @putint(i32 %load_temp73)
    %load_temp74 = load i32, i32* %a11, align 4
    call void @putint(i32 %load_temp74)
    %load_temp75 = load i32, i32* %a12, align 4
    call void @putint(i32 %load_temp75)
    %load_temp76 = load i32, i32* %a13, align 4
    call void @putint(i32 %load_temp76)
    %load_temp77 = load i32, i32* %a14, align 4
    call void @putint(i32 %load_temp77)
    %load_temp78 = load i32, i32* %a15, align 4
    call void @putint(i32 %load_temp78)
    %load_temp79 = load i32, i32* %a16, align 4
    call void @putint(i32 %load_temp79)
    %load_temp80 = load i32, i32* %a17, align 4
    call void @putint(i32 %load_temp80)
    %load_temp81 = load i32, i32* %a18, align 4
    call void @putint(i32 %load_temp81)
    %load_temp82 = load i32, i32* %a19, align 4
    call void @putint(i32 %load_temp82)
    %load_temp83 = load i32, i32* %a20, align 4
    call void @putint(i32 %load_temp83)
    %load_temp84 = load i32, i32* %a21, align 4
    call void @putint(i32 %load_temp84)
    %load_temp85 = load i32, i32* %a22, align 4
    call void @putint(i32 %load_temp85)
    %load_temp86 = load i32, i32* %a23, align 4
    call void @putint(i32 %load_temp86)
    %load_temp87 = load i32, i32* %a24, align 4
    call void @putint(i32 %load_temp87)
    %load_temp88 = load i32, i32* %a25, align 4
    call void @putint(i32 %load_temp88)
    %load_temp89 = load i32, i32* %a26, align 4
    call void @putint(i32 %load_temp89)
    %load_temp90 = load i32, i32* %a27, align 4
    call void @putint(i32 %load_temp90)
    %load_temp91 = load i32, i32* %a28, align 4
    call void @putint(i32 %load_temp91)
    %load_temp92 = load i32, i32* %a29, align 4
    call void @putint(i32 %load_temp92)
    %newline = alloca i32, align 4
    store i32 10, i32* %newline, align 4
    %load_temp93 = load i32, i32* %newline, align 4
    call void @putch(i32 %load_temp93)
    %load_temp94 = load i32, i32* %b, align 4
    call void @putint(i32 %load_temp94)
    %load_temp95 = load i32, i32* %newline, align 4
    call void @putch(i32 %load_temp95)
    %load_temp96 = load i32, i32* %a25, align 4
    ret i32 %load_temp96
}

