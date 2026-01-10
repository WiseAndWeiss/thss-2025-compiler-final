; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@ints = global [10000 x i32] zeroinitializer, align 4
@intt = global i32 0, align 4
@chas = global [10000 x i32] zeroinitializer, align 4
@chat = global i32 0, align 4
@i = global i32 0, align 4
@ii = global i32 1, align 4
@c = global i32 0, align 4
@get = global [10000 x i32] zeroinitializer, align 4
@get2 = global [10000 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @isdigit(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp0 = load i32, i32* %x_local, align 4
    %icmp_sge_temp1 = icmp sge i32 %load_temp0, 48
    %load_temp2 = load i32, i32* %x_local, align 4
    %icmp_sle_temp3 = icmp sle i32 %load_temp2, 57
    %zext_temp4 = zext i1 %icmp_sge_temp1 to i32
    %zext_temp5 = zext i1 %icmp_sle_temp3 to i32
    %mul_temp6 = mul i32 %zext_temp4, %zext_temp5
    %icmp_ne_temp7 = icmp ne i32 %mul_temp6, 0
    br i1 %icmp_ne_temp7, label %if_then_0, label %if_end_0
if_then_0:
    ret i32 1
if_end_0:
    ret i32 0
}

define i32 @power(i32 %b, i32 %a) {
entry:
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %result = alloca i32, align 4
    store i32 1, i32* %result, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp8 = load i32, i32* %a_local, align 4
    %icmp_ne_temp9 = icmp ne i32 %load_temp8, 0
    br i1 %icmp_ne_temp9, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp10 = load i32, i32* %result, align 4
    %load_temp11 = load i32, i32* %b_local, align 4
    %mul_temp12 = mul i32 %load_temp10, %load_temp11
    store i32 %mul_temp12, i32* %result, align 4
    %load_temp13 = load i32, i32* %a_local, align 4
    %sub_temp14 = sub i32 %load_temp13, 1
    store i32 %sub_temp14, i32* %a_local, align 4
    br label %while_cond_0
while_end_0:
    %load_temp15 = load i32, i32* %result, align 4
    ret i32 %load_temp15
}

define i32 @getstr(i32* %get) {
entry:
    %get_local = alloca i32*, align 4
    store i32* %get, i32** %get_local, align 4
    %x = alloca i32, align 4
    %call_temp16 = call i32 @getch()
    store i32 %call_temp16, i32* %x, align 4
    %length = alloca i32, align 4
    store i32 0, i32* %length, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp17 = load i32, i32* %x, align 4
    %icmp_ne_temp18 = icmp ne i32 %load_temp17, 13
    %load_temp19 = load i32, i32* %x, align 4
    %icmp_ne_temp20 = icmp ne i32 %load_temp19, 10
    %zext_temp21 = zext i1 %icmp_ne_temp18 to i32
    %zext_temp22 = zext i1 %icmp_ne_temp20 to i32
    %mul_temp23 = mul i32 %zext_temp21, %zext_temp22
    %icmp_ne_temp24 = icmp ne i32 %mul_temp23, 0
    br i1 %icmp_ne_temp24, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp25 = load i32, i32* %length, align 4
    %gep_temp26 = getelementptr i32*, i32** %get_local, i32 0, i32 %load_temp25
    %load_temp27 = load i32, i32* %x, align 4
    store i32 %load_temp27, i32** %gep_temp26, align 4
    %load_temp28 = load i32, i32* %length, align 4
    %add_temp29 = add i32 %load_temp28, 1
    store i32 %add_temp29, i32* %length, align 4
    %call_temp30 = call i32 @getch()
    store i32 %call_temp30, i32* %x, align 4
    br label %while_cond_0
while_end_0:
    %load_temp31 = load i32, i32* %length, align 4
    ret i32 %load_temp31
}

define void @intpush(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp32 = load i32, i32* @intt, align 4
    %add_temp33 = add i32 %load_temp32, 1
    store i32 %add_temp33, i32* @intt, align 4
    %load_temp34 = load i32, i32* @intt, align 4
    %gep_temp35 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %load_temp34
    %load_temp36 = load i32, i32* %x_local, align 4
    store i32 %load_temp36, i32* %gep_temp35, align 4
    ret void
}

define void @chapush(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp37 = load i32, i32* @chat, align 4
    %add_temp38 = add i32 %load_temp37, 1
    store i32 %add_temp38, i32* @chat, align 4
    %load_temp39 = load i32, i32* @chat, align 4
    %gep_temp40 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp39
    %load_temp41 = load i32, i32* %x_local, align 4
    store i32 %load_temp41, i32* %gep_temp40, align 4
    ret void
}

define i32 @intpop() {
entry:
    %load_temp42 = load i32, i32* @intt, align 4
    %sub_temp43 = sub i32 %load_temp42, 1
    store i32 %sub_temp43, i32* @intt, align 4
    %load_temp44 = load i32, i32* @intt, align 4
    %add_temp45 = add i32 %load_temp44, 1
    %gep_temp46 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %add_temp45
    %load_temp47 = load i32, i32* %gep_temp46, align 4
    ret i32 %load_temp47
}

define i32 @chapop() {
entry:
    %load_temp48 = load i32, i32* @chat, align 4
    %sub_temp49 = sub i32 %load_temp48, 1
    store i32 %sub_temp49, i32* @chat, align 4
    %load_temp50 = load i32, i32* @chat, align 4
    %add_temp51 = add i32 %load_temp50, 1
    %gep_temp52 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %add_temp51
    %load_temp53 = load i32, i32* %gep_temp52, align 4
    ret i32 %load_temp53
}

define void @intadd(i32 %x) {
entry:
    %x_local = alloca i32, align 4
    store i32 %x, i32* %x_local, align 4
    %load_temp54 = load i32, i32* @intt, align 4
    %gep_temp55 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %load_temp54
    %load_temp56 = load i32, i32* @intt, align 4
    %gep_temp57 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %load_temp56
    %load_temp58 = load i32, i32* %gep_temp57, align 4
    %mul_temp59 = mul i32 %load_temp58, 10
    store i32 %mul_temp59, i32* %gep_temp55, align 4
    %load_temp60 = load i32, i32* @intt, align 4
    %gep_temp61 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %load_temp60
    %load_temp62 = load i32, i32* @intt, align 4
    %gep_temp63 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %load_temp62
    %load_temp64 = load i32, i32* %gep_temp63, align 4
    %load_temp65 = load i32, i32* %x_local, align 4
    %add_temp66 = add i32 %load_temp64, %load_temp65
    store i32 %add_temp66, i32* %gep_temp61, align 4
    ret void
}

define i32 @find() {
entry:
    %call_temp67 = call i32 @chapop()
    store i32 %call_temp67, i32* @c, align 4
    %load_temp68 = load i32, i32* @ii, align 4
    %gep_temp69 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp68
    store i32 32, i32* %gep_temp69, align 4
    %load_temp70 = load i32, i32* @ii, align 4
    %add_temp71 = add i32 %load_temp70, 1
    %gep_temp72 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %add_temp71
    %load_temp73 = load i32, i32* @c, align 4
    store i32 %load_temp73, i32* %gep_temp72, align 4
    %load_temp74 = load i32, i32* @ii, align 4
    %add_temp75 = add i32 %load_temp74, 2
    store i32 %add_temp75, i32* @ii, align 4
    %load_temp76 = load i32, i32* @chat, align 4
    %icmp_eq_temp77 = icmp eq i32 %load_temp76, 0
    br i1 %icmp_eq_temp77, label %if_then_1, label %if_end_1
if_then_1:
    ret i32 0
if_end_1:
    ret i32 1
}

define i32 @main() {
entry:
    store i32 0, i32* @intt, align 4
    store i32 0, i32* @chat, align 4
    %lengets = alloca i32, align 4
    %load_temp78 = load [10000 x i32], [10000 x i32]* @get, align 4
    %call_temp79 = call i32 @getstr([10000 x i32] %load_temp78)
    store i32 %call_temp79, i32* %lengets, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp80 = load i32, i32* @i, align 4
    %load_temp81 = load i32, i32* %lengets, align 4
    %icmp_slt_temp82 = icmp slt i32 %load_temp80, %load_temp81
    br i1 %icmp_slt_temp82, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp83 = load i32, i32* @i, align 4
    %gep_temp84 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp83
    %load_temp85 = load i32, i32* %gep_temp84, align 4
    %call_temp86 = call i32 @isdigit(i32 %load_temp85)
    %icmp_eq_temp87 = icmp eq i32 %call_temp86, 1
    br i1 %icmp_eq_temp87, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp88 = load i32, i32* @ii, align 4
    %gep_temp89 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp88
    %load_temp90 = load i32, i32* @i, align 4
    %gep_temp91 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp90
    %load_temp92 = load i32, i32* %gep_temp91, align 4
    store i32 %load_temp92, i32* %gep_temp89, align 4
    %load_temp93 = load i32, i32* @ii, align 4
    %add_temp94 = add i32 %load_temp93, 1
    store i32 %add_temp94, i32* @ii, align 4
    br label %if_end_2
if_else_2:
    %load_temp95 = load i32, i32* @i, align 4
    %gep_temp96 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp95
    %load_temp97 = load i32, i32* %gep_temp96, align 4
    %icmp_eq_temp98 = icmp eq i32 %load_temp97, 40
    br i1 %icmp_eq_temp98, label %if_then_3, label %if_end_3
if_then_3:
    call void @chapush(i32 40)
    br label %if_end_3
if_end_3:
    %load_temp99 = load i32, i32* @i, align 4
    %gep_temp100 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp99
    %load_temp101 = load i32, i32* %gep_temp100, align 4
    %icmp_eq_temp102 = icmp eq i32 %load_temp101, 94
    br i1 %icmp_eq_temp102, label %if_then_4, label %if_end_4
if_then_4:
    call void @chapush(i32 94)
    br label %if_end_4
if_end_4:
    %load_temp103 = load i32, i32* @i, align 4
    %gep_temp104 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp103
    %load_temp105 = load i32, i32* %gep_temp104, align 4
    %icmp_eq_temp106 = icmp eq i32 %load_temp105, 41
    br i1 %icmp_eq_temp106, label %if_then_5, label %if_end_5
if_then_5:
    %call_temp107 = call i32 @chapop()
    store i32 %call_temp107, i32* @c, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp108 = load i32, i32* @c, align 4
    %icmp_ne_temp109 = icmp ne i32 %load_temp108, 40
    br i1 %icmp_ne_temp109, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp110 = load i32, i32* @ii, align 4
    %gep_temp111 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp110
    store i32 32, i32* %gep_temp111, align 4
    %load_temp112 = load i32, i32* @ii, align 4
    %add_temp113 = add i32 %load_temp112, 1
    %gep_temp114 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %add_temp113
    %load_temp115 = load i32, i32* @c, align 4
    store i32 %load_temp115, i32* %gep_temp114, align 4
    %load_temp116 = load i32, i32* @ii, align 4
    %add_temp117 = add i32 %load_temp116, 2
    store i32 %add_temp117, i32* @ii, align 4
    %call_temp118 = call i32 @chapop()
    store i32 %call_temp118, i32* @c, align 4
    br label %while_cond_1
while_end_1:
    br label %if_end_5
if_end_5:
    %load_temp119 = load i32, i32* @i, align 4
    %gep_temp120 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp119
    %load_temp121 = load i32, i32* %gep_temp120, align 4
    %icmp_eq_temp122 = icmp eq i32 %load_temp121, 43
    br i1 %icmp_eq_temp122, label %if_then_6, label %if_end_6
if_then_6:
    br label %while_cond_1
while_cond_1:
    %load_temp123 = load i32, i32* @chat, align 4
    %gep_temp124 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp123
    %load_temp125 = load i32, i32* %gep_temp124, align 4
    %icmp_eq_temp126 = icmp eq i32 %load_temp125, 43
    %load_temp127 = load i32, i32* @chat, align 4
    %gep_temp128 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp127
    %load_temp129 = load i32, i32* %gep_temp128, align 4
    %icmp_eq_temp130 = icmp eq i32 %load_temp129, 45
    %zext_temp131 = zext i1 %icmp_eq_temp126 to i32
    %zext_temp132 = zext i1 %icmp_eq_temp130 to i32
    %add_temp133 = add i32 %zext_temp131, %zext_temp132
    %icmp_ne_temp134 = icmp ne i32 %add_temp133, 0
    %load_temp135 = load i32, i32* @chat, align 4
    %gep_temp136 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp135
    %load_temp137 = load i32, i32* %gep_temp136, align 4
    %icmp_eq_temp138 = icmp eq i32 %load_temp137, 42
    %zext_temp139 = zext i1 %icmp_ne_temp134 to i32
    %zext_temp140 = zext i1 %icmp_eq_temp138 to i32
    %add_temp141 = add i32 %zext_temp139, %zext_temp140
    %icmp_ne_temp142 = icmp ne i32 %add_temp141, 0
    %load_temp143 = load i32, i32* @chat, align 4
    %gep_temp144 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp143
    %load_temp145 = load i32, i32* %gep_temp144, align 4
    %icmp_eq_temp146 = icmp eq i32 %load_temp145, 47
    %zext_temp147 = zext i1 %icmp_ne_temp142 to i32
    %zext_temp148 = zext i1 %icmp_eq_temp146 to i32
    %add_temp149 = add i32 %zext_temp147, %zext_temp148
    %icmp_ne_temp150 = icmp ne i32 %add_temp149, 0
    %load_temp151 = load i32, i32* @chat, align 4
    %gep_temp152 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp151
    %load_temp153 = load i32, i32* %gep_temp152, align 4
    %icmp_eq_temp154 = icmp eq i32 %load_temp153, 37
    %zext_temp155 = zext i1 %icmp_ne_temp150 to i32
    %zext_temp156 = zext i1 %icmp_eq_temp154 to i32
    %add_temp157 = add i32 %zext_temp155, %zext_temp156
    %icmp_ne_temp158 = icmp ne i32 %add_temp157, 0
    %load_temp159 = load i32, i32* @chat, align 4
    %gep_temp160 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp159
    %load_temp161 = load i32, i32* %gep_temp160, align 4
    %icmp_eq_temp162 = icmp eq i32 %load_temp161, 94
    %zext_temp163 = zext i1 %icmp_ne_temp158 to i32
    %zext_temp164 = zext i1 %icmp_eq_temp162 to i32
    %add_temp165 = add i32 %zext_temp163, %zext_temp164
    %icmp_ne_temp166 = icmp ne i32 %add_temp165, 0
    br i1 %icmp_ne_temp166, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp167 = call i32 @find()
    %icmp_eq_temp168 = icmp eq i32 %call_temp167, 0
    br i1 %icmp_eq_temp168, label %if_then_7, label %if_end_7
if_then_7:
    br label %while_end_1
if_end_7:
    br label %while_cond_1
while_end_1:
    call void @chapush(i32 43)
    br label %if_end_6
if_end_6:
    %load_temp169 = load i32, i32* @i, align 4
    %gep_temp170 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp169
    %load_temp171 = load i32, i32* %gep_temp170, align 4
    %icmp_eq_temp172 = icmp eq i32 %load_temp171, 45
    br i1 %icmp_eq_temp172, label %if_then_8, label %if_end_8
if_then_8:
    br label %while_cond_1
while_cond_1:
    %load_temp173 = load i32, i32* @chat, align 4
    %gep_temp174 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp173
    %load_temp175 = load i32, i32* %gep_temp174, align 4
    %icmp_eq_temp176 = icmp eq i32 %load_temp175, 43
    %load_temp177 = load i32, i32* @chat, align 4
    %gep_temp178 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp177
    %load_temp179 = load i32, i32* %gep_temp178, align 4
    %icmp_eq_temp180 = icmp eq i32 %load_temp179, 45
    %zext_temp181 = zext i1 %icmp_eq_temp176 to i32
    %zext_temp182 = zext i1 %icmp_eq_temp180 to i32
    %add_temp183 = add i32 %zext_temp181, %zext_temp182
    %icmp_ne_temp184 = icmp ne i32 %add_temp183, 0
    %load_temp185 = load i32, i32* @chat, align 4
    %gep_temp186 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp185
    %load_temp187 = load i32, i32* %gep_temp186, align 4
    %icmp_eq_temp188 = icmp eq i32 %load_temp187, 42
    %zext_temp189 = zext i1 %icmp_ne_temp184 to i32
    %zext_temp190 = zext i1 %icmp_eq_temp188 to i32
    %add_temp191 = add i32 %zext_temp189, %zext_temp190
    %icmp_ne_temp192 = icmp ne i32 %add_temp191, 0
    %load_temp193 = load i32, i32* @chat, align 4
    %gep_temp194 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp193
    %load_temp195 = load i32, i32* %gep_temp194, align 4
    %icmp_eq_temp196 = icmp eq i32 %load_temp195, 47
    %zext_temp197 = zext i1 %icmp_ne_temp192 to i32
    %zext_temp198 = zext i1 %icmp_eq_temp196 to i32
    %add_temp199 = add i32 %zext_temp197, %zext_temp198
    %icmp_ne_temp200 = icmp ne i32 %add_temp199, 0
    %load_temp201 = load i32, i32* @chat, align 4
    %gep_temp202 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp201
    %load_temp203 = load i32, i32* %gep_temp202, align 4
    %icmp_eq_temp204 = icmp eq i32 %load_temp203, 37
    %zext_temp205 = zext i1 %icmp_ne_temp200 to i32
    %zext_temp206 = zext i1 %icmp_eq_temp204 to i32
    %add_temp207 = add i32 %zext_temp205, %zext_temp206
    %icmp_ne_temp208 = icmp ne i32 %add_temp207, 0
    %load_temp209 = load i32, i32* @chat, align 4
    %gep_temp210 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp209
    %load_temp211 = load i32, i32* %gep_temp210, align 4
    %icmp_eq_temp212 = icmp eq i32 %load_temp211, 94
    %zext_temp213 = zext i1 %icmp_ne_temp208 to i32
    %zext_temp214 = zext i1 %icmp_eq_temp212 to i32
    %add_temp215 = add i32 %zext_temp213, %zext_temp214
    %icmp_ne_temp216 = icmp ne i32 %add_temp215, 0
    br i1 %icmp_ne_temp216, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp217 = call i32 @find()
    %icmp_eq_temp218 = icmp eq i32 %call_temp217, 0
    br i1 %icmp_eq_temp218, label %if_then_9, label %if_end_9
if_then_9:
    br label %while_end_1
if_end_9:
    br label %while_cond_1
while_end_1:
    call void @chapush(i32 45)
    br label %if_end_8
if_end_8:
    %load_temp219 = load i32, i32* @i, align 4
    %gep_temp220 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp219
    %load_temp221 = load i32, i32* %gep_temp220, align 4
    %icmp_eq_temp222 = icmp eq i32 %load_temp221, 42
    br i1 %icmp_eq_temp222, label %if_then_10, label %if_end_10
if_then_10:
    br label %while_cond_1
while_cond_1:
    %load_temp223 = load i32, i32* @chat, align 4
    %gep_temp224 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp223
    %load_temp225 = load i32, i32* %gep_temp224, align 4
    %icmp_eq_temp226 = icmp eq i32 %load_temp225, 42
    %load_temp227 = load i32, i32* @chat, align 4
    %gep_temp228 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp227
    %load_temp229 = load i32, i32* %gep_temp228, align 4
    %icmp_eq_temp230 = icmp eq i32 %load_temp229, 47
    %zext_temp231 = zext i1 %icmp_eq_temp226 to i32
    %zext_temp232 = zext i1 %icmp_eq_temp230 to i32
    %add_temp233 = add i32 %zext_temp231, %zext_temp232
    %icmp_ne_temp234 = icmp ne i32 %add_temp233, 0
    %load_temp235 = load i32, i32* @chat, align 4
    %gep_temp236 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp235
    %load_temp237 = load i32, i32* %gep_temp236, align 4
    %icmp_eq_temp238 = icmp eq i32 %load_temp237, 37
    %zext_temp239 = zext i1 %icmp_ne_temp234 to i32
    %zext_temp240 = zext i1 %icmp_eq_temp238 to i32
    %add_temp241 = add i32 %zext_temp239, %zext_temp240
    %icmp_ne_temp242 = icmp ne i32 %add_temp241, 0
    %load_temp243 = load i32, i32* @chat, align 4
    %gep_temp244 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp243
    %load_temp245 = load i32, i32* %gep_temp244, align 4
    %icmp_eq_temp246 = icmp eq i32 %load_temp245, 94
    %zext_temp247 = zext i1 %icmp_ne_temp242 to i32
    %zext_temp248 = zext i1 %icmp_eq_temp246 to i32
    %add_temp249 = add i32 %zext_temp247, %zext_temp248
    %icmp_ne_temp250 = icmp ne i32 %add_temp249, 0
    br i1 %icmp_ne_temp250, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp251 = call i32 @find()
    %icmp_eq_temp252 = icmp eq i32 %call_temp251, 0
    br i1 %icmp_eq_temp252, label %if_then_11, label %if_end_11
if_then_11:
    br label %while_end_1
if_end_11:
    br label %while_cond_1
while_end_1:
    call void @chapush(i32 42)
    br label %if_end_10
if_end_10:
    %load_temp253 = load i32, i32* @i, align 4
    %gep_temp254 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp253
    %load_temp255 = load i32, i32* %gep_temp254, align 4
    %icmp_eq_temp256 = icmp eq i32 %load_temp255, 47
    br i1 %icmp_eq_temp256, label %if_then_12, label %if_end_12
if_then_12:
    br label %while_cond_1
while_cond_1:
    %load_temp257 = load i32, i32* @chat, align 4
    %gep_temp258 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp257
    %load_temp259 = load i32, i32* %gep_temp258, align 4
    %icmp_eq_temp260 = icmp eq i32 %load_temp259, 42
    %load_temp261 = load i32, i32* @chat, align 4
    %gep_temp262 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp261
    %load_temp263 = load i32, i32* %gep_temp262, align 4
    %icmp_eq_temp264 = icmp eq i32 %load_temp263, 47
    %zext_temp265 = zext i1 %icmp_eq_temp260 to i32
    %zext_temp266 = zext i1 %icmp_eq_temp264 to i32
    %add_temp267 = add i32 %zext_temp265, %zext_temp266
    %icmp_ne_temp268 = icmp ne i32 %add_temp267, 0
    %load_temp269 = load i32, i32* @chat, align 4
    %gep_temp270 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp269
    %load_temp271 = load i32, i32* %gep_temp270, align 4
    %icmp_eq_temp272 = icmp eq i32 %load_temp271, 37
    %zext_temp273 = zext i1 %icmp_ne_temp268 to i32
    %zext_temp274 = zext i1 %icmp_eq_temp272 to i32
    %add_temp275 = add i32 %zext_temp273, %zext_temp274
    %icmp_ne_temp276 = icmp ne i32 %add_temp275, 0
    %load_temp277 = load i32, i32* @chat, align 4
    %gep_temp278 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp277
    %load_temp279 = load i32, i32* %gep_temp278, align 4
    %icmp_eq_temp280 = icmp eq i32 %load_temp279, 94
    %zext_temp281 = zext i1 %icmp_ne_temp276 to i32
    %zext_temp282 = zext i1 %icmp_eq_temp280 to i32
    %add_temp283 = add i32 %zext_temp281, %zext_temp282
    %icmp_ne_temp284 = icmp ne i32 %add_temp283, 0
    br i1 %icmp_ne_temp284, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp285 = call i32 @find()
    %icmp_eq_temp286 = icmp eq i32 %call_temp285, 0
    br i1 %icmp_eq_temp286, label %if_then_13, label %if_end_13
if_then_13:
    br label %while_end_1
if_end_13:
    br label %while_cond_1
while_end_1:
    call void @chapush(i32 47)
    br label %if_end_12
if_end_12:
    %load_temp287 = load i32, i32* @i, align 4
    %gep_temp288 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %load_temp287
    %load_temp289 = load i32, i32* %gep_temp288, align 4
    %icmp_eq_temp290 = icmp eq i32 %load_temp289, 37
    br i1 %icmp_eq_temp290, label %if_then_14, label %if_end_14
if_then_14:
    br label %while_cond_1
while_cond_1:
    %load_temp291 = load i32, i32* @chat, align 4
    %gep_temp292 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp291
    %load_temp293 = load i32, i32* %gep_temp292, align 4
    %icmp_eq_temp294 = icmp eq i32 %load_temp293, 42
    %load_temp295 = load i32, i32* @chat, align 4
    %gep_temp296 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp295
    %load_temp297 = load i32, i32* %gep_temp296, align 4
    %icmp_eq_temp298 = icmp eq i32 %load_temp297, 47
    %zext_temp299 = zext i1 %icmp_eq_temp294 to i32
    %zext_temp300 = zext i1 %icmp_eq_temp298 to i32
    %add_temp301 = add i32 %zext_temp299, %zext_temp300
    %icmp_ne_temp302 = icmp ne i32 %add_temp301, 0
    %load_temp303 = load i32, i32* @chat, align 4
    %gep_temp304 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp303
    %load_temp305 = load i32, i32* %gep_temp304, align 4
    %icmp_eq_temp306 = icmp eq i32 %load_temp305, 37
    %zext_temp307 = zext i1 %icmp_ne_temp302 to i32
    %zext_temp308 = zext i1 %icmp_eq_temp306 to i32
    %add_temp309 = add i32 %zext_temp307, %zext_temp308
    %icmp_ne_temp310 = icmp ne i32 %add_temp309, 0
    %load_temp311 = load i32, i32* @chat, align 4
    %gep_temp312 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %load_temp311
    %load_temp313 = load i32, i32* %gep_temp312, align 4
    %icmp_eq_temp314 = icmp eq i32 %load_temp313, 94
    %zext_temp315 = zext i1 %icmp_ne_temp310 to i32
    %zext_temp316 = zext i1 %icmp_eq_temp314 to i32
    %add_temp317 = add i32 %zext_temp315, %zext_temp316
    %icmp_ne_temp318 = icmp ne i32 %add_temp317, 0
    br i1 %icmp_ne_temp318, label %while_body_1, label %while_end_1
while_body_1:
    %call_temp319 = call i32 @find()
    %icmp_eq_temp320 = icmp eq i32 %call_temp319, 0
    br i1 %icmp_eq_temp320, label %if_then_15, label %if_end_15
if_then_15:
    br label %while_end_1
if_end_15:
    br label %while_cond_1
while_end_1:
    call void @chapush(i32 37)
    br label %if_end_14
if_end_14:
    %load_temp321 = load i32, i32* @ii, align 4
    %gep_temp322 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp321
    store i32 32, i32* %gep_temp322, align 4
    %load_temp323 = load i32, i32* @ii, align 4
    %add_temp324 = add i32 %load_temp323, 1
    store i32 %add_temp324, i32* @ii, align 4
    br label %if_end_2
if_end_2:
    %load_temp325 = load i32, i32* @i, align 4
    %add_temp326 = add i32 %load_temp325, 1
    store i32 %add_temp326, i32* @i, align 4
    br label %while_cond_0
while_end_0:
    br label %while_cond_0
while_cond_0:
    %load_temp327 = load i32, i32* @chat, align 4
    %icmp_sgt_temp328 = icmp sgt i32 %load_temp327, 0
    br i1 %icmp_sgt_temp328, label %while_body_0, label %while_end_0
while_body_0:
    %c = alloca i32, align 4
    %call_temp329 = call i32 @chapop()
    store i32 %call_temp329, i32* %c, align 4
    %load_temp330 = load i32, i32* @ii, align 4
    %gep_temp331 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp330
    store i32 32, i32* %gep_temp331, align 4
    %load_temp332 = load i32, i32* @ii, align 4
    %add_temp333 = add i32 %load_temp332, 1
    %gep_temp334 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %add_temp333
    %load_temp335 = load i32, i32* %c, align 4
    store i32 %load_temp335, i32* %gep_temp334, align 4
    %load_temp336 = load i32, i32* @ii, align 4
    %add_temp337 = add i32 %load_temp336, 2
    store i32 %add_temp337, i32* @ii, align 4
    br label %while_cond_0
while_end_0:
    %load_temp338 = load i32, i32* @ii, align 4
    %gep_temp339 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp338
    store i32 64, i32* %gep_temp339, align 4
    store i32 1, i32* @i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp340 = load i32, i32* @i, align 4
    %gep_temp341 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp340
    %load_temp342 = load i32, i32* %gep_temp341, align 4
    %icmp_ne_temp343 = icmp ne i32 %load_temp342, 64
    br i1 %icmp_ne_temp343, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp344 = load i32, i32* @i, align 4
    %gep_temp345 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp344
    %load_temp346 = load i32, i32* %gep_temp345, align 4
    %icmp_eq_temp347 = icmp eq i32 %load_temp346, 43
    %load_temp348 = load i32, i32* @i, align 4
    %gep_temp349 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp348
    %load_temp350 = load i32, i32* %gep_temp349, align 4
    %icmp_eq_temp351 = icmp eq i32 %load_temp350, 45
    %zext_temp352 = zext i1 %icmp_eq_temp347 to i32
    %zext_temp353 = zext i1 %icmp_eq_temp351 to i32
    %add_temp354 = add i32 %zext_temp352, %zext_temp353
    %icmp_ne_temp355 = icmp ne i32 %add_temp354, 0
    %load_temp356 = load i32, i32* @i, align 4
    %gep_temp357 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp356
    %load_temp358 = load i32, i32* %gep_temp357, align 4
    %icmp_eq_temp359 = icmp eq i32 %load_temp358, 42
    %zext_temp360 = zext i1 %icmp_ne_temp355 to i32
    %zext_temp361 = zext i1 %icmp_eq_temp359 to i32
    %add_temp362 = add i32 %zext_temp360, %zext_temp361
    %icmp_ne_temp363 = icmp ne i32 %add_temp362, 0
    %load_temp364 = load i32, i32* @i, align 4
    %gep_temp365 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp364
    %load_temp366 = load i32, i32* %gep_temp365, align 4
    %icmp_eq_temp367 = icmp eq i32 %load_temp366, 47
    %zext_temp368 = zext i1 %icmp_ne_temp363 to i32
    %zext_temp369 = zext i1 %icmp_eq_temp367 to i32
    %add_temp370 = add i32 %zext_temp368, %zext_temp369
    %icmp_ne_temp371 = icmp ne i32 %add_temp370, 0
    %load_temp372 = load i32, i32* @i, align 4
    %gep_temp373 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp372
    %load_temp374 = load i32, i32* %gep_temp373, align 4
    %icmp_eq_temp375 = icmp eq i32 %load_temp374, 37
    %zext_temp376 = zext i1 %icmp_ne_temp371 to i32
    %zext_temp377 = zext i1 %icmp_eq_temp375 to i32
    %add_temp378 = add i32 %zext_temp376, %zext_temp377
    %icmp_ne_temp379 = icmp ne i32 %add_temp378, 0
    %load_temp380 = load i32, i32* @i, align 4
    %gep_temp381 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp380
    %load_temp382 = load i32, i32* %gep_temp381, align 4
    %icmp_eq_temp383 = icmp eq i32 %load_temp382, 94
    %zext_temp384 = zext i1 %icmp_ne_temp379 to i32
    %zext_temp385 = zext i1 %icmp_eq_temp383 to i32
    %add_temp386 = add i32 %zext_temp384, %zext_temp385
    %icmp_ne_temp387 = icmp ne i32 %add_temp386, 0
    br i1 %icmp_ne_temp387, label %if_then_16, label %if_else_16
if_then_16:
    %a = alloca i32, align 4
    %call_temp388 = call i32 @intpop()
    store i32 %call_temp388, i32* %a, align 4
    %b = alloca i32, align 4
    %call_temp389 = call i32 @intpop()
    store i32 %call_temp389, i32* %b, align 4
    %c = alloca i32, align 4
    %load_temp390 = load i32, i32* @i, align 4
    %gep_temp391 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp390
    %load_temp392 = load i32, i32* %gep_temp391, align 4
    %icmp_eq_temp393 = icmp eq i32 %load_temp392, 43
    br i1 %icmp_eq_temp393, label %if_then_17, label %if_end_17
if_then_17:
    %load_temp394 = load i32, i32* %a, align 4
    %load_temp395 = load i32, i32* %b, align 4
    %add_temp396 = add i32 %load_temp394, %load_temp395
    store i32 %add_temp396, i32* %c, align 4
    br label %if_end_17
if_end_17:
    %load_temp397 = load i32, i32* @i, align 4
    %gep_temp398 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp397
    %load_temp399 = load i32, i32* %gep_temp398, align 4
    %icmp_eq_temp400 = icmp eq i32 %load_temp399, 45
    br i1 %icmp_eq_temp400, label %if_then_18, label %if_end_18
if_then_18:
    %load_temp401 = load i32, i32* %b, align 4
    %load_temp402 = load i32, i32* %a, align 4
    %sub_temp403 = sub i32 %load_temp401, %load_temp402
    store i32 %sub_temp403, i32* %c, align 4
    br label %if_end_18
if_end_18:
    %load_temp404 = load i32, i32* @i, align 4
    %gep_temp405 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp404
    %load_temp406 = load i32, i32* %gep_temp405, align 4
    %icmp_eq_temp407 = icmp eq i32 %load_temp406, 42
    br i1 %icmp_eq_temp407, label %if_then_19, label %if_end_19
if_then_19:
    %load_temp408 = load i32, i32* %a, align 4
    %load_temp409 = load i32, i32* %b, align 4
    %mul_temp410 = mul i32 %load_temp408, %load_temp409
    store i32 %mul_temp410, i32* %c, align 4
    br label %if_end_19
if_end_19:
    %load_temp411 = load i32, i32* @i, align 4
    %gep_temp412 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp411
    %load_temp413 = load i32, i32* %gep_temp412, align 4
    %icmp_eq_temp414 = icmp eq i32 %load_temp413, 47
    br i1 %icmp_eq_temp414, label %if_then_20, label %if_end_20
if_then_20:
    %load_temp415 = load i32, i32* %b, align 4
    %load_temp416 = load i32, i32* %a, align 4
    %sdiv_temp417 = sdiv i32 %load_temp415, %load_temp416
    store i32 %sdiv_temp417, i32* %c, align 4
    br label %if_end_20
if_end_20:
    %load_temp418 = load i32, i32* @i, align 4
    %gep_temp419 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp418
    %load_temp420 = load i32, i32* %gep_temp419, align 4
    %icmp_eq_temp421 = icmp eq i32 %load_temp420, 37
    br i1 %icmp_eq_temp421, label %if_then_21, label %if_end_21
if_then_21:
    %load_temp422 = load i32, i32* %b, align 4
    %load_temp423 = load i32, i32* %a, align 4
    %srem_temp424 = srem i32 %load_temp422, %load_temp423
    store i32 %srem_temp424, i32* %c, align 4
    br label %if_end_21
if_end_21:
    %load_temp425 = load i32, i32* @i, align 4
    %gep_temp426 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp425
    %load_temp427 = load i32, i32* %gep_temp426, align 4
    %icmp_eq_temp428 = icmp eq i32 %load_temp427, 94
    br i1 %icmp_eq_temp428, label %if_then_22, label %if_end_22
if_then_22:
    %load_temp429 = load i32, i32* %b, align 4
    %load_temp430 = load i32, i32* %a, align 4
    %call_temp431 = call i32 @power(i32 %load_temp429, i32 %load_temp430)
    store i32 %call_temp431, i32* %c, align 4
    br label %if_end_22
if_end_22:
    %load_temp432 = load i32, i32* %c, align 4
    call void @intpush(i32 %load_temp432)
    br label %if_end_16
if_else_16:
    %load_temp433 = load i32, i32* @i, align 4
    %gep_temp434 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp433
    %load_temp435 = load i32, i32* %gep_temp434, align 4
    %icmp_ne_temp436 = icmp ne i32 %load_temp435, 32
    br i1 %icmp_ne_temp436, label %if_then_23, label %if_end_23
if_then_23:
    %load_temp437 = load i32, i32* @i, align 4
    %gep_temp438 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %load_temp437
    %load_temp439 = load i32, i32* %gep_temp438, align 4
    %sub_temp440 = sub i32 %load_temp439, 48
    call void @intpush(i32 %sub_temp440)
    store i32 1, i32* @ii, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp441 = load i32, i32* @i, align 4
    %load_temp442 = load i32, i32* @ii, align 4
    %add_temp443 = add i32 %load_temp441, %load_temp442
    %gep_temp444 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %add_temp443
    %load_temp445 = load i32, i32* %gep_temp444, align 4
    %icmp_ne_temp446 = icmp ne i32 %load_temp445, 32
    br i1 %icmp_ne_temp446, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp447 = load i32, i32* @i, align 4
    %load_temp448 = load i32, i32* @ii, align 4
    %add_temp449 = add i32 %load_temp447, %load_temp448
    %gep_temp450 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %add_temp449
    %load_temp451 = load i32, i32* %gep_temp450, align 4
    %sub_temp452 = sub i32 %load_temp451, 48
    call void @intadd(i32 %sub_temp452)
    %load_temp453 = load i32, i32* @ii, align 4
    %add_temp454 = add i32 %load_temp453, 1
    store i32 %add_temp454, i32* @ii, align 4
    br label %while_cond_1
while_end_1:
    %load_temp455 = load i32, i32* @i, align 4
    %load_temp456 = load i32, i32* @ii, align 4
    %add_temp457 = add i32 %load_temp455, %load_temp456
    %sub_temp458 = sub i32 %add_temp457, 1
    store i32 %sub_temp458, i32* @i, align 4
    br label %if_end_23
if_end_23:
    br label %if_end_16
if_end_16:
    %load_temp459 = load i32, i32* @i, align 4
    %add_temp460 = add i32 %load_temp459, 1
    store i32 %add_temp460, i32* @i, align 4
    br label %while_cond_0
while_end_0:
    %gep_temp461 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 1
    %load_temp462 = load i32, i32* %gep_temp461, align 4
    call void @putint(i32 %load_temp462)
    ret i32 0
}

