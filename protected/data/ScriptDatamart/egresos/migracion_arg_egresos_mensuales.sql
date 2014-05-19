
DROP PROCEDURE IF EXISTS migracion_arg_egresos_mensuales;
delimiter //
CREATE PROCEDURE migracion_arg_egresos_mensuales()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( DATE_FORMAT(t.fecha, "%Y-%m" ) ) FROM DatamartEgresos.agr_egresos_mensuales egre JOIN  DatamartEgresos.dim_tiempo t ON (t.id_fecha = egre.fecha_egreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( DATE_FORMAT(fecha_egreso, "%Y-%m" ) ) FROM IngresoEgresos.egresos INTO @fi;
    ELSE
        SET @fi = DATE_FORMAT(DATE_ADD(@fi, INTERVAL 1 MONTH), "%Y-%m" );
    END IF;
   CALL migracion_arg_egresos_mensuales_process(@fi);
END;//
delimiter ;

CALL migracion_arg_egresos_mensuales();


DROP PROCEDURE IF EXISTS migracion_arg_egresos_mensuales_process;

delimiter //
CREATE PROCEDURE migracion_arg_egresos_mensuales_process(IN fechafi VARCHAR(10))
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_egreso INT;
   DECLARE id_tp_egreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_egresos CURSOR FOR SELECT SUM( valor_egresos ) total , usuario_id, DATE_FORMAT(fecha_egreso,'%Y-%m') fecha_egreso,tipo_egreso_id FROM IngresoEgresos.egresos WHERE fecha_egreso BETWEEN DATE_FORMAT(CONCAT(fechafi,'-01'),  '%Y-%m-%d') AND DATE_FORMAT(CONCAT(DATE_FORMAT(now(),  '%Y-%m' ),'-31'),  '%Y-%m-%d') GROUP BY usuario_id, DATE_FORMAT(fecha_egreso,'%Y-%m');
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_egresos;

    REPEAT
        FETCH c_egresos INTO total,id,f,id_egreso;
IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartEgresos.dim_tiempo WHERE  DATE_FORMAT(fecha,  '%Y-%m') = DATE_FORMAT( CONCAT(f,'-01'), '%Y-%m' ) LIMIT 1);
        SET id_tp_egreso = (SELECT MAX(id_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso WHERE cod_tipo_egreso = id_egreso LIMIT 1);
        INSERT INTO DatamartEgresos.agr_egresos_mensuales (id_persona,fecha_egreso,id_tipo_egreso,total_egreso_mensuale) VALUE(id,fecha_id,id_tp_egreso,total);
END IF;    
UNTIL done END REPEAT;   
    CLOSE c_egresos;
    SELECT  fechafi;
    END; //
delimiter ;