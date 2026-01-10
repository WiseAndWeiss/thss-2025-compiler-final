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
    %load_temp0 = load i32, i32* @a, align 4
    %add_temp1 = add i32 %load_temp0, 5
    ret i32 %add_temp1
}

