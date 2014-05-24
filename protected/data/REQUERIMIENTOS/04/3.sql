DROP PROCEDURE IF EXISTS saldoDiasHabiles;
DELIMITER //
CREATE PROCEDURE saldoDiasHabiles()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE dia INT;
DECLARE c_dias_habiles INT DEFAULT 0;
DECLARE total_dia DOUBLE;
DECLARE total DOUBLE DEFAULT 0;
DECLARE c_ingresos CURSOR FOR SELECT fac.total_egreso_dia,t.dia_semana FROM datamartEgresos.fac_egresos_diarios fac 
                INNER JOIN datamartEgresos.dim_tiempo t ON (fac.fecha_egreso = t.if_fecha) INNER JOIN IngresoEgresos.usuarios inusummod ON (inusummod.id = t.);
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

OPEN c_ingresos;

REPEAT
        FETCH c_ingresos INTO total_dia,dia;
            IF NOT dia <> 5 AND dia <> 6 THEN
                total = total + total_dia;
                c_dias_habiles = c_dias_habiles + 1;
            END IF;
    UNTIL done END REPEAT;

CLOSE c_ingresos;

SELECT total/c_dias_habiles;

END
//