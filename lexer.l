%option yylineno
%pointer

%{
    #define YYSTYPE char*
    #include <stdlib.h>
    void yyerror(const char *);
    #include "parser.hpp"
%}


%x COMMENT

%%

  /* WRITEME: Write your Flex token rules here */

<INITIAL>"/*"     { BEGIN(COMMENT); } 
<COMMENT>[^*\n]*     ;
<COMMENT>"*"+[^*/\n]* ;
<COMMENT>"\n"     ;
<COMMENT><<EOF>>  { yyerror("dangling comment"); }
<COMMENT>"*/"     { BEGIN(INITIAL); } 

[ \t\n]           ; 
0|[1-9][0-9]*     { return T_INTEGER; } 
"+"               { return T_PLUS; }  
"-"               { return T_MINUS; }
"/"               { return T_DIVIDE; }
"*"               { return T_MULT; }
"="               { return T_EQUAL; }  
"=="              { return T_EQUALEQ; }
"<"               { return T_LESS; }
";"               { return T_SEMICOLON; }  
":"               { return T_COLON; }  
"<="              { return T_LESSEQ; } 
"("               { return T_OPENPAREN; }
")"               { return T_CLOSEPAREN; }
"{"               { return T_OPENBRACKET; }
"}"               { return T_CLOSEBRACKET; }  
","               { return T_COMMA; }       
"or"              { return T_OR; }
"and"             { return T_AND; }  
"true"            { return T_TRUE; }
"false"           { return T_FALSE; }
"if"              { return T_IF; }  
"else"            { return T_ELSE; }
"print"           { return T_PRINT; }
"return"          { return T_RETURN; }  
"for"             { return T_FOR; }
"new"             { return T_NEW; }
"not"             { return T_NOT; }  
"int"             { return T_INT; } 
"bool"            { return T_BOOL; }  
"none"            { return T_NONE; } 
"."               { return T_DOTOP; }  
[a-zA-Z][a-zA-Z0-9]*    { return T_ID; }
.                 { yyerror("invalid character"); }
%%

int yywrap(void) {
  return 1;
}
