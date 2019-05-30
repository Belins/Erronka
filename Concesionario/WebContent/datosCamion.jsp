<%-- JSP para editar vehiculos.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>

<head>
<title>Datos</title>
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
String query = "SELECT id, carga, tipoMercancia FROM camion WHERE id='"+id+"'";
ResultSet rs = st.executeQuery(query);


while (rs.next()) {
%>

<table border="1" width="40%">
<tr>
<td width="100%">
<h2 align="center">CAMION</h2>
	<table  width="80%" >

<tr>
<td width="50%"><b>ID:</b></td>
<td width="50%"><input type="text" name="id" value="<%=rs.getString("id")%>" size="20" readonly/> </td>
</tr>
<tr>
<td width="50%"><b>CARGA:</b></td>
<td width="50%"><input type="text" name="carga" value="<%=rs.getString("carga")%>" size="20" readonly/></td>
</tr>
<tr>
<td width="50%"><b>TIPO MERCANCIA:</b></td>
<td width="50%"><input type="text" name="tipoMercancia" value="<%=rs.getString("tipoMercancia")%>" size="20" readonly></td>
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
		 		margin-top:50%"/>
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