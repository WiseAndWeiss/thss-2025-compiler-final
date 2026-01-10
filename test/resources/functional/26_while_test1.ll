; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @doubleWhile() {
entry:
    %i = alloca i32, align 4
    store i32 5, i32* %i, align 4
    %j = alloca i32, align 4
    store i32 7, i32* %j, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %i, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 100
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %i, align 4
    %add_temp3 = add i32 %load_temp2, 30
    store i32 %add_temp3, i32* %i, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp4 = load i32, i32* %j, align 4
    %icmp_slt_temp5 = icmp slt i32 %load_temp4, 100
    br i1 %icmp_slt_temp5, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp6 = load i32, i32* %j, align 4
    %add_temp7 = add i32 %load_temp6, 6
    store i32 %add_temp7, i32* %j, align 4
    br label %while_cond_1
while_end_1:
    %load_temp8 = load i32, i32* %j, align 4
    %sub_temp9 = sub i32 %load_temp8, 100
    store i32 %sub_temp9, i32* %j, align 4
    br label %while_cond_0
while_end_0:
    %load_temp10 = load i32, i32* %j, align 4
    ret i32 %load_temp10
}

define i32 @main() {
entry:
    %call_temp11 = call i32 @doubleWhile()
    ret i32 %call_temp11
}

