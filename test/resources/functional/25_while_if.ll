; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @get_one(i32 %a) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    ret i32 1
}

define i32 @deepWhileBr(i32 %a, i32 %b) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %c = alloca i32, align 4
    %load_temp0 = load i32, i32* %a_local, align 4
    %load_temp1 = load i32, i32* %b_local, align 4
    %add_temp2 = add i32 %load_temp0, %load_temp1
    store i32 %add_temp2, i32* %c, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp3 = load i32, i32* %c, align 4
    %icmp_slt_temp4 = icmp slt i32 %load_temp3, 75
    br i1 %icmp_slt_temp4, label %while_body_0, label %while_end_0
while_body_0:
    %d = alloca i32, align 4
    store i32 42, i32* %d, align 4
    %load_temp5 = load i32, i32* %c, align 4
    %icmp_slt_temp6 = icmp slt i32 %load_temp5, 100
    br i1 %icmp_slt_temp6, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp7 = load i32, i32* %c, align 4
    %load_temp8 = load i32, i32* %d, align 4
    %add_temp9 = add i32 %load_temp7, %load_temp8
    store i32 %add_temp9, i32* %c, align 4
    %load_temp10 = load i32, i32* %c, align 4
    %icmp_sgt_temp11 = icmp sgt i32 %load_temp10, 99
    br i1 %icmp_sgt_temp11, label %if_then_1, label %if_end_1
if_then_1:
    %e = alloca i32, align 4
    %load_temp12 = load i32, i32* %d, align 4
    %mul_temp13 = mul i32 %load_temp12, 2
    store i32 %mul_temp13, i32* %e, align 4
    %call_temp14 = call i32 @get_one(i32 0)
    %icmp_eq_temp15 = icmp eq i32 %call_temp14, 1
    br i1 %icmp_eq_temp15, label %if_then_2, label %if_end_2
if_then_2:
    %load_temp16 = load i32, i32* %e, align 4
    %mul_temp17 = mul i32 %load_temp16, 2
    store i32 %mul_temp17, i32* %c, align 4
    br label %if_end_2
if_end_2:
    br label %if_end_1
if_end_1:
    br label %if_end_0
if_end_0:
    br label %while_cond_0
while_end_0:
    %load_temp18 = load i32, i32* %c, align 4
    ret i32 %load_temp18
}

define i32 @main() {
entry:
    %p = alloca i32, align 4
    store i32 2, i32* %p, align 4
    %load_temp19 = load i32, i32* %p, align 4
    %load_temp20 = load i32, i32* %p, align 4
    %call_temp21 = call i32 @deepWhileBr(i32 %load_temp19, i32 %load_temp20)
    store i32 %call_temp21, i32* %p, align 4
    %load_temp22 = load i32, i32* %p, align 4
    call void @putint(i32 %load_temp22)
    ret i32 0
}

