grammar Program;

prog: BEGIN block END;

block: (stmt SEMICOLON)*;

stmt: assignStmt | whileStmt | ifStmt | outputStmt;

assignStmt: ID ASSIGN expressions;

whileStmt: WHILE expressions DO block ENDDO;

ifStmt: IF expressions THEN block (elseStmt)? ENDIF;

outputStmt: OUTPUT LBRACKET expressions RBRACKET;

elseStmt: ELSE block;

expressions: expr;

expr: ID                     # Id
    | INT                    # Int
    | READ                   # Read
    | expr MUL expr          # Multiplication
    | expr DIV expr          # Division
    | expr ADD expr          # Addition
    | expr SUB expr          # Subtracting
    | expr EQ  expr          # Equals
    | expr NEQ expr          # NotEquals
    | expr GT  expr          # GreaterThan
    | expr GTE expr          # GreaterEqualsThan
    | expr LT  expr          # LessThan
    | expr LTE expr          # LessEqualsThan
    | LBRACKET expr RBRACKET # Brackets
    ;

BEGIN: 'BEGIN';
END: 'END';
IF: 'IF';
THEN: 'THEN';
ELSE: 'ELSE';
ENDIF: 'ENDIF';
WHILE: 'WHILE';
DO: 'DO';
ENDDO: 'ENDDO';
READ: 'READ';
OUTPUT: 'OUTPUT';

ASSIGN: ':=';
SEMICOLON: ';';
LBRACKET: '(';
RBRACKET: ')';

LTE: '<=';
GTE: '>=';
LT: '<';
GT: '>';
NEQ: '<>';
EQ: '==';

SUB: '-';
ADD: '+';
DIV: '/';
MUL: '*';

INT: [0-9]+;

ID: [a-zA-Z0-9]+;

WS: [ \t\r\n]+ -> skip;
