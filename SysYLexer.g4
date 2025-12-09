lexer grammar SysYLexer;

CONST : 'const';

INT : 'int';

VOID : 'void';

IF : 'if';

ELSE : 'else';

WHILE : 'while';

BREAK : 'break';

CONTINUE : 'continue';

RETURN : 'return';

PLUS : '+';

MINUS : '-';

MUL : '*';

DIV : '/';

MOD : '%';

ASSIGN : '=';

EQ : '==';

NEQ : '!=';

LT : '<';

GT : '>';

LE : '<=';

GE : '>=';

NOT : '!';

AND : '&&';

OR : '||';

L_PAREN : '(';

R_PAREN : ')';

L_BRACE : '{';

R_BRACE : '}';

L_BRACKT : '[';

R_BRACKT : ']';

COMMA : ',';

SEMICOLON : ';';
//以下划线或字母开头，仅包含下划线、英文字母大小写、阿拉伯数字
IDENT : [_a-zA-Z][_a-zA-Z0-9]*;
//数字常量，包含十进制数，0开头的八进制数，0x或0X开头的十六进制数
INTEGER_CONST : [1-9][0-9]*
    |'0' [0-7]*
    |('0x'|'0X') [0-9a-fA-F]+;

WS : [ \r\n\t]+ ->skip;

LINE_COMMENT : '//' .*? '\n' ->skip;
//同标准C语言，以'/*'开头，以'*/'结尾 
MULTILINE_COMMENT : '/*' .*? '*/' ->skip;
   