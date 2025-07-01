package br.com.filmeapp.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import br.com.filmeapp.model.Filme;

public class FilmesDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/filmesdb";
    private static final String USER = "root";
    private static final String PASSWORD = "solutis";

    public List<Filme> listarFilmes() {
        List<Filme> lista = new ArrayList<>();
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = con.createStatement();
        	ResultSet rs = stmt.executeQuery("SELECT id, nome FROM filmes");
            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                lista.add(new Filme(id, nome));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    public List<Filme> adicionarFilme(String filme) {
        List<Filme> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = con.createStatement();

            // Inserir novo filme
            stmt.executeUpdate("INSERT INTO filmes (nome) VALUES ('" + filme + "')");

            // Buscar todos os filmes após inserção
            ResultSet rs = stmt.executeQuery("SELECT id, nome FROM filmes");

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                lista.add(new Filme(id, nome)); // Corrigido: adiciona objeto Filme
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

}
