<%-- JSP principal del concesionario.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*"%>

<head><title>CONCESIONARIO MANOLI</title>
</head>
<style>
	body {
 		background-image: url("ruedas.jpg");
 		background-repeat: no-repeat;
 		background-size: 100% 100%;
	}
    h1 {
        text-align:center;
        font-family: arial;
        color:black;
        border: solid black 2px;
        background-color:white;
        width:30%;
       
       }
   table{
   		margin: auto;
   		width: 920px;
   		height:80px;
   		text-align:center;
   }
   td{	
   		border: solid black 1px;
   		width: 150px;
   		height: 25px;
   		
   }
   form{
   		margin-left: 5%;
   }
   
</style>    

<body>

<div align="center">
    <br>
  
    <h1>CONCESIONARIO MANOLI</h1>
  
    <br>
    <div align="left">

<form method="get" action="añadir.jsp">
<input type="submit" value="AÑADIR" />
</form>
<br>
<table cellPadding="0" cellSpacing="0">
<tbody>
<td bgColor="grey"><font color="white"><b>CODIGO</b></font></td>
<td bgColor="grey"><font color="white"><b>MATRICULA</b></font></td>
<td bgColor="grey"><font color="white"><b>Nº BASTIDOR</b></font></td>
<td bgColor="grey"><font color="white"><b>COLOR</b></font></td>
<td bgColor="grey"><font color="white"><b>Nº ASIENTOS</b></font></td>
<td bgColor="grey"><font color="white"><b>PRECIO</b></font></td>
<td bgColor="grey"><font color="white"><b>Nº SERIE</b></font></td>
<td bgColor="grey"><font color="white"><b>EDITAR</b></font></td>
<td bgColor="grey"><font color="white"><b>ELIMINAR</b></font></td>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER).newInstance();
Connection con=null;
ResultSet rst=null;
Statement stmt=null;
try{
  
int i=1;
con=DriverManager.getConnection("jdbc:mysql://10.18.124.90:3306/concesionario","root","david1234");
stmt=con.createStatement();
rst=stmt.executeQuery("SELECT * FROM vehiculos");
while(rst.next()){

if (i==(i/2)*2){
%>
<tr>
<td bgColor="lightgrey"><%=i%></td>
<td bgColor="lightgrey"><%=rst.getString(2)%></td>
<td bgColor="lightgrey"><%=rst.getString(3)%></td>
<td bgColor="lightgrey"><%=rst.getString(4)%></td>
<td bgColor="lightgrey"><%=rst.getString(5)%></td>
<td bgColor="lightgrey"><%=rst.getString(6)%></td>
<td bgColor="lightgrey"><%=rst.getString(7)%></td>
<td bgColor="lightgrey">
    <a href="editar.jsp?id=<%=rst.getInt("id")%>"> Editar </a></td>
<td bgColor="lightgrey">
    <a href="eliminar.jsp?id=<%=rst.getInt("id")%>"> Eliminar </a></td>
</tr>
<%
}else{
%>
<tr>
<td bgColor="lightgrey"><%=i%></td>
<td bgColor="lightgrey"><%=rst.getString(2)%></td>
<td bgColor="lightgrey"><%=rst.getString(3)%></td>
<td bgColor="lightgrey"><%=rst.getString(4)%></td>
<td bgColor="lightgrey"><%=rst.getString(5)%></td>
<td bgColor="lightgrey"><%=rst.getString(6)%></td>
<td bgColor="lightgrey"><%=rst.getString(7)%></td>
<td bgColor="lightgrey">
    <a href="editar.jsp?id=<%=rst.getInt("id")%>"> Editar </a></td>
<td bgColor="lightgrey">
    <a href="eliminar.jsp?id=<%=rst.getInt("id")%>"> Eliminar </a></td>
</tr>
<%	}

i++;
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
