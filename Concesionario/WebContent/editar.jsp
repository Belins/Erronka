<%-- JSP para editar vehiculos.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>

<head>
<title>Actualizar</title>
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
   #pint {
   background-image: url("spray.jpg");
 		background-repeat: no-repeat;
 		background-size: 100% 100%;
   }
   #pint2 {
   background-color:black;
   color: white;
   }
   
</style>
<body>

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
String query = "SELECT  Color FROM vehiculos WHERE id='"+id+"'";
ResultSet rs = st.executeQuery(query);
while (rs.next()) {
%>


<table id="pint" border="1" width="50%">
<tr>
<td width="100%">
<form method="POST" action="actualizar.jsp">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<h2 align="center">PINTAR VEHICULO</h2>
<table  width="15%" >


<tr id="pint2">
<td width="50%"><b>Color:</b></td>
<td width="50%"><input type="text" name="Color" value="<%=rs.getString("Color")%>" size="5" readonly></td>
<td width="50%"><b>Nuevo_color:</b></td>
<td width="50%"><input type="text" name="nuevo_color" value="" size="30"></td>
</tr>


</table>
<br>
<p align="center"><input type="submit" value="Pintar" name="submit"
style="color: black;
 		font-size: 20px;
 		font-weight: 500;
 		background: white;
 		border: 1px solid;
 		border-color: black;
 		position: relative;">
<input type="reset" value="Resetear" name="reset"
style="color: black;
 		font-size: 20px;
 		font-weight: 500;
 		background: white;
 		border: 1px solid;
 		border-color: black;
 		position: relative;">
</form>
<form method="get" action="principal.jsp">
<input type="submit" value="Volver" 
style="margin-left:11%;
color: black;
 		font-size: 20px;
 		font-weight: 500;
 		background: white;
 		border: 1px solid;
 		border-color: black;
 		position: relative"/>
</form>
</p>
</td>
</tr>
</table>


<%}

rs.close();	
con.close();

}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>

</body>
</html>
