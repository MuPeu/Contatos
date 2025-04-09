<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Contato</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="box-alteracao">
            <%
                //recebe o id do contato a ser alterado e armazena na variavel
                int id_cpf;
                id_cpf=Integer.parseInt(request.getParameter("id_cpf"));

                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/db_murilo";
                String user="root";
                String password="root";
                conecta = DriverManager.getConnection(url,user,password);

                conecta=DriverManager.getConnection(url,user,password);
                //Buscar o contato pelo id recebido
                String sql=("SELECT * FROM tb_contato_murilo WHERE id_cpf=?");
                st=conecta.prepareStatement(sql);
                //ResultSet serve para guardar aquilo que é trazido do banco
                st.setInt(1,id_cpf);
                ResultSet resultado = st.executeQuery();
                //Verifica se o contato de id informado, foi encontrado
                if (!resultado.next()){
                    out.print("Este contato não foi encontrado");
                } else {
                    //se encontrar o contato na tabela, vamos carregar estes dados dentro do formulário
            %>
            <form method="post" action="editar.jsp">
                
                    <label for="id_cpf">ID:</label>
                    <input type="number" placeholder="ID" name="id_cpf" id="id_cpf" value="<%=resultado.getString("id_cpf")%>" readonly>
                
                
                    <label for="cpf">CPF:</label>
                    <input type="text" placeholder="CPF" name="cpf" id="cpf" size="11" value="<%=resultado.getString("CPF")%>" readonly>
                
                
                    <label for="pnome">Primeiro Nome:</label>
                    <input type="text" placeholder="Primeiro Nome" name="pnome" id="pnome" value="<%=resultado.getString("primeiro_nome")%>" readonly>
                
                
                    <label for="unome">Ultimo Nome:</label>
                    <input type="text" placeholder="Ultimo Nome" name="unome" id="unome" value="<%=resultado.getString("ultimo_nome")%>" readonly>
                
                
                    <label for="mes_nascimento">Mês de Nacimento:</label>
                    <input type="number" placeholder="Mês de Nascimento" name="mes_nascimento" id="mes_nascimento" size="2" value="<%=resultado.getString("mes_nascimento")%>" readonly>
                
                
                    <label for="ddd">DDD:</label>
                    <input type="text" placeholder="DDD" name="ddd" id="ddd" minlength="2" maxlength="2" pattern="[0-9]{2}" value="<%=resultado.getString("DDD")%>" required>
                
                
                    <label for="celular">Celular:</label>
                    <input type="text" placeholder="Celular" name="celular" id="celular" minlength="9" maxlength="9" pattern="[0-9]{9}" value="<%=resultado.getString("celular")%>" required>
                
                    <label for="email">Email:</label>
                    <input type="text" placeholder="Email" name="email" id="email" maxlength="30" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,30}$" value="<%=resultado.getString("email")%>" required>
                
                    <label for="endereco">Endereço:</label>
                    <input type="text" placeholder="Endereço" name="endereco" id="endereco" maxlength="50" value="<%=resultado.getString("endereco")%>" required>
                
                    <label for="cidade">Cidade:</label>
                    <input type="text" placeholder="Cidade" name="cidade" id="cidade" maxlength="20" value="<%=resultado.getString("cidade")%>" required>
               
                    <label for="estado">Estado:</label>
                    <input type="text" placeholder="Estado" name="estado" id="estado" minlength="2" maxlength="2" pattern="[A-Za-z]{2}" value="<%=resultado.getString("estado")%>" required>
                
                    <label for="id">ID ADMIN:</label>
                    <input type="number" placeholder="ID ADMIN" name="id" id="id" value="<%=resultado.getString("id")%>">
                
                    <input type="submit" value="Salvar Alterações">
                
            </form>
            <%
                }
            %>
            <br><a href="welcome.html">
                <button type="button">Voltar</button>
            </a>
        </div>
    </body>
</html>
