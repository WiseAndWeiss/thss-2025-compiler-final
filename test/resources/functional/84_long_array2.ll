; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global [4096 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @f1(i32* %b) {
entry:
    %b_local = alloca i32*, align 4
    store i32* %b, i32** %b_local, align 4
    %gep_temp0 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
    store i32 4000, i32* %gep_temp0, align 4
    %gep_temp1 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4000
    store i32 3, i32* %gep_temp1, align 4
    %gep_temp2 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
    store i32 7, i32* %gep_temp2, align 4
    %gep_temp3 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 4095
    %load_temp4 = load i32, i32* %gep_temp3, align 4
    %gep_temp5 = getelementptr i32*, i32** %b_local, i32 0, i32 %load_temp4
    %gep_temp6 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 2216
    %load_temp7 = load i32, i32* %gep_temp6, align 4
    %add_temp8 = add i32 %load_temp7, 9
    store i32 %add_temp8, i32** %gep_temp5, align 4
    %gep_temp9 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 5
    %load_temp10 = load i32, i32* %gep_temp9, align 4
    %gep_temp11 = getelementptr [4096 x i32], [4096 x i32]* @a, i32 0, i32 %load_temp10
    %load_temp12 = load i32, i32* %gep_temp11, align 4
    ret i32 %load_temp12
}

define i32 @main() {
entry:
    %b = alloca [4 x [1024 x i32]], align 4
    %gep_temp13 = getelementptr [4 x [1024 x i32]], [4 x [1024 x i32]]* %b, i32 0, i32 0
    %gep_temp14 = getelementptr [4 x [1024 x i32]], [4 x [1024 x i32]]* %b, i32 0, i32 1
    %gep_temp15 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp14, i32 0, i32 0
    store i32 1, i32* %gep_temp15, align 4
    %gep_temp16 = getelementptr [4 x [1024 x i32]], [4 x [1024 x i32]]* %b, i32 0, i32 2
    %gep_temp17 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp16, i32 0, i32 0
    store i32 2, i32* %gep_temp17, align 4
    %gep_temp18 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp16, i32 0, i32 1
    store i32 3, i32* %gep_temp18, align 4
    %gep_temp19 = getelementptr [4 x [1024 x i32]], [4 x [1024 x i32]]* %b, i32 0, i32 3
    %gep_temp20 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp19, i32 0, i32 0
    store i32 4, i32* %gep_temp20, align 4
    %gep_temp21 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp19, i32 0, i32 1
    store i32 5, i32* %gep_temp21, align 4
    %gep_temp22 = getelementptr [1024 x i32], [1024 x i32]* %gep_temp19, i32 0, i32 2
    store i32 6, i32* %gep_temp22, align 4
    %c = alloca [1024 x [4 x i32]], align 4
    %gep_temp23 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %c, i32 0, i32 0
    %gep_temp24 = getelementptr [4 x i32], [4 x i32]* %gep_temp23, i32 0, i32 0
    store i32 1, i32* %gep_temp24, align 4
    %gep_temp25 = getelementptr [4 x i32], [4 x i32]* %gep_temp23, i32 0, i32 1
    store i32 2, i32* %gep_temp25, align 4
    %gep_temp26 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %c, i32 0, i32 1
    %gep_temp27 = getelementptr [4 x i32], [4 x i32]* %gep_temp26, i32 0, i32 0
    store i32 3, i32* %gep_temp27, align 4
    %gep_temp28 = getelementptr [4 x i32], [4 x i32]* %gep_temp26, i32 0, i32 1
    store i32 4, i32* %gep_temp28, align 4
    %gep_temp29 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %c, i32 0, i32 0
    %load_temp30 = load [4 x i32], [4 x i32]* %gep_temp29, align 4
    %call_temp31 = call i32 @f1([4 x i32] %load_temp30)
    call void @putint(i32 %call_temp31)
    call void @putch(i32 10)
    %gep_temp32 = getelementptr [1024 x [4 x i32]], [1024 x [4 x i32]]* %c, i32 0, i32 2, i32 0
    %load_temp33 = load i32, i32* %gep_temp32, align 4
    ret i32 %load_temp33
}

