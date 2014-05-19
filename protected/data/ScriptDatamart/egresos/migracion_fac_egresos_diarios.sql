DROP PROCEDURE IF EXISTS migracion_fac_egresos_diarios;
delimiter //
CREATE PROCEDURE migracion_fac_egresos_diarios()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( t.fecha ) FROM DatamartEgresos.fac_egresos_diarios egre JOIN  DatamartEgresos.dim_tiempo t ON (t.id_fecha = egre.fecha_egreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
    ELSE
        SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY);
    END IF;
   CALL migracion_fac_egresos_diarios_process(@fi);
END;//
delimiter ;

CALL migracion_fac_egresos_diarios();


DROP PROCEDURE IF EXISTS migracion_fac_egresos_diarios_process;
delimiter //
CREATE PROCEDURE migracion_fac_egresos_diarios_process(IN fechafi DATE)
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_egreso INT;
   DECLARE id_tp_egreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_egresos CURSOR FOR SELECT SUM( valor_egresos ) total , usuario_id, fecha_egreso,tipo_egreso_id FROM IngresoEgresos.egresos WHERE fecha_egreso BETWEEN DATE_FORMAT(fechafi,  '%Y-%m-%d' ) AND DATE_FORMAT(now(),  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_egreso;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_egresos;

    REPEAT
        FETCH c_egresos INTO total,id,f,id_egreso;
    IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartEgresos.dim_tiempo WHERE `fecha` = f LIMIT 1);
        SET id_tp_egreso = (SELECT MAX(id_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso WHERE cod_tipo_egreso = id_egreso LIMIT 1);
        INSERT INTO DatamartEgresos.fac_egresos_diarios (id_persona,fecha_egreso,id_tipo_egreso,total_egreso_dia) VALUE(id,fecha_id,id_tp_egreso,total);
    END IF;    
    UNTIL done END REPEAT;   
    CLOSE c_egresos;
    SELECT  fechafi;
    END; //
delimiter ;