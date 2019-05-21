delimiter $$
CREATE TRIGGER concesionario.vehiculo
AFTER INSERT ON vehiculos
FOR EACH ROW
BEGIN
  INSERT INTO historico (fecha_operacion, operacion, id, Matricula, NumBastidor, Color, NumAsientos, Precio, numSerie )
      values (NOW(), "Comprado", NEW.id, NEW.Matricula, NEW.NumBastidor, NEW.Color, NEW.NumAsientos, NEW.Precio, NEW.numSerie);
END$$
delimiter ;

delimiter $$
CREATE TRIGGER concesionario.venta
before DELETE ON vehiculos
FOR EACH ROW
BEGIN
  INSERT INTO historico (fecha_operacion, operacion, id, Matricula, NumBastidor, Color, NumAsientos, Precio, numSerie)
      values (NOW(), "Vendido", old.Matricula, old.id, old.NumBastidor, old.Color, old.NumAsientos, old.Precio, old.numSerie);
END$$
delimiter ;

INSERT INTO Vehiculos VALUES (14,"0478 VNI", "4V4SC9GF47N419977", "Blanco", 5, 18000, 113);
select * from historico;
DROP TRIGGER IF EXISTS concesionario.venta;
show triggers;