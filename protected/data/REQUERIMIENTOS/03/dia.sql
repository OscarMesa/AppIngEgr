-----------------------------------------------
-- Función que invoca el procedimiento
-----------------------------------------------
DROP FUNCTION IF EXISTS saldoDia;
DELIMITER //

CREATE FUNCTION saldoDia(usuario INT(5)) RETURNS DOUBLE
BEGIN
  DECLARE fecha_menor DATE;
	-- DECLARE saldo_dia DOUBLE;

	SET fecha_menor = (SELECT MIN(t.fecha)
											FROM datamartingresos.fac_ingresos_diarios fac 
											INNER JOIN datamartingresos.dim_tiempo t ON fac.fecha_ingreso = t.id_fecha AND fac.id_persona = usuario
										LIMIT 1);	
	CALL saldoDiaRecursiva(fecha_menor, NOW(), usuario, @saldo_dia);
  RETURN @saldo_dia;
END;
//

-----------------------------------------------
-- Procedimiento
-----------------------------------------------
DROP PROCEDURE IF EXISTS saldoDiaRecursiva;
DELIMITER //
CREATE PROCEDURE saldoDiaRecursiva(IN fecha_menor DATE, IN fecha_actual DATE, IN usuario INT(5), OUT saldo_dia DOUBLE)
BEGIN
	DECLARE	ingresos_dia DOUBLE;
	DECLARE	egresos_dia DOUBLE;
	SET saldo_dia = 0;
	WHILE fecha_menor <= fecha_actual DO 
		

		SET ingresos_dia = (SELECT fac.total_ingreso_dia 
													FROM datamartingresos.dim_tiempo t 
													INNER JOIN datamartingresos.fac_ingresos_diarios fac ON t.id_fecha = fac.fecha_ingreso
													WHERE t.fecha = fecha_menor  AND fac.id_persona = usuario
													LIMIT 1);
		IF ingresos_dia IS NULL THEN
			SET ingresos_dia = 0;
		END IF;

		SET egresos_dia  = (SELECT fac.total_egreso_dia 
													FROM datamartegresos.dim_tiempo t 
													INNER JOIN datamartegresos.fac_egresos_diarios fac ON t.id_fecha = fac.fecha_egreso
													WHERE t.fecha = fecha_menor  AND fac.id_persona = usuario
													LIMIT 1);
		IF egresos_dia IS NULL  THEN
			SET egresos_dia = 0;
		END IF;

		SET saldo_dia = saldo_dia + ingresos_dia - egresos_dia;		
		SET fecha_menor = DATE_ADD(fecha_menor,INTERVAL 1 DAY);
	END WHILE;
END
//