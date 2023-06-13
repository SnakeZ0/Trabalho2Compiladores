lexer grammar AnalisadorLexer;

//Tokens para operacoes logicas
OP_COMPR:   'e' | 'ou' | 'nao' | '&'; 

//Define palavras chaves proprias da gramatica para serem usadas
PALAVRA_CHAVE: 
    'algoritmo' | 'fim_algoritmo' | 'declare' | 'constante' 
    | 'tipo' | 'literal' | 'inteiro' | 'real' | 'logico' 
    | '^' | 'verdadeiro' | 'falso' | 'registro' | 'fim_registro' 
    | 'procedimento' | 'fim_procedimento' | '..' | 'funcao' | 'fim_funcao' 
    | 'var' | 'leia' | 'escreva' | 'se' | 'entao' | 'senao' | 'fim_se' 
    | 'caso' | 'seja' | 'fim_caso' | 'para' | '<-' | 'ate' | 'faca' 
    | 'fim_para' | 'enquanto' | 'fim_enquanto' | 'retorne' | '%' | '.';

//Define quais identificadores(variaveis) devem começa com letra e aceitam numeros e _
IDENT : ('a'..'z'|'A'..'Z') ('a'..'z'|'A'..'Z'|'0'..'9' | '_')*; 

//Indica uma cadeia, na qual deve comecar com aspas duplas e terminar com aspas duplas
CADEIA: ('"') (ESC_SEQ | ~('\n' | '\\'|'"'))* ( '"'); 
fragment
ESC_SEQ:    '\\"'; //Barras e aspas duplas

WS: (' '|'\t'|'\r'|'\n') { skip(); };
    // \n pula para a proxima linha
    // \r move o cursor para o comeco da linha
    // \t insere um tab

//Tokens para operacoes relacionais
OP_REL	:	'>' | '>=' | '<' | '<=' | '<>' | '='  ; 

//Tokens para operacoes aritmeticas
OP_ARIT	:	'+' | '-' | '*' | '/'; 

//Indicador do fim
DELIM:	':'; 

//Abre e fecha parenteses, respectivamente
ABREPA:	'('; 

FECHAPA: ')'; 

//Virgula 
VIR : ','; 

//Abre e fecha colchetes, respectivamente
ABRECO: '['; 
FECHACO: ']';

//Numeros sem virgula, ou seja, inteiros
NUM_INT:    ('0'..'9')+; 

//Numeros com virgula, ou seja, reais
NUM_REAL:   ('0'..'9')+ '.' ('0'..'9')+; 

//O comentario deve ter em seu inicio um { e em seu fim um } 
COMENTARIO: '{' ~('}' | '\n' | '\r')*  '}' { skip(); }; //E nao deve ter quebras de linha

//trata do erro em que uma cadeia é aberta com ",mas não é fechada
CADEIA_LITERAL_NAO_FECHADA:  ('"') (ESC_SEQ | ~('\n'|'\\'|'"'))* '\n';
           
//trata do erro em que um comentario é aberto com {,mas não é fechado
COMENTARIO_NAO_FECHADO: '{' ~('}' | '\n' | '\r')* ('\r' | '\n'); 
ERRO: .; //todo outro tipo de erro
