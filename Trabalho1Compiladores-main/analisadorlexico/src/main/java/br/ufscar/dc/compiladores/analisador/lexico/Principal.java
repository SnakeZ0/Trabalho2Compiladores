package br.ufscar.dc.compiladores.analisador.lexico;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

public class Principal {
    public static void main(String[] args) {
        try {
            // args[0] eh o primeiro argumento da linha de comando
            CharStream cs = CharStreams.fromFileName(args[0]);
            AnalisadorLexer lex = new AnalisadorLexer(cs);
            Token t = null;

            // Verifica se o diretorio de saida existe,se nessessario ele cria
            File outputFile = new File(args[1]);
            File outputDir = outputFile.getParentFile();
            if (outputDir != null && !outputDir.exists()) {
                outputDir.mkdirs();
            }

            FileWriter writer = new FileWriter(outputFile);
            String textoarq;
            //loop pra ler todo o arquivo
            while ((t = lex.nextToken()).getType() != Token.EOF) {
                String tipo = AnalisadorLexer.VOCABULARY.getDisplayName(t.getType());
                String texto = t.getText();
                //nos tratamentos de erro, caso um erro exisa o programa encerra(break)
                //trata de erros que nao sao nem de cadeia nao fechada nem de comentarios nao fechados
                if (tipo.equals("ERRO")) {
                    textoarq = "Linha " + t.getLine() + ": " + t.getText() + " - simbolo nao identificado\n";
                    writer.write(textoarq);
                    break;
                } 
                //trata de erros de cadeias nao fechadas
                else if (tipo.equals("CADEIA_LITERAL_NAO_FECHADA")) {
                    textoarq = "Linha " + t.getLine() + ": cadeia literal nao fechada\n";
                    writer.write(textoarq);
                    break;
                } 
                //trata de erros de comentarios nao fechados
                else if (tipo.equals("COMENTARIO_NAO_FECHADO")) {
                    textoarq = "Linha " + t.getLine() + ": comentario nao fechado\n";
                    writer.write(textoarq);
                    break;
                } 
                //trata de casos que o token indica uma paralavra chave ou um tipo de operacao, seja ela relacional, logica ou aritmetica
                else if (tipo.equals("PALAVRA_CHAVE") || tipo.equals("OP_REL") || tipo.equals("OP_ARIT") || tipo.equals("OP_COMPR") ) {
                    tipo = "'" + texto.toLowerCase() + "'";
                }
                //faz a atribuicao da mensagem e escreve no arquivo
                textoarq = "<'" + texto + "'," + tipo + ">\n";
                writer.write(textoarq);
            }

            writer.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}