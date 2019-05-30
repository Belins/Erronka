<%-- JSP para editar vehiculos.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>

<head>
<title>Confirmar Venta</title>
</head>
<style>
 body {
 		background-image: url("coches.jpg");
 		background-repeat: no-repeat;
 		background-size: 100% 100%;º
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
Statement st2 = con.createStatement();
String query = "SELECT * FROM vehiculos WHERE id='"+id+"'";
ResultSet rs = st2.executeQuery(query);
	while (rs.next()) {
		%>


		<table border="1" width="40%">
		<tr>
		<td width="100%">
		<h2 align="center">CONFIRMACION DE VENTA</h2>
		<table  width="80%" >

		<tr>
		<td width="50%"><b>CODIGO:</b></td>
		<td width="50%"><input type="text" name="codigo" value="<%=rs.getString(1)%>" size="20" readonly/> </td>
		</tr>
		<tr>
		<td width="50%"><b>MATRICULA:</b></td>
		<td width="50%"><input type="text" name="matricula" value="<%=rs.getString(2)%>" size="20" readonly/></td>
		</tr>
		<tr>
		<td width="50%"><b>Nº BASTIDOR:</b></td>
		<td width="50%"><input type="text" name="numBastidor" value="<%=rs.getString(3)%>" size="20" readonly></td>
		</tr>
		<tr>
		<td width="50%"><b>COLOR:</b></td>
		<td width="50%"><input type="text" name="color" value="<%=rs.getString(4)%>" size="20" dreadonly/> </td>
		</tr>
		<tr>
		<td width="50%"><b>Nº ASIENTOS:</b></td>
		<td width="50%"><input type="text" name="numAsientos" value="<%=rs.getString(5)%>" size="20" dreadonly/> </td>
		</tr>
		<tr>
		<td width="50%"><b>PRECIO:</b></td>
		<td width="50%"><input type="text" name="precio" value="<%=rs.getString(6)%>" size="20" dreadonly/> </td>
		</tr>
		</table>
		<form method="get" action="principal.jsp">
		<input type="submit" value="Cancelar" 
		style="margin-left:11%;
		color: black;
		 		font-size: 20px;
		 		font-weight: 500;
		 		background: white;
		 		border: 1px solid;
		 		border-color: black;
		 		position: relative;
		 		margin-bottom:2%;
		 		margin-top:2%"/>
		</form>
		<form method="get" action="informeEliminar.jsp?id=<%=rs.getInt("id")%>">
		<input type="submit" value="Aceptar" 
		style="margin-left:11%;
		color: black;
		 		font-size: 20px;
		 		font-weight: 500;
		 		background: white;
		 		border: 1px solid;
		 		border-color: black;
		 		position: relative;
		 		margin-bottom:2%;
		 		margin-top:2%"/>
		</form>

		</td>
		</tr>
		</table>


<%}
	
	rs.close();	
	con.close();
}
catch (SQLException ex2){
System.out.println(ex2.getMessage());
}



}
catch (Exception e){
e.printStackTrace();
}
%>

</body>
</html>