-----------------------------------------------
-- Función que invoca el procedimiento
-----------------------------------------------
DROP FUNCTION IF EXISTS saldoMes;
DELIMITER //

CREATE FUNCTION saldoMes(usuario INT(5)) RETURNS DOUBLE
BEGIN
  DECLARE fecha_menor DATE;

	SET fecha_menor = (SELECT MIN(t.fecha)
											FROM datamartingresos.agr_ingresos_mensuales agr 
											INNER JOIN datamartingresos.dim_tiempo t ON agr.fecha_ingreso = t.id_fecha AND agr.id_persona = usuario
										LIMIT 1);	
	CALL saldoMesRecursiva(fecha_menor, NOW(), usuario, @saldo_mes);
  RETURN @saldo_mes;
END;
//

-----------------------------------------------
-- Procedimiento
-----------------------------------------------
DROP PROCEDURE IF EXISTS saldoMesRecursiva;
DELIMITER //
CREATE PROCEDURE saldoMesRecursiva(IN fecha_menor DATE, IN fecha_actual DATE, IN usuario INT(5), OUT saldo_mes DOUBLE)
BEGIN
	DECLARE	ingresos_mes DOUBLE;
	DECLARE	egresos_mes DOUBLE;
	SET saldo_mes = 0;
	WHILE fecha_menor <= fecha_actual DO 
		

		SET ingresos_mes = (SELECT agm.total_ingreso_mensuale
													FROM datamartingresos.dim_tiempo t 
													INNER JOIN datamartingresos.agr_ingresos_mensuales agm ON t.id_fecha = agm.fecha_ingreso
													WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha_menor)  AND agm.id_persona = usuario
													LIMIT 1);
		IF ingresos_mes IS NULL THEN
			SET ingresos_mes = 0;
		END IF;

		SET egresos_mes  = (SELECT egm.total_egreso_mensuale
													FROM datamartegresos.dim_tiempo t 
													INNER JOIN datamartegresos.agr_egresos_mensuales egm ON t.id_fecha = egm.fecha_egreso
													WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha_menor)  AND egm.id_persona = usuario
													LIMIT 1);
		IF egresos_mes IS NULL  THEN
			SET egresos_mes = 0;
		END IF;

		SET saldo_mes = saldo_mes + ingresos_mes - egresos_mes;		
		SET fecha_menor = DATE_ADD(fecha_menor,INTERVAL 1 MONTH);
	END WHILE;
END
//