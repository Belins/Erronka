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
   
   
</style>
<body>

<% 
String strId =request.getParameter("numSerie");
int numSerie = Integer.parseInt(strId);
Connection con = null;
String url = "jdbc:mysql://10.18.124.90:3306/";;
String db = "concesionario";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"root","david1234");
try{
Statement st = con.createStatement();
String query = "SELECT numSerie, Marca, Modelo, Año_de_Fabricacion FROM serie WHERE numSerie='"+numSerie+"'";
ResultSet rs = st.executeQuery(query);
while (rs.next()) {
%>


<table border="1" width="40%">
<tr>
<td width="100%">
<h2 align="center">SERIE DEL VEHICULO</h2>
<table  width="80%" >

<tr>
<td width="50%"><b>Nº SERIE:</b></td>
<td width="50%"><input type="text" name="NumSerie" value="<%=rs.getString("numSerie")%>" size="20" readonly/> </td>
</tr>
<tr>
<td width="50%"><b>MARCA:</b></td>
<td width="50%"><input type="text" name="Marca" value="<%=rs.getString("Marca")%>" size="20" readonly/></td>
</tr>
<tr>
<td width="50%"><b>MODELO:</b></td>
<td width="50%"><input type="text" name="Modelo" value="<%=rs.getString("Modelo")%>" size="20" readonly></td>
</tr>
<tr>
<td width="50%"><b>AÑO FABRICACION:</b></td>
<td width="50%"><input type="text" name="Año_Fabricacion" value="<%=rs.getString("Año_de_Fabricacion")%>" size="20" dreadonly/> </td>
</tr>
</table>
<form method="get" action="principal.jsp">
<input type="submit" value="Volver" 
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