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
    store i32 10, i32* %a, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %sdiv_temp1 = sdiv i32 %load_temp0, 3
    ret i32 %sdiv_temp1
}

