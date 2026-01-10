; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @get_next(i32* %str, i32* %next) {
entry:
    %str_local = alloca i32*, align 4
    store i32* %str, i32** %str_local, align 4
    %next_local = alloca i32*, align 4
    store i32* %next, i32** %next_local, align 4
    %gep_temp0 = getelementptr i32*, i32** %next_local, i32 0, i32 0
    %sub_temp1 = sub i32 0, 1
    store i32 %sub_temp1, i32** %gep_temp0, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %j = alloca i32, align 4
    %sub_temp2 = sub i32 0, 1
    store i32 %sub_temp2, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp3 = load i32, i32* %i, align 4
    %gep_temp4 = getelementptr i32*, i32** %str_local, i32 0, i32 %load_temp3
    %load_temp5 = load i32*, i32** %gep_temp4, align 4
    %icmp_ne_temp6 = icmp ne i32* %load_temp5, 0
    br i1 %icmp_ne_temp6, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp7 = load i32, i32* %j, align 4
    %sub_temp8 = sub i32 0, 1
    %icmp_eq_temp9 = icmp eq i32 %load_temp7, %sub_temp8
    %load_temp10 = load i32, i32* %i, align 4
    %gep_temp11 = getelementptr i32*, i32** %str_local, i32 0, i32 %load_temp10
    %load_temp12 = load i32*, i32** %gep_temp11, align 4
    %load_temp13 = load i32, i32* %j, align 4
    %gep_temp14 = getelementptr i32*, i32** %str_local, i32 0, i32 %load_temp13
    %load_temp15 = load i32*, i32** %gep_temp14, align 4
    %icmp_eq_temp16 = icmp eq i32* %load_temp12, %load_temp15
    %zext_temp17 = zext i1 %icmp_eq_temp9 to i32
    %zext_temp18 = zext i1 %icmp_eq_temp16 to i32
    %add_temp19 = add i32 %zext_temp17, %zext_temp18
    %icmp_ne_temp20 = icmp ne i32 %add_temp19, 0
    br i1 %icmp_ne_temp20, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp21 = load i32, i32* %j, align 4
    %add_temp22 = add i32 %load_temp21, 1
    store i32 %add_temp22, i32* %j, align 4
    %load_temp23 = load i32, i32* %i, align 4
    %add_temp24 = add i32 %load_temp23, 1
    store i32 %add_temp24, i32* %i, align 4
    %load_temp25 = load i32, i32* %i, align 4
    %gep_temp26 = getelementptr i32*, i32** %next_local, i32 0, i32 %load_temp25
    %load_temp27 = load i32, i32* %j, align 4
    store i32 %load_temp27, i32** %gep_temp26, align 4
    br label %if_end_0
if_else_0:
    %load_temp28 = load i32, i32* %j, align 4
    %gep_temp29 = getelementptr i32*, i32** %next_local, i32 0, i32 %load_temp28
    %load_temp30 = load i32*, i32** %gep_temp29, align 4
    store i32* %load_temp30, i32* %j, align 4
    br label %if_end_0
if_end_0:
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @KMP(i32* %dst, i32* %src) {
entry:
    %dst_local = alloca i32*, align 4
    store i32* %dst, i32** %dst_local, align 4
    %src_local = alloca i32*, align 4
    store i32* %src, i32** %src_local, align 4
    %next = alloca [4096 x i32], align 4
    %load_temp31 = load i32*, i32** %dst_local, align 4
    %load_temp32 = load [4096 x i32], [4096 x i32]* %next, align 4
    call void @get_next(i32* %load_temp31, [4096 x i32] %load_temp32)
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %j = alloca i32, align 4
    store i32 0, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp33 = load i32, i32* %j, align 4
    %gep_temp34 = getelementptr i32*, i32** %src_local, i32 0, i32 %load_temp33
    %load_temp35 = load i32*, i32** %gep_temp34, align 4
    %icmp_ne_temp36 = icmp ne i32* %load_temp35, 0
    br i1 %icmp_ne_temp36, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp37 = load i32, i32* %i, align 4
    %gep_temp38 = getelementptr i32*, i32** %dst_local, i32 0, i32 %load_temp37
    %load_temp39 = load i32*, i32** %gep_temp38, align 4
    %load_temp40 = load i32, i32* %j, align 4
    %gep_temp41 = getelementptr i32*, i32** %src_local, i32 0, i32 %load_temp40
    %load_temp42 = load i32*, i32** %gep_temp41, align 4
    %icmp_eq_temp43 = icmp eq i32* %load_temp39, %load_temp42
    br i1 %icmp_eq_temp43, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp44 = load i32, i32* %i, align 4
    %add_temp45 = add i32 %load_temp44, 1
    store i32 %add_temp45, i32* %i, align 4
    %load_temp46 = load i32, i32* %j, align 4
    %add_temp47 = add i32 %load_temp46, 1
    store i32 %add_temp47, i32* %j, align 4
    %load_temp48 = load i32, i32* %i, align 4
    %gep_temp49 = getelementptr i32*, i32** %dst_local, i32 0, i32 %load_temp48
    %load_temp50 = load i32*, i32** %gep_temp49, align 4
    %icmp_eq_temp51 = icmp eq i32* %load_temp50, 0
    br i1 %icmp_eq_temp51, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp52 = load i32, i32* %j, align 4
    ret i32 %load_temp52
if_end_2:
    br label %if_end_1
if_else_1:
    %load_temp53 = load i32, i32* %i, align 4
    %gep_temp54 = getelementptr [4096 x i32], [4096 x i32]* %next, i32 0, i32 %load_temp53
    %load_temp55 = load i32, i32* %gep_temp54, align 4
    store i32 %load_temp55, i32* %i, align 4
    %load_temp56 = load i32, i32* %i, align 4
    %sub_temp57 = sub i32 0, 1
    %icmp_eq_temp58 = icmp eq i32 %load_temp56, %sub_temp57
    br i1 %icmp_eq_temp58, label %if_then_3, label %if_end_3
if_then_3:
    %load_temp59 = load i32, i32* %i, align 4
    %add_temp60 = add i32 %load_temp59, 1
    store i32 %add_temp60, i32* %i, align 4
    %load_temp61 = load i32, i32* %j, align 4
    %add_temp62 = add i32 %load_temp61, 1
    store i32 %add_temp62, i32* %j, align 4
    br label %if_end_3
if_end_3:
    br label %if_end_1
if_end_1:
    br label %while_cond_0
while_end_0:
    %sub_temp63 = sub i32 0, 1
    ret i32 %sub_temp63
}

define i32 @read_str(i32* %buf) {
entry:
    %buf_local = alloca i32*, align 4
    store i32* %buf, i32** %buf_local, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %icmp_ne_temp64 = icmp ne i32 1, 0
    br i1 %icmp_ne_temp64, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp65 = load i32, i32* %i, align 4
    %gep_temp66 = getelementptr i32*, i32** %buf_local, i32 0, i32 %load_temp65
    %call_temp67 = call i32 @getch()
    store i32 %call_temp67, i32** %gep_temp66, align 4
    %load_temp68 = load i32, i32* %i, align 4
    %gep_temp69 = getelementptr i32*, i32** %buf_local, i32 0, i32 %load_temp68
    %load_temp70 = load i32*, i32** %gep_temp69, align 4
    %icmp_eq_temp71 = icmp eq i32* %load_temp70, 10
    br i1 %icmp_eq_temp71, label %if_then_4, label %if_end_4
if_then_4:
    br label %while_end_0
if_end_4:
    %load_temp72 = load i32, i32* %i, align 4
    %add_temp73 = add i32 %load_temp72, 1
    store i32 %add_temp73, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp74 = load i32, i32* %i, align 4
    %gep_temp75 = getelementptr i32*, i32** %buf_local, i32 0, i32 %load_temp74
    store i32 0, i32** %gep_temp75, align 4
    %load_temp76 = load i32, i32* %i, align 4
    ret i32 %load_temp76
}

define i32 @main() {
entry:
    %dst = alloca [4096 x i32], align 4
    %src = alloca [4096 x i32], align 4
    %load_temp77 = load [4096 x i32], [4096 x i32]* %dst, align 4
    %call_temp78 = call i32 @read_str([4096 x i32] %load_temp77)
    %load_temp79 = load [4096 x i32], [4096 x i32]* %src, align 4
    %call_temp80 = call i32 @read_str([4096 x i32] %load_temp79)
    %load_temp81 = load [4096 x i32], [4096 x i32]* %dst, align 4
    %load_temp82 = load [4096 x i32], [4096 x i32]* %src, align 4
    %call_temp83 = call i32 @KMP([4096 x i32] %load_temp81, [4096 x i32] %load_temp82)
    call void @putint(i32 %call_temp83)
    call void @putch(i32 10)
    ret i32 0
}

