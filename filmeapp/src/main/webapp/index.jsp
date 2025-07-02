<!-- src/main/webapp/index.jsp -->

<%@ page import="java.util.List" %>
<%@ page import="br.com.filmeapp.model.Filme" %>

<html>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<body>

<div class="container-pai">

	<div>
			<h1>Minha lista de filmes:</h1>
		<div>
			<table>
			    <thead>
			        <tr>
			            <th>Nome</th>
			            <th>Deletar</th>
			        </tr>
			    </thead>
			    <tbody>
			        <%
			            List<Filme> filmes = (List<Filme>) request.getAttribute("filmes");
			            if (filmes != null) {
			                for (Filme f : filmes) {
			        %>
			        <tr>
			            <td><%= f.getNome() %></td>
			            <td>
			            <form action="filmes" method="post">
			    <input type="hidden" name="action" value="delete" />
			    <input type="hidden" value="<%= f.getId() %>" name="idFilme" placeholder="Digite o código do filme" required>
			    <button class="close" type="submit"><i class="fas fa-trash-alt"></i></button>
			</form>
			            </td>
			        </tr>
			        <%
			                }
			            }
			        %>
			    </tbody>
			</table>
		</div>
	

	</div>
		<div>
		    <h2>Adicionar Filme</h2>
		    <form action="filmes" method="post">
		  
		        <input type="text" name="nomeFilme" placeholder="Digite o nome do filme" required />
		        <button type="submit">Adicionar Filme</button>
		    </form>
		    

		</div>
</div>
    
</body>
</html>
