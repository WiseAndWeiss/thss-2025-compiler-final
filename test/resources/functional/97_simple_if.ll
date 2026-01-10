; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @main() {
entry:
    %a = alloca i32, align 4
    store i32 2, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 10, i32* %b, align 4
    %c = alloca i32, align 4
    %load_temp0 = load i32, i32* %a, align 4
    %load_temp1 = load i32, i32* %b, align 4
    %icmp_slt_temp2 = icmp slt i32 %load_temp0, %load_temp1
    br i1 %icmp_slt_temp2, label %if_then_0, label %if_else_0
if_then_0:
    store i32 30, i32* %c, align 4
    br label %if_end_0
if_else_0:
    %load_temp3 = load i32, i32* %a, align 4
    %load_temp4 = load i32, i32* %b, align 4
    %sub_temp5 = sub i32 %load_temp3, %load_temp4
    %mul_temp6 = mul i32 %sub_temp5, 10
    %add_temp7 = add i32 %mul_temp6, 30
    store i32 %add_temp7, i32* %c, align 4
    br label %if_end_0
if_end_0:
    %load_temp8 = load i32, i32* %c, align 4
    %icmp_sgt_temp9 = icmp sgt i32 %load_temp8, 1000
    br i1 %icmp_sgt_temp9, label %if_then_1, label %if_end_1
if_then_1:
    store i32 1000, i32* %c, align 4
    br label %if_end_1
if_end_1:
    %load_temp10 = load i32, i32* %c, align 4
    ret i32 %load_temp10
}

