<%-- JSP que confirma actualización de vehiculo.
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
String Matricula=request.getParameter("Matricula");
String NumBastidor=request.getParameter("NumBastidor");
String Color=request.getParameter("Color");
String NumAsientos=request.getParameter("NumAsientos");
String Precio=request.getParameter("Precio");
String NumSerie=request.getParameter("NumSerie");
int in = st.executeUpdate("UPDATE vehiculos SET Matricula='"+Matricula+"'"
        + ",NumBastidor='"+NumBastidor+"',Color='"+Color+"' "
        + ",NumAsientos='"+NumAsientos+"',Precio='"+Precio+"' "
        + ",NumSerie='"+NumSerie+"',WHERE id='"+id+"'");
con.close();
out.println("<p> El vehiculo " +"<b>"+ Matricula +"</b>" + " ha sido actualizado. </p>");
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

