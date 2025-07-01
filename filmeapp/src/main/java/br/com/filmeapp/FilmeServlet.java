package br.com.filmeapp;


import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.filmeapp.DAO.FilmesDAO;
import br.com.filmeapp.model.Filme;

@WebServlet("/filmes")
public class FilmeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // Boa prática para servlets

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FilmesDAO dao = new FilmesDAO();
       
        List<Filme> lista = dao.listarFilmes();

        request.setAttribute("filmes", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String nomeFilme = req.getParameter("nomeFilme");
        FilmesDAO dao = new FilmesDAO();
        List<Filme> filmes = dao.adicionarFilme(nomeFilme); // insere e busca
        req.setAttribute("filmes", filmes);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
