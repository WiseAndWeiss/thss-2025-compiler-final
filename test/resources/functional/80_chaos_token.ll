; ModuleID = 'sysy_module'
source_filename = "sysy_module"

@__HELLO = global [100 x i32] zeroinitializer, align 4
@N4__mE___ = global [6 x [50 x i32]] zeroinitializer, align 4
@saY_HeI10_To = global [40 x i32] zeroinitializer, align 4
@RET = global [5 x i32] zeroinitializer, align 4
declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @putstr(i32* %str) {
entry:
    %str_local = alloca i32*, align 4
    store i32* %str, i32** %str_local, align 4
    %iNd__1X = alloca i32, align 4
    store i32 0, i32* %iNd__1X, align 4
    br label %while_cond_0
while_cond_0:
    %load_temp0 = load i32, i32* %iNd__1X, align 4
    %gep_temp1 = getelementptr i32*, i32** %str_local, i32 0, i32 %load_temp0
    %load_temp2 = load i32*, i32** %gep_temp1, align 4
    %icmp_ne_temp3 = icmp ne i32* %load_temp2, 0
    br i1 %icmp_ne_temp3, label %while_body_0, label %while_end_0
while_body_0:
    %load_temp4 = load i32, i32* %iNd__1X, align 4
    %gep_temp5 = getelementptr i32*, i32** %str_local, i32 0, i32 %load_temp4
    %load_temp6 = load i32*, i32** %gep_temp5, align 4
    call void @putch(i32* %load_temp6)
    %load_temp7 = load i32, i32* %iNd__1X, align 4
    %add_temp8 = add i32 %load_temp7, 1
    store i32 %add_temp8, i32* %iNd__1X, align 4
    br label %while_cond_0
while_end_0:
    %load_temp9 = load i32, i32* %iNd__1X, align 4
    ret i32 %load_temp9
}

define i32 @main() {
entry:
    %load_temp10 = load [100 x i32], [100 x i32]* @__HELLO, align 4
    %call_temp11 = call i32 @putstr([100 x i32] %load_temp10)
    %i = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %while_cond_0
while_cond_0:
    %icmp_ne_temp12 = icmp ne i32 1, 0
    br i1 %icmp_ne_temp12, label %while_body_0, label %while_end_0
while_body_0:
    %_ = alloca i32, align 4
    %load_temp13 = load i32, i32* %i, align 4
    %sdiv_temp14 = sdiv i32 %load_temp13, 6
    store i32 %sdiv_temp14, i32* %_, align 4
    %__ = alloca i32, align 4
    %load_temp15 = load i32, i32* %i, align 4
    %srem_temp16 = srem i32 %load_temp15, 6
    store i32 %srem_temp16, i32* %__, align 4
    %load_temp17 = load i32, i32* %_, align 4
    %load_temp18 = load i32, i32* %__, align 4
    %icmp_ne_temp19 = icmp ne i32 %load_temp17, %load_temp18
    br i1 %icmp_ne_temp19, label %if_then_0, label %if_end_0
if_then_0:
    %load_temp20 = load i32, i32* %_, align 4
    %gep_temp21 = getelementptr [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %load_temp20
    %load_temp22 = load [50 x i32], [50 x i32]* %gep_temp21, align 4
    %call_temp23 = call i32 @putstr([50 x i32] %load_temp22)
    %load_temp24 = load [40 x i32], [40 x i32]* @saY_HeI10_To, align 4
    %call_temp25 = call i32 @putstr([40 x i32] %load_temp24)
    %load_temp26 = load i32, i32* %__, align 4
    %gep_temp27 = getelementptr [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %load_temp26
    %load_temp28 = load [50 x i32], [50 x i32]* %gep_temp27, align 4
    %call_temp29 = call i32 @putstr([50 x i32] %load_temp28)
    %load_temp30 = load [5 x i32], [5 x i32]* @RET, align 4
    %call_temp31 = call i32 @putstr([5 x i32] %load_temp30)
    br label %if_end_0
if_end_0:
    %load_temp32 = load i32, i32* %i, align 4
    %mul_temp33 = mul i32 %load_temp32, 17
    %add_temp34 = add i32 %mul_temp33, 23
    %srem_temp35 = srem i32 %add_temp34, 32
    store i32 %srem_temp35, i32* %i, align 4
    %load_temp36 = load i32, i32* %i, align 4
    %icmp_eq_temp37 = icmp eq i32 %load_temp36, 0
    br i1 %icmp_eq_temp37, label %if_then_1, label %if_end_1
if_then_1:
    br label %while_end_0
if_end_1:
    br label %while_cond_0
while_end_0:
    ret i32 0
}

