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
    store i32 30, i32* %b, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %sub_temp1 = sub i32 0, 5
    %sub_temp2 = sub i32 %load_temp0, %sub_temp1
    %load_temp3 = load i32, i32* %b, align 4
    %add_temp4 = add i32 %sub_temp2, %load_temp3
    %sub_temp5 = sub i32 0, 5
    %add_temp6 = add i32 %add_temp4, %sub_temp5
    ret i32 %add_temp6
}

