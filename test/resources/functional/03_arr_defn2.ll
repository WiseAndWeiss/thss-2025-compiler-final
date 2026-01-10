; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global [10 x [10 x i32]] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    ret i32 0
}

