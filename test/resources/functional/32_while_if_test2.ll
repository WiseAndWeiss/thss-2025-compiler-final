; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @ifWhile() {
entry:
    %a = alloca i32, align 4
    store i32 0, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 3, i32* %b, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 5
    br i1 %icmp_eq_temp1, label %if_then_0, label %if_else_0
if_then_0:
    br label %while_cond_0
while_cond_0:
    %load_temp2 = load i32, i32* %b, align 4
    %icmp_eq_temp3 = icmp eq i32 %load_temp2, 2
    br i1 %icmp_eq_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp4 = load i32, i32* %b, align 4
    %add_temp5 = add i32 %load_temp4, 2
    store i32 %add_temp5, i32* %b, align 4
    br label %while_cond_0
while_end_0:
    %load_temp6 = load i32, i32* %b, align 4
    %add_temp7 = add i32 %load_temp6, 25
    store i32 %add_temp7, i32* %b, align 4
    br label %if_end_0
if_else_0:
    br label %while_cond_0
while_cond_0:
    %load_temp8 = load i32, i32* %a, align 4
    %icmp_slt_temp9 = icmp slt i32 %load_temp8, 5
    br i1 %icmp_slt_temp9, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp10 = load i32, i32* %b, align 4
    %mul_temp11 = mul i32 %load_temp10, 2
    store i32 %mul_temp11, i32* %b, align 4
    %load_temp12 = load i32, i32* %a, align 4
    %add_temp13 = add i32 %load_temp12, 1
    store i32 %add_temp13, i32* %a, align 4
    br label %while_cond_0
while_end_0:
    br label %if_end_0
if_end_0:
    %load_temp14 = load i32, i32* %b, align 4
    ret i32 %load_temp14
}

define i32 @main() {
entry:
    %call_temp15 = call i32 @ifWhile()
    ret i32 %call_temp15
}

