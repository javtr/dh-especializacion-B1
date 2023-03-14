DROP PROCEDURE IF EXISTS mySP;

DELIMITER $$
	CREATE PROCEDURE mySP()
    BEGIN
    
		DECLARE var_final INTEGER DEFAULT 0;
        DECLARE var_column1 INTEGER;
        
		DECLARE cursor1 CURSOR FOR SELECT id FROM empleados;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

		OPEN cursor1;
			bucle: LOOP
			FETCH cursor1 INTO var_column1;
            
			IF var_final = 1 THEN
			  LEAVE bucle;
			END IF;

			SELECT * FROM empleados
            WHERE var_column1 = empleados.id
            ;

			END LOOP bucle;
		CLOSE cursor1;
    
    END $$
DELIMITER ;


CALL mySP();