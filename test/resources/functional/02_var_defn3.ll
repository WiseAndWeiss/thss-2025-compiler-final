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
    %a = alloca i32, align 4
    %b0 = alloca i32, align 4
    %_c = alloca i32, align 4
    store i32 1, i32* %a, align 4
    store i32 2, i32* %b0, align 4
    store i32 3, i32* %_c, align 4
    %load_temp0 = load i32, i32* %b0, align 4
    %load_temp1 = load i32, i32* %_c, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    ret i32 %add_temp2
}

