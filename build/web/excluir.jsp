<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <%
            //recebe o código digitado no formulário
            int id_cpf;
            id_cpf=Integer.parseInt(request.getParameter("id_cpf"));
            
            String primeiro_nome, ultimo_nome;
            primeiro_nome = request.getParameter("primeiro_nome");
            ultimo_nome = request.getParameter("ultimo_nome");
                
            try{
                //conectar ao banco de dados bancojsp
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/db_murilo";
                String user="root";
                String password="root";
                conecta = DriverManager.getConnection(url,user,password);
                
                String sql="DELETE FROM tb_contato_murilo WHERE id_cpf=?"; 
                st=conecta.prepareStatement(sql);
                st.setInt(1,id_cpf);
                
                int resultado=st.executeUpdate();   //executa o comando DELETE
                if (resultado==0){
                    out.print("Este Contato Não Está Cadastrado no Banco.");
                }else{
                    out.print("O Contato, foi Excluido com Sucesso!");
                }
            }catch(Exception erro){
                String mensagemErro = erro.getMessage();
                out.print("Entre em Contato com o Administrador e Informe o Erro.");
            }
        %>
        <br><a href="welcome.html">
            <button type="button">Voltar</button>
        </a>
    </body>
</html>