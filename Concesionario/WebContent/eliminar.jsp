<%-- JSP que confirma eliminación de vehiculo.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>

<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%
out.println("<style>  h1 {font-family: arial;"
        + " color: white; font-size: 20; text-align:center   }; "
        + "</style>");
out.println("<style>  form {font-family: arial;"
        + " color: blue; font-size: 16; margin-left:45%;  }; "
        + "</style>");
out.println("<style>  b {font-family: arial;"
     + " color: blue; font-size: 16;  }; "
     + "</style>");
out.println("<style>  body {background-image: url('coches.jpg'); background-repeat: no-repeat; background-size: 100% 100%;   }; </style>");
out.println("<style>  table {background-color: #C7CAC7;margin-left:45%; }; </style>");


%>

<% 
String strId =request.getParameter("id");
int id = Integer.parseInt(strId);
Connection con = null;
String url = "jdbc:mysql://10.18.124.91:3306/";;
String db = "concesionario";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"root","david1234");
try{
Statement st = con.createStatement();
String Stock=request.getParameter("Stock");
int in = st.executeUpdate("DELETE from vehiculos WHERE id='"+id+"'");
out.println("<body>");
con.close();
out.println("<h1> El vehiculo se ha vendido correctamente. </h1>");
out.println("<br>");
out.println("<form method='get' action='principal.jsp'>");
out.println("<input type='submit' value='Volver a la pagina principal'>");
out.println("</form>");
out.println("</body>");
}
catch (SQLException ex){
System.out.println(ex.getMessage());
}

}
catch (Exception e){
e.printStackTrace();
}
%>

