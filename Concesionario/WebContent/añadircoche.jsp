<%-- JSP para a�adir vehiculos al concesionario.
		Hecho por:
		Manex Arroitaonandia, David Belinchon y Aitor Ortiz de Zarate
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>
<head>
<title>A�adir  </title>
</head>
<body>
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
   	td{
   		width:50%;
   	}
   
</style>


<table border="1" width="50%">
<tr>
<td>
<form method="POST" action="guardarcoche.jsp">

<h2 align="center">A�ADIR VEHICULO</h2>
		
		<table  width="15%">
			<tr>
			<td><b>Matricula:</b></td>
			<td><input type="text" name="Matricula" size="50"/> </td>
			</tr>
			<tr>
			<td><b>Bastidor:</b></td>
			<td><input type="text" name="NumBastidor" size="50"></td>
			</tr>
			<tr>
			<td><b>Color:</b></td>
			<td><input type="text" name="Color" size="50"></td>
			</tr>
			<tr>
			<td><b>NumAsientos:</b></td>
			<td><input type="text" name="NumAsientos" size="50"></td>
			</tr>
			<tr>
			<td><b>Precio:</b></td>
			<td><input type="text" name="Precio" size="50"></td>
			</tr>
			<tr>
			<td><b>NumSerie:</b></td>
			<td><input type="text" name="NumSerie" size="50"></td>
			</tr>
			<td><b>numPuertas:</b></td>
			<td><input type="text" name="numPuertas" size="50"></td>
			</tr>
			<td><b>capacidadMaletero:</b></td>
			<td><input type="text" name="capacidadMaletero" size="50"></td>
			</tr>
		
		
		</table>
		
		
<p align="center"><input type="submit" value="A�adir" name="Submit"
style="color: black;
 		font-size: 20px;
 		font-weight: 500;
 		background: white;
 		border: 1px solid;
 		border-color: black;
 		position: relative;">
<input type="reset" value="Restablecer" name="Reset"
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
 		position: relative;"/>
</form>
</p>
</td>
</tr>
</table>


</body>
</html>
