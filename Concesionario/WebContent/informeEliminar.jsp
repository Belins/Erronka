<%-- JSP para editar vehiculos.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>

<head>
<title>SERIE</title>
</head>
<style>
 body {
 		background-image: url("coches.jpg");
 		background-repeat: no-repeat;
 		background-size: 100% 100%;
	}
	table {
		margin: auto;
   		background-color: lightgrey;
   }
   h1{
   	margin-left:31%;
   	margin-right: 32%;
   	color: red;
   	border:solid 1px;
   	border-color: red;
   	background-color: black;
   }
   a{
   margin-left:32%;
   color: white;
   }
   
   
</style>
<body>

<% 
String driver = "com.mysql.jdbc.Driver";
Connection con = null;

try{
Class.forName(driver);
con=DriverManager.getConnection("jdbc:mysql://10.18.124.91:3306/concesionario","root","david1234");
String strId =request.getParameter("id");
int id = Integer.parseInt(strId);
try{
	
Statement st = con.createStatement();
int in = st.executeUpdate("DELETE from vehiculos WHERE id='"+id+"'");
con.close();
out.println("<h1> El vehiculo ya no esta disponible.</h1>");
out.println("<br>");
out.println("<a href='principal.jsp'> Volver a la pagina principal </a>");
}
catch (SQLException ex){
System.out.println(ex.getMessage());
}

}
catch (Exception e){
e.printStackTrace();
}
%>

</body>
</html>