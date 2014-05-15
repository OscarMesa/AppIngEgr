DROP PROCEDURE IF EXISTS migracion_fac_ingresos_diarios;
delimiter //
CREATE PROCEDURE migracion_fac_ingresos_diarios()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( t.fecha ) FROM DatamartIngresos.fac_ingresos_diarios ingre JOIN  DatamartIngresos.dim_tiempo t ON (t.id_fecha = ingre.fecha_ingreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @fi;
    ELSE
        @fi = DATE_ADD(@fi, INTERVAL 1 DAY);
    END IF;
   CALL migracion_fac_ingresos_diarios_process(@fi);
END;//
delimiter ;

CALL migracion_fac_ingresos_diarios();


DROP PROCEDURE IF EXISTS migracion_fac_ingresos_diarios_process;

delimiter //
CREATE PROCEDURE migracion_fac_ingresos_diarios_process(IN fechafi DATE)
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_ingreso INT;
   DECLARE id_tp_ingreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_ingresos CURSOR FOR SELECT SUM( valor_ingreso ) total , usuario_id, fecha_ingreso,tipo_ingreso_id FROM IngresoEgresos.ingresos WHERE fecha_ingreso BETWEEN DATE_FORMAT(fechafi,  '%Y-%m-%d' ) AND DATE_FORMAT(now(),  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_ingreso;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_ingresos;

    REPEAT
        FETCH c_ingresos INTO total,id,f,id_ingreso;
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartIngresos.dim_tiempo WHERE `fecha` = f LIMIT 1);
        SET id_tp_ingreso = (SELECT MAX(id_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso WHERE cod_tipo_ingreso = id_ingreso LIMIT 1);
        INSERT INTO DatamartIngresos.fac_ingresos_diarios (id_persona,fecha_ingreso,id_tipo_ingreso,total_ingreso_dia) VALUE(id,fecha_id,id_tp_ingreso,total);
    UNTIL done END REPEAT;   
    CLOSE c_ingresos;
    SELECT  fechafi;
    END; //
delimiter ;