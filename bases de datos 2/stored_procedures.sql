DROP FUNCTION IF EXISTS facturas_por_cliente;
DELIMITER $$
CREATE FUNCTION facturas_por_cliente (clienteID INT, fechaIni VARCHAR(20), fechaFin VARCHAR(20)) RETURNS FLOAT
DETERMINISTIC
	BEGIN
    
    DECLARE totalSalida FLOAT;
    
    SELECT SUM(total) INTO totalSalida FROM facturas f
	WHERE f.id_cliente = clienteID AND
	f.fecha_factura BETWEEN fechaIni AND fechaFin;
    
	RETURN totalSalida;
    
	END $$
DELIMITER ;

USE musimundos;
SELECT facturas_por_cliente (5,'2010-02-11','2010-02-11');

DROP PROCEDURE IF EXISTS facturacion_cliente;
DELIMITER $$
	CREATE PROCEDURE facturacion_cliente(IN fecha_inicio DATE, IN fecha_fin DATE)
    BEGIN
		SELECT c.id, 
			CASE  
			WHEN facturas_por_cliente(c.id, fecha_inicio, fecha_fin) IS NULL THEN "Sin Datos"
			WHEN facturas_por_cliente(c.id, fecha_inicio, fecha_fin) = 0 THEN "Sin Datos"
			ELSE facturas_por_cliente(c.id, fecha_inicio, fecha_fin)
			END AS 'total'
        FROM clientes AS c
        GROUP BY c.id
        ;
    END $$
DELIMITER ;

CALL facturacion_cliente('2010-02-01','2010-02-11');

