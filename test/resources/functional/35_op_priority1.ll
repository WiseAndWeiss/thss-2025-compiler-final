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
    %c = alloca i32, align 4
    %d = alloca i32, align 4
    store i32 10, i32* %a, align 4
    store i32 4, i32* %b, align 4
    store i32 2, i32* %c, align 4
    store i32 2, i32* %d, align 4
    %load_temp0 = load i32, i32* %c, align 4
    %load_temp1 = load i32, i32* %a, align 4
    %load_temp2 = load i32, i32* %b, align 4
    %mul_temp3 = mul i32 %load_temp1, %load_temp2
    %add_temp4 = add i32 %load_temp0, %mul_temp3
    %load_temp5 = load i32, i32* %d, align 4
    %sub_temp6 = sub i32 %add_temp4, %load_temp5
    ret i32 %sub_temp6
}

