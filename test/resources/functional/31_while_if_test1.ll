; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @whileIf() {
entry:
    %a = alloca i32, align 4
    store i32 0, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 0, i32* %b, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 100
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %a, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 5
    br i1 %icmp_eq_temp3, label %if_then_0, label %if_else_0
if_then_0:
    store i32 25, i32* %b, align 4
    br label %if_end_0
if_else_0:
    %load_temp4 = load i32, i32* %a, align 4
    %icmp_eq_temp5 = icmp eq i32 %load_temp4, 10
    br i1 %icmp_eq_temp5, label %if_then_1, label %if_else_1
if_then_1:
    store i32 42, i32* %b, align 4
    br label %if_end_1
if_else_1:
    %load_temp6 = load i32, i32* %a, align 4
    %mul_temp7 = mul i32 %load_temp6, 2
    store i32 %mul_temp7, i32* %b, align 4
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    %load_temp8 = load i32, i32* %a, align 4
    %add_temp9 = add i32 %load_temp8, 1
    store i32 %add_temp9, i32* %a, align 4
    br label %while_cond_0
while_end_0:
    %load_temp10 = load i32, i32* %b, align 4
    ret i32 %load_temp10
}

define i32 @main() {
entry:
    %call_temp11 = call i32 @whileIf()
    ret i32 %call_temp11
}

