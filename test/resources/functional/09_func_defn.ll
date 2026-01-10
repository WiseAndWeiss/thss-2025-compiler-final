; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@a = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @func(i32 %p) {
entry:
    %p_local = alloca i32, align 4
    store i32 %p, i32* %p_local, align 4
    %load_temp0 = load i32, i32* %p_local, align 4
    %sub_temp1 = sub i32 %load_temp0, 1
    store i32 %sub_temp1, i32* %p_local, align 4
    %load_temp2 = load i32, i32* %p_local, align 4
    ret i32 %load_temp2
}

define i32 @main() {
entry:
    %b = alloca i32, align 4
    store i32 10, i32* @a, align 4
    %load_temp3 = load i32, i32* @a, align 4
    %call_temp4 = call i32 @func(i32 %load_temp3)
    store i32 %call_temp4, i32* %b, align 4
    %load_temp5 = load i32, i32* %b, align 4
    ret i32 %load_temp5
}

