; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define void @reverse(i32 %n) {
entry:
    %n_local = alloca i32, align 4
    store i32 %n, i32* %n_local, align 4
    %next = alloca i32, align 4
    %load_temp0 = load i32, i32* %n_local, align 4
    %icmp_sle_temp1 = icmp sle i32 %load_temp0, 1
    br i1 %icmp_sle_temp1, label %if_then_0, label %if_else_0
if_then_0:
    %call_temp2 = call i32 @getint()
    store i32 %call_temp2, i32* %next, align 4
    %load_temp3 = load i32, i32* %next, align 4
    call void @putint(i32 %load_temp3)
    br label %if_end_0
if_else_0:
    %call_temp4 = call i32 @getint()
    store i32 %call_temp4, i32* %next, align 4
    %load_temp5 = load i32, i32* %n_local, align 4
    %sub_temp6 = sub i32 %load_temp5, 1
    call void @reverse(i32 %sub_temp6)
    %load_temp7 = load i32, i32* %next, align 4
    call void @putint(i32 %load_temp7)
    br label %if_end_0
if_end_0:
    ret void
}

define i32 @main() {
entry:
    %i = alloca i32, align 4
    store i32 200, i32* %i, align 4
    %load_temp8 = load i32, i32* %i, align 4
    call void @reverse(i32 %load_temp8)
    ret i32 0
}

