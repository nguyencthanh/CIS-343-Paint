//Thanh Nguyen, Hunter Sutton

%{
#include <stdio.h>
#include <stdlib.h>
#include "gvlogo.tab.h"

extern void yyerror(const char* s);
%}

%%

;           { return SEP; } 
[ \t\r\n]	{ ; } 
"+"         { return PLUS; } 
"-"         { return SUB; } 
"*"         { return MULT; } 
"/"         { return DIV; } 
[0-9]+      { yylval.f = atof(yytext); return NUMBER; } 
\"[A-Za-z]+.\"     { yylval.s = yytext; return QSTRING; } 
.		    { yyerror("Lexing Syntax error.\n"); }
penup       { return PENUP; } 
pendown     { return PENDOWN; } 
print       { return PRINT; } 
change_color     { return CHANGE_COLOR; } 
clear       { return CLEAR; } 
turn        { return TURN; }
move        { return MOVE; } 
end         { return END; } 
save        { return SAVE; } 
goto        { return GOTO; } 
where       { return WHERE; } 
[A-Za-z"."a-z]+    { yylval.s = yytext; return STRING;}

%%
