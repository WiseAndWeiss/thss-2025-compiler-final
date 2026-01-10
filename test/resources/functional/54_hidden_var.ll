; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@b = global i32 5, align 4
@c = global [4 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a = alloca i32, align 4
    store i32 1, i32* %a, align 4
    %a = alloca i32, align 4
    store i32 2, i32* %a, align 4
    store i32 3, i32* %a, align 4
    %load_temp0 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp0)
    %load_temp1 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp1)
    %load_temp2 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp2)
    call void @putch(i32 10)
    br label %while_cond_0
while_cond_0:
    %load_temp3 = load i32, i32* %a, align 4
    %icmp_slt_temp4 = icmp slt i32 %load_temp3, 5
    br i1 %icmp_slt_temp4, label %while_body_0, label %while_end_0
while_body_0:
    %a = alloca i32, align 4
    store i32 0, i32* %a, align 4
    %load_temp5 = load i32, i32* %a, align 4
    %add_temp6 = add i32 %load_temp5, 1
    store i32 %add_temp6, i32* %a, align 4
    %load_temp7 = load i32, i32* %a, align 4
    %icmp_ne_temp8 = icmp ne i32 %load_temp7, 0
    br i1 %icmp_ne_temp8, label %if_then_0, label %if_end_0
if_then_0:
    br label %while_end_0
if_end_0:
    br label %while_cond_0
while_end_0:
    %load_temp9 = load i32, i32* %a, align 4
    call void @putint(i32 %load_temp9)
    call void @putch(i32 10)
    %gep_temp10 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 2
    store i32 1, i32* %gep_temp10, align 4
    %c = alloca [2 x [8 x i32]], align 4
    %gep_temp11 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %c, i32 0, i32 0
    %gep_temp12 = getelementptr [8 x i32], [8 x i32]* %gep_temp11, i32 0, i32 0
    store i32 0, i32* %gep_temp12, align 4
    %gep_temp13 = getelementptr [8 x i32], [8 x i32]* %gep_temp11, i32 0, i32 1
    store i32 9, i32* %gep_temp13, align 4
    %gep_temp14 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %c, i32 0, i32 1, i32 0
    store i32 8, i32* %gep_temp14, align 4
    %gep_temp15 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %c, i32 0, i32 1, i32 1
    store i32 3, i32* %gep_temp15, align 4
    %b = alloca i32, align 4
    store i32 2, i32* %b, align 4
    %gep_temp16 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 2
    %load_temp17 = load i32, i32* %gep_temp16, align 4
    %icmp_ne_temp18 = icmp ne i32 %load_temp17, 0
    br i1 %icmp_ne_temp18, label %if_then_1, label %if_end_1
if_then_1:
    %c = alloca [7 x [1 x [5 x i32]]], align 4
    %gep_temp19 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 0
    %gep_temp20 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 1
    %gep_temp21 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 2
    %gep_temp22 = getelementptr [1 x [5 x i32]], [1 x [5 x i32]]* %gep_temp21, i32 0, i32 0, i32 0
    store i32 2, i32* %gep_temp22, align 4
    %gep_temp23 = getelementptr [1 x [5 x i32]], [1 x [5 x i32]]* %gep_temp21, i32 0, i32 0, i32 1
    store i32 1, i32* %gep_temp23, align 4
    %gep_temp24 = getelementptr [1 x [5 x i32]], [1 x [5 x i32]]* %gep_temp21, i32 0, i32 0, i32 2
    store i32 8, i32* %gep_temp24, align 4
    %gep_temp25 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 3
    %gep_temp26 = getelementptr [1 x [5 x i32]], [1 x [5 x i32]]* %gep_temp25, i32 0, i32 0
    %load_temp27 = load i32, i32* %b, align 4
    %gep_temp28 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 %load_temp27, i32 0, i32 0
    %load_temp29 = load i32, i32* %gep_temp28, align 4
    call void @putint(i32 %load_temp29)
    %load_temp30 = load i32, i32* %b, align 4
    %gep_temp31 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 %load_temp30, i32 0, i32 1
    %load_temp32 = load i32, i32* %gep_temp31, align 4
    call void @putint(i32 %load_temp32)
    %load_temp33 = load i32, i32* %b, align 4
    %gep_temp34 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %c, i32 0, i32 %load_temp33, i32 0, i32 2
    %load_temp35 = load i32, i32* %gep_temp34, align 4
    call void @putint(i32 %load_temp35)
    br label %if_end_1
if_end_1:
    call void @putch(i32 10)
    %load_temp36 = load i32, i32* @b, align 4
    call void @putint(i32 %load_temp36)
    call void @putch(i32 10)
    %gep_temp37 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 0
    %load_temp38 = load i32, i32* %gep_temp37, align 4
    call void @putint(i32 %load_temp38)
    %gep_temp39 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 1
    %load_temp40 = load i32, i32* %gep_temp39, align 4
    call void @putint(i32 %load_temp40)
    %gep_temp41 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 2
    %load_temp42 = load i32, i32* %gep_temp41, align 4
    call void @putint(i32 %load_temp42)
    %gep_temp43 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 3
    %load_temp44 = load i32, i32* %gep_temp43, align 4
    call void @putint(i32 %load_temp44)
    call void @putch(i32 10)
    ret i32 0
}

