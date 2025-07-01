<!-- src/main/webapp/index.jsp -->

<%@ page import="java.util.List" %>
<%@ page import="br.com.filmeapp.model.Filme" %>

<html>
<link rel="stylesheet" href="style.css">

<body>

	<h1>Minha lista de filmes:</h1>
<ul>
<%
    List<Filme> filmes = (List<Filme>) request.getAttribute("filmes");
    if (filmes != null) {
        for (Filme f : filmes) {
%>
    <li><%= f.getId() %> - <%= f.getNome() %></li>
<%
        }
    }
%>
</ul>


    <h2>Adicionar Filme</h2>
    <form action="filmes" method="post">
        <input type="text" name="nomeFilme" placeholder="Digite o nome do filme" required />
        <button type="submit">Adicionar Filme</button>
    </form>
    
    
    <h2>Remover Filme</h2>
    <form action="filmes" method="post">
        <input type="text" name="removerFilme" placeholder="Digite o nome código do filme" required />
        <button type="submit">Remover Filme</button>
    </form>
    

    
    
</body>
</html>
