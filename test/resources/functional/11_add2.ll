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
    %b = alloca i32, align 4
    store i32 10, i32* %a, align 4
    %sub_temp0 = sub i32 0, 1
    store i32 %sub_temp0, i32* %b, align 4
    %load_temp1 = load i32, i32* %a, align 4
    %load_temp2 = load i32, i32* %b, align 4
    %add_temp3 = add i32 %load_temp1, %load_temp2
    ret i32 %add_temp3
}

