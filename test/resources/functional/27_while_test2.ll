; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @FourWhile() {
entry:
    %a = alloca i32, align 4
    store i32 5, i32* %a, align 4
    %b = alloca i32, align 4
    %c = alloca i32, align 4
    store i32 6, i32* %b, align 4
    store i32 7, i32* %c, align 4
    %d = alloca i32, align 4
    store i32 10, i32* %d, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %a, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 20
    br i1 %icmp_slt_temp1, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp2 = load i32, i32* %a, align 4
    %add_temp3 = add i32 %load_temp2, 3
    store i32 %add_temp3, i32* %a, align 4
    br label %while_cond_1
while_cond_1:
    %load_temp4 = load i32, i32* %b, align 4
    %icmp_slt_temp5 = icmp slt i32 %load_temp4, 10
    br i1 %icmp_slt_temp5, label %while_body_1, label %while_end_1
while_body_1:
    %load_temp6 = load i32, i32* %b, align 4
    %add_temp7 = add i32 %load_temp6, 1
    store i32 %add_temp7, i32* %b, align 4
    br label %while_cond_2
while_cond_2:
    %load_temp8 = load i32, i32* %c, align 4
    %icmp_eq_temp9 = icmp eq i32 %load_temp8, 7
    br i1 %icmp_eq_temp9, label %while_body_2, label %while_end_2
while_body_2:
    %load_temp10 = load i32, i32* %c, align 4
    %sub_temp11 = sub i32 %load_temp10, 1
    store i32 %sub_temp11, i32* %c, align 4
    br label %while_cond_3
while_cond_3:
    %load_temp12 = load i32, i32* %d, align 4
    %icmp_slt_temp13 = icmp slt i32 %load_temp12, 20
    br i1 %icmp_slt_temp13, label %while_body_3, label %while_end_3
while_body_3:
    %load_temp14 = load i32, i32* %d, align 4
    %add_temp15 = add i32 %load_temp14, 3
    store i32 %add_temp15, i32* %d, align 4
    br label %while_cond_3
while_end_3:
    %load_temp16 = load i32, i32* %d, align 4
    %sub_temp17 = sub i32 %load_temp16, 1
    store i32 %sub_temp17, i32* %d, align 4
    br label %while_cond_2
while_end_2:
    %load_temp18 = load i32, i32* %c, align 4
    %add_temp19 = add i32 %load_temp18, 1
    store i32 %add_temp19, i32* %c, align 4
    br label %while_cond_1
while_end_1:
    %load_temp20 = load i32, i32* %b, align 4
    %sub_temp21 = sub i32 %load_temp20, 2
    store i32 %sub_temp21, i32* %b, align 4
    br label %while_cond_0
while_end_0:
    %load_temp22 = load i32, i32* %a, align 4
    %load_temp23 = load i32, i32* %b, align 4
    %load_temp24 = load i32, i32* %d, align 4
    %add_temp25 = add i32 %load_temp23, %load_temp24
    %add_temp26 = add i32 %load_temp22, %add_temp25
    %load_temp27 = load i32, i32* %c, align 4
    %add_temp28 = add i32 %add_temp26, %load_temp27
    ret i32 %add_temp28
}

define i32 @main() {
entry:
    %call_temp29 = call i32 @FourWhile()
    ret i32 %call_temp29
}

