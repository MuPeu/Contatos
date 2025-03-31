<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus Contatos - Nomes</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <h1>Meus Contatos Por Nome</h1>
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
                String sql=("SELECT * FROM tb_contato_murilo ORDER BY primeiro_nome ASC");
                st=conecta.prepareStatement(sql);
                ResultSet rs=st.executeQuery();
                //enquanto não chegar no final ele vai executar
                //o que estiver dentro do while
        %>
        <table>
            <tr>
                <th>CPF</th>
                <th value="ASC">Primeiro Nome</th>
                <th>DDD</th>
                <th>Celular</th>
                <th>Email</th>
                <th>Mês de Nacimento</th>
            </tr>
            <%
                while (rs.next()){
            %>
            <!--Finalizei o código java acima. Agora vou criar o corpo da tabela html para mostar os dados trazidos do Banco de Dados-->
            <tr>
                <td>
                    <%=rs.getString("CPF")%>
                </td>
                <td>
                    <%=rs.getString("primeiro_nome")%>
                </td>
                <td>
                    <%=rs.getString("DDD")%>
                </td>
                <td>
                    <%=rs.getString("celular")%>
                </td>
                <td>
                    <%=rs.getString("email")%>
                </td>
                <td>
                    <%=rs.getString("mes_nascimento")%>
                </td>
                <td>
                    <a href="excluir.jsp?id_cpf=<%=rs.getString("id_cpf")%>">Excluir</a>
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
    </body>
</html>
