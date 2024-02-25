
%option noyywrap
%option noinput
%option nounput


%%

"//"(.)*\n   ; 
"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+"/" ;


"if" {printf("tIF\n");}
"else" {printf("tELSE\n");}
"while" {printf("tWHILE\n");}
"print" {printf("tPRINT\n");}
"return" {printf("tRETURN\n");}
"int" {printf("tINT\n");}
"void" {printf("tVOID\n");}


"+" {printf("tADD\n");}
"-" {printf("tSUB\n");}
"*" {printf("tMUL\n");}
"/" {printf("tDIV\n");}
"<" {printf("tLT\n");}
">" {printf("tGT\n");}
"!=" {printf("tNE\n");}
"==" {printf("tEQ\n");}
"<=" {printf("tLE\n");}
">=" {printf("tGE\n");}
"=" {printf("tASSIGN\n");}
"&&" {printf("tAND\n");}
"||" {printf("tOR\n");}
"!" {printf("tNOT\n");}
"{" {printf("tLBRACE\n");}
"}" {printf("tRBRACE\n");}
"(" {printf("tLPAR\n");}
")" {printf("tRPAR\n");}
";" {printf("tSEMI\n");}
"," {printf("tCOMMA\n");}


[a-zA-Z][a-zA-Z0-9]* {printf("tID: '%s'\n", yytext);}


[0-9]+ {
    int dec = atoi(yytext);
    printf("tNB: '%s[0x%x]'\n", yytext, dec);
}
0[xX][0-9a-fA-F]+ {
    int dec = (int)strtol(yytext, NULL, 0);
    printf("tNB: '%d[%s]'\n", dec, yytext);
}





[ \t\n] ;

. {printf("tERROR\n");}

%%


int main() {
    yylex();
    return 0;
}