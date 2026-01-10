; ModuleID = 'sysy_module'
source_filename = "sysy_module"

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)
declare i32 @getch()
declare void @putarray(i32, i32*)
declare i32 @getarray(i32*)
define i32 @foo() {
entry:
    %arr = alloca [16 x i32], align 4
    %gep_temp0 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 0
    store i32 0, i32* %gep_temp0, align 4
    %gep_temp1 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 1
    store i32 1, i32* %gep_temp1, align 4
    %gep_temp2 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 2
    store i32 2, i32* %gep_temp2, align 4
    %gep_temp3 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 3
    store i32 3, i32* %gep_temp3, align 4
    %gep_temp4 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 4
    store i32 0, i32* %gep_temp4, align 4
    %gep_temp5 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 5
    store i32 1, i32* %gep_temp5, align 4
    %gep_temp6 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 6
    store i32 2, i32* %gep_temp6, align 4
    %gep_temp7 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 7
    store i32 3, i32* %gep_temp7, align 4
    %gep_temp8 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 8
    store i32 0, i32* %gep_temp8, align 4
    %gep_temp9 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 9
    store i32 1, i32* %gep_temp9, align 4
    %gep_temp10 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 10
    store i32 2, i32* %gep_temp10, align 4
    %gep_temp11 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 11
    store i32 3, i32* %gep_temp11, align 4
    %gep_temp12 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 12
    store i32 0, i32* %gep_temp12, align 4
    %gep_temp13 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 13
    store i32 1, i32* %gep_temp13, align 4
    %gep_temp14 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 14
    store i32 2, i32* %gep_temp14, align 4
    %gep_temp15 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 15
    store i32 3, i32* %gep_temp15, align 4
    %a = alloca i32, align 4
    store i32 3, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 7, i32* %b, align 4
    %c = alloca i32, align 4
    store i32 5, i32* %c, align 4
    %d = alloca i32, align 4
    store i32 6, i32* %d, align 4
    %e = alloca i32, align 4
    store i32 1, i32* %e, align 4
    %f = alloca i32, align 4
    store i32 0, i32* %f, align 4
    %g = alloca i32, align 4
    store i32 3, i32* %g, align 4
    %h = alloca i32, align 4
    store i32 5, i32* %h, align 4
    %i = alloca i32, align 4
    store i32 4, i32* %i, align 4
    %j = alloca i32, align 4
    store i32 2, i32* %j, align 4
    %k = alloca i32, align 4
    store i32 7, i32* %k, align 4
    %l = alloca i32, align 4
    store i32 9, i32* %l, align 4
    %m = alloca i32, align 4
    store i32 8, i32* %m, align 4
    %n = alloca i32, align 4
    store i32 1, i32* %n, align 4
    %o = alloca i32, align 4
    store i32 4, i32* %o, align 4
    %p = alloca i32, align 4
    store i32 6, i32* %p, align 4
    %sum1 = alloca i32, align 4
    %load_temp16 = load i32, i32* %a, align 4
    %load_temp17 = load i32, i32* %b, align 4
    %add_temp18 = add i32 %load_temp16, %load_temp17
    %load_temp19 = load i32, i32* %c, align 4
    %add_temp20 = add i32 %add_temp18, %load_temp19
    %load_temp21 = load i32, i32* %d, align 4
    %add_temp22 = add i32 %add_temp20, %load_temp21
    %load_temp23 = load i32, i32* %e, align 4
    %add_temp24 = add i32 %add_temp22, %load_temp23
    %load_temp25 = load i32, i32* %f, align 4
    %add_temp26 = add i32 %add_temp24, %load_temp25
    %load_temp27 = load i32, i32* %g, align 4
    %add_temp28 = add i32 %add_temp26, %load_temp27
    %load_temp29 = load i32, i32* %h, align 4
    %add_temp30 = add i32 %add_temp28, %load_temp29
    store i32 %add_temp30, i32* %sum1, align 4
    %sum2 = alloca i32, align 4
    %load_temp31 = load i32, i32* %i, align 4
    %load_temp32 = load i32, i32* %j, align 4
    %add_temp33 = add i32 %load_temp31, %load_temp32
    %load_temp34 = load i32, i32* %k, align 4
    %add_temp35 = add i32 %add_temp33, %load_temp34
    %load_temp36 = load i32, i32* %l, align 4
    %add_temp37 = add i32 %add_temp35, %load_temp36
    %load_temp38 = load i32, i32* %m, align 4
    %add_temp39 = add i32 %add_temp37, %load_temp38
    %load_temp40 = load i32, i32* %n, align 4
    %add_temp41 = add i32 %add_temp39, %load_temp40
    %load_temp42 = load i32, i32* %o, align 4
    %add_temp43 = add i32 %add_temp41, %load_temp42
    %load_temp44 = load i32, i32* %p, align 4
    %add_temp45 = add i32 %add_temp43, %load_temp44
    store i32 %add_temp45, i32* %sum2, align 4
    %load_temp46 = load i32, i32* %sum1, align 4
    %load_temp47 = load i32, i32* %sum2, align 4
    %add_temp48 = add i32 %load_temp46, %load_temp47
    %load_temp49 = load i32, i32* %a, align 4
    %gep_temp50 = getelementptr [16 x i32], [16 x i32]* %arr, i32 0, i32 %load_temp49
    %load_temp51 = load i32, i32* %gep_temp50, align 4
    %add_temp52 = add i32 %add_temp48, %load_temp51
    ret i32 %add_temp52
}

define i32 @main() {
entry:
    %a = alloca i32, align 4
    store i32 3, i32* %a, align 4
    %b = alloca i32, align 4
    store i32 7, i32* %b, align 4
    %c = alloca i32, align 4
    store i32 5, i32* %c, align 4
    %d = alloca i32, align 4
    store i32 6, i32* %d, align 4
    %e = alloca i32, align 4
    store i32 1, i32* %e, align 4
    %f = alloca i32, align 4
    store i32 0, i32* %f, align 4
    %g = alloca i32, align 4
    store i32 3, i32* %g, align 4
    %h = alloca i32, align 4
    store i32 5, i32* %h, align 4
    %i = alloca i32, align 4
    store i32 4, i32* %i, align 4
    %j = alloca i32, align 4
    store i32 2, i32* %j, align 4
    %k = alloca i32, align 4
    store i32 7, i32* %k, align 4
    %l = alloca i32, align 4
    store i32 9, i32* %l, align 4
    %m = alloca i32, align 4
    store i32 8, i32* %m, align 4
    %n = alloca i32, align 4
    store i32 1, i32* %n, align 4
    %o = alloca i32, align 4
    store i32 4, i32* %o, align 4
    %p = alloca i32, align 4
    store i32 6, i32* %p, align 4
    %sum1 = alloca i32, align 4
    %load_temp53 = load i32, i32* %a, align 4
    %load_temp54 = load i32, i32* %b, align 4
    %add_temp55 = add i32 %load_temp53, %load_temp54
    %load_temp56 = load i32, i32* %c, align 4
    %add_temp57 = add i32 %add_temp55, %load_temp56
    %load_temp58 = load i32, i32* %d, align 4
    %add_temp59 = add i32 %add_temp57, %load_temp58
    %load_temp60 = load i32, i32* %e, align 4
    %add_temp61 = add i32 %add_temp59, %load_temp60
    %load_temp62 = load i32, i32* %f, align 4
    %add_temp63 = add i32 %add_temp61, %load_temp62
    %load_temp64 = load i32, i32* %g, align 4
    %add_temp65 = add i32 %add_temp63, %load_temp64
    %load_temp66 = load i32, i32* %h, align 4
    %add_temp67 = add i32 %add_temp65, %load_temp66
    store i32 %add_temp67, i32* %sum1, align 4
    %sum2 = alloca i32, align 4
    %load_temp68 = load i32, i32* %i, align 4
    %load_temp69 = load i32, i32* %j, align 4
    %add_temp70 = add i32 %load_temp68, %load_temp69
    %load_temp71 = load i32, i32* %k, align 4
    %add_temp72 = add i32 %add_temp70, %load_temp71
    %load_temp73 = load i32, i32* %l, align 4
    %add_temp74 = add i32 %add_temp72, %load_temp73
    %load_temp75 = load i32, i32* %m, align 4
    %add_temp76 = add i32 %add_temp74, %load_temp75
    %load_temp77 = load i32, i32* %n, align 4
    %add_temp78 = add i32 %add_temp76, %load_temp77
    %load_temp79 = load i32, i32* %o, align 4
    %add_temp80 = add i32 %add_temp78, %load_temp79
    %load_temp81 = load i32, i32* %p, align 4
    %add_temp82 = add i32 %add_temp80, %load_temp81
    store i32 %add_temp82, i32* %sum2, align 4
    %load_temp83 = load i32, i32* %sum1, align 4
    %call_temp84 = call i32 @foo()
    %add_temp85 = add i32 %load_temp83, %call_temp84
    store i32 %add_temp85, i32* %sum1, align 4
    %q = alloca i32, align 4
    store i32 4, i32* %q, align 4
    %r = alloca i32, align 4
    store i32 7, i32* %r, align 4
    %s = alloca i32, align 4
    store i32 2, i32* %s, align 4
    %t = alloca i32, align 4
    store i32 5, i32* %t, align 4
    %u = alloca i32, align 4
    store i32 8, i32* %u, align 4
    %v = alloca i32, align 4
    store i32 0, i32* %v, align 4
    %w = alloca i32, align 4
    store i32 6, i32* %w, align 4
    %x = alloca i32, align 4
    store i32 3, i32* %x, align 4
    %load_temp86 = load i32, i32* %sum2, align 4
    %call_temp87 = call i32 @foo()
    %add_temp88 = add i32 %load_temp86, %call_temp87
    store i32 %add_temp88, i32* %sum2, align 4
    %load_temp89 = load i32, i32* %i, align 4
    store i32 %load_temp89, i32* %a, align 4
    %load_temp90 = load i32, i32* %j, align 4
    store i32 %load_temp90, i32* %b, align 4
    %load_temp91 = load i32, i32* %k, align 4
    store i32 %load_temp91, i32* %c, align 4
    %load_temp92 = load i32, i32* %l, align 4
    store i32 %load_temp92, i32* %d, align 4
    %load_temp93 = load i32, i32* %m, align 4
    store i32 %load_temp93, i32* %e, align 4
    %load_temp94 = load i32, i32* %n, align 4
    store i32 %load_temp94, i32* %f, align 4
    %load_temp95 = load i32, i32* %o, align 4
    store i32 %load_temp95, i32* %g, align 4
    %load_temp96 = load i32, i32* %p, align 4
    store i32 %load_temp96, i32* %h, align 4
    %sum3 = alloca i32, align 4
    %load_temp97 = load i32, i32* %q, align 4
    %load_temp98 = load i32, i32* %r, align 4
    %add_temp99 = add i32 %load_temp97, %load_temp98
    %load_temp100 = load i32, i32* %s, align 4
    %add_temp101 = add i32 %add_temp99, %load_temp100
    %load_temp102 = load i32, i32* %t, align 4
    %add_temp103 = add i32 %add_temp101, %load_temp102
    %load_temp104 = load i32, i32* %u, align 4
    %add_temp105 = add i32 %add_temp103, %load_temp104
    %load_temp106 = load i32, i32* %v, align 4
    %add_temp107 = add i32 %add_temp105, %load_temp106
    %load_temp108 = load i32, i32* %w, align 4
    %add_temp109 = add i32 %add_temp107, %load_temp108
    %load_temp110 = load i32, i32* %x, align 4
    %add_temp111 = add i32 %add_temp109, %load_temp110
    store i32 %add_temp111, i32* %sum3, align 4
    %sum = alloca i32, align 4
    %load_temp112 = load i32, i32* %sum1, align 4
    %load_temp113 = load i32, i32* %sum2, align 4
    %add_temp114 = add i32 %load_temp112, %load_temp113
    %load_temp115 = load i32, i32* %sum3, align 4
    %add_temp116 = add i32 %add_temp114, %load_temp115
    store i32 %add_temp116, i32* %sum, align 4
    %load_temp117 = load i32, i32* %sum, align 4
    call void @putint(i32 %load_temp117)
    call void @putch(i32 10)
    ret i32 0
}

