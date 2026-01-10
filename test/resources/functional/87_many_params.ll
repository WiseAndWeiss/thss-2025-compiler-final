; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @sort(i32* %arr, i32 %len) {
entry:
    %arr_local = alloca i32*, align 4
    store i32* %arr, i32** %arr_local, align 4
    %len_local = alloca i32, align 4
    store i32 %len, i32* %len_local, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %load_temp1 = load i32, i32* %len_local, align 4
    %sub_temp2 = sub i32 %load_temp1, 1
    %icmp_slt_temp3 = icmp slt i32 %load_temp0, %sub_temp2
    br i1 %icmp_slt_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %j = alloca i32, align 4
    %load_temp4 = load i32, i32* %i, align 4
    %add_temp5 = add i32 %load_temp4, 1
    store i32 %add_temp5, i32* %j, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp6 = load i32, i32* %j, align 4
    %load_temp7 = load i32, i32* %len_local, align 4
    %icmp_slt_temp8 = icmp slt i32 %load_temp6, %load_temp7
    br i1 %icmp_slt_temp8, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp9 = load i32, i32* %i, align 4
    %gep_temp10 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp9
    %load_temp11 = load i32*, i32** %gep_temp10, align 4
    %load_temp12 = load i32, i32* %j, align 4
    %gep_temp13 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp12
    %load_temp14 = load i32*, i32** %gep_temp13, align 4
    %icmp_slt_temp15 = icmp slt i32* %load_temp11, %load_temp14
    br i1 %icmp_slt_temp15, label %if_then_0, label %if_end_0
if_then_0:
    %temp = alloca i32, align 4
    %load_temp16 = load i32, i32* %i, align 4
    %gep_temp17 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp16
    %load_temp18 = load i32*, i32** %gep_temp17, align 4
    store i32* %load_temp18, i32* %temp, align 4
    %load_temp19 = load i32, i32* %i, align 4
    %gep_temp20 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp19
    %load_temp21 = load i32, i32* %j, align 4
    %gep_temp22 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp21
    %load_temp23 = load i32*, i32** %gep_temp22, align 4
    store i32* %load_temp23, i32** %gep_temp20, align 4
    %load_temp24 = load i32, i32* %j, align 4
    %gep_temp25 = getelementptr i32*, i32** %arr_local, i32 0, i32 %load_temp24
    %load_temp26 = load i32, i32* %temp, align 4
    store i32 %load_temp26, i32** %gep_temp25, align 4
    br label %if_end_0
if_end_0:
    %load_temp27 = load i32, i32* %j, align 4
    %add_temp28 = add i32 %load_temp27, 1
    store i32 %add_temp28, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp29 = load i32, i32* %i, align 4
    %add_temp30 = add i32 %load_temp29, 1
    store i32 %add_temp30, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @param32_rec(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i32 %a16, i32 %a17, i32 %a18, i32 %a19, i32 %a20, i32 %a21, i32 %a22, i32 %a23, i32 %a24, i32 %a25, i32 %a26, i32 %a27, i32 %a28, i32 %a29, i32 %a30, i32 %a31, i32 %a32) {
entry:
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
    %a32_local = alloca i32, align 4
    store i32 %a32, i32* %a32_local, align 4
    %load_temp31 = load i32, i32* %a1_local, align 4
    %icmp_eq_temp32 = icmp eq i32 %load_temp31, 0
    br i1 %icmp_eq_temp32, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp33 = load i32, i32* %a2_local, align 4
    ret i32 %load_temp33
if_else_1:
    %load_temp34 = load i32, i32* %a1_local, align 4
    %sub_temp35 = sub i32 %load_temp34, 1
    %load_temp36 = load i32, i32* %a2_local, align 4
    %load_temp37 = load i32, i32* %a3_local, align 4
    %add_temp38 = add i32 %load_temp36, %load_temp37
    %srem_temp39 = srem i32 %add_temp38, 998244353
    %load_temp40 = load i32, i32* %a4_local, align 4
    %load_temp41 = load i32, i32* %a5_local, align 4
    %load_temp42 = load i32, i32* %a6_local, align 4
    %load_temp43 = load i32, i32* %a7_local, align 4
    %load_temp44 = load i32, i32* %a8_local, align 4
    %load_temp45 = load i32, i32* %a9_local, align 4
    %load_temp46 = load i32, i32* %a10_local, align 4
    %load_temp47 = load i32, i32* %a11_local, align 4
    %load_temp48 = load i32, i32* %a12_local, align 4
    %load_temp49 = load i32, i32* %a13_local, align 4
    %load_temp50 = load i32, i32* %a14_local, align 4
    %load_temp51 = load i32, i32* %a15_local, align 4
    %load_temp52 = load i32, i32* %a16_local, align 4
    %load_temp53 = load i32, i32* %a17_local, align 4
    %load_temp54 = load i32, i32* %a18_local, align 4
    %load_temp55 = load i32, i32* %a19_local, align 4
    %load_temp56 = load i32, i32* %a20_local, align 4
    %load_temp57 = load i32, i32* %a21_local, align 4
    %load_temp58 = load i32, i32* %a22_local, align 4
    %load_temp59 = load i32, i32* %a23_local, align 4
    %load_temp60 = load i32, i32* %a24_local, align 4
    %load_temp61 = load i32, i32* %a25_local, align 4
    %load_temp62 = load i32, i32* %a26_local, align 4
    %load_temp63 = load i32, i32* %a27_local, align 4
    %load_temp64 = load i32, i32* %a28_local, align 4
    %load_temp65 = load i32, i32* %a29_local, align 4
    %load_temp66 = load i32, i32* %a30_local, align 4
    %load_temp67 = load i32, i32* %a31_local, align 4
    %load_temp68 = load i32, i32* %a32_local, align 4
    %call_temp69 = call i32 @param32_rec(i32 %sub_temp35, i32 %srem_temp39, i32 %load_temp40, i32 %load_temp41, i32 %load_temp42, i32 %load_temp43, i32 %load_temp44, i32 %load_temp45, i32 %load_temp46, i32 %load_temp47, i32 %load_temp48, i32 %load_temp49, i32 %load_temp50, i32 %load_temp51, i32 %load_temp52, i32 %load_temp53, i32 %load_temp54, i32 %load_temp55, i32 %load_temp56, i32 %load_temp57, i32 %load_temp58, i32 %load_temp59, i32 %load_temp60, i32 %load_temp61, i32 %load_temp62, i32 %load_temp63, i32 %load_temp64, i32 %load_temp65, i32 %load_temp66, i32 %load_temp67, i32 %load_temp68, i32 0)
    ret i32 %call_temp69
if_end_1:
    ret void
}

define i32 @param32_arr(i32* %a1, i32* %a2, i32* %a3, i32* %a4, i32* %a5, i32* %a6, i32* %a7, i32* %a8, i32* %a9, i32* %a10, i32* %a11, i32* %a12, i32* %a13, i32* %a14, i32* %a15, i32* %a16, i32* %a17, i32* %a18, i32* %a19, i32* %a20, i32* %a21, i32* %a22, i32* %a23, i32* %a24, i32* %a25, i32* %a26, i32* %a27, i32* %a28, i32* %a29, i32* %a30, i32* %a31, i32* %a32) {
entry:
    %a1_local = alloca i32*, align 4
    store i32* %a1, i32** %a1_local, align 4
    %a2_local = alloca i32*, align 4
    store i32* %a2, i32** %a2_local, align 4
    %a3_local = alloca i32*, align 4
    store i32* %a3, i32** %a3_local, align 4
    %a4_local = alloca i32*, align 4
    store i32* %a4, i32** %a4_local, align 4
    %a5_local = alloca i32*, align 4
    store i32* %a5, i32** %a5_local, align 4
    %a6_local = alloca i32*, align 4
    store i32* %a6, i32** %a6_local, align 4
    %a7_local = alloca i32*, align 4
    store i32* %a7, i32** %a7_local, align 4
    %a8_local = alloca i32*, align 4
    store i32* %a8, i32** %a8_local, align 4
    %a9_local = alloca i32*, align 4
    store i32* %a9, i32** %a9_local, align 4
    %a10_local = alloca i32*, align 4
    store i32* %a10, i32** %a10_local, align 4
    %a11_local = alloca i32*, align 4
    store i32* %a11, i32** %a11_local, align 4
    %a12_local = alloca i32*, align 4
    store i32* %a12, i32** %a12_local, align 4
    %a13_local = alloca i32*, align 4
    store i32* %a13, i32** %a13_local, align 4
    %a14_local = alloca i32*, align 4
    store i32* %a14, i32** %a14_local, align 4
    %a15_local = alloca i32*, align 4
    store i32* %a15, i32** %a15_local, align 4
    %a16_local = alloca i32*, align 4
    store i32* %a16, i32** %a16_local, align 4
    %a17_local = alloca i32*, align 4
    store i32* %a17, i32** %a17_local, align 4
    %a18_local = alloca i32*, align 4
    store i32* %a18, i32** %a18_local, align 4
    %a19_local = alloca i32*, align 4
    store i32* %a19, i32** %a19_local, align 4
    %a20_local = alloca i32*, align 4
    store i32* %a20, i32** %a20_local, align 4
    %a21_local = alloca i32*, align 4
    store i32* %a21, i32** %a21_local, align 4
    %a22_local = alloca i32*, align 4
    store i32* %a22, i32** %a22_local, align 4
    %a23_local = alloca i32*, align 4
    store i32* %a23, i32** %a23_local, align 4
    %a24_local = alloca i32*, align 4
    store i32* %a24, i32** %a24_local, align 4
    %a25_local = alloca i32*, align 4
    store i32* %a25, i32** %a25_local, align 4
    %a26_local = alloca i32*, align 4
    store i32* %a26, i32** %a26_local, align 4
    %a27_local = alloca i32*, align 4
    store i32* %a27, i32** %a27_local, align 4
    %a28_local = alloca i32*, align 4
    store i32* %a28, i32** %a28_local, align 4
    %a29_local = alloca i32*, align 4
    store i32* %a29, i32** %a29_local, align 4
    %a30_local = alloca i32*, align 4
    store i32* %a30, i32** %a30_local, align 4
    %a31_local = alloca i32*, align 4
    store i32* %a31, i32** %a31_local, align 4
    %a32_local = alloca i32*, align 4
    store i32* %a32, i32** %a32_local, align 4
    %sum = alloca i32, align 4
    %gep_temp70 = getelementptr i32*, i32** %a1_local, i32 0, i32 0
    %load_temp71 = load i32*, i32** %gep_temp70, align 4
    %gep_temp72 = getelementptr i32*, i32** %a1_local, i32 0, i32 1
    %load_temp73 = load i32*, i32** %gep_temp72, align 4
    %add_temp74 = add i32* %load_temp71, %load_temp73
    store i32* %add_temp74, i32* %sum, align 4
    %load_temp75 = load i32, i32* %sum, align 4
    %gep_temp76 = getelementptr i32*, i32** %a2_local, i32 0, i32 0
    %load_temp77 = load i32*, i32** %gep_temp76, align 4
    %add_temp78 = add i32 %load_temp75, %load_temp77
    %gep_temp79 = getelementptr i32*, i32** %a2_local, i32 0, i32 1
    %load_temp80 = load i32*, i32** %gep_temp79, align 4
    %add_temp81 = add i32 %add_temp78, %load_temp80
    store i32 %add_temp81, i32* %sum, align 4
    %load_temp82 = load i32, i32* %sum, align 4
    %gep_temp83 = getelementptr i32*, i32** %a3_local, i32 0, i32 0
    %load_temp84 = load i32*, i32** %gep_temp83, align 4
    %add_temp85 = add i32 %load_temp82, %load_temp84
    %gep_temp86 = getelementptr i32*, i32** %a3_local, i32 0, i32 1
    %load_temp87 = load i32*, i32** %gep_temp86, align 4
    %add_temp88 = add i32 %add_temp85, %load_temp87
    store i32 %add_temp88, i32* %sum, align 4
    %load_temp89 = load i32, i32* %sum, align 4
    %gep_temp90 = getelementptr i32*, i32** %a4_local, i32 0, i32 0
    %load_temp91 = load i32*, i32** %gep_temp90, align 4
    %add_temp92 = add i32 %load_temp89, %load_temp91
    %gep_temp93 = getelementptr i32*, i32** %a4_local, i32 0, i32 1
    %load_temp94 = load i32*, i32** %gep_temp93, align 4
    %add_temp95 = add i32 %add_temp92, %load_temp94
    store i32 %add_temp95, i32* %sum, align 4
    %load_temp96 = load i32, i32* %sum, align 4
    %gep_temp97 = getelementptr i32*, i32** %a5_local, i32 0, i32 0
    %load_temp98 = load i32*, i32** %gep_temp97, align 4
    %add_temp99 = add i32 %load_temp96, %load_temp98
    %gep_temp100 = getelementptr i32*, i32** %a5_local, i32 0, i32 1
    %load_temp101 = load i32*, i32** %gep_temp100, align 4
    %add_temp102 = add i32 %add_temp99, %load_temp101
    store i32 %add_temp102, i32* %sum, align 4
    %load_temp103 = load i32, i32* %sum, align 4
    %gep_temp104 = getelementptr i32*, i32** %a6_local, i32 0, i32 0
    %load_temp105 = load i32*, i32** %gep_temp104, align 4
    %add_temp106 = add i32 %load_temp103, %load_temp105
    %gep_temp107 = getelementptr i32*, i32** %a6_local, i32 0, i32 1
    %load_temp108 = load i32*, i32** %gep_temp107, align 4
    %add_temp109 = add i32 %add_temp106, %load_temp108
    store i32 %add_temp109, i32* %sum, align 4
    %load_temp110 = load i32, i32* %sum, align 4
    %gep_temp111 = getelementptr i32*, i32** %a7_local, i32 0, i32 0
    %load_temp112 = load i32*, i32** %gep_temp111, align 4
    %add_temp113 = add i32 %load_temp110, %load_temp112
    %gep_temp114 = getelementptr i32*, i32** %a7_local, i32 0, i32 1
    %load_temp115 = load i32*, i32** %gep_temp114, align 4
    %add_temp116 = add i32 %add_temp113, %load_temp115
    store i32 %add_temp116, i32* %sum, align 4
    %load_temp117 = load i32, i32* %sum, align 4
    %gep_temp118 = getelementptr i32*, i32** %a8_local, i32 0, i32 0
    %load_temp119 = load i32*, i32** %gep_temp118, align 4
    %add_temp120 = add i32 %load_temp117, %load_temp119
    %gep_temp121 = getelementptr i32*, i32** %a8_local, i32 0, i32 1
    %load_temp122 = load i32*, i32** %gep_temp121, align 4
    %add_temp123 = add i32 %add_temp120, %load_temp122
    store i32 %add_temp123, i32* %sum, align 4
    %load_temp124 = load i32, i32* %sum, align 4
    %gep_temp125 = getelementptr i32*, i32** %a9_local, i32 0, i32 0
    %load_temp126 = load i32*, i32** %gep_temp125, align 4
    %add_temp127 = add i32 %load_temp124, %load_temp126
    %gep_temp128 = getelementptr i32*, i32** %a9_local, i32 0, i32 1
    %load_temp129 = load i32*, i32** %gep_temp128, align 4
    %add_temp130 = add i32 %add_temp127, %load_temp129
    store i32 %add_temp130, i32* %sum, align 4
    %load_temp131 = load i32, i32* %sum, align 4
    %gep_temp132 = getelementptr i32*, i32** %a10_local, i32 0, i32 0
    %load_temp133 = load i32*, i32** %gep_temp132, align 4
    %add_temp134 = add i32 %load_temp131, %load_temp133
    %gep_temp135 = getelementptr i32*, i32** %a10_local, i32 0, i32 1
    %load_temp136 = load i32*, i32** %gep_temp135, align 4
    %add_temp137 = add i32 %add_temp134, %load_temp136
    store i32 %add_temp137, i32* %sum, align 4
    %load_temp138 = load i32, i32* %sum, align 4
    %gep_temp139 = getelementptr i32*, i32** %a11_local, i32 0, i32 0
    %load_temp140 = load i32*, i32** %gep_temp139, align 4
    %add_temp141 = add i32 %load_temp138, %load_temp140
    %gep_temp142 = getelementptr i32*, i32** %a11_local, i32 0, i32 1
    %load_temp143 = load i32*, i32** %gep_temp142, align 4
    %add_temp144 = add i32 %add_temp141, %load_temp143
    store i32 %add_temp144, i32* %sum, align 4
    %load_temp145 = load i32, i32* %sum, align 4
    %gep_temp146 = getelementptr i32*, i32** %a12_local, i32 0, i32 0
    %load_temp147 = load i32*, i32** %gep_temp146, align 4
    %add_temp148 = add i32 %load_temp145, %load_temp147
    %gep_temp149 = getelementptr i32*, i32** %a12_local, i32 0, i32 1
    %load_temp150 = load i32*, i32** %gep_temp149, align 4
    %add_temp151 = add i32 %add_temp148, %load_temp150
    store i32 %add_temp151, i32* %sum, align 4
    %load_temp152 = load i32, i32* %sum, align 4
    %gep_temp153 = getelementptr i32*, i32** %a13_local, i32 0, i32 0
    %load_temp154 = load i32*, i32** %gep_temp153, align 4
    %add_temp155 = add i32 %load_temp152, %load_temp154
    %gep_temp156 = getelementptr i32*, i32** %a13_local, i32 0, i32 1
    %load_temp157 = load i32*, i32** %gep_temp156, align 4
    %add_temp158 = add i32 %add_temp155, %load_temp157
    store i32 %add_temp158, i32* %sum, align 4
    %load_temp159 = load i32, i32* %sum, align 4
    %gep_temp160 = getelementptr i32*, i32** %a14_local, i32 0, i32 0
    %load_temp161 = load i32*, i32** %gep_temp160, align 4
    %add_temp162 = add i32 %load_temp159, %load_temp161
    %gep_temp163 = getelementptr i32*, i32** %a14_local, i32 0, i32 1
    %load_temp164 = load i32*, i32** %gep_temp163, align 4
    %add_temp165 = add i32 %add_temp162, %load_temp164
    store i32 %add_temp165, i32* %sum, align 4
    %load_temp166 = load i32, i32* %sum, align 4
    %gep_temp167 = getelementptr i32*, i32** %a15_local, i32 0, i32 0
    %load_temp168 = load i32*, i32** %gep_temp167, align 4
    %add_temp169 = add i32 %load_temp166, %load_temp168
    %gep_temp170 = getelementptr i32*, i32** %a15_local, i32 0, i32 1
    %load_temp171 = load i32*, i32** %gep_temp170, align 4
    %add_temp172 = add i32 %add_temp169, %load_temp171
    store i32 %add_temp172, i32* %sum, align 4
    %load_temp173 = load i32, i32* %sum, align 4
    %gep_temp174 = getelementptr i32*, i32** %a16_local, i32 0, i32 0
    %load_temp175 = load i32*, i32** %gep_temp174, align 4
    %add_temp176 = add i32 %load_temp173, %load_temp175
    %gep_temp177 = getelementptr i32*, i32** %a16_local, i32 0, i32 1
    %load_temp178 = load i32*, i32** %gep_temp177, align 4
    %add_temp179 = add i32 %add_temp176, %load_temp178
    store i32 %add_temp179, i32* %sum, align 4
    %load_temp180 = load i32, i32* %sum, align 4
    %gep_temp181 = getelementptr i32*, i32** %a17_local, i32 0, i32 0
    %load_temp182 = load i32*, i32** %gep_temp181, align 4
    %add_temp183 = add i32 %load_temp180, %load_temp182
    %gep_temp184 = getelementptr i32*, i32** %a17_local, i32 0, i32 1
    %load_temp185 = load i32*, i32** %gep_temp184, align 4
    %add_temp186 = add i32 %add_temp183, %load_temp185
    store i32 %add_temp186, i32* %sum, align 4
    %load_temp187 = load i32, i32* %sum, align 4
    %gep_temp188 = getelementptr i32*, i32** %a18_local, i32 0, i32 0
    %load_temp189 = load i32*, i32** %gep_temp188, align 4
    %add_temp190 = add i32 %load_temp187, %load_temp189
    %gep_temp191 = getelementptr i32*, i32** %a18_local, i32 0, i32 1
    %load_temp192 = load i32*, i32** %gep_temp191, align 4
    %add_temp193 = add i32 %add_temp190, %load_temp192
    store i32 %add_temp193, i32* %sum, align 4
    %load_temp194 = load i32, i32* %sum, align 4
    %gep_temp195 = getelementptr i32*, i32** %a19_local, i32 0, i32 0
    %load_temp196 = load i32*, i32** %gep_temp195, align 4
    %add_temp197 = add i32 %load_temp194, %load_temp196
    %gep_temp198 = getelementptr i32*, i32** %a19_local, i32 0, i32 1
    %load_temp199 = load i32*, i32** %gep_temp198, align 4
    %add_temp200 = add i32 %add_temp197, %load_temp199
    store i32 %add_temp200, i32* %sum, align 4
    %load_temp201 = load i32, i32* %sum, align 4
    %gep_temp202 = getelementptr i32*, i32** %a20_local, i32 0, i32 0
    %load_temp203 = load i32*, i32** %gep_temp202, align 4
    %add_temp204 = add i32 %load_temp201, %load_temp203
    %gep_temp205 = getelementptr i32*, i32** %a20_local, i32 0, i32 1
    %load_temp206 = load i32*, i32** %gep_temp205, align 4
    %add_temp207 = add i32 %add_temp204, %load_temp206
    store i32 %add_temp207, i32* %sum, align 4
    %load_temp208 = load i32, i32* %sum, align 4
    %gep_temp209 = getelementptr i32*, i32** %a21_local, i32 0, i32 0
    %load_temp210 = load i32*, i32** %gep_temp209, align 4
    %add_temp211 = add i32 %load_temp208, %load_temp210
    %gep_temp212 = getelementptr i32*, i32** %a21_local, i32 0, i32 1
    %load_temp213 = load i32*, i32** %gep_temp212, align 4
    %add_temp214 = add i32 %add_temp211, %load_temp213
    store i32 %add_temp214, i32* %sum, align 4
    %load_temp215 = load i32, i32* %sum, align 4
    %gep_temp216 = getelementptr i32*, i32** %a22_local, i32 0, i32 0
    %load_temp217 = load i32*, i32** %gep_temp216, align 4
    %add_temp218 = add i32 %load_temp215, %load_temp217
    %gep_temp219 = getelementptr i32*, i32** %a22_local, i32 0, i32 1
    %load_temp220 = load i32*, i32** %gep_temp219, align 4
    %add_temp221 = add i32 %add_temp218, %load_temp220
    store i32 %add_temp221, i32* %sum, align 4
    %load_temp222 = load i32, i32* %sum, align 4
    %gep_temp223 = getelementptr i32*, i32** %a23_local, i32 0, i32 0
    %load_temp224 = load i32*, i32** %gep_temp223, align 4
    %add_temp225 = add i32 %load_temp222, %load_temp224
    %gep_temp226 = getelementptr i32*, i32** %a23_local, i32 0, i32 1
    %load_temp227 = load i32*, i32** %gep_temp226, align 4
    %add_temp228 = add i32 %add_temp225, %load_temp227
    store i32 %add_temp228, i32* %sum, align 4
    %load_temp229 = load i32, i32* %sum, align 4
    %gep_temp230 = getelementptr i32*, i32** %a24_local, i32 0, i32 0
    %load_temp231 = load i32*, i32** %gep_temp230, align 4
    %add_temp232 = add i32 %load_temp229, %load_temp231
    %gep_temp233 = getelementptr i32*, i32** %a24_local, i32 0, i32 1
    %load_temp234 = load i32*, i32** %gep_temp233, align 4
    %add_temp235 = add i32 %add_temp232, %load_temp234
    store i32 %add_temp235, i32* %sum, align 4
    %load_temp236 = load i32, i32* %sum, align 4
    %gep_temp237 = getelementptr i32*, i32** %a25_local, i32 0, i32 0
    %load_temp238 = load i32*, i32** %gep_temp237, align 4
    %add_temp239 = add i32 %load_temp236, %load_temp238
    %gep_temp240 = getelementptr i32*, i32** %a25_local, i32 0, i32 1
    %load_temp241 = load i32*, i32** %gep_temp240, align 4
    %add_temp242 = add i32 %add_temp239, %load_temp241
    store i32 %add_temp242, i32* %sum, align 4
    %load_temp243 = load i32, i32* %sum, align 4
    %gep_temp244 = getelementptr i32*, i32** %a26_local, i32 0, i32 0
    %load_temp245 = load i32*, i32** %gep_temp244, align 4
    %add_temp246 = add i32 %load_temp243, %load_temp245
    %gep_temp247 = getelementptr i32*, i32** %a26_local, i32 0, i32 1
    %load_temp248 = load i32*, i32** %gep_temp247, align 4
    %add_temp249 = add i32 %add_temp246, %load_temp248
    store i32 %add_temp249, i32* %sum, align 4
    %load_temp250 = load i32, i32* %sum, align 4
    %gep_temp251 = getelementptr i32*, i32** %a27_local, i32 0, i32 0
    %load_temp252 = load i32*, i32** %gep_temp251, align 4
    %add_temp253 = add i32 %load_temp250, %load_temp252
    %gep_temp254 = getelementptr i32*, i32** %a27_local, i32 0, i32 1
    %load_temp255 = load i32*, i32** %gep_temp254, align 4
    %add_temp256 = add i32 %add_temp253, %load_temp255
    store i32 %add_temp256, i32* %sum, align 4
    %load_temp257 = load i32, i32* %sum, align 4
    %gep_temp258 = getelementptr i32*, i32** %a28_local, i32 0, i32 0
    %load_temp259 = load i32*, i32** %gep_temp258, align 4
    %add_temp260 = add i32 %load_temp257, %load_temp259
    %gep_temp261 = getelementptr i32*, i32** %a28_local, i32 0, i32 1
    %load_temp262 = load i32*, i32** %gep_temp261, align 4
    %add_temp263 = add i32 %add_temp260, %load_temp262
    store i32 %add_temp263, i32* %sum, align 4
    %load_temp264 = load i32, i32* %sum, align 4
    %gep_temp265 = getelementptr i32*, i32** %a29_local, i32 0, i32 0
    %load_temp266 = load i32*, i32** %gep_temp265, align 4
    %add_temp267 = add i32 %load_temp264, %load_temp266
    %gep_temp268 = getelementptr i32*, i32** %a29_local, i32 0, i32 1
    %load_temp269 = load i32*, i32** %gep_temp268, align 4
    %add_temp270 = add i32 %add_temp267, %load_temp269
    store i32 %add_temp270, i32* %sum, align 4
    %load_temp271 = load i32, i32* %sum, align 4
    %gep_temp272 = getelementptr i32*, i32** %a30_local, i32 0, i32 0
    %load_temp273 = load i32*, i32** %gep_temp272, align 4
    %add_temp274 = add i32 %load_temp271, %load_temp273
    %gep_temp275 = getelementptr i32*, i32** %a30_local, i32 0, i32 1
    %load_temp276 = load i32*, i32** %gep_temp275, align 4
    %add_temp277 = add i32 %add_temp274, %load_temp276
    store i32 %add_temp277, i32* %sum, align 4
    %load_temp278 = load i32, i32* %sum, align 4
    %gep_temp279 = getelementptr i32*, i32** %a31_local, i32 0, i32 0
    %load_temp280 = load i32*, i32** %gep_temp279, align 4
    %add_temp281 = add i32 %load_temp278, %load_temp280
    %gep_temp282 = getelementptr i32*, i32** %a31_local, i32 0, i32 1
    %load_temp283 = load i32*, i32** %gep_temp282, align 4
    %add_temp284 = add i32 %add_temp281, %load_temp283
    store i32 %add_temp284, i32* %sum, align 4
    %load_temp285 = load i32, i32* %sum, align 4
    %gep_temp286 = getelementptr i32*, i32** %a32_local, i32 0, i32 0
    %load_temp287 = load i32*, i32** %gep_temp286, align 4
    %add_temp288 = add i32 %load_temp285, %load_temp287
    %gep_temp289 = getelementptr i32*, i32** %a32_local, i32 0, i32 1
    %load_temp290 = load i32*, i32** %gep_temp289, align 4
    %add_temp291 = add i32 %add_temp288, %load_temp290
    store i32 %add_temp291, i32* %sum, align 4
    %load_temp292 = load i32, i32* %sum, align 4
    ret i32 %load_temp292
}

define i32 @param16(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i32 %a16) {
entry:
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
    %arr = alloca [16 x i32], align 4
    %load_temp293 = load i32, i32* %a1_local, align 4
    %gep_temp294 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 0
    store i32 %load_temp293, i32* %gep_temp294, align 4
    %load_temp295 = load i32, i32* %a2_local, align 4
    %gep_temp296 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 1
    store i32 %load_temp295, i32* %gep_temp296, align 4
    %load_temp297 = load i32, i32* %a3_local, align 4
    %gep_temp298 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 2
    store i32 %load_temp297, i32* %gep_temp298, align 4
    %load_temp299 = load i32, i32* %a4_local, align 4
    %gep_temp300 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 3
    store i32 %load_temp299, i32* %gep_temp300, align 4
    %load_temp301 = load i32, i32* %a5_local, align 4
    %gep_temp302 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 4
    store i32 %load_temp301, i32* %gep_temp302, align 4
    %load_temp303 = load i32, i32* %a6_local, align 4
    %gep_temp304 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 5
    store i32 %load_temp303, i32* %gep_temp304, align 4
    %load_temp305 = load i32, i32* %a7_local, align 4
    %gep_temp306 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 6
    store i32 %load_temp305, i32* %gep_temp306, align 4
    %load_temp307 = load i32, i32* %a8_local, align 4
    %gep_temp308 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 7
    store i32 %load_temp307, i32* %gep_temp308, align 4
    %load_temp309 = load i32, i32* %a9_local, align 4
    %gep_temp310 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 8
    store i32 %load_temp309, i32* %gep_temp310, align 4
    %load_temp311 = load i32, i32* %a10_local, align 4
    %gep_temp312 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 9
    store i32 %load_temp311, i32* %gep_temp312, align 4
    %load_temp313 = load i32, i32* %a11_local, align 4
    %gep_temp314 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 10
    store i32 %load_temp313, i32* %gep_temp314, align 4
    %load_temp315 = load i32, i32* %a12_local, align 4
    %gep_temp316 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 11
    store i32 %load_temp315, i32* %gep_temp316, align 4
    %load_temp317 = load i32, i32* %a13_local, align 4
    %gep_temp318 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 12
    store i32 %load_temp317, i32* %gep_temp318, align 4
    %load_temp319 = load i32, i32* %a14_local, align 4
    %gep_temp320 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 13
    store i32 %load_temp319, i32* %gep_temp320, align 4
    %load_temp321 = load i32, i32* %a15_local, align 4
    %gep_temp322 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 14
    store i32 %load_temp321, i32* %gep_temp322, align 4
    %load_temp323 = load i32, i32* %a16_local, align 4
    %gep_temp324 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 15
    store i32 %load_temp323, i32* %gep_temp324, align 4
    %load_temp325 = load [16 x i32], [16 x i32]* %arr, align 4
    call void @sort([16 x i32] %load_temp325, i32 16)
    %gep_temp326 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 0
    %load_temp327 = load i32, i32* %gep_temp326, align 4
    %gep_temp328 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 1
    %load_temp329 = load i32, i32* %gep_temp328, align 4
    %gep_temp330 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 2
    %load_temp331 = load i32, i32* %gep_temp330, align 4
    %gep_temp332 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 3
    %load_temp333 = load i32, i32* %gep_temp332, align 4
    %gep_temp334 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 4
    %load_temp335 = load i32, i32* %gep_temp334, align 4
    %gep_temp336 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 5
    %load_temp337 = load i32, i32* %gep_temp336, align 4
    %gep_temp338 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 6
    %load_temp339 = load i32, i32* %gep_temp338, align 4
    %gep_temp340 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 7
    %load_temp341 = load i32, i32* %gep_temp340, align 4
    %gep_temp342 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 8
    %load_temp343 = load i32, i32* %gep_temp342, align 4
    %gep_temp344 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 9
    %load_temp345 = load i32, i32* %gep_temp344, align 4
    %gep_temp346 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 10
    %load_temp347 = load i32, i32* %gep_temp346, align 4
    %gep_temp348 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 11
    %load_temp349 = load i32, i32* %gep_temp348, align 4
    %gep_temp350 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 12
    %load_temp351 = load i32, i32* %gep_temp350, align 4
    %gep_temp352 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 13
    %load_temp353 = load i32, i32* %gep_temp352, align 4
    %gep_temp354 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 14
    %load_temp355 = load i32, i32* %gep_temp354, align 4
    %gep_temp356 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 15
    %load_temp357 = load i32, i32* %gep_temp356, align 4
    %load_temp358 = load i32, i32* %a1_local, align 4
    %load_temp359 = load i32, i32* %a2_local, align 4
    %load_temp360 = load i32, i32* %a3_local, align 4
    %load_temp361 = load i32, i32* %a4_local, align 4
    %load_temp362 = load i32, i32* %a5_local, align 4
    %load_temp363 = load i32, i32* %a6_local, align 4
    %load_temp364 = load i32, i32* %a7_local, align 4
    %load_temp365 = load i32, i32* %a8_local, align 4
    %load_temp366 = load i32, i32* %a9_local, align 4
    %load_temp367 = load i32, i32* %a10_local, align 4
    %load_temp368 = load i32, i32* %a11_local, align 4
    %load_temp369 = load i32, i32* %a12_local, align 4
    %load_temp370 = load i32, i32* %a13_local, align 4
    %load_temp371 = load i32, i32* %a14_local, align 4
    %load_temp372 = load i32, i32* %a15_local, align 4
    %load_temp373 = load i32, i32* %a16_local, align 4
    %call_temp374 = call i32 @param32_rec(i32 %load_temp327, i32 %load_temp329, i32 %load_temp331, i32 %load_temp333, i32 %load_temp335, i32 %load_temp337, i32 %load_temp339, i32 %load_temp341, i32 %load_temp343, i32 %load_temp345, i32 %load_temp347, i32 %load_temp349, i32 %load_temp351, i32 %load_temp353, i32 %load_temp355, i32 %load_temp357, i32 %load_temp358, i32 %load_temp359, i32 %load_temp360, i32 %load_temp361, i32 %load_temp362, i32 %load_temp363, i32 %load_temp364, i32 %load_temp365, i32 %load_temp366, i32 %load_temp367, i32 %load_temp368, i32 %load_temp369, i32 %load_temp370, i32 %load_temp371, i32 %load_temp372, i32 %load_temp373)
    ret i32 %call_temp374
}

define i32 @main() {
entry:
    %arr = alloca [32 x [2 x i32]], align 4
    %gep_temp375 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 0
    %call_temp376 = call i32 @getint()
    %call_temp377 = call i32 @getint()
    %call_temp378 = call i32 @getint()
    %call_temp379 = call i32 @getint()
    %call_temp380 = call i32 @getint()
    %call_temp381 = call i32 @getint()
    %call_temp382 = call i32 @getint()
    %call_temp383 = call i32 @getint()
    %call_temp384 = call i32 @getint()
    %call_temp385 = call i32 @getint()
    %call_temp386 = call i32 @getint()
    %call_temp387 = call i32 @getint()
    %call_temp388 = call i32 @getint()
    %call_temp389 = call i32 @getint()
    %call_temp390 = call i32 @getint()
    %call_temp391 = call i32 @getint()
    %call_temp392 = call i32 @param16(i32 %call_temp376, i32 %call_temp377, i32 %call_temp378, i32 %call_temp379, i32 %call_temp380, i32 %call_temp381, i32 %call_temp382, i32 %call_temp383, i32 %call_temp384, i32 %call_temp385, i32 %call_temp386, i32 %call_temp387, i32 %call_temp388, i32 %call_temp389, i32 %call_temp390, i32 %call_temp391)
    %gep_temp393 = getelementptr [2 x i32], [2 x i32]* %gep_temp375, i32 0, i32 0
    store i32 %call_temp392, i32* %gep_temp393, align 4
    %gep_temp394 = getelementptr [2 x i32], [2 x i32]* %gep_temp375, i32 0, i32 1
    store i32 8848, i32* %gep_temp394, align 4
    %i = alloca i32, align 4
    store i32 1, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp395 = load i32, i32* %i, align 4
    %icmp_slt_temp396 = icmp slt i32 %load_temp395, 32
    br i1 %icmp_slt_temp396, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp397 = load i32, i32* %i, align 4
    %gep_temp398 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 %load_temp397, i32 0
    %load_temp399 = load i32, i32* %i, align 4
    %sub_temp400 = sub i32 %load_temp399, 1
    %gep_temp401 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 %sub_temp400, i32 1
    %load_temp402 = load i32, i32* %gep_temp401, align 4
    %sub_temp403 = sub i32 %load_temp402, 1
    store i32 %sub_temp403, i32* %gep_temp398, align 4
    %load_temp404 = load i32, i32* %i, align 4
    %gep_temp405 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 %load_temp404, i32 1
    %load_temp406 = load i32, i32* %i, align 4
    %sub_temp407 = sub i32 %load_temp406, 1
    %gep_temp408 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 %sub_temp407, i32 0
    %load_temp409 = load i32, i32* %gep_temp408, align 4
    %sub_temp410 = sub i32 %load_temp409, 2
    store i32 %sub_temp410, i32* %gep_temp405, align 4
    %load_temp411 = load i32, i32* %i, align 4
    %add_temp412 = add i32 %load_temp411, 1
    store i32 %add_temp412, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %gep_temp413 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 0
    %load_temp414 = load [2 x i32], [2 x i32]* %gep_temp413, align 4
    %gep_temp415 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 1
    %load_temp416 = load [2 x i32], [2 x i32]* %gep_temp415, align 4
    %gep_temp417 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 2
    %load_temp418 = load [2 x i32], [2 x i32]* %gep_temp417, align 4
    %gep_temp419 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 3
    %load_temp420 = load [2 x i32], [2 x i32]* %gep_temp419, align 4
    %gep_temp421 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 4
    %load_temp422 = load [2 x i32], [2 x i32]* %gep_temp421, align 4
    %gep_temp423 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 5
    %load_temp424 = load [2 x i32], [2 x i32]* %gep_temp423, align 4
    %gep_temp425 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 6
    %load_temp426 = load [2 x i32], [2 x i32]* %gep_temp425, align 4
    %gep_temp427 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 7
    %load_temp428 = load [2 x i32], [2 x i32]* %gep_temp427, align 4
    %gep_temp429 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 8
    %load_temp430 = load [2 x i32], [2 x i32]* %gep_temp429, align 4
    %gep_temp431 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 9
    %load_temp432 = load [2 x i32], [2 x i32]* %gep_temp431, align 4
    %gep_temp433 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 10
    %load_temp434 = load [2 x i32], [2 x i32]* %gep_temp433, align 4
    %gep_temp435 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 11
    %load_temp436 = load [2 x i32], [2 x i32]* %gep_temp435, align 4
    %gep_temp437 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 12
    %load_temp438 = load [2 x i32], [2 x i32]* %gep_temp437, align 4
    %gep_temp439 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 13
    %load_temp440 = load [2 x i32], [2 x i32]* %gep_temp439, align 4
    %gep_temp441 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 14
    %load_temp442 = load [2 x i32], [2 x i32]* %gep_temp441, align 4
    %gep_temp443 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 15
    %load_temp444 = load [2 x i32], [2 x i32]* %gep_temp443, align 4
    %gep_temp445 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 16
    %load_temp446 = load [2 x i32], [2 x i32]* %gep_temp445, align 4
    %gep_temp447 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 17
    %load_temp448 = load [2 x i32], [2 x i32]* %gep_temp447, align 4
    %gep_temp449 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 18
    %load_temp450 = load [2 x i32], [2 x i32]* %gep_temp449, align 4
    %gep_temp451 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 19
    %load_temp452 = load [2 x i32], [2 x i32]* %gep_temp451, align 4
    %gep_temp453 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 20
    %load_temp454 = load [2 x i32], [2 x i32]* %gep_temp453, align 4
    %gep_temp455 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 21
    %load_temp456 = load [2 x i32], [2 x i32]* %gep_temp455, align 4
    %gep_temp457 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 22
    %load_temp458 = load [2 x i32], [2 x i32]* %gep_temp457, align 4
    %gep_temp459 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 23
    %load_temp460 = load [2 x i32], [2 x i32]* %gep_temp459, align 4
    %gep_temp461 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 24
    %load_temp462 = load [2 x i32], [2 x i32]* %gep_temp461, align 4
    %gep_temp463 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 25
    %load_temp464 = load [2 x i32], [2 x i32]* %gep_temp463, align 4
    %gep_temp465 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 26
    %load_temp466 = load [2 x i32], [2 x i32]* %gep_temp465, align 4
    %gep_temp467 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 27
    %load_temp468 = load [2 x i32], [2 x i32]* %gep_temp467, align 4
    %gep_temp469 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 28
    %load_temp470 = load [2 x i32], [2 x i32]* %gep_temp469, align 4
    %gep_temp471 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 29
    %load_temp472 = load [2 x i32], [2 x i32]* %gep_temp471, align 4
    %gep_temp473 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 30
    %load_temp474 = load [2 x i32], [2 x i32]* %gep_temp473, align 4
    %gep_temp475 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %arr, i32 0, i32 31
    %load_temp476 = load [2 x i32], [2 x i32]* %gep_temp475, align 4
    %call_temp477 = call i32 @param32_arr([2 x i32] %load_temp414, [2 x i32] %load_temp416, [2 x i32] %load_temp418, [2 x i32] %load_temp420, [2 x i32] %load_temp422, [2 x i32] %load_temp424, [2 x i32] %load_temp426, [2 x i32] %load_temp428, [2 x i32] %load_temp430, [2 x i32] %load_temp432, [2 x i32] %load_temp434, [2 x i32] %load_temp436, [2 x i32] %load_temp438, [2 x i32] %load_temp440, [2 x i32] %load_temp442, [2 x i32] %load_temp444, [2 x i32] %load_temp446, [2 x i32] %load_temp448, [2 x i32] %load_temp450, [2 x i32] %load_temp452, [2 x i32] %load_temp454, [2 x i32] %load_temp456, [2 x i32] %load_temp458, [2 x i32] %load_temp460, [2 x i32] %load_temp462, [2 x i32] %load_temp464, [2 x i32] %load_temp466, [2 x i32] %load_temp468, [2 x i32] %load_temp470, [2 x i32] %load_temp472, [2 x i32] %load_temp474, [2 x i32] %load_temp476)
    call void @putint(i32 %call_temp477)
    call void @putch(i32 10)
    ret i32 0
}

