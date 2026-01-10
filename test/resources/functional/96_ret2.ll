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
    %add_temp0 = add i32 3, 5
    %mul_temp1 = mul i32 %add_temp0, 7
    %srem_temp2 = srem i32 5, 3
    %mul_temp3 = mul i32 %srem_temp2, 7
    %sdiv_temp4 = sdiv i32 %mul_temp3, 2
    %add_temp5 = add i32 %mul_temp1, %sdiv_temp4
    ret i32 %add_temp5
}

