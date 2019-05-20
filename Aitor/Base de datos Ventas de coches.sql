-- Creamos la Base de Datos.

create database vehiculos;
use vehiculos;

-- Creacion de tablas
CREATE TABLE Serie
 (
   numSerie 	integer(10) NOT NULL ,
   Marca 		varchar(30),
   Modelo 		varchar(30),
   Año_de_Fabricacion		int(4)
 ) ;
 
 CREATE TABLE Vehiculos
 (
   CodVehiculo 		integer(10) NOT NULL ,
   Matricula 		varchar(30),
   NumBastidor 		varchar(30),
   Color			int(4),
   NumAsientos		int(2),
   Precio			float,
   Serie			integer(10)
 ) ;

-- Insertar datos
INSERT INTO Serie VALUES (, '', '', );