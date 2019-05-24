<%-- JSP principal del concesionario.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*"%>

<head><title>CONCESIONARIO AMD</title>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<style>
	body {
 		background-image: url("coches.jpg");
 		background-repeat: no-repeat;
 		background-size: 100% 100%;
	}
    h1 {
        text-align:center;
        font-family: 'Fredoka One', cursive;
        color:black;
        border: solid black 2px;
        background-color:white;
        width:40%;
       
       }
   table{
   		margin: auto;
   		margin-top: 5%;
   		width: 1100px;
   		height:80px;
   		text-align:center;
   }
   td{	
   		border: solid black 1px;
   		width: 150px;
   		height: 25px;
   }
   input {
 		color: black;
 		font-size: 20px;
 		font-weight: 500;
  		padding: 0.5em 1.2em;
 		background: white;
 		border: 2px solid;
 		border-color: black;
 		transition: all 0.5s ease;
 		position: relative;
}
  input:hover {
 		background: black;
  		color: white;
}
   
</style>    

<body>

<div align="center">
    <br>
  
    <h1>CONCESIONARIO A.M.D</h1>
  
    <br>
    <div align="left">

<form method="get" action="añadir.jsp" style="margin-left:12.65%; float: left">
<input type="submit" value="AÑADIR" />
</form>

<form method="get" action="historico.jsp" style="margin-right:12.65%; float: right">
<input type="submit" value="HISTORIAL" />
</form>
<br>
<table id ="table" cellPadding="0" cellSpacing="0">
<tbody>
<td bgColor="grey"><font color="white"><b>CODIGO</b></font></td>
<td bgColor="grey"><font color="white"><b>MATRICULA</b></font></td>
<td bgColor="grey"><font color="white"><b>Nº BASTIDOR</b></font></td>
<td bgColor="grey"><font color="white"><b><a href="filtrarColor.jsp" text-decoration= "none" color="black"> COLOR </a></b></font></td>
<td bgColor="grey"><font color="white"><b>Nº ASIENTOS</b></font></td>
<td bgColor="grey"><font color="white"><b>PRECIO</b></font></td>
<td bgColor="grey"><font color="white"><b>Nº SERIE</b></font></td>
<td bgColor="grey"><font color="white"><b>STOCK</b></font></td>
<td bgColor="grey"><font color="white"><b>PINTAR</b></font></td>
<td bgColor="grey"><font color="white"><b>ELIMINAR</b></font></td>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER).newInstance();
Connection con=null;
ResultSet rst=null;
Statement stmt=null;
try{
  

con=DriverManager.getConnection("jdbc:mysql://10.18.124.91:3306/concesionario","root","david1234");
stmt=con.createStatement();
rst=stmt.executeQuery("SELECT * FROM vehiculos");
while(rst.next()){


%>


<tr>
<td bgColor="lightgrey"><%=rst.getString(1)%></td>
<td bgColor="lightgrey"><%=rst.getString(2)%></td>
<td bgColor="lightgrey"><%=rst.getString(3)%></td>
<td bgColor="lightgrey"><%=rst.getString(4)%></td>
<td bgColor="lightgrey"><%=rst.getString(5)%></td>
<td bgColor="lightgrey"><%=rst.getString(6)%> &euro;</td>
<td bgColor="lightgrey">
	<a href="serie.jsp?numSerie=<%=rst.getInt("numSerie")%>"><%=rst.getString(7)%></a></td>
<td bgColor="lightgrey"><%=rst.getString(8)%></td>	
<td bgColor="lightgrey">
    <a href="editar.jsp?id=<%=rst.getInt("id")%>"> Pintar </a></td>
<td bgColor="lightgrey">
    <a href="eliminar.jsp?id=<%=rst.getInt("id")%>"> Eliminar </a></td>
</tr>
<%
}
rst.close();
stmt.close();
con.close();
}catch(Exception e){
System.out.println(e.getMessage());
}
%>
</tbody>
</table>
</center>
</div>
</body>


