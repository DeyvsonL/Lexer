package generated.lexer;

%%

/* 
A linha atual pode ser acessada por yyline 
e a coluna atual com yycolumn. 
*/ 
%line
%column

/* Se quisermos 'interfacear' com um parser gerado pelo sistema CUP
%cup
*/ 

//encoding
%unicode

// faz com que a classe tenha uma função main e torna possivel que a classe gerada seja usada como reconhecedor
%standalone

//nomeia a classe
%class TesteLexer

/* 
Declarações

código dentro de %{ e %}, é copiado para a classe gerada. 
a ideia é utilizar este recurso para declarar atributos e métodos usados nas ações 
*/ 
%{
int qtdeID=0;
int qtdWordKeys=0;
int qtdDelimiters=0;
int qtdInt=0;
int qtdFloat=0;
int qtdComment=0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
System.out.println("Quantidade de Palavras Chaves e Operadores encontrados: "+qtdWordKeys);
System.out.println("Quantidade de Delimitadores encontrados: "+qtdDelimiters);
System.out.println("Quantidade de Inteiros encontrados: "+qtdInt);
System.out.println("Quantidade de Floats encontrados: "+qtdFloat);
System.out.println("Quantidade de Comentarios encontrados: "+qtdComment);
%eof}

/*-*
 * PADROES NOMEADOS:
 */
letter          = [A-Za-z]
digit           = [0-9]
initialDigit	= [1-9]
zero			= 0
underline		= _
integer         = {initialDigit}{digit}*|{zero}
floating		= {integer}+(\.{digit}+)?(E[+\-]?{digit}+)?
alphanumeric    = {letter}|{digit}|{underline}
identifier      = {underline}|{letter}({alphanumeric})*
whitespace      = [ \n\t\r]
delimiter		=  [;|.|,|=|(|)|{|}|[|]]
comment	 		= "/*"~"*/"

%%
/**
 * REGRAS LEXICAS:
 */
class           {qtdWordKeys++; System.out.println("Token class"); }
public			{qtdWordKeys++; System.out.println("Token public"); }
extends			{qtdWordKeys++; System.out.println("Token extends"); }
static			{qtdWordKeys++; System.out.println("Token static"); }
void			{qtdWordKeys++; System.out.println("Token void"); }
int				{qtdWordKeys++; System.out.println("Token int"); }
boolean			{qtdWordKeys++; System.out.println("Token boolean"); }
while			{qtdWordKeys++; System.out.println("Token while"); }
if				{qtdWordKeys++; System.out.println("Token if"); }
else			{qtdWordKeys++; System.out.println("Token else"); }
return			{qtdWordKeys++; System.out.println("Token return"); }
"||"			{qtdWordKeys++; System.out.println("Token ||"); }
"&&"			{qtdWordKeys++; System.out.println("Token &&"); }
"=="			{qtdWordKeys++; System.out.println("Token =="); }
"!="			{qtdWordKeys++; System.out.println("Token !="); }
"<"				{qtdWordKeys++; System.out.println("Token <"); }
"<="			{qtdWordKeys++; System.out.println("Token <="); }
">"				{qtdWordKeys++; System.out.println("Token >"); }
">="			{qtdWordKeys++; System.out.println("Token >="); }
"*"             {qtdWordKeys++; System.out.println("Token *"); }
"+"             {qtdWordKeys++; System.out.println("Token +"); }
"-"             {qtdWordKeys++; System.out.println("Token -"); }
"/"             {qtdWordKeys++; System.out.println("Token /"); }
"%"             {qtdWordKeys++; System.out.println("Token %"); }
"!"             {qtdWordKeys++; System.out.println("Token !"); }
false			{qtdWordKeys++; System.out.println("Token false"); }
true			{qtdWordKeys++; System.out.println("Token true"); }
this			{qtdWordKeys++; System.out.println("Token this"); }
new				{qtdWordKeys++; System.out.println("Token new"); }
{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
{integer}       { qtdInt++; System.out.println("Token INT ("+yytext()+")"); }
{floating}      { qtdFloat++; System.out.println("Token FLOAT ("+yytext()+")"); }
{whitespace}    { /* Ignorar whitespace. */ }
{delimiter}     { qtdDelimiters++; System.out.println("Token DELIMITER ("+yytext()+")"); }
{comment}     { qtdComment++; System.out.println("Token COMMENT ("+yytext()+")"); }
.               { System.out.println("Illegal char, '" + yytext() +
                    "' line: " + yyline + ", column: " + yycolumn); }
