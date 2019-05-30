<%-- JSP que confirma que el vehiculo ha sido añadido.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<%
out.println("<style>  h1 {font-family: arial;"
        + " color: white; font-size: 20; text-align:center   }; "
        + "</style>");
out.println("<style>  form {font-family: arial;"
        + " color: blue; font-size: 16; margin-left:45%;  }; "
        + "</style>");
out.println("<style>  b {font-family: arial;"
     + " color: blue; font-size: 16;  }; "
     + "</style>");
out.println("<style>  body {background-image: url('coches.jpg'); background-repeat: no-repeat; background-size: 100% 100%;   }; </style>");
out.println("<style>  table {background-color: #C7CAC7;margin-left:45%; }; </style>");

%>
<%
Connection con = null;
String url = "jdbc:mysql://10.18.124.91:3306/";;
String db = "concesionario";
String driver = "com.mysql.jdbc.Driver";

ResultSet rst=null;
Statement stmt=null;


try{
Class.forName(driver);
con=DriverManager.getConnection("jdbc:mysql://10.18.124.91:3306/concesionario","root","david1234");
try{
Statement st = con.createStatement();
String Matricula=request.getParameter("Matricula");
String NumBastidor=request.getParameter("NumBastidor");
String Color=request.getParameter("Color");
String NumAsientos=request.getParameter("NumAsientos");
String Precio=request.getParameter("Precio");
String NumSerie=request.getParameter("NumSerie");
String carga=request.getParameter("carga");
String tipoMercancia=request.getParameter("tipoMercancia");


int val = st.executeUpdate("INSERT vehiculos "
        + "VALUES(id,'"+Matricula+"','"+NumBastidor+"','"+Color+"','"+NumAsientos+"','"+Precio+"' ,'"+NumSerie+"','En stock')");

stmt=con.createStatement();
rst=stmt.executeQuery("SELECT id from vehiculos where matricula= '"+Matricula+"'");
rst.next();
int id = rst.getInt("id");

int val3 = st.executeUpdate("INSERT camion "
        + "VALUES( '"+id+"', '"+carga+"','"+tipoMercancia+"')");
out.println("<body>");
con.close();
out.println("<h1> El vehiculo con los siguientes datos ha sido añadido correctamente. </h1>");
out.println("<br>");
out.println("<table border=\"1\" margin-left=\"20%\">");
out.println("<tr><td>ID: " +"<b>"+ id +"</b>" + "</td></tr>");
out.println("<tr><td>Matricula: " +"<b>"+ Matricula +"</b>" + "</td></tr>");
out.println("<tr><td>Bastidor: " +"<b>"+ NumBastidor +"</b>" + "</td></tr>");
out.println("<tr><td>Color: " +"<b>"+ Color +"</b>" + "</td></tr>");
out.println("<tr><td>Asientos: " +"<b>"+ NumAsientos +"</b>" + "</td></tr>");
out.println("<tr><td>Precio: " +"<b>"+ Precio +"</b>" + "</td></tr>");
out.println("<tr><td>Serie: " +"<b>"+ NumSerie +"</b>" + "</td></tr>");
out.println("<tr><td>Carga: " +"<b>"+ carga +"</b>" + "</td></tr>");
out.println("<tr><td>Mercancia: " +"<b>"+ tipoMercancia +"</b>" + "</td></tr>");
out.println("<br>");
out.println("</table>");
out.println("<br>");
out.println("<form method='get' action='principal.jsp'>");
out.println("<input type='submit' value='Volver a la pagina principal'>");
out.println("</form>");
out.println("</body>");
}

catch (SQLException ex){
System.out.println(ex.getMessage());
}
}
catch (Exception e){
e.printStackTrace();
}

%>
