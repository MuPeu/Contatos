<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="styles.css">
        <title>Login</title>
    </head>
    
    <body>
        <%
        String usuario = request.getParameter("usuario");
        String senha  = request.getParameter("senha");
    
        try{
        
            Connection conecta;

            PreparedStatement st; 
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/login";
            String user="root";
            String password = "root";

            conecta = DriverManager.getConnection(url,user,password);

            String sql=("SELECT * from tb_login WHERE usuario=? AND senha=?");

            st = conecta.prepareStatement(sql);
            st.setString(1,usuario);
            st.setString(2,senha);

            ResultSet rs=st.executeQuery();

            if (rs.next()){
                response.sendRedirect("welcome.html");
            } else {
                response.sendRedirect("error.html");
            }
        
        } catch (Exception x){
           response.sendRedirect("error.html");
        }
         %>  
    </body>
</html>
