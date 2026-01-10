; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@k = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    store i32 3389, i32* @k, align 4
    %load_temp0 = load i32, i32* @k, align 4
    %icmp_slt_temp1 = icmp slt i32 %load_temp0, 10000
    br i1 %icmp_slt_temp1, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp2 = load i32, i32* @k, align 4
    %add_temp3 = add i32 %load_temp2, 1
    store i32 %add_temp3, i32* @k, align 4
    %k = alloca i32, align 4
    store i32 112, i32* %k, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp4 = load i32, i32* %k, align 4
    %icmp_sgt_temp5 = icmp sgt i32 %load_temp4, 10
    br i1 %icmp_sgt_temp5, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp6 = load i32, i32* %k, align 4
    %sub_temp7 = sub i32 %load_temp6, 88
    store i32 %sub_temp7, i32* %k, align 4
    %load_temp8 = load i32, i32* %k, align 4
    %icmp_slt_temp9 = icmp slt i32 %load_temp8, 1000
    br i1 %icmp_slt_temp9, label %if_then_1, label %if_end_1
if_then_1:
    %g = alloca i32, align 4
    store i32 9, i32* %g, align 4
    %l = alloca i32, align 4
    store i32 11, i32* %l, align 4
    store i32 10, i32* %g, align 4
    %load_temp10 = load i32, i32* %k, align 4
    %load_temp11 = load i32, i32* %g, align 4
    %sub_temp12 = sub i32 %load_temp10, %load_temp11
    store i32 %sub_temp12, i32* %k, align 4
    %g = alloca i32, align 4
    store i32 11, i32* %g, align 4
    %load_temp13 = load i32, i32* %k, align 4
    %load_temp14 = load i32, i32* %g, align 4
    %add_temp15 = add i32 %load_temp13, %load_temp14
    %load_temp16 = load i32, i32* %l, align 4
    %add_temp17 = add i32 %add_temp15, %load_temp16
    store i32 %add_temp17, i32* %k, align 4
    br label %if_end_1
if_end_1:
    br label %while_cond_0
while_end_0:
    %load_temp18 = load i32, i32* %k, align 4
    call void @putint(i32 %load_temp18)
    br label %if_end_0
if_end_0:
    %load_temp19 = load i32, i32* @k, align 4
    ret i32 %load_temp19
}

