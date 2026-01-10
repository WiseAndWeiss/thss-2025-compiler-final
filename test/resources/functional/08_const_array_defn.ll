; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = constant [5 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4], align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %gep_temp0 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 4
    %load_temp1 = load i32, i32* %gep_temp0, align 4
    ret i32 %load_temp1
}

