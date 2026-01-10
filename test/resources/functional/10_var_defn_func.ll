; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @defn() {
entry:
    ret i32 4
}

define i32 @main() {
entry:
    %a = alloca i32, align 4
    %call_temp0 = call i32 @defn()
    store i32 %call_temp0, i32* %a, align 4
    %load_temp1 = load i32, i32* %a, align 4
    ret i32 %load_temp1
}

