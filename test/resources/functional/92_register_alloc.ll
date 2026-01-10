; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a1 = global i32 1, align 4
@a2 = global i32 2, align 4
@a3 = global i32 3, align 4
@a4 = global i32 4, align 4
@a5 = global i32 5, align 4
@a6 = global i32 6, align 4
@a7 = global i32 7, align 4
@a8 = global i32 8, align 4
@a9 = global i32 9, align 4
@a10 = global i32 10, align 4
@a11 = global i32 11, align 4
@a12 = global i32 12, align 4
@a13 = global i32 13, align 4
@a14 = global i32 14, align 4
@a15 = global i32 15, align 4
@a16 = global i32 16, align 4
@a17 = global i32 1, align 4
@a18 = global i32 2, align 4
@a19 = global i32 3, align 4
@a20 = global i32 4, align 4
@a21 = global i32 5, align 4
@a22 = global i32 6, align 4
@a23 = global i32 7, align 4
@a24 = global i32 8, align 4
@a25 = global i32 9, align 4
@a26 = global i32 10, align 4
@a27 = global i32 11, align 4
@a28 = global i32 12, align 4
@a29 = global i32 13, align 4
@a30 = global i32 14, align 4
@a31 = global i32 15, align 4
@a32 = global i32 16, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func(i32 %a, i32 %b) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %i = alloca i32, align 4
    %load_temp0 = load i32, i32* %a_local, align 4
    %load_temp1 = load i32, i32* %b_local, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    store i32 %add_temp2, i32* %i, align 4
    %c1 = alloca i32, align 4
    %c2 = alloca i32, align 4
    %c3 = alloca i32, align 4
    %c4 = alloca i32, align 4
    %d1 = alloca i32, align 4
    %d2 = alloca i32, align 4
    %d3 = alloca i32, align 4
    %d4 = alloca i32, align 4
    %e1 = alloca i32, align 4
    %e2 = alloca i32, align 4
    %e3 = alloca i32, align 4
    %e4 = alloca i32, align 4
    %f1 = alloca i32, align 4
    %f2 = alloca i32, align 4
    %f3 = alloca i32, align 4
    %f4 = alloca i32, align 4
    %g1 = alloca i32, align 4
    %g2 = alloca i32, align 4
    %g3 = alloca i32, align 4
    %g4 = alloca i32, align 4
    %h1 = alloca i32, align 4
    %h2 = alloca i32, align 4
    %h3 = alloca i32, align 4
    %h4 = alloca i32, align 4
    %i1 = alloca i32, align 4
    %i2 = alloca i32, align 4
    %i3 = alloca i32, align 4
    %i4 = alloca i32, align 4
    %j1 = alloca i32, align 4
    %j2 = alloca i32, align 4
    %j3 = alloca i32, align 4
    %j4 = alloca i32, align 4
    %k1 = alloca i32, align 4
    %k2 = alloca i32, align 4
    %k3 = alloca i32, align 4
    %k4 = alloca i32, align 4
    %call_temp3 = call i32 @getint()
    store i32 %call_temp3, i32* %c1, align 4
    %call_temp4 = call i32 @getint()
    store i32 %call_temp4, i32* %c2, align 4
    %call_temp5 = call i32 @getint()
    store i32 %call_temp5, i32* %c3, align 4
    %call_temp6 = call i32 @getint()
    store i32 %call_temp6, i32* %c4, align 4
    %load_temp7 = load i32, i32* %c1, align 4
    %add_temp8 = add i32 1, %load_temp7
    %load_temp9 = load i32, i32* @a1, align 4
    %add_temp10 = add i32 %add_temp8, %load_temp9
    store i32 %add_temp10, i32* %d1, align 4
    %load_temp11 = load i32, i32* %c2, align 4
    %add_temp12 = add i32 2, %load_temp11
    %load_temp13 = load i32, i32* @a2, align 4
    %add_temp14 = add i32 %add_temp12, %load_temp13
    store i32 %add_temp14, i32* %d2, align 4
    %load_temp15 = load i32, i32* %c3, align 4
    %add_temp16 = add i32 3, %load_temp15
    %load_temp17 = load i32, i32* @a3, align 4
    %add_temp18 = add i32 %add_temp16, %load_temp17
    store i32 %add_temp18, i32* %d3, align 4
    %load_temp19 = load i32, i32* %c4, align 4
    %add_temp20 = add i32 4, %load_temp19
    %load_temp21 = load i32, i32* @a4, align 4
    %add_temp22 = add i32 %add_temp20, %load_temp21
    store i32 %add_temp22, i32* %d4, align 4
    %load_temp23 = load i32, i32* %d1, align 4
    %add_temp24 = add i32 1, %load_temp23
    %load_temp25 = load i32, i32* @a5, align 4
    %add_temp26 = add i32 %add_temp24, %load_temp25
    store i32 %add_temp26, i32* %e1, align 4
    %load_temp27 = load i32, i32* %d2, align 4
    %add_temp28 = add i32 2, %load_temp27
    %load_temp29 = load i32, i32* @a6, align 4
    %add_temp30 = add i32 %add_temp28, %load_temp29
    store i32 %add_temp30, i32* %e2, align 4
    %load_temp31 = load i32, i32* %d3, align 4
    %add_temp32 = add i32 3, %load_temp31
    %load_temp33 = load i32, i32* @a7, align 4
    %add_temp34 = add i32 %add_temp32, %load_temp33
    store i32 %add_temp34, i32* %e3, align 4
    %load_temp35 = load i32, i32* %d4, align 4
    %add_temp36 = add i32 4, %load_temp35
    %load_temp37 = load i32, i32* @a8, align 4
    %add_temp38 = add i32 %add_temp36, %load_temp37
    store i32 %add_temp38, i32* %e4, align 4
    %load_temp39 = load i32, i32* %e1, align 4
    %add_temp40 = add i32 1, %load_temp39
    %load_temp41 = load i32, i32* @a9, align 4
    %add_temp42 = add i32 %add_temp40, %load_temp41
    store i32 %add_temp42, i32* %f1, align 4
    %load_temp43 = load i32, i32* %e2, align 4
    %add_temp44 = add i32 2, %load_temp43
    %load_temp45 = load i32, i32* @a10, align 4
    %add_temp46 = add i32 %add_temp44, %load_temp45
    store i32 %add_temp46, i32* %f2, align 4
    %load_temp47 = load i32, i32* %e3, align 4
    %add_temp48 = add i32 3, %load_temp47
    %load_temp49 = load i32, i32* @a11, align 4
    %add_temp50 = add i32 %add_temp48, %load_temp49
    store i32 %add_temp50, i32* %f3, align 4
    %load_temp51 = load i32, i32* %e4, align 4
    %add_temp52 = add i32 4, %load_temp51
    %load_temp53 = load i32, i32* @a12, align 4
    %add_temp54 = add i32 %add_temp52, %load_temp53
    store i32 %add_temp54, i32* %f4, align 4
    %load_temp55 = load i32, i32* %f1, align 4
    %add_temp56 = add i32 1, %load_temp55
    %load_temp57 = load i32, i32* @a13, align 4
    %add_temp58 = add i32 %add_temp56, %load_temp57
    store i32 %add_temp58, i32* %g1, align 4
    %load_temp59 = load i32, i32* %f2, align 4
    %add_temp60 = add i32 2, %load_temp59
    %load_temp61 = load i32, i32* @a14, align 4
    %add_temp62 = add i32 %add_temp60, %load_temp61
    store i32 %add_temp62, i32* %g2, align 4
    %load_temp63 = load i32, i32* %f3, align 4
    %add_temp64 = add i32 3, %load_temp63
    %load_temp65 = load i32, i32* @a15, align 4
    %add_temp66 = add i32 %add_temp64, %load_temp65
    store i32 %add_temp66, i32* %g3, align 4
    %load_temp67 = load i32, i32* %f4, align 4
    %add_temp68 = add i32 4, %load_temp67
    %load_temp69 = load i32, i32* @a16, align 4
    %add_temp70 = add i32 %add_temp68, %load_temp69
    store i32 %add_temp70, i32* %g4, align 4
    %load_temp71 = load i32, i32* %g1, align 4
    %add_temp72 = add i32 1, %load_temp71
    %load_temp73 = load i32, i32* @a17, align 4
    %add_temp74 = add i32 %add_temp72, %load_temp73
    store i32 %add_temp74, i32* %h1, align 4
    %load_temp75 = load i32, i32* %g2, align 4
    %add_temp76 = add i32 2, %load_temp75
    %load_temp77 = load i32, i32* @a18, align 4
    %add_temp78 = add i32 %add_temp76, %load_temp77
    store i32 %add_temp78, i32* %h2, align 4
    %load_temp79 = load i32, i32* %g3, align 4
    %add_temp80 = add i32 3, %load_temp79
    %load_temp81 = load i32, i32* @a19, align 4
    %add_temp82 = add i32 %add_temp80, %load_temp81
    store i32 %add_temp82, i32* %h3, align 4
    %load_temp83 = load i32, i32* %g4, align 4
    %add_temp84 = add i32 4, %load_temp83
    %load_temp85 = load i32, i32* @a20, align 4
    %add_temp86 = add i32 %add_temp84, %load_temp85
    store i32 %add_temp86, i32* %h4, align 4
    %load_temp87 = load i32, i32* %h1, align 4
    %add_temp88 = add i32 1, %load_temp87
    %load_temp89 = load i32, i32* @a21, align 4
    %add_temp90 = add i32 %add_temp88, %load_temp89
    store i32 %add_temp90, i32* %i1, align 4
    %load_temp91 = load i32, i32* %h2, align 4
    %add_temp92 = add i32 2, %load_temp91
    %load_temp93 = load i32, i32* @a22, align 4
    %add_temp94 = add i32 %add_temp92, %load_temp93
    store i32 %add_temp94, i32* %i2, align 4
    %load_temp95 = load i32, i32* %h3, align 4
    %add_temp96 = add i32 3, %load_temp95
    %load_temp97 = load i32, i32* @a23, align 4
    %add_temp98 = add i32 %add_temp96, %load_temp97
    store i32 %add_temp98, i32* %i3, align 4
    %load_temp99 = load i32, i32* %h4, align 4
    %add_temp100 = add i32 4, %load_temp99
    %load_temp101 = load i32, i32* @a24, align 4
    %add_temp102 = add i32 %add_temp100, %load_temp101
    store i32 %add_temp102, i32* %i4, align 4
    %load_temp103 = load i32, i32* %i1, align 4
    %add_temp104 = add i32 1, %load_temp103
    %load_temp105 = load i32, i32* @a25, align 4
    %add_temp106 = add i32 %add_temp104, %load_temp105
    store i32 %add_temp106, i32* %j1, align 4
    %load_temp107 = load i32, i32* %i2, align 4
    %add_temp108 = add i32 2, %load_temp107
    %load_temp109 = load i32, i32* @a26, align 4
    %add_temp110 = add i32 %add_temp108, %load_temp109
    store i32 %add_temp110, i32* %j2, align 4
    %load_temp111 = load i32, i32* %i3, align 4
    %add_temp112 = add i32 3, %load_temp111
    %load_temp113 = load i32, i32* @a27, align 4
    %add_temp114 = add i32 %add_temp112, %load_temp113
    store i32 %add_temp114, i32* %j3, align 4
    %load_temp115 = load i32, i32* %i4, align 4
    %add_temp116 = add i32 4, %load_temp115
    %load_temp117 = load i32, i32* @a28, align 4
    %add_temp118 = add i32 %add_temp116, %load_temp117
    store i32 %add_temp118, i32* %j4, align 4
    %load_temp119 = load i32, i32* %j1, align 4
    %add_temp120 = add i32 1, %load_temp119
    %load_temp121 = load i32, i32* @a29, align 4
    %add_temp122 = add i32 %add_temp120, %load_temp121
    store i32 %add_temp122, i32* %k1, align 4
    %load_temp123 = load i32, i32* %j2, align 4
    %add_temp124 = add i32 2, %load_temp123
    %load_temp125 = load i32, i32* @a30, align 4
    %add_temp126 = add i32 %add_temp124, %load_temp125
    store i32 %add_temp126, i32* %k2, align 4
    %load_temp127 = load i32, i32* %j3, align 4
    %add_temp128 = add i32 3, %load_temp127
    %load_temp129 = load i32, i32* @a31, align 4
    %add_temp130 = add i32 %add_temp128, %load_temp129
    store i32 %add_temp130, i32* %k3, align 4
    %load_temp131 = load i32, i32* %j4, align 4
    %add_temp132 = add i32 4, %load_temp131
    %load_temp133 = load i32, i32* @a32, align 4
    %add_temp134 = add i32 %add_temp132, %load_temp133
    store i32 %add_temp134, i32* %k4, align 4
    %load_temp135 = load i32, i32* %a_local, align 4
    %load_temp136 = load i32, i32* %b_local, align 4
    %sub_temp137 = sub i32 %load_temp135, %load_temp136
    %add_temp138 = add i32 %sub_temp137, 10
    store i32 %add_temp138, i32* %i, align 4
    %load_temp139 = load i32, i32* %j1, align 4
    %add_temp140 = add i32 1, %load_temp139
    %load_temp141 = load i32, i32* @a29, align 4
    %add_temp142 = add i32 %add_temp140, %load_temp141
    store i32 %add_temp142, i32* %k1, align 4
    %load_temp143 = load i32, i32* %j2, align 4
    %add_temp144 = add i32 2, %load_temp143
    %load_temp145 = load i32, i32* @a30, align 4
    %add_temp146 = add i32 %add_temp144, %load_temp145
    store i32 %add_temp146, i32* %k2, align 4
    %load_temp147 = load i32, i32* %j3, align 4
    %add_temp148 = add i32 3, %load_temp147
    %load_temp149 = load i32, i32* @a31, align 4
    %add_temp150 = add i32 %add_temp148, %load_temp149
    store i32 %add_temp150, i32* %k3, align 4
    %load_temp151 = load i32, i32* %j4, align 4
    %add_temp152 = add i32 4, %load_temp151
    %load_temp153 = load i32, i32* @a32, align 4
    %add_temp154 = add i32 %add_temp152, %load_temp153
    store i32 %add_temp154, i32* %k4, align 4
    %load_temp155 = load i32, i32* %i1, align 4
    %add_temp156 = add i32 1, %load_temp155
    %load_temp157 = load i32, i32* @a25, align 4
    %add_temp158 = add i32 %add_temp156, %load_temp157
    store i32 %add_temp158, i32* %j1, align 4
    %load_temp159 = load i32, i32* %i2, align 4
    %add_temp160 = add i32 2, %load_temp159
    %load_temp161 = load i32, i32* @a26, align 4
    %add_temp162 = add i32 %add_temp160, %load_temp161
    store i32 %add_temp162, i32* %j2, align 4
    %load_temp163 = load i32, i32* %i3, align 4
    %add_temp164 = add i32 3, %load_temp163
    %load_temp165 = load i32, i32* @a27, align 4
    %add_temp166 = add i32 %add_temp164, %load_temp165
    store i32 %add_temp166, i32* %j3, align 4
    %load_temp167 = load i32, i32* %i4, align 4
    %add_temp168 = add i32 4, %load_temp167
    %load_temp169 = load i32, i32* @a28, align 4
    %add_temp170 = add i32 %add_temp168, %load_temp169
    store i32 %add_temp170, i32* %j4, align 4
    %load_temp171 = load i32, i32* %h1, align 4
    %add_temp172 = add i32 1, %load_temp171
    %load_temp173 = load i32, i32* @a21, align 4
    %add_temp174 = add i32 %add_temp172, %load_temp173
    store i32 %add_temp174, i32* %i1, align 4
    %load_temp175 = load i32, i32* %h2, align 4
    %add_temp176 = add i32 2, %load_temp175
    %load_temp177 = load i32, i32* @a22, align 4
    %add_temp178 = add i32 %add_temp176, %load_temp177
    store i32 %add_temp178, i32* %i2, align 4
    %load_temp179 = load i32, i32* %h3, align 4
    %add_temp180 = add i32 3, %load_temp179
    %load_temp181 = load i32, i32* @a23, align 4
    %add_temp182 = add i32 %add_temp180, %load_temp181
    store i32 %add_temp182, i32* %i3, align 4
    %load_temp183 = load i32, i32* %h4, align 4
    %add_temp184 = add i32 4, %load_temp183
    %load_temp185 = load i32, i32* @a24, align 4
    %add_temp186 = add i32 %add_temp184, %load_temp185
    store i32 %add_temp186, i32* %i4, align 4
    %load_temp187 = load i32, i32* %g1, align 4
    %add_temp188 = add i32 1, %load_temp187
    %load_temp189 = load i32, i32* @a17, align 4
    %add_temp190 = add i32 %add_temp188, %load_temp189
    store i32 %add_temp190, i32* %h1, align 4
    %load_temp191 = load i32, i32* %g2, align 4
    %add_temp192 = add i32 2, %load_temp191
    %load_temp193 = load i32, i32* @a18, align 4
    %add_temp194 = add i32 %add_temp192, %load_temp193
    store i32 %add_temp194, i32* %h2, align 4
    %load_temp195 = load i32, i32* %g3, align 4
    %add_temp196 = add i32 3, %load_temp195
    %load_temp197 = load i32, i32* @a19, align 4
    %add_temp198 = add i32 %add_temp196, %load_temp197
    store i32 %add_temp198, i32* %h3, align 4
    %load_temp199 = load i32, i32* %g4, align 4
    %add_temp200 = add i32 4, %load_temp199
    %load_temp201 = load i32, i32* @a20, align 4
    %add_temp202 = add i32 %add_temp200, %load_temp201
    store i32 %add_temp202, i32* %h4, align 4
    %load_temp203 = load i32, i32* %f1, align 4
    %add_temp204 = add i32 1, %load_temp203
    %load_temp205 = load i32, i32* @a13, align 4
    %add_temp206 = add i32 %add_temp204, %load_temp205
    store i32 %add_temp206, i32* %g1, align 4
    %load_temp207 = load i32, i32* %f2, align 4
    %add_temp208 = add i32 2, %load_temp207
    %load_temp209 = load i32, i32* @a14, align 4
    %add_temp210 = add i32 %add_temp208, %load_temp209
    store i32 %add_temp210, i32* %g2, align 4
    %load_temp211 = load i32, i32* %f3, align 4
    %add_temp212 = add i32 3, %load_temp211
    %load_temp213 = load i32, i32* @a15, align 4
    %add_temp214 = add i32 %add_temp212, %load_temp213
    store i32 %add_temp214, i32* %g3, align 4
    %load_temp215 = load i32, i32* %f4, align 4
    %add_temp216 = add i32 4, %load_temp215
    %load_temp217 = load i32, i32* @a16, align 4
    %add_temp218 = add i32 %add_temp216, %load_temp217
    store i32 %add_temp218, i32* %g4, align 4
    %load_temp219 = load i32, i32* %e1, align 4
    %add_temp220 = add i32 1, %load_temp219
    %load_temp221 = load i32, i32* @a9, align 4
    %add_temp222 = add i32 %add_temp220, %load_temp221
    store i32 %add_temp222, i32* %f1, align 4
    %load_temp223 = load i32, i32* %e2, align 4
    %add_temp224 = add i32 2, %load_temp223
    %load_temp225 = load i32, i32* @a10, align 4
    %add_temp226 = add i32 %add_temp224, %load_temp225
    store i32 %add_temp226, i32* %f2, align 4
    %load_temp227 = load i32, i32* %e3, align 4
    %add_temp228 = add i32 3, %load_temp227
    %load_temp229 = load i32, i32* @a11, align 4
    %add_temp230 = add i32 %add_temp228, %load_temp229
    store i32 %add_temp230, i32* %f3, align 4
    %load_temp231 = load i32, i32* %e4, align 4
    %add_temp232 = add i32 4, %load_temp231
    %load_temp233 = load i32, i32* @a12, align 4
    %add_temp234 = add i32 %add_temp232, %load_temp233
    store i32 %add_temp234, i32* %f4, align 4
    %load_temp235 = load i32, i32* %d1, align 4
    %add_temp236 = add i32 1, %load_temp235
    %load_temp237 = load i32, i32* @a5, align 4
    %add_temp238 = add i32 %add_temp236, %load_temp237
    store i32 %add_temp238, i32* %e1, align 4
    %load_temp239 = load i32, i32* %d2, align 4
    %add_temp240 = add i32 2, %load_temp239
    %load_temp241 = load i32, i32* @a6, align 4
    %add_temp242 = add i32 %add_temp240, %load_temp241
    store i32 %add_temp242, i32* %e2, align 4
    %load_temp243 = load i32, i32* %d3, align 4
    %add_temp244 = add i32 3, %load_temp243
    %load_temp245 = load i32, i32* @a7, align 4
    %add_temp246 = add i32 %add_temp244, %load_temp245
    store i32 %add_temp246, i32* %e3, align 4
    %load_temp247 = load i32, i32* %d4, align 4
    %add_temp248 = add i32 4, %load_temp247
    %load_temp249 = load i32, i32* @a8, align 4
    %add_temp250 = add i32 %add_temp248, %load_temp249
    store i32 %add_temp250, i32* %e4, align 4
    %load_temp251 = load i32, i32* %c1, align 4
    %add_temp252 = add i32 1, %load_temp251
    %load_temp253 = load i32, i32* @a1, align 4
    %add_temp254 = add i32 %add_temp252, %load_temp253
    store i32 %add_temp254, i32* %d1, align 4
    %load_temp255 = load i32, i32* %c2, align 4
    %add_temp256 = add i32 2, %load_temp255
    %load_temp257 = load i32, i32* @a2, align 4
    %add_temp258 = add i32 %add_temp256, %load_temp257
    store i32 %add_temp258, i32* %d2, align 4
    %load_temp259 = load i32, i32* %c3, align 4
    %add_temp260 = add i32 3, %load_temp259
    %load_temp261 = load i32, i32* @a3, align 4
    %add_temp262 = add i32 %add_temp260, %load_temp261
    store i32 %add_temp262, i32* %d3, align 4
    %load_temp263 = load i32, i32* %c4, align 4
    %add_temp264 = add i32 4, %load_temp263
    %load_temp265 = load i32, i32* @a4, align 4
    %add_temp266 = add i32 %add_temp264, %load_temp265
    store i32 %add_temp266, i32* %d4, align 4
    %load_temp267 = load i32, i32* %c1, align 4
    %add_temp268 = add i32 1, %load_temp267
    %load_temp269 = load i32, i32* @a1, align 4
    %add_temp270 = add i32 %add_temp268, %load_temp269
    store i32 %add_temp270, i32* %d1, align 4
    %load_temp271 = load i32, i32* %c2, align 4
    %add_temp272 = add i32 2, %load_temp271
    %load_temp273 = load i32, i32* @a2, align 4
    %add_temp274 = add i32 %add_temp272, %load_temp273
    store i32 %add_temp274, i32* %d2, align 4
    %load_temp275 = load i32, i32* %c3, align 4
    %add_temp276 = add i32 3, %load_temp275
    %load_temp277 = load i32, i32* @a3, align 4
    %add_temp278 = add i32 %add_temp276, %load_temp277
    store i32 %add_temp278, i32* %d3, align 4
    %load_temp279 = load i32, i32* %c4, align 4
    %add_temp280 = add i32 4, %load_temp279
    %load_temp281 = load i32, i32* @a4, align 4
    %add_temp282 = add i32 %add_temp280, %load_temp281
    store i32 %add_temp282, i32* %d4, align 4
    %load_temp283 = load i32, i32* %i, align 4
    %load_temp284 = load i32, i32* %c1, align 4
    %add_temp285 = add i32 %load_temp283, %load_temp284
    %load_temp286 = load i32, i32* %c2, align 4
    %add_temp287 = add i32 %add_temp285, %load_temp286
    %load_temp288 = load i32, i32* %c3, align 4
    %add_temp289 = add i32 %add_temp287, %load_temp288
    %load_temp290 = load i32, i32* %c4, align 4
    %add_temp291 = add i32 %add_temp289, %load_temp290
    %load_temp292 = load i32, i32* %d1, align 4
    %sub_temp293 = sub i32 %add_temp291, %load_temp292
    %load_temp294 = load i32, i32* %d2, align 4
    %sub_temp295 = sub i32 %sub_temp293, %load_temp294
    %load_temp296 = load i32, i32* %d3, align 4
    %sub_temp297 = sub i32 %sub_temp295, %load_temp296
    %load_temp298 = load i32, i32* %d4, align 4
    %sub_temp299 = sub i32 %sub_temp297, %load_temp298
    %load_temp300 = load i32, i32* %e1, align 4
    %add_temp301 = add i32 %sub_temp299, %load_temp300
    %load_temp302 = load i32, i32* %e2, align 4
    %add_temp303 = add i32 %add_temp301, %load_temp302
    %load_temp304 = load i32, i32* %e3, align 4
    %add_temp305 = add i32 %add_temp303, %load_temp304
    %load_temp306 = load i32, i32* %e4, align 4
    %add_temp307 = add i32 %add_temp305, %load_temp306
    %load_temp308 = load i32, i32* %f1, align 4
    %sub_temp309 = sub i32 %add_temp307, %load_temp308
    %load_temp310 = load i32, i32* %f2, align 4
    %sub_temp311 = sub i32 %sub_temp309, %load_temp310
    %load_temp312 = load i32, i32* %f3, align 4
    %sub_temp313 = sub i32 %sub_temp311, %load_temp312
    %load_temp314 = load i32, i32* %f4, align 4
    %sub_temp315 = sub i32 %sub_temp313, %load_temp314
    %load_temp316 = load i32, i32* %g1, align 4
    %add_temp317 = add i32 %sub_temp315, %load_temp316
    %load_temp318 = load i32, i32* %g2, align 4
    %add_temp319 = add i32 %add_temp317, %load_temp318
    %load_temp320 = load i32, i32* %g3, align 4
    %add_temp321 = add i32 %add_temp319, %load_temp320
    %load_temp322 = load i32, i32* %g4, align 4
    %add_temp323 = add i32 %add_temp321, %load_temp322
    %load_temp324 = load i32, i32* %h1, align 4
    %sub_temp325 = sub i32 %add_temp323, %load_temp324
    %load_temp326 = load i32, i32* %h2, align 4
    %sub_temp327 = sub i32 %sub_temp325, %load_temp326
    %load_temp328 = load i32, i32* %h3, align 4
    %sub_temp329 = sub i32 %sub_temp327, %load_temp328
    %load_temp330 = load i32, i32* %h4, align 4
    %sub_temp331 = sub i32 %sub_temp329, %load_temp330
    %load_temp332 = load i32, i32* %i1, align 4
    %add_temp333 = add i32 %sub_temp331, %load_temp332
    %load_temp334 = load i32, i32* %i2, align 4
    %add_temp335 = add i32 %add_temp333, %load_temp334
    %load_temp336 = load i32, i32* %i3, align 4
    %add_temp337 = add i32 %add_temp335, %load_temp336
    %load_temp338 = load i32, i32* %i4, align 4
    %add_temp339 = add i32 %add_temp337, %load_temp338
    %load_temp340 = load i32, i32* %j1, align 4
    %sub_temp341 = sub i32 %add_temp339, %load_temp340
    %load_temp342 = load i32, i32* %j2, align 4
    %sub_temp343 = sub i32 %sub_temp341, %load_temp342
    %load_temp344 = load i32, i32* %j3, align 4
    %sub_temp345 = sub i32 %sub_temp343, %load_temp344
    %load_temp346 = load i32, i32* %j4, align 4
    %sub_temp347 = sub i32 %sub_temp345, %load_temp346
    %load_temp348 = load i32, i32* %k1, align 4
    %add_temp349 = add i32 %sub_temp347, %load_temp348
    %load_temp350 = load i32, i32* %k2, align 4
    %add_temp351 = add i32 %add_temp349, %load_temp350
    %load_temp352 = load i32, i32* %k3, align 4
    %add_temp353 = add i32 %add_temp351, %load_temp352
    %load_temp354 = load i32, i32* %k4, align 4
    %add_temp355 = add i32 %add_temp353, %load_temp354
    %load_temp356 = load i32, i32* @a1, align 4
    %add_temp357 = add i32 %add_temp355, %load_temp356
    %load_temp358 = load i32, i32* @a2, align 4
    %sub_temp359 = sub i32 %add_temp357, %load_temp358
    %load_temp360 = load i32, i32* @a3, align 4
    %add_temp361 = add i32 %sub_temp359, %load_temp360
    %load_temp362 = load i32, i32* @a4, align 4
    %sub_temp363 = sub i32 %add_temp361, %load_temp362
    %load_temp364 = load i32, i32* @a5, align 4
    %add_temp365 = add i32 %sub_temp363, %load_temp364
    %load_temp366 = load i32, i32* @a6, align 4
    %sub_temp367 = sub i32 %add_temp365, %load_temp366
    %load_temp368 = load i32, i32* @a7, align 4
    %add_temp369 = add i32 %sub_temp367, %load_temp368
    %load_temp370 = load i32, i32* @a8, align 4
    %sub_temp371 = sub i32 %add_temp369, %load_temp370
    %load_temp372 = load i32, i32* @a9, align 4
    %add_temp373 = add i32 %sub_temp371, %load_temp372
    %load_temp374 = load i32, i32* @a10, align 4
    %sub_temp375 = sub i32 %add_temp373, %load_temp374
    %load_temp376 = load i32, i32* @a11, align 4
    %add_temp377 = add i32 %sub_temp375, %load_temp376
    %load_temp378 = load i32, i32* @a12, align 4
    %sub_temp379 = sub i32 %add_temp377, %load_temp378
    %load_temp380 = load i32, i32* @a13, align 4
    %add_temp381 = add i32 %sub_temp379, %load_temp380
    %load_temp382 = load i32, i32* @a14, align 4
    %sub_temp383 = sub i32 %add_temp381, %load_temp382
    %load_temp384 = load i32, i32* @a15, align 4
    %add_temp385 = add i32 %sub_temp383, %load_temp384
    %load_temp386 = load i32, i32* @a16, align 4
    %sub_temp387 = sub i32 %add_temp385, %load_temp386
    %load_temp388 = load i32, i32* @a17, align 4
    %add_temp389 = add i32 %sub_temp387, %load_temp388
    %load_temp390 = load i32, i32* @a18, align 4
    %sub_temp391 = sub i32 %add_temp389, %load_temp390
    %load_temp392 = load i32, i32* @a19, align 4
    %add_temp393 = add i32 %sub_temp391, %load_temp392
    %load_temp394 = load i32, i32* @a20, align 4
    %sub_temp395 = sub i32 %add_temp393, %load_temp394
    %load_temp396 = load i32, i32* @a21, align 4
    %add_temp397 = add i32 %sub_temp395, %load_temp396
    %load_temp398 = load i32, i32* @a22, align 4
    %sub_temp399 = sub i32 %add_temp397, %load_temp398
    %load_temp400 = load i32, i32* @a23, align 4
    %add_temp401 = add i32 %sub_temp399, %load_temp400
    %load_temp402 = load i32, i32* @a24, align 4
    %sub_temp403 = sub i32 %add_temp401, %load_temp402
    %load_temp404 = load i32, i32* @a25, align 4
    %add_temp405 = add i32 %sub_temp403, %load_temp404
    %load_temp406 = load i32, i32* @a26, align 4
    %sub_temp407 = sub i32 %add_temp405, %load_temp406
    %load_temp408 = load i32, i32* @a27, align 4
    %add_temp409 = add i32 %sub_temp407, %load_temp408
    %load_temp410 = load i32, i32* @a28, align 4
    %sub_temp411 = sub i32 %add_temp409, %load_temp410
    %load_temp412 = load i32, i32* @a29, align 4
    %add_temp413 = add i32 %sub_temp411, %load_temp412
    %load_temp414 = load i32, i32* @a30, align 4
    %sub_temp415 = sub i32 %add_temp413, %load_temp414
    %load_temp416 = load i32, i32* @a31, align 4
    %add_temp417 = add i32 %sub_temp415, %load_temp416
    %load_temp418 = load i32, i32* @a32, align 4
    %sub_temp419 = sub i32 %add_temp417, %load_temp418
    ret i32 %sub_temp419
}

define i32 @main() {
entry:
    %a = alloca i32, align 4
    %b = alloca i32, align 4
    %call_temp420 = call i32 @getint()
    store i32 %call_temp420, i32* %a, align 4
    %load_temp421 = load i32, i32* %a, align 4
    %mul_temp422 = mul i32 2, 9
    %add_temp423 = add i32 %load_temp421, %mul_temp422
    store i32 %add_temp423, i32* %b, align 4
    %load_temp424 = load i32, i32* %a, align 4
    %load_temp425 = load i32, i32* %b, align 4
    %call_temp426 = call i32 @func(i32 %load_temp424, i32 %load_temp425)
    store i32 %call_temp426, i32* %a, align 4
    %load_temp427 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp427)
    %load_temp428 = load i32, i32* %a, align 4
    ret i32 %load_temp428
}

