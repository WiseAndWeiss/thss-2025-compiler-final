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
    %b = alloca [4 x [2 x i32]], align 4
    %gep_temp0 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 0, i32 0
    store i32 1, i32* %gep_temp0, align 4
    %gep_temp1 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 0, i32 1
    store i32 2, i32* %gep_temp1, align 4
    %gep_temp2 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 1, i32 0
    store i32 3, i32* %gep_temp2, align 4
    %gep_temp3 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 1, i32 1
    store i32 4, i32* %gep_temp3, align 4
    %gep_temp4 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 2, i32 0
    store i32 5, i32* %gep_temp4, align 4
    %gep_temp5 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 2, i32 1
    store i32 6, i32* %gep_temp5, align 4
    %gep_temp6 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 3, i32 0
    store i32 7, i32* %gep_temp6, align 4
    %gep_temp7 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %b, i32 0, i32 3, i32 1
    store i32 8, i32* %gep_temp7, align 4
    %c = alloca [4 x [2 x i32]], align 4
    %gep_temp8 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 0
    %gep_temp9 = getelementptr [2 x i32], [2 x i32]* %gep_temp8, i32 0, i32 0
    store i32 1, i32* %gep_temp9, align 4
    %gep_temp10 = getelementptr [2 x i32], [2 x i32]* %gep_temp8, i32 0, i32 1
    store i32 2, i32* %gep_temp10, align 4
    %gep_temp11 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 1
    %gep_temp12 = getelementptr [2 x i32], [2 x i32]* %gep_temp11, i32 0, i32 0
    store i32 3, i32* %gep_temp12, align 4
    %gep_temp13 = getelementptr [2 x i32], [2 x i32]* %gep_temp11, i32 0, i32 1
    store i32 4, i32* %gep_temp13, align 4
    %gep_temp14 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 2
    %gep_temp15 = getelementptr [2 x i32], [2 x i32]* %gep_temp14, i32 0, i32 0
    store i32 5, i32* %gep_temp15, align 4
    %gep_temp16 = getelementptr [2 x i32], [2 x i32]* %gep_temp14, i32 0, i32 1
    store i32 6, i32* %gep_temp16, align 4
    %gep_temp17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 3
    %gep_temp18 = getelementptr [2 x i32], [2 x i32]* %gep_temp17, i32 0, i32 0
    store i32 7, i32* %gep_temp18, align 4
    %gep_temp19 = getelementptr [2 x i32], [2 x i32]* %gep_temp17, i32 0, i32 1
    store i32 8, i32* %gep_temp19, align 4
    %d = alloca [4 x [2 x i32]], align 4
    %gep_temp20 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 0, i32 0
    store i32 1, i32* %gep_temp20, align 4
    %gep_temp21 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 0, i32 1
    store i32 2, i32* %gep_temp21, align 4
    %gep_temp22 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 1
    %gep_temp23 = getelementptr [2 x i32], [2 x i32]* %gep_temp22, i32 0, i32 0
    store i32 3, i32* %gep_temp23, align 4
    %gep_temp24 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 2
    %gep_temp25 = getelementptr [2 x i32], [2 x i32]* %gep_temp24, i32 0, i32 0
    store i32 5, i32* %gep_temp25, align 4
    %gep_temp26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 3, i32 0
    store i32 7, i32* %gep_temp26, align 4
    %gep_temp27 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 3, i32 1
    store i32 8, i32* %gep_temp27, align 4
    %e = alloca [4 x [2 x i32]], align 4
    %gep_temp28 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 0
    %gep_temp29 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %d, i32 0, i32 2, i32 1
    %load_temp30 = load i32, i32* %gep_temp29, align 4
    %gep_temp31 = getelementptr [2 x i32], [2 x i32]* %gep_temp28, i32 0, i32 0
    store i32 %load_temp30, i32* %gep_temp31, align 4
    %gep_temp32 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %c, i32 0, i32 2, i32 1
    %load_temp33 = load i32, i32* %gep_temp32, align 4
    %gep_temp34 = getelementptr [2 x i32], [2 x i32]* %gep_temp28, i32 0, i32 1
    store i32 %load_temp33, i32* %gep_temp34, align 4
    %gep_temp35 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 1
    %gep_temp36 = getelementptr [2 x i32], [2 x i32]* %gep_temp35, i32 0, i32 0
    store i32 3, i32* %gep_temp36, align 4
    %gep_temp37 = getelementptr [2 x i32], [2 x i32]* %gep_temp35, i32 0, i32 1
    store i32 4, i32* %gep_temp37, align 4
    %gep_temp38 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 2
    %gep_temp39 = getelementptr [2 x i32], [2 x i32]* %gep_temp38, i32 0, i32 0
    store i32 5, i32* %gep_temp39, align 4
    %gep_temp40 = getelementptr [2 x i32], [2 x i32]* %gep_temp38, i32 0, i32 1
    store i32 6, i32* %gep_temp40, align 4
    %gep_temp41 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 3
    %gep_temp42 = getelementptr [2 x i32], [2 x i32]* %gep_temp41, i32 0, i32 0
    store i32 7, i32* %gep_temp42, align 4
    %gep_temp43 = getelementptr [2 x i32], [2 x i32]* %gep_temp41, i32 0, i32 1
    store i32 8, i32* %gep_temp43, align 4
    %gep_temp44 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 3, i32 1
    %load_temp45 = load i32, i32* %gep_temp44, align 4
    %gep_temp46 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 0, i32 0
    %load_temp47 = load i32, i32* %gep_temp46, align 4
    %add_temp48 = add i32 %load_temp45, %load_temp47
    %gep_temp49 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %e, i32 0, i32 0, i32 1
    %load_temp50 = load i32, i32* %gep_temp49, align 4
    %add_temp51 = add i32 %add_temp48, %load_temp50
    %gep_temp52 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %a, i32 0, i32 2, i32 0
    %load_temp53 = load i32, i32* %gep_temp52, align 4
    %add_temp54 = add i32 %add_temp51, %load_temp53
    ret i32 %add_temp54
}

