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
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <%
            //recebe os dados alterados no formulário carregaprod.jsp
            int id_cpf, mes_nascimento;
            id_cpf = Integer.parseInt(request.getParameter("id_cpf"));
            mes_nascimento = Integer.parseInt(request.getParameter("mes_nascimento"));
            
            String cpf, pnome, unome, ddd, celular, email, endereco, cidade, estado;
            cpf = request.getParameter("cpf");
            pnome = request.getParameter("pnome");
            unome = request.getParameter("unome");
            ddd = request.getParameter("ddd");
            celular = request.getParameter("celular");
            email = request.getParameter("email");
            endereco = request.getParameter("endereco");
            cidade = request.getParameter("cidade");
            estado = request.getParameter("estado");
            
            String idStr = request.getParameter("id");
            int id = 0; // Inicializa a variável 'id' com um valor padrão
            if (idStr != null && !idStr.isEmpty()) {
                id = Integer.parseInt(idStr);  // Agora 'id' é inicializado corretamente
            }
            
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/db_murilo";
            String user="root";
            String password="root";
            conecta = DriverManager.getConnection(url,user,password);
            String sql;
            if (idStr != null && !idStr.isEmpty()) {
                sql=("UPDATE tb_contato_murilo SET CPF=?, primeiro_nome=?, ultimo_nome=?, mes_nascimento=?, DDD=?, celular=?, email=?, endereco=?, cidade=?, estado=?, id=? WHERE id_cpf=?");
            } else {
                sql=("UPDATE tb_contato_murilo SET CPF=?, primeiro_nome=?, ultimo_nome=?, mes_nascimento=?, DDD=?, celular=?, email=?, endereco=?, cidade=?, estado=? WHERE id_cpf=?");
            }
            st = conecta.prepareStatement(sql);
            
            st.setString(1, cpf);
            st.setString(2, pnome);
            st.setString(3, unome);
            st.setInt(4, mes_nascimento);
            st.setString(5, ddd);
            st.setString(6, celular);
            st.setString(7, email);
            st.setString(8, endereco);
            st.setString(9, cidade);
            st.setString(10, estado);
            if (idStr != null && !idStr.isEmpty()) {
                st.setInt(11, id);
                st.setInt(12, id_cpf);
            } else {
                st.setInt(11, id_cpf);
            }
            
            st.executeUpdate();
            out.print("Os dados do contato " + pnome + " " + unome + " foram alterados com sucesso!");
        %>
        <br><a href="welcome.html">
            <button type="button">Voltar</button>
        </a>
    </body>
</html>
