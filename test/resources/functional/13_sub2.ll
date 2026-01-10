; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = constant i32 10, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %b = alloca i32, align 4
    store i32 2, i32* %b, align 4
    %load_temp0 = load i32, i32* %b, align 4
    %load_temp1 = load i32, i32* @a, align 4
    %sub_temp2 = sub i32 %load_temp0, %load_temp1
    ret i32 %sub_temp2
}

