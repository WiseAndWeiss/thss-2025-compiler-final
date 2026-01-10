; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 3, align 4
@b = global i32 5, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a = alloca i32, align 4
    store i32 5, i32* %a, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %load_temp1 = load i32, i32* @b, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    ret i32 %add_temp2
}

