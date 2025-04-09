<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Contato</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <h1>Contatos Encontrados</h1>
        <%
            try {
                // Pega o valor do parâmetro 'contato' enviado pelo formulário
                String contato = request.getParameter("contato");

                // Verifica se o parâmetro não é nulo ou vazio
                if (contato != null && !contato.isEmpty()) {
                    // Faz a conexão com o banco de dados
                    Connection conecta;
                    PreparedStatement st;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/db_murilo";
                    String user = "root";
                    String password = "root";
                    conecta = DriverManager.getConnection(url, user, password);

                    // Se for buscar pelo primeiro nome
                    String sql = "SELECT * FROM tb_contato_murilo WHERE primeiro_nome = ? ORDER BY primeiro_nome ASC";
                    st = conecta.prepareStatement(sql);
                    st.setString(1, contato);  // Primeiro nome

                    ResultSet rs = st.executeQuery();

                    // Verifica se encontrou algum resultado
                    if (rs.next()) {
        %>
        <!-- Se houver resultados para o primeiro nome, exibe em uma tabela -->
        <table>
            <tr>
                <th value="ASC">Primeiro Nome</th>
                <th>Sobrenome</th>
                <th>CPF</th>
                <th>DDD</th>
                <th>Celular</th>
                <th>Email</th>
                <th>Endereço</th>
                <th>Cidade</th>
            </tr>
        <%
                    // Exibe os dados na tabela
                    do {
        %>
            <tr>
                <td><%= rs.getString("primeiro_nome") %></td>
                <td><%= rs.getString("ultimo_nome") %></td>
                <td><%= rs.getString("CPF") %></td>
                <td><%= rs.getString("DDD") %></td>
                <td><%= rs.getString("celular") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("endereco") %></td>
                <td><%= rs.getString("cidade") %></td>
                <td><a href="excluir.jsp?id_cpf=<%= rs.getString("id_cpf") %>">Excluir</a></td>
            </tr>
        <%
                    } while (rs.next());  // Continua até o final dos resultados
        %>
        </table>
        <%
                    } else {
                        
                    }

                    // Se o contato for um mês de nascimento
                    sql = "SELECT * FROM tb_contato_murilo WHERE mes_nascimento = ? ORDER BY primeiro_nome ASC";
                    st = conecta.prepareStatement(sql);
                    st.setString(1, contato);  // Mês de nascimento

                    rs = st.executeQuery();

                    // Verifica se encontrou algum resultado
                    if (rs.next()) {
        %>
        <!-- Se houver resultados para o mês de nascimento, exibe em uma tabela -->
        <table>
            <tr>
                <th value="ASC">Primeiro Nome</th>
                <th>Sobrenome</th>
                <th>CPF</th>
                <th>Mês de Nascimento</th>
                <th>DDD</th>
                <th>Celular</th>
                <th>Email</th>
                <th>Endereço</th>
                <th>Cidade</th>
                <th>Estado</th>
            </tr>
        <%
                    // Exibe os dados na tabela
                    do {
        %>
            <tr>
                <td><%= rs.getString("primeiro_nome") %></td>
                <td><%= rs.getString("ultimo_nome") %></td>
                <td><%= rs.getString("CPF") %></td>
                <td><%= rs.getString("mes_nascimento") %></td>
                <td><%= rs.getString("DDD") %></td>
                <td><%= rs.getString("celular") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("endereco") %></td>
                <td><%= rs.getString("cidade") %></td>
                <td><%= rs.getString("estado") %></td>
                <td><a href="excluir.jsp?id_cpf=<%= rs.getString("id_cpf") %>">Excluir</a></td>
            </tr>
        <%
                    } while (rs.next());  // Continua até o final dos resultados
        %>
        </table>
        <%
                    } else {
                        
                    }

                } else {
        %>
        <p>Por favor, insira um nome ou mês de nascimento para realizar a busca.</p>
        <%
                }
            } catch (Exception e) {
                out.print("Erro: " + e.getMessage());
            }
        %>
        <div class="button">
            <a href="buscar.html">
                <button type="button">Voltar</button>
            </a>
        </div>
    </body>
</html>
