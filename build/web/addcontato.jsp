<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adiconar Contato</title>
    </head>
    <body>
        <%
            //receber dados digitados do formulario addcontato.html
            String cpf, pnome, unome, ddd, celular, email, endereco, cidade, estado;
            cpf=request.getParameter("cpf");
            pnome=request.getParameter("pnome");
            unome=request.getParameter("unome");
            ddd=request.getParameter("ddd");
            celular=request.getParameter("celular");
            email=request.getParameter("email");
            endereco=request.getParameter("endereco");
            cidade=request.getParameter("cidade");
            estado=request.getParameter("estado");
            
             // Verificar e converter os valores numéricos com segurança
            int mes_nascimento = 0, id = 0;

            String mesNascimentoStr = request.getParameter("mes_nascimento");
            if (mesNascimentoStr != null && !mesNascimentoStr.isEmpty()) {
                mes_nascimento = Integer.parseInt(mesNascimentoStr);
            }

            String idStr = request.getParameter("id");
            if (idStr != null && !idStr.isEmpty()) {
                id = Integer.parseInt(idStr);
            }
            
            //fazer a conexão com o banco de dados
            try{
                Connection conecta;
                PreparedStatement st; //este objeto permite enviar vários comandos SQL como um grupo unico de banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver"); //este método é usado para que o servidor de aplicação faça o registro do driver do Banco
                
                String url="jdbc:mysql://localhost:3306/db_murilo";
                String user="root";
                String password="root";
                
                conecta=DriverManager.getConnection(url,user,password);
                
                //inserindo dados na tabela do banco de dados
                String sql;
                if (idStr != null && !idStr.isEmpty()) {
                    sql = "INSERT INTO tb_contato_murilo (CPF, primeiro_nome, ultimo_nome, mes_nascimento, DDD, celular, email, endereco, cidade, estado, id) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                } else {
                    sql = "INSERT INTO tb_contato_murilo (CPF, primeiro_nome, ultimo_nome, mes_nascimento, DDD, celular, email, endereco, cidade, estado) VALUES (?,?,?,?,?,?,?,?,?,?)";
                }
                st=conecta.prepareStatement(sql);
                st.setString(1,cpf);
                st.setString(2,pnome);
                st.setString(3,unome);
                st.setInt(4,mes_nascimento);
                st.setString(5,ddd);
                st.setString(6,celular);
                st.setString(7,email);
                st.setString(8,endereco);
                st.setString(9,cidade);
                st.setString(10,estado);
                
                if (idStr != null && !idStr.isEmpty()) {
                    st.setInt(11, id);
                }
                
                st.executeUpdate(); //executar a instrução INSERT
                out.print("<p style='color:blue;font-size:25px'>Contato Cadastrado com Sucesso!</p>");
            }catch (Exception x){
                String erro=x.getMessage();
                if(erro.contains("Duplicate entry")){
                    out.print("<p style='color:blue;font-size:25px'>Este contato já está cadastrado!</p>");
                }
                else{
                    out.print("<p style='color:blue;font-size:25px'>Mensagem de erro:" + erro + "</p>");
                }
            }
        %>
    </body>
</html>
