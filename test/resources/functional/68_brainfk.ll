; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@TAPE_LEN = constant i32 65536, align 4
@BUFFER_LEN = constant i32 32768, align 4
@tape = global [65536 x i32] zeroinitializer, align 4
@program = global [32768 x i32] zeroinitializer, align 4
@ptr = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @read_program() {
entry:
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    %len = alloca i32, align 4
    %call_temp0 = call i32 @getint()
    store i32 %call_temp0, i32* %len, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp1 = load i32, i32* %i, align 4
    %load_temp2 = load i32, i32* %len, align 4
    %icmp_slt_temp3 = icmp slt i32 %load_temp1, %load_temp2
    br i1 %icmp_slt_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp4 = load i32, i32* %i, align 4
    %gep_temp5 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %load_temp4
    %call_temp6 = call i32 @getch()
    store i32 %call_temp6, i32* %gep_temp5, align 4
    %load_temp7 = load i32, i32* %i, align 4
    %add_temp8 = add i32 %load_temp7, 1
    store i32 %add_temp8, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    %load_temp9 = load i32, i32* %i, align 4
    %gep_temp10 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %load_temp9
    store i32 0, i32* %gep_temp10, align 4
    ret void
}

define void @interpret(i32* %input) {
entry:
    %input_local = alloca i32*, align 4
    store i32* %input, i32** %input_local, align 4
    %cur_char = alloca i32, align 4
    %loop = alloca i32, align 4
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp11 = load i32, i32* %i, align 4
    %gep_temp12 = getelementptr i32*, i32** %input_local, i32 0, i32 %load_temp11
    %load_temp13 = load i32*, i32** %gep_temp12, align 4
    %icmp_ne_temp14 = icmp ne i32* %load_temp13, 0
    br i1 %icmp_ne_temp14, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp15 = load i32, i32* %i, align 4
    %gep_temp16 = getelementptr i32*, i32** %input_local, i32 0, i32 %load_temp15
    %load_temp17 = load i32*, i32** %gep_temp16, align 4
    store i32* %load_temp17, i32* %cur_char, align 4
    %load_temp18 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp19 = icmp eq i32 %load_temp18, 62
    br i1 %icmp_eq_temp19, label %if_then_0, label %if_else_0
if_then_0:
    %load_temp20 = load i32, i32* @ptr, align 4
    %add_temp21 = add i32 %load_temp20, 1
    store i32 %add_temp21, i32* @ptr, align 4
    br label %if_end_0
if_else_0:
    %load_temp22 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp23 = icmp eq i32 %load_temp22, 60
    br i1 %icmp_eq_temp23, label %if_then_1, label %if_else_1
if_then_1:
    %load_temp24 = load i32, i32* @ptr, align 4
    %sub_temp25 = sub i32 %load_temp24, 1
    store i32 %sub_temp25, i32* @ptr, align 4
    br label %if_end_1
if_else_1:
    %load_temp26 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp27 = icmp eq i32 %load_temp26, 43
    br i1 %icmp_eq_temp27, label %if_then_2, label %if_else_2
if_then_2:
    %load_temp28 = load i32, i32* @ptr, align 4
    %gep_temp29 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp28
    %load_temp30 = load i32, i32* @ptr, align 4
    %gep_temp31 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp30
    %load_temp32 = load i32, i32* %gep_temp31, align 4
    %add_temp33 = add i32 %load_temp32, 1
    store i32 %add_temp33, i32* %gep_temp29, align 4
    br label %if_end_2
if_else_2:
    %load_temp34 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp35 = icmp eq i32 %load_temp34, 45
    br i1 %icmp_eq_temp35, label %if_then_3, label %if_else_3
if_then_3:
    %load_temp36 = load i32, i32* @ptr, align 4
    %gep_temp37 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp36
    %load_temp38 = load i32, i32* @ptr, align 4
    %gep_temp39 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp38
    %load_temp40 = load i32, i32* %gep_temp39, align 4
    %sub_temp41 = sub i32 %load_temp40, 1
    store i32 %sub_temp41, i32* %gep_temp37, align 4
    br label %if_end_3
if_else_3:
    %load_temp42 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp43 = icmp eq i32 %load_temp42, 46
    br i1 %icmp_eq_temp43, label %if_then_4, label %if_else_4
if_then_4:
    %load_temp44 = load i32, i32* @ptr, align 4
    %gep_temp45 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp44
    %load_temp46 = load i32, i32* %gep_temp45, align 4
    call void @putch(i32 %load_temp46)
    br label %if_end_4
if_else_4:
    %load_temp47 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp48 = icmp eq i32 %load_temp47, 44
    br i1 %icmp_eq_temp48, label %if_then_5, label %if_else_5
if_then_5:
    %load_temp49 = load i32, i32* @ptr, align 4
    %gep_temp50 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp49
    %call_temp51 = call i32 @getch()
    store i32 %call_temp51, i32* %gep_temp50, align 4
    br label %if_end_5
if_else_5:
    %load_temp52 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp53 = icmp eq i32 %load_temp52, 93
    %load_temp54 = load i32, i32* @ptr, align 4
    %gep_temp55 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %load_temp54
    %load_temp56 = load i32, i32* %gep_temp55, align 4
    %icmp_ne_temp57 = icmp ne i1 %icmp_eq_temp53, 0
    %icmp_ne_temp58 = icmp ne i32 %load_temp56, 0
    %zext_temp59 = zext i1 %icmp_ne_temp57 to i32
    %zext_temp60 = zext i1 %icmp_ne_temp58 to i32
    %mul_temp61 = mul i32 %zext_temp59, %zext_temp60
    %icmp_ne_temp62 = icmp ne i32 %mul_temp61, 0
    br i1 %icmp_ne_temp62, label %if_then_6, label %if_end_6
if_then_6:
    store i32 1, i32* %loop, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp63 = load i32, i32* %loop, align 4
    %icmp_sgt_temp64 = icmp sgt i32 %load_temp63, 0
    br i1 %icmp_sgt_temp64, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp65 = load i32, i32* %i, align 4
    %sub_temp66 = sub i32 %load_temp65, 1
    store i32 %sub_temp66, i32* %i, align 4
    %load_temp67 = load i32, i32* %i, align 4
    %gep_temp68 = getelementptr i32*, i32** %input_local, i32 0, i32 %load_temp67
    %load_temp69 = load i32*, i32** %gep_temp68, align 4
    store i32* %load_temp69, i32* %cur_char, align 4
    %load_temp70 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp71 = icmp eq i32 %load_temp70, 91
    br i1 %icmp_eq_temp71, label %if_then_7, label %if_else_7
if_then_7:
    %load_temp72 = load i32, i32* %loop, align 4
    %sub_temp73 = sub i32 %load_temp72, 1
    store i32 %sub_temp73, i32* %loop, align 4
    br label %if_end_7
if_else_7:
    %load_temp74 = load i32, i32* %cur_char, align 4
    %icmp_eq_temp75 = icmp eq i32 %load_temp74, 93
    br i1 %icmp_eq_temp75, label %if_then_8, label %if_end_8
if_then_8:
    %load_temp76 = load i32, i32* %loop, align 4
    %add_temp77 = add i32 %load_temp76, 1
    store i32 %add_temp77, i32* %loop, align 4
    br label %if_end_8
if_end_8:
    br label %if_end_7
if_end_7:
    br label %while_cond_1
while_end_1:
    br label %if_end_6
if_end_6:
    br label %if_end_5
if_end_5:
    br label %if_end_4
if_end_4:
    br label %if_end_3
if_end_3:
    br label %if_end_2
if_end_2:
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    %load_temp78 = load i32, i32* %i, align 4
    %add_temp79 = add i32 %load_temp78, 1
    store i32 %add_temp79, i32* %i, align 4
    br label %while_cond_0
while_end_0:
    ret void
}

define i32 @main() {
entry:
    call void @read_program()
    %load_temp80 = load [32768 x i32], [32768 x i32]* @program, align 4
    call void @interpret([32768 x i32] %load_temp80)
    ret i32 0
}

