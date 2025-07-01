<!-- src/main/webapp/index.jsp -->

<%@ page import="java.util.List" %>
<%@ page import="br.com.filmeapp.model.Filme" %>

<html>
<link rel="stylesheet" href="style.css">

<body>

<div class="container-pai">

	<div>
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
	</div>
		<div>
		    <h2>Adicionar Filme</h2>
		    <form action="filmes" method="post">
		  
		        <input type="text" name="nomeFilme" placeholder="Digite o nome do filme" required />
		        <button type="submit">Adicionar Filme</button>
		    </form>
		    
		    
		   <h2>Remover Filme</h2>
		<form action="filmes" method="post">
		    <input type="hidden" name="action" value="delete" />
		    <input type="text" name="idFilme" placeholder="Digite o código do filme" required>
		    <button class="close" type="submit">Remover Filme</button>
		</form>
		</div>
	</div>
    
</body>
</html>
