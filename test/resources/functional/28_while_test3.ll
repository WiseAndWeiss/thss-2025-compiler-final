; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@g = global i32 0, align 4
@h = global i32 0, align 4
@f = global i32 0, align 4
@e = global i32 0, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @EightWhile() {
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
    br label %while_cond_4
while_cond_4:
    %load_temp16 = load i32, i32* @e, align 4
    %icmp_sgt_temp17 = icmp sgt i32 %load_temp16, 1
    br i1 %icmp_sgt_temp17, label %while_body_4, label %while_end_4
while_body_4:
    %load_temp18 = load i32, i32* @e, align 4
    %sub_temp19 = sub i32 %load_temp18, 1
    store i32 %sub_temp19, i32* @e, align 4
    br label %while_cond_5
while_cond_5:
    %load_temp20 = load i32, i32* @f, align 4
    %icmp_sgt_temp21 = icmp sgt i32 %load_temp20, 2
    br i1 %icmp_sgt_temp21, label %while_body_5, label %while_end_5
while_body_5:
    %load_temp22 = load i32, i32* @f, align 4
    %sub_temp23 = sub i32 %load_temp22, 2
    store i32 %sub_temp23, i32* @f, align 4
    br label %while_cond_6
while_cond_6:
    %load_temp24 = load i32, i32* @g, align 4
    %icmp_slt_temp25 = icmp slt i32 %load_temp24, 3
    br i1 %icmp_slt_temp25, label %while_body_6, label %while_end_6
while_body_6:
    %load_temp26 = load i32, i32* @g, align 4
    %add_temp27 = add i32 %load_temp26, 10
    store i32 %add_temp27, i32* @g, align 4
    br label %while_cond_7
while_cond_7:
    %load_temp28 = load i32, i32* @h, align 4
    %icmp_slt_temp29 = icmp slt i32 %load_temp28, 10
    br i1 %icmp_slt_temp29, label %while_body_7, label %while_end_7
while_body_7:
    %load_temp30 = load i32, i32* @h, align 4
    %add_temp31 = add i32 %load_temp30, 8
    store i32 %add_temp31, i32* @h, align 4
    br label %while_cond_7
while_end_7:
    %load_temp32 = load i32, i32* @h, align 4
    %sub_temp33 = sub i32 %load_temp32, 1
    store i32 %sub_temp33, i32* @h, align 4
    br label %while_cond_6
while_end_6:
    %load_temp34 = load i32, i32* @g, align 4
    %sub_temp35 = sub i32 %load_temp34, 8
    store i32 %sub_temp35, i32* @g, align 4
    br label %while_cond_5
while_end_5:
    %load_temp36 = load i32, i32* @f, align 4
    %add_temp37 = add i32 %load_temp36, 1
    store i32 %add_temp37, i32* @f, align 4
    br label %while_cond_4
while_end_4:
    %load_temp38 = load i32, i32* @e, align 4
    %add_temp39 = add i32 %load_temp38, 1
    store i32 %add_temp39, i32* @e, align 4
    br label %while_cond_3
while_end_3:
    %load_temp40 = load i32, i32* %d, align 4
    %sub_temp41 = sub i32 %load_temp40, 1
    store i32 %sub_temp41, i32* %d, align 4
    br label %while_cond_2
while_end_2:
    %load_temp42 = load i32, i32* %c, align 4
    %add_temp43 = add i32 %load_temp42, 1
    store i32 %add_temp43, i32* %c, align 4
    br label %while_cond_1
while_end_1:
    %load_temp44 = load i32, i32* %b, align 4
    %sub_temp45 = sub i32 %load_temp44, 2
    store i32 %sub_temp45, i32* %b, align 4
    br label %while_cond_0
while_end_0:
    %load_temp46 = load i32, i32* %a, align 4
    %load_temp47 = load i32, i32* %b, align 4
    %load_temp48 = load i32, i32* %d, align 4
    %add_temp49 = add i32 %load_temp47, %load_temp48
    %add_temp50 = add i32 %load_temp46, %add_temp49
    %load_temp51 = load i32, i32* %c, align 4
    %add_temp52 = add i32 %add_temp50, %load_temp51
    %load_temp53 = load i32, i32* @e, align 4
    %load_temp54 = load i32, i32* %d, align 4
    %add_temp55 = add i32 %load_temp53, %load_temp54
    %load_temp56 = load i32, i32* @g, align 4
    %sub_temp57 = sub i32 %add_temp55, %load_temp56
    %load_temp58 = load i32, i32* @h, align 4
    %add_temp59 = add i32 %sub_temp57, %load_temp58
    %sub_temp60 = sub i32 %add_temp52, %add_temp59
    ret i32 %sub_temp60
}

define i32 @main() {
entry:
    store i32 1, i32* @g, align 4
    store i32 2, i32* @h, align 4
    store i32 4, i32* @e, align 4
    store i32 6, i32* @f, align 4
    %call_temp61 = call i32 @EightWhile()
    ret i32 %call_temp61
}

