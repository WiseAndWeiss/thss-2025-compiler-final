; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a0 = global i32 0, align 4
@a1 = global i32 0, align 4
@a2 = global i32 0, align 4
@a3 = global i32 0, align 4
@a4 = global i32 0, align 4
@a5 = global i32 0, align 4
@a6 = global i32 0, align 4
@a7 = global i32 0, align 4
@a8 = global i32 0, align 4
@a9 = global i32 0, align 4
@a10 = global i32 0, align 4
@a11 = global i32 0, align 4
@a12 = global i32 0, align 4
@a13 = global i32 0, align 4
@a14 = global i32 0, align 4
@a15 = global i32 0, align 4
@a16 = global i32 0, align 4
@a17 = global i32 0, align 4
@a18 = global i32 0, align 4
@a19 = global i32 0, align 4
@a20 = global i32 0, align 4
@a21 = global i32 0, align 4
@a22 = global i32 0, align 4
@a23 = global i32 0, align 4
@a24 = global i32 0, align 4
@a25 = global i32 0, align 4
@a26 = global i32 0, align 4
@a27 = global i32 0, align 4
@a28 = global i32 0, align 4
@a29 = global i32 0, align 4
@a30 = global i32 0, align 4
@a31 = global i32 0, align 4
@a32 = global i32 0, align 4
@a33 = global i32 0, align 4
@a34 = global i32 0, align 4
@a35 = global i32 0, align 4
@a36 = global i32 0, align 4
@a37 = global i32 0, align 4
@a38 = global i32 0, align 4
@a39 = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @testParam8(i32 %a0, i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7) {
entry:
    %a0_local = alloca i32, align 4
    store i32 %a0, i32* %a0_local, align 4
    %a1_local = alloca i32, align 4
    store i32 %a1, i32* %a1_local, align 4
    %a2_local = alloca i32, align 4
    store i32 %a2, i32* %a2_local, align 4
    %a3_local = alloca i32, align 4
    store i32 %a3, i32* %a3_local, align 4
    %a4_local = alloca i32, align 4
    store i32 %a4, i32* %a4_local, align 4
    %a5_local = alloca i32, align 4
    store i32 %a5, i32* %a5_local, align 4
    %a6_local = alloca i32, align 4
    store i32 %a6, i32* %a6_local, align 4
    %a7_local = alloca i32, align 4
    store i32 %a7, i32* %a7_local, align 4
    %load_temp0 = load i32, i32* %a0_local, align 4
    %load_temp1 = load i32, i32* %a1_local, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    %load_temp3 = load i32, i32* %a2_local, align 4
    %add_temp4 = add i32 %add_temp2, %load_temp3
    %load_temp5 = load i32, i32* %a3_local, align 4
    %add_temp6 = add i32 %add_temp4, %load_temp5
    %load_temp7 = load i32, i32* %a4_local, align 4
    %add_temp8 = add i32 %add_temp6, %load_temp7
    %load_temp9 = load i32, i32* %a5_local, align 4
    %add_temp10 = add i32 %add_temp8, %load_temp9
    %load_temp11 = load i32, i32* %a6_local, align 4
    %add_temp12 = add i32 %add_temp10, %load_temp11
    %load_temp13 = load i32, i32* %a7_local, align 4
    %add_temp14 = add i32 %add_temp12, %load_temp13
    ret i32 %add_temp14
}

define i32 @testParam16(i32 %a0, i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15) {
entry:
    %a0_local = alloca i32, align 4
    store i32 %a0, i32* %a0_local, align 4
    %a1_local = alloca i32, align 4
    store i32 %a1, i32* %a1_local, align 4
    %a2_local = alloca i32, align 4
    store i32 %a2, i32* %a2_local, align 4
    %a3_local = alloca i32, align 4
    store i32 %a3, i32* %a3_local, align 4
    %a4_local = alloca i32, align 4
    store i32 %a4, i32* %a4_local, align 4
    %a5_local = alloca i32, align 4
    store i32 %a5, i32* %a5_local, align 4
    %a6_local = alloca i32, align 4
    store i32 %a6, i32* %a6_local, align 4
    %a7_local = alloca i32, align 4
    store i32 %a7, i32* %a7_local, align 4
    %a8_local = alloca i32, align 4
    store i32 %a8, i32* %a8_local, align 4
    %a9_local = alloca i32, align 4
    store i32 %a9, i32* %a9_local, align 4
    %a10_local = alloca i32, align 4
    store i32 %a10, i32* %a10_local, align 4
    %a11_local = alloca i32, align 4
    store i32 %a11, i32* %a11_local, align 4
    %a12_local = alloca i32, align 4
    store i32 %a12, i32* %a12_local, align 4
    %a13_local = alloca i32, align 4
    store i32 %a13, i32* %a13_local, align 4
    %a14_local = alloca i32, align 4
    store i32 %a14, i32* %a14_local, align 4
    %a15_local = alloca i32, align 4
    store i32 %a15, i32* %a15_local, align 4
    %load_temp15 = load i32, i32* %a0_local, align 4
    %load_temp16 = load i32, i32* %a1_local, align 4
    %add_temp17 = add i32 %load_temp15, %load_temp16
    %load_temp18 = load i32, i32* %a2_local, align 4
    %add_temp19 = add i32 %add_temp17, %load_temp18
    %load_temp20 = load i32, i32* %a3_local, align 4
    %sub_temp21 = sub i32 %add_temp19, %load_temp20
    %load_temp22 = load i32, i32* %a4_local, align 4
    %sub_temp23 = sub i32 %sub_temp21, %load_temp22
    %load_temp24 = load i32, i32* %a5_local, align 4
    %sub_temp25 = sub i32 %sub_temp23, %load_temp24
    %load_temp26 = load i32, i32* %a6_local, align 4
    %sub_temp27 = sub i32 %sub_temp25, %load_temp26
    %load_temp28 = load i32, i32* %a7_local, align 4
    %sub_temp29 = sub i32 %sub_temp27, %load_temp28
    %load_temp30 = load i32, i32* %a8_local, align 4
    %add_temp31 = add i32 %sub_temp29, %load_temp30
    %load_temp32 = load i32, i32* %a9_local, align 4
    %add_temp33 = add i32 %add_temp31, %load_temp32
    %load_temp34 = load i32, i32* %a10_local, align 4
    %add_temp35 = add i32 %add_temp33, %load_temp34
    %load_temp36 = load i32, i32* %a11_local, align 4
    %add_temp37 = add i32 %add_temp35, %load_temp36
    %load_temp38 = load i32, i32* %a12_local, align 4
    %add_temp39 = add i32 %add_temp37, %load_temp38
    %load_temp40 = load i32, i32* %a13_local, align 4
    %add_temp41 = add i32 %add_temp39, %load_temp40
    %load_temp42 = load i32, i32* %a14_local, align 4
    %add_temp43 = add i32 %add_temp41, %load_temp42
    %load_temp44 = load i32, i32* %a15_local, align 4
    %add_temp45 = add i32 %add_temp43, %load_temp44
    ret i32 %add_temp45
}

define i32 @testParam32(i32 %a0, i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i32 %a16, i32 %a17, i32 %a18, i32 %a19, i32 %a20, i32 %a21, i32 %a22, i32 %a23, i32 %a24, i32 %a25, i32 %a26, i32 %a27, i32 %a28, i32 %a29, i32 %a30, i32 %a31) {
entry:
    %a0_local = alloca i32, align 4
    store i32 %a0, i32* %a0_local, align 4
    %a1_local = alloca i32, align 4
    store i32 %a1, i32* %a1_local, align 4
    %a2_local = alloca i32, align 4
    store i32 %a2, i32* %a2_local, align 4
    %a3_local = alloca i32, align 4
    store i32 %a3, i32* %a3_local, align 4
    %a4_local = alloca i32, align 4
    store i32 %a4, i32* %a4_local, align 4
    %a5_local = alloca i32, align 4
    store i32 %a5, i32* %a5_local, align 4
    %a6_local = alloca i32, align 4
    store i32 %a6, i32* %a6_local, align 4
    %a7_local = alloca i32, align 4
    store i32 %a7, i32* %a7_local, align 4
    %a8_local = alloca i32, align 4
    store i32 %a8, i32* %a8_local, align 4
    %a9_local = alloca i32, align 4
    store i32 %a9, i32* %a9_local, align 4
    %a10_local = alloca i32, align 4
    store i32 %a10, i32* %a10_local, align 4
    %a11_local = alloca i32, align 4
    store i32 %a11, i32* %a11_local, align 4
    %a12_local = alloca i32, align 4
    store i32 %a12, i32* %a12_local, align 4
    %a13_local = alloca i32, align 4
    store i32 %a13, i32* %a13_local, align 4
    %a14_local = alloca i32, align 4
    store i32 %a14, i32* %a14_local, align 4
    %a15_local = alloca i32, align 4
    store i32 %a15, i32* %a15_local, align 4
    %a16_local = alloca i32, align 4
    store i32 %a16, i32* %a16_local, align 4
    %a17_local = alloca i32, align 4
    store i32 %a17, i32* %a17_local, align 4
    %a18_local = alloca i32, align 4
    store i32 %a18, i32* %a18_local, align 4
    %a19_local = alloca i32, align 4
    store i32 %a19, i32* %a19_local, align 4
    %a20_local = alloca i32, align 4
    store i32 %a20, i32* %a20_local, align 4
    %a21_local = alloca i32, align 4
    store i32 %a21, i32* %a21_local, align 4
    %a22_local = alloca i32, align 4
    store i32 %a22, i32* %a22_local, align 4
    %a23_local = alloca i32, align 4
    store i32 %a23, i32* %a23_local, align 4
    %a24_local = alloca i32, align 4
    store i32 %a24, i32* %a24_local, align 4
    %a25_local = alloca i32, align 4
    store i32 %a25, i32* %a25_local, align 4
    %a26_local = alloca i32, align 4
    store i32 %a26, i32* %a26_local, align 4
    %a27_local = alloca i32, align 4
    store i32 %a27, i32* %a27_local, align 4
    %a28_local = alloca i32, align 4
    store i32 %a28, i32* %a28_local, align 4
    %a29_local = alloca i32, align 4
    store i32 %a29, i32* %a29_local, align 4
    %a30_local = alloca i32, align 4
    store i32 %a30, i32* %a30_local, align 4
    %a31_local = alloca i32, align 4
    store i32 %a31, i32* %a31_local, align 4
    %load_temp46 = load i32, i32* %a0_local, align 4
    %load_temp47 = load i32, i32* %a1_local, align 4
    %add_temp48 = add i32 %load_temp46, %load_temp47
    %load_temp49 = load i32, i32* %a2_local, align 4
    %add_temp50 = add i32 %add_temp48, %load_temp49
    %load_temp51 = load i32, i32* %a3_local, align 4
    %add_temp52 = add i32 %add_temp50, %load_temp51
    %load_temp53 = load i32, i32* %a4_local, align 4
    %add_temp54 = add i32 %add_temp52, %load_temp53
    %load_temp55 = load i32, i32* %a5_local, align 4
    %add_temp56 = add i32 %add_temp54, %load_temp55
    %load_temp57 = load i32, i32* %a6_local, align 4
    %add_temp58 = add i32 %add_temp56, %load_temp57
    %load_temp59 = load i32, i32* %a7_local, align 4
    %add_temp60 = add i32 %add_temp58, %load_temp59
    %load_temp61 = load i32, i32* %a8_local, align 4
    %add_temp62 = add i32 %add_temp60, %load_temp61
    %load_temp63 = load i32, i32* %a9_local, align 4
    %add_temp64 = add i32 %add_temp62, %load_temp63
    %load_temp65 = load i32, i32* %a10_local, align 4
    %add_temp66 = add i32 %add_temp64, %load_temp65
    %load_temp67 = load i32, i32* %a11_local, align 4
    %add_temp68 = add i32 %add_temp66, %load_temp67
    %load_temp69 = load i32, i32* %a12_local, align 4
    %add_temp70 = add i32 %add_temp68, %load_temp69
    %load_temp71 = load i32, i32* %a13_local, align 4
    %add_temp72 = add i32 %add_temp70, %load_temp71
    %load_temp73 = load i32, i32* %a14_local, align 4
    %add_temp74 = add i32 %add_temp72, %load_temp73
    %load_temp75 = load i32, i32* %a15_local, align 4
    %add_temp76 = add i32 %add_temp74, %load_temp75
    %load_temp77 = load i32, i32* %a16_local, align 4
    %add_temp78 = add i32 %add_temp76, %load_temp77
    %load_temp79 = load i32, i32* %a17_local, align 4
    %add_temp80 = add i32 %add_temp78, %load_temp79
    %load_temp81 = load i32, i32* %a18_local, align 4
    %sub_temp82 = sub i32 %add_temp80, %load_temp81
    %load_temp83 = load i32, i32* %a19_local, align 4
    %sub_temp84 = sub i32 %sub_temp82, %load_temp83
    %load_temp85 = load i32, i32* %a20_local, align 4
    %sub_temp86 = sub i32 %sub_temp84, %load_temp85
    %load_temp87 = load i32, i32* %a21_local, align 4
    %sub_temp88 = sub i32 %sub_temp86, %load_temp87
    %load_temp89 = load i32, i32* %a22_local, align 4
    %sub_temp90 = sub i32 %sub_temp88, %load_temp89
    %load_temp91 = load i32, i32* %a23_local, align 4
    %add_temp92 = add i32 %sub_temp90, %load_temp91
    %load_temp93 = load i32, i32* %a24_local, align 4
    %add_temp94 = add i32 %add_temp92, %load_temp93
    %load_temp95 = load i32, i32* %a25_local, align 4
    %add_temp96 = add i32 %add_temp94, %load_temp95
    %load_temp97 = load i32, i32* %a26_local, align 4
    %add_temp98 = add i32 %add_temp96, %load_temp97
    %load_temp99 = load i32, i32* %a27_local, align 4
    %add_temp100 = add i32 %add_temp98, %load_temp99
    %load_temp101 = load i32, i32* %a28_local, align 4
    %add_temp102 = add i32 %add_temp100, %load_temp101
    %load_temp103 = load i32, i32* %a29_local, align 4
    %add_temp104 = add i32 %add_temp102, %load_temp103
    %load_temp105 = load i32, i32* %a30_local, align 4
    %add_temp106 = add i32 %add_temp104, %load_temp105
    %load_temp107 = load i32, i32* %a31_local, align 4
    %add_temp108 = add i32 %add_temp106, %load_temp107
    ret i32 %add_temp108
}

define i32 @main() {
entry:
    store i32 0, i32* @a0, align 4
    store i32 1, i32* @a1, align 4
    store i32 2, i32* @a2, align 4
    store i32 3, i32* @a3, align 4
    store i32 4, i32* @a4, align 4
    store i32 5, i32* @a5, align 4
    store i32 6, i32* @a6, align 4
    store i32 7, i32* @a7, align 4
    store i32 8, i32* @a8, align 4
    store i32 9, i32* @a9, align 4
    store i32 0, i32* @a10, align 4
    store i32 1, i32* @a11, align 4
    store i32 2, i32* @a12, align 4
    store i32 3, i32* @a13, align 4
    store i32 4, i32* @a14, align 4
    store i32 5, i32* @a15, align 4
    store i32 6, i32* @a16, align 4
    store i32 7, i32* @a17, align 4
    store i32 8, i32* @a18, align 4
    store i32 9, i32* @a19, align 4
    store i32 0, i32* @a20, align 4
    store i32 1, i32* @a21, align 4
    store i32 2, i32* @a22, align 4
    store i32 3, i32* @a23, align 4
    store i32 4, i32* @a24, align 4
    store i32 5, i32* @a25, align 4
    store i32 6, i32* @a26, align 4
    store i32 7, i32* @a27, align 4
    store i32 8, i32* @a28, align 4
    store i32 9, i32* @a29, align 4
    store i32 0, i32* @a30, align 4
    store i32 1, i32* @a31, align 4
    store i32 4, i32* @a32, align 4
    store i32 5, i32* @a33, align 4
    store i32 6, i32* @a34, align 4
    store i32 7, i32* @a35, align 4
    store i32 8, i32* @a36, align 4
    store i32 9, i32* @a37, align 4
    store i32 0, i32* @a38, align 4
    store i32 1, i32* @a39, align 4
    %load_temp109 = load i32, i32* @a0, align 4
    %load_temp110 = load i32, i32* @a1, align 4
    %load_temp111 = load i32, i32* @a2, align 4
    %load_temp112 = load i32, i32* @a3, align 4
    %load_temp113 = load i32, i32* @a4, align 4
    %load_temp114 = load i32, i32* @a5, align 4
    %load_temp115 = load i32, i32* @a6, align 4
    %load_temp116 = load i32, i32* @a7, align 4
    %call_temp117 = call i32 @testParam8(i32 %load_temp109, i32 %load_temp110, i32 %load_temp111, i32 %load_temp112, i32 %load_temp113, i32 %load_temp114, i32 %load_temp115, i32 %load_temp116)
    store i32 %call_temp117, i32* @a0, align 4
    %load_temp118 = load i32, i32* @a0, align 4
    call void @putint(i32 %load_temp118)
    %load_temp119 = load i32, i32* @a32, align 4
    %load_temp120 = load i32, i32* @a33, align 4
    %load_temp121 = load i32, i32* @a34, align 4
    %load_temp122 = load i32, i32* @a35, align 4
    %load_temp123 = load i32, i32* @a36, align 4
    %load_temp124 = load i32, i32* @a37, align 4
    %load_temp125 = load i32, i32* @a38, align 4
    %load_temp126 = load i32, i32* @a39, align 4
    %load_temp127 = load i32, i32* @a8, align 4
    %load_temp128 = load i32, i32* @a9, align 4
    %load_temp129 = load i32, i32* @a10, align 4
    %load_temp130 = load i32, i32* @a11, align 4
    %load_temp131 = load i32, i32* @a12, align 4
    %load_temp132 = load i32, i32* @a13, align 4
    %load_temp133 = load i32, i32* @a14, align 4
    %load_temp134 = load i32, i32* @a15, align 4
    %call_temp135 = call i32 @testParam16(i32 %load_temp119, i32 %load_temp120, i32 %load_temp121, i32 %load_temp122, i32 %load_temp123, i32 %load_temp124, i32 %load_temp125, i32 %load_temp126, i32 %load_temp127, i32 %load_temp128, i32 %load_temp129, i32 %load_temp130, i32 %load_temp131, i32 %load_temp132, i32 %load_temp133, i32 %load_temp134)
    store i32 %call_temp135, i32* @a0, align 4
    %load_temp136 = load i32, i32* @a0, align 4
    call void @putint(i32 %load_temp136)
    %load_temp137 = load i32, i32* @a0, align 4
    %load_temp138 = load i32, i32* @a1, align 4
    %load_temp139 = load i32, i32* @a2, align 4
    %load_temp140 = load i32, i32* @a3, align 4
    %load_temp141 = load i32, i32* @a4, align 4
    %load_temp142 = load i32, i32* @a5, align 4
    %load_temp143 = load i32, i32* @a6, align 4
    %load_temp144 = load i32, i32* @a7, align 4
    %load_temp145 = load i32, i32* @a8, align 4
    %load_temp146 = load i32, i32* @a9, align 4
    %load_temp147 = load i32, i32* @a10, align 4
    %load_temp148 = load i32, i32* @a11, align 4
    %load_temp149 = load i32, i32* @a12, align 4
    %load_temp150 = load i32, i32* @a13, align 4
    %load_temp151 = load i32, i32* @a14, align 4
    %load_temp152 = load i32, i32* @a15, align 4
    %load_temp153 = load i32, i32* @a16, align 4
    %load_temp154 = load i32, i32* @a17, align 4
    %load_temp155 = load i32, i32* @a18, align 4
    %load_temp156 = load i32, i32* @a19, align 4
    %load_temp157 = load i32, i32* @a20, align 4
    %load_temp158 = load i32, i32* @a21, align 4
    %load_temp159 = load i32, i32* @a22, align 4
    %load_temp160 = load i32, i32* @a23, align 4
    %load_temp161 = load i32, i32* @a24, align 4
    %load_temp162 = load i32, i32* @a25, align 4
    %load_temp163 = load i32, i32* @a26, align 4
    %load_temp164 = load i32, i32* @a27, align 4
    %load_temp165 = load i32, i32* @a28, align 4
    %load_temp166 = load i32, i32* @a29, align 4
    %load_temp167 = load i32, i32* @a30, align 4
    %load_temp168 = load i32, i32* @a31, align 4
    %call_temp169 = call i32 @testParam32(i32 %load_temp137, i32 %load_temp138, i32 %load_temp139, i32 %load_temp140, i32 %load_temp141, i32 %load_temp142, i32 %load_temp143, i32 %load_temp144, i32 %load_temp145, i32 %load_temp146, i32 %load_temp147, i32 %load_temp148, i32 %load_temp149, i32 %load_temp150, i32 %load_temp151, i32 %load_temp152, i32 %load_temp153, i32 %load_temp154, i32 %load_temp155, i32 %load_temp156, i32 %load_temp157, i32 %load_temp158, i32 %load_temp159, i32 %load_temp160, i32 %load_temp161, i32 %load_temp162, i32 %load_temp163, i32 %load_temp164, i32 %load_temp165, i32 %load_temp166, i32 %load_temp167, i32 %load_temp168)
    store i32 %call_temp169, i32* @a0, align 4
    %load_temp170 = load i32, i32* @a0, align 4
    call void @putint(i32 %load_temp170)
    ret i32 0
}

