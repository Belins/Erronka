Drop database concesionario;
Create database concesionario;
Use concesionario;
-- Creacion de tablas
CREATE TABLE Serie
 (
   numSerie 	integer(10) NOT NULL ,
   Marca 		varchar(30),
   Modelo 		varchar(30),
   Año_de_Fabricacion		int(4),
   PRIMARY KEY (numSerie)
 ) ;
 
 CREATE TABLE Vehiculos
 (
   id 		integer NOT NULL auto_increment,
   Matricula 		varchar(30),
   NumBastidor 		varchar(30),
   Color			varchar(15),
   NumAsientos		int(2),
   Precio			float,
   numSerie			integer(10),
   PRIMARY KEY (id),
   FOREIGN KEY (numSerie) REFERENCES Serie(numSerie)
   ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 
 CREATE TABLE Coche
 (
	 id 		integer(10) NOT NULL auto_increment ,
     numPuertas			integer(1),
     capacidadMaletero	integer(4),
     PRIMARY KEY (id),
     FOREIGN KEY (id) REFERENCES Vehiculos(id)
     ON DELETE CASCADE ON UPDATE CASCADE
 
 ) ;
 
  CREATE TABLE Camion
 (
	 id 		integer(10) NOT NULL auto_increment,
     carga				integer(5),
     tipoMercancia		ENUM('G','A','P'),
     PRIMARY KEY (id),
     FOREIGN KEY (id) REFERENCES Vehiculos(id)
     ON DELETE CASCADE ON UPDATE CASCADE
 
 ) ;
 
 CREATE TABLE Historico
 (
	fecha_operacion date,
	cod_historico  integer(10) NOT NULL auto_increment,
	operacion		ENUM('Comprado', 'Pintado', 'Vendido'),
    nuevo_color varchar(20),
	id 			integer,
	Matricula 		varchar(30),
	NumBastidor 		varchar(30),
	Color			varchar(15),
	NumAsientos		int(2),
	Precio			float,
	numSerie			integer(10),
    PRIMARY KEY (cod_historico),
    FOREIGN KEY (id) REFERENCES Vehiculos(id)
     ON DELETE CASCADE ON UPDATE CASCADE
 );
 

-- Insertar datos
INSERT INTO Serie VALUES (100, "bmw", "serie 3", 2000);
INSERT INTO Serie VALUES (101, "Ford", "fiesta", 1992);
INSERT INTO Serie VALUES (102, "Volkswagen", "Golf", 2004);
INSERT INTO Serie VALUES (103, "Seat", "Ibiza", 2009);
INSERT INTO Serie VALUES (104, "Ford", "Focus", 2015);
INSERT INTO Serie VALUES (105, "Peugeot", "206", 2004);
INSERT INTO Serie VALUES (106, "Honda", "Civic", 1996);
INSERT INTO Serie VALUES (107, "Renautlt", "Clio", 2012);
INSERT INTO Serie VALUES (108, "Opel", "Astra", 2003);
INSERT INTO Serie VALUES (109, "Opel", "Kadett", 1993);
INSERT INTO Serie VALUES (110, "bmw", "520", 2007);
INSERT INTO Serie VALUES (111, "Citroen", "Saxo", 2000);
INSERT INTO Serie VALUES (112, "Ford", "Sierra", 1992);
INSERT INTO Serie VALUES (113, "Mercedes", "Actros", 2007);
INSERT INTO Serie VALUES (114, "Ford", "Cargo", 2002);

INSERT INTO Vehiculos VALUES (1, "1966 YUD", "1GCNKSEA7DZ285987", "Azul", 5, 3000, 103);
INSERT INTO Vehiculos VALUES (2,"8691 GUM", "JH4CU2F52DC837058", "Rojo", 5, 2500, 101);
INSERT INTO Vehiculos VALUES (3,"8972 FSR", "JF2SHCEC7DH478396", "Verde", 5, 1500, 105);
INSERT INTO Vehiculos VALUES (4,"5683 FUD", "JY4AJ38W89C067483", "Blanco", 5, 3500, 106);
INSERT INTO Vehiculos VALUES (5,"4428 QTI", "1GBGC24U51Z377830", "Rojo", 5, 2000, 112);
INSERT INTO Vehiculos VALUES (6,"0001 MHK", "1XKDDU8X76J111330", "Negro", 5, 3000, 110);
INSERT INTO Vehiculos VALUES (7,"1529 MAU", "1FUYFDYB2YDF16875", "Amarillo", 5, 1200, 108);
INSERT INTO Vehiculos VALUES (8,"7579 WUI", "2GCEC19W011424794", "Azul", 2, 4000, 109);
INSERT INTO Vehiculos VALUES (9,"8781 JGF", "2C4GP74L41R485497", "Gris", 5, 4000, 100);
INSERT INTO Vehiculos VALUES (10,"6086 UAW", "JS2RC62H465339589", "Gris", 3, 10000, 113);
INSERT INTO Vehiculos VALUES (11,"0358 XDX", "ZFFXC26A0H0003270", "Blanco", 3, 14000, 114);
INSERT INTO Vehiculos VALUES (12,"3856 SBD", "KM8SC73D35U810516", "Negro", 4, 20000, 114);
INSERT INTO Vehiculos VALUES (13,"0478 VNI", "4V4MC9GF47N419977", "Blanco", 5, 18000, 113);

INSERT INTO Coche VALUES (1,3, 500);
INSERT INTO Coche VALUES (2,3, 800);
INSERT INTO Coche VALUES (3,3, 700);
INSERT INTO Coche VALUES (4,3, 600);
INSERT INTO Coche VALUES (5,3, 400);
INSERT INTO Coche VALUES (6,5, 550);
INSERT INTO Coche VALUES (7,3, 500);
INSERT INTO Coche VALUES (8,3, 700);
INSERT INTO Coche VALUES (9,5, 1000);

INSERT INTO Camion VALUES (10,18000, "G");
INSERT INTO Camion VALUES (11,15000, "P");
INSERT INTO Camion VALUES (12,23000, "A");
INSERT INTO Camion VALUES (13,16500, "P");


select * from vehiculos;
