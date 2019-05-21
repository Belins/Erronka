<%-- JSP que confirma eliminación de vehiculo.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>

<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%
out.println("<style>  p {font-family: arial;"
           + " color: red; font-size: 16;   }; "
           + "</style>");
out.println("<style>  a,b {font-family: arial;"
           + " color: blue; font-size: 16;   }; "
           + "</style>");

%>

<% 
String strId =request.getParameter("id");
int id = Integer.parseInt(strId);
Connection con = null;
String url = "jdbc:mysql://10.18.124.90:3306/";;
String db = "concesionario";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"root","david1234");
try{
Statement st = con.createStatement();
String name=request.getParameter("name");
int in = st.executeUpdate("DELETE FROM vehiculos WHERE id='"+id+"'");
con.close();
out.println("<p> El vehiculo ha sido eleminado. </p>");
out.println("<br>");
out.println("<a href='principal.jsp'> Volver a la pagina principal </a>");
}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
