; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @exgcd(i32 %a, i32 %b, i32* %x, i32* %y) {
entry:
    %a_local = alloca i32, align 4
    store i32 %a, i32* %a_local, align 4
    %b_local = alloca i32, align 4
    store i32 %b, i32* %b_local, align 4
    %x_local = alloca i32*, align 4
    store i32* %x, i32** %x_local, align 4
    %y_local = alloca i32*, align 4
    store i32* %y, i32** %y_local, align 4
    %load_temp0 = load i32, i32* %b_local, align 4
    %icmp_eq_temp1 = icmp eq i32 %load_temp0, 0
    br i1 %icmp_eq_temp1, label %if_then_0, label %if_else_0
if_then_0:
    %gep_temp2 = getelementptr i32*, i32** %x_local, i32 0, i32 0
    store i32 1, i32** %gep_temp2, align 4
    %gep_temp3 = getelementptr i32*, i32** %y_local, i32 0, i32 0
    store i32 0, i32** %gep_temp3, align 4
    %load_temp4 = load i32, i32* %a_local, align 4
    ret i32 %load_temp4
if_else_0:
    %r = alloca i32, align 4
    %load_temp5 = load i32, i32* %b_local, align 4
    %load_temp6 = load i32, i32* %a_local, align 4
    %load_temp7 = load i32, i32* %b_local, align 4
    %srem_temp8 = srem i32 %load_temp6, %load_temp7
    %load_temp9 = load i32*, i32** %x_local, align 4
    %load_temp10 = load i32*, i32** %y_local, align 4
    %call_temp11 = call i32 @exgcd(i32 %load_temp5, i32 %srem_temp8, i32* %load_temp9, i32* %load_temp10)
    store i32 %call_temp11, i32* %r, align 4
    %t = alloca i32, align 4
    %gep_temp12 = getelementptr i32*, i32** %x_local, i32 0, i32 0
    %load_temp13 = load i32*, i32** %gep_temp12, align 4
    store i32* %load_temp13, i32* %t, align 4
    %gep_temp14 = getelementptr i32*, i32** %x_local, i32 0, i32 0
    %gep_temp15 = getelementptr i32*, i32** %y_local, i32 0, i32 0
    %load_temp16 = load i32*, i32** %gep_temp15, align 4
    store i32* %load_temp16, i32** %gep_temp14, align 4
    %gep_temp17 = getelementptr i32*, i32** %y_local, i32 0, i32 0
    %load_temp18 = load i32, i32* %t, align 4
    %load_temp19 = load i32, i32* %a_local, align 4
    %load_temp20 = load i32, i32* %b_local, align 4
    %sdiv_temp21 = sdiv i32 %load_temp19, %load_temp20
    %gep_temp22 = getelementptr i32*, i32** %y_local, i32 0, i32 0
    %load_temp23 = load i32*, i32** %gep_temp22, align 4
    %mul_temp24 = mul i32 %sdiv_temp21, %load_temp23
    %sub_temp25 = sub i32 %load_temp18, %mul_temp24
    store i32 %sub_temp25, i32** %gep_temp17, align 4
    %load_temp26 = load i32, i32* %r, align 4
    ret i32 %load_temp26
if_end_0:
    ret void
}

define i32 @main() {
entry:
    %a = alloca i32, align 4
    store i32 7, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 15, i32* %b, align 4
    %x = alloca [1 x i32], align 4
    %gep_temp27 = getelementptr [1 x i32], [1 x i32]* %x, i32 0, i32 0
    store i32 1, i32* %gep_temp27, align 4
    %y = alloca [1 x i32], align 4
    %gep_temp28 = getelementptr [1 x i32], [1 x i32]* %y, i32 0, i32 0
    store i32 1, i32* %gep_temp28, align 4
    %load_temp29 = load i32, i32* %a, align 4
    %load_temp30 = load i32, i32* %b, align 4
    %load_temp31 = load [1 x i32], [1 x i32]* %x, align 4
    %load_temp32 = load [1 x i32], [1 x i32]* %y, align 4
    %call_temp33 = call i32 @exgcd(i32 %load_temp29, i32 %load_temp30, [1 x i32] %load_temp31, [1 x i32] %load_temp32)
    %gep_temp34 = getelementptr [1 x i32], [1 x i32]* %x, i32 0, i32 0
    %gep_temp35 = getelementptr [1 x i32], [1 x i32]* %x, i32 0, i32 0
    %load_temp36 = load i32, i32* %gep_temp35, align 4
    %load_temp37 = load i32, i32* %b, align 4
    %srem_temp38 = srem i32 %load_temp36, %load_temp37
    %load_temp39 = load i32, i32* %b, align 4
    %add_temp40 = add i32 %srem_temp38, %load_temp39
    %load_temp41 = load i32, i32* %b, align 4
    %srem_temp42 = srem i32 %add_temp40, %load_temp41
    store i32 %srem_temp42, i32* %gep_temp34, align 4
    %gep_temp43 = getelementptr [1 x i32], [1 x i32]* %x, i32 0, i32 0
    %load_temp44 = load i32, i32* %gep_temp43, align 4
    call void @putint(i32 %load_temp44)
    ret i32 0
}

