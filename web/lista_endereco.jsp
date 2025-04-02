<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus Contatos - Endereço</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <h1>Meus Contatos Por Endereço</h1>
        <% try{
                //fazer a conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/db_murilo";
                String user="root";
                String password="root";
                conecta = DriverManager.getConnection(url,user,password);
                //Listar os dados da tabela produto do banco de dados
                String sql=("SELECT * FROM tb_contato_murilo ORDER BY endereco ASC");
                st=conecta.prepareStatement(sql);
                ResultSet rs=st.executeQuery();
                //enquanto não chegar no final ele vai executar
                //o que estiver dentro do while
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Primeiro Nome</th>
                <th value="ASC">Endereço</th>
                <th>Cidade</th>
                <th>Email</th>
            </tr>
            <%
                while (rs.next()){
                    // Verificar se o valor de id é null, e se for, substituí por " "
                    String id = rs.getString("id");
                    if (id == null) {
                        id = "";
                    }
            %>
            <!--Finalizei o código java acima. Agora vou criar o corpo da tabela html para mostar os dados trazidos do Banco de Dados-->
            <tr>
                <td>
                    <%= id %> <!-- Exibe o valor de id, se for null, como " "-->
                </td>
                <td>
                    <%= rs.getString("primeiro_nome")%>
                </td>
                <td>
                    <%= rs.getString("endereco")%>
                </td>
                <td>
                    <%= rs.getString("cidade")%>
                </td>
                <td>
                    <%=rs.getString("email")%>
                </td>
                <td>
                    <a href="excluir.jsp?id_cpf=<%= rs.getString("id_cpf") %>">Excluir</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch(Exception x){
                out.print ("Mensagem de erro: " + x.getMessage());
            }
        %>
        <a href="welcome.html">
            <button type="button">Voltar</button>
        </a>
    </body>
</html>