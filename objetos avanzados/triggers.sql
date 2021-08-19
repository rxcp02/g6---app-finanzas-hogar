DROP TRIGGER IF EXISTS insertar_cuenta;
DELIMITER $$
CREATE TRIGGER insertar_cuenta BEFORE INSERT ON cuenta FOR EACH ROW
BEGIN
IF (SELECT new.numeroCuenta IN (SELECT numeroCuenta FROM cuenta)) THEN
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'NUMERO DE CUENTA YA EXISTE';
END IF;
END $$ DELIMITER ;

DROP TRIGGER IF EXISTS crear_respaldo;
DELIMITER $$
CREATE TRIGGER crear_respaldo BEFORE INSERT ON respaldo FOR EACH ROW
BEGIN
IF (new.fechaInicio > new.fechaFin) THEN
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'LAS FECHAS INGRESADAS NO SON CORRECTAS';
END IF;
END $$ DELIMITER ;

