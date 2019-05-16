<%-- list.java
     Written By: Mr. Jake R. Pomperada, MAED-IT
     Date : July 17, 2015, Friday
     Tools: JSP and MySQL
            mysql-connecter-java-5.1.13-bin.jar
            netbeans ide 8.0.2
--%>
<%@ page language="java" import="java.sql.*"%>

<head><title>CONCESIONARIO MANOLI</title>
</head>
<style>
    h1 {
        text-align:center;
        font-family: arial;
        color: black;
        font-size:34px;
       }
    
	td{background-color:lightgrey;}
	form{margin-left:5%}
</style>    

<body>

<div align="center" width="200%">
    <br>
    <h1>CONCESIONARIO MANOLI</h1>
    <br>
    <div align="left" width="200%">
   
   <form action="añadir.jsp">
    <input type="submit" value="Añadir" />
	</form>
<br>
<table text align="center" border="2" borderColor="black" cellPadding="0" cellSpacing="0" width="920" height="80">
<tbody>
<td align="center"><b>Posición</b></td>
<td align="center"><b>NOMBRE</b></td>
<td align="center"><b>GRUPO</b></td>
<td align="center"><b>VEHICULO</b></td>
<td align="center"><b>ACTIONS</b></td>
<td align="center"><b>TAKEN</b></td>
<%
String DRIVER = "com.mysql.jdbc.Driver";
Class.forName(DRIVER).newInstance();
Connection con=null;
ResultSet rst=null;
Statement stmt=null;
try{
  
int i=1;
con=DriverManager.getConnection("jdbc:mysql://10.18.124.90/users","root","david1234");
stmt=con.createStatement();
rst=stmt.executeQuery("SELECT * FROM student_info ORDER BY name ASC ");
while(rst.next()){

if (i==(i/2)*2){
%>
<tr>
<td align="center"><%=i%></td>
<td><%=rst.getString(2)%></td>
<td><%=rst.getString(3)%></td>
<td><%=rst.getString(4)%></td>
<td>
    <a href="edit.jsp?id=<%=rst.getInt("id")%>"> Editar </a></td>
<td>
    <a href="delete.jsp?id=<%=rst.getInt("id")%>"> Eliminar </a></td>
</tr>
<%
}else{
%>
<tr>
<td align="center"><%=i%></td>
<td><%=rst.getString(2)%></td>
<td><%=rst.getString(3)%></td>
<td><%=rst.getString(4)%></td>
<td>
    <a href="edit.jsp?id=<%=rst.getInt("id")%>"> Editar </a></td>
<td>
    <a href="delete.jsp?id=<%=rst.getInt("id")%>"> Eliminar </a></td>
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
