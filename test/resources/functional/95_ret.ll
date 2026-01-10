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
    %mul_temp0 = mul i32 9, 3
    %add_temp1 = add i32 4, %mul_temp0
    ret i32 %add_temp1
}

