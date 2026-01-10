; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a = alloca [4 x [2 x i32]], align 4
    %gep_temp0 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 0
    %gep_temp1 = getelementptr [2 x i32], [2 x i32]* %gep_temp0, i32 0, i32 0
    store i32 1, i32* %gep_temp1, align 4
    %gep_temp2 = getelementptr [2 x i32], [2 x i32]* %gep_temp0, i32 0, i32 1
    store i32 2, i32* %gep_temp2, align 4
    %gep_temp3 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 1
    %gep_temp4 = getelementptr [2 x i32], [2 x i32]* %gep_temp3, i32 0, i32 0
    store i32 3, i32* %gep_temp4, align 4
    %gep_temp5 = getelementptr [2 x i32], [2 x i32]* %gep_temp3, i32 0, i32 1
    store i32 4, i32* %gep_temp5, align 4
    %gep_temp6 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 2
    %gep_temp7 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 3, i32 0
    store i32 7, i32* %gep_temp7, align 4
    %N = alloca i32, align 4
    store i32 3, i32* %N, align 4
    %b = alloca [4 x [2 x i32]], align 4
    %c = alloca [4 x [2 x i32]], align 4
    %gep_temp8 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 0, i32 0
    store i32 1, i32* %gep_temp8, align 4
    %gep_temp9 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 0, i32 1
    store i32 2, i32* %gep_temp9, align 4
    %gep_temp10 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 1, i32 0
    store i32 3, i32* %gep_temp10, align 4
    %gep_temp11 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 1, i32 1
    store i32 4, i32* %gep_temp11, align 4
    %gep_temp12 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 2, i32 0
    store i32 5, i32* %gep_temp12, align 4
    %gep_temp13 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 2, i32 1
    store i32 6, i32* %gep_temp13, align 4
    %gep_temp14 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 3, i32 0
    store i32 7, i32* %gep_temp14, align 4
    %gep_temp15 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 3, i32 1
    store i32 8, i32* %gep_temp15, align 4
    %d = alloca [4 x [2 x i32]], align 4
    %gep_temp16 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 0, i32 0
    store i32 1, i32* %gep_temp16, align 4
    %gep_temp17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 0, i32 1
    store i32 2, i32* %gep_temp17, align 4
    %gep_temp18 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 1
    %gep_temp19 = getelementptr [2 x i32], [2 x i32]* %gep_temp18, i32 0, i32 0
    store i32 3, i32* %gep_temp19, align 4
    %gep_temp20 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 2
    %gep_temp21 = getelementptr [2 x i32], [2 x i32]* %gep_temp20, i32 0, i32 0
    store i32 5, i32* %gep_temp21, align 4
    %gep_temp22 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 3, i32 0
    %load_temp23 = load i32, i32* %gep_temp22, align 4
    %gep_temp24 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 3, i32 0
    store i32 %load_temp23, i32* %gep_temp24, align 4
    %gep_temp25 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 3, i32 1
    store i32 8, i32* %gep_temp25, align 4
    %e = alloca [4 x [2 x [1 x i32]]], align 4
    %gep_temp26 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 0
    %gep_temp27 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 2, i32 1
    %load_temp28 = load i32, i32* %gep_temp27, align 4
    %gep_temp29 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp26, i32 0, i32 0, i32 0
    store i32 %load_temp28, i32* %gep_temp29, align 4
    %gep_temp30 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp26, i32 0, i32 1
    %gep_temp31 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 2, i32 1
    %load_temp32 = load i32, i32* %gep_temp31, align 4
    %gep_temp33 = getelementptr [1 x i32], [1 x i32]* %gep_temp30, i32 0, i32 0
    store i32 %load_temp32, i32* %gep_temp33, align 4
    %gep_temp34 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 1
    %gep_temp35 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp34, i32 0, i32 0, i32 0
    store i32 3, i32* %gep_temp35, align 4
    %gep_temp36 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp34, i32 0, i32 1, i32 0
    store i32 4, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 2
    %gep_temp38 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp37, i32 0, i32 0, i32 0
    store i32 5, i32* %gep_temp38, align 4
    %gep_temp39 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp37, i32 0, i32 1, i32 0
    store i32 6, i32* %gep_temp39, align 4
    %gep_temp40 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 3
    %gep_temp41 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp40, i32 0, i32 0, i32 0
    store i32 7, i32* %gep_temp41, align 4
    %gep_temp42 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %gep_temp40, i32 0, i32 1, i32 0
    store i32 8, i32* %gep_temp42, align 4
    %gep_temp43 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 3, i32 1, i32 0
    %load_temp44 = load i32, i32* %gep_temp43, align 4
    %gep_temp45 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 0, i32 0, i32 0
    %load_temp46 = load i32, i32* %gep_temp45, align 4
    %add_temp47 = add i32 %load_temp44, %load_temp46
    %gep_temp48 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %e, i32 0, i32 0, i32 1, i32 0
    %load_temp49 = load i32, i32* %gep_temp48, align 4
    %add_temp50 = add i32 %add_temp47, %load_temp49
    %gep_temp51 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 3, i32 0
    %load_temp52 = load i32, i32* %gep_temp51, align 4
    %add_temp53 = add i32 %add_temp50, %load_temp52
    ret i32 %add_temp53
}

