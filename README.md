# Trabalho 1 Analisador Lexico
Trabalho da disciplina de Compiladores 2023/1

Professor:    Daniel Lucrédio.

Estudantes:   

    Gabriel Mansano Pires, RA: 790951

    Jonathan Braian Dias Vaz, RA: 790870

    Pedro Freire Baleeiro, RA: 790984
              
Descrição:    Desenvolvimento de um Analisador Lexico na linguagem JAVA utilizando Antlr4.

Dependências: JDK 18 - Maven 4.0.0 - Antlr4 4.11.1

## Passos para Compilar e Executar o Analisador
1) Acesse o código Principal.java na seguinte pasta "analisadorlexico/main/java/br/ufscar/dc/compiladores/analisador/lexico/Principal.java";

2) Utilize o comando a seguir para criar um pacote distribuível (formato ".jar");

```
mvn package
```

3) O pacote "lexico-1.0-jar-with-dependencies.jar" será criado e ficará disponível na pasta "analisadorlexico/target/lexico-1.0-jar-with-dependencies.jar";
 
4) Acesse novamente o terminal e execute o comando a seguir substituindo os campos de <input> e <output> com os arquivos de entrada e saída respectivamente;
  
```
java -jar  lexico-1.0-jar-with-dependencies.jar <input> <output>
```
  
5) Caso o arquivo de entrada seja válido o sistema retornará um arquivo de saída correto.
