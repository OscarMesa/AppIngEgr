
DROP PROCEDURE IF EXISTS migracion_arg_ingresos_mensuales;
delimiter //
CREATE PROCEDURE migracion_arg_ingresos_mensuales()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( DATE_FORMAT(t.fecha, "%Y-%m" ) ) FROM DatamartIngresos.agr_ingresos_mensuales ingre JOIN  DatamartIngresos.dim_tiempo t ON (t.id_fecha = ingre.fecha_ingreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( DATE_FORMAT(fecha_ingreso, "%Y-%m" ) ) FROM IngresoEgresos.ingresos INTO @fi;
    ELSE
        SET @fi = DATE_FORMAT(DATE_ADD(@fi, INTERVAL 1 MONTH), "%Y-%m" );
    END IF;
   CALL migracion_arg_ingresos_mensuales_process(@fi);
END;//
delimiter ;

CALL migracion_arg_ingresos_mensuales();


DROP PROCEDURE IF EXISTS migracion_arg_ingresos_mensuales_process;

delimiter //
CREATE PROCEDURE migracion_arg_ingresos_mensuales_process(IN fechafi VARCHAR(10))
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_ingreso INT;
   DECLARE id_tp_ingreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_ingresos CURSOR FOR SELECT SUM( valor_ingreso ) total , usuario_id, DATE_FORMAT(fecha_ingreso,'%Y-%m') fecha_ingreso,tipo_ingreso_id FROM IngresoEgresos.ingresos WHERE fecha_ingreso BETWEEN DATE_FORMAT(CONCAT(fechafi,'-01'),  '%Y-%m-%d') AND DATE_FORMAT(CONCAT(DATE_FORMAT(now(),  '%Y-%m' ),'-31'),  '%Y-%m-%d') GROUP BY usuario_id, DATE_FORMAT(fecha_ingreso,'%Y-%m');
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_ingresos;

    REPEAT
        FETCH c_ingresos INTO total,id,f,id_ingreso;
        IF NOT done THEN
            SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartIngresos.dim_tiempo WHERE  DATE_FORMAT(fecha,  '%Y-%m') = DATE_FORMAT( CONCAT(f,'-01'), '%Y-%m' ) LIMIT 1);
            SET id_tp_ingreso = (SELECT MAX(id_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso WHERE cod_tipo_ingreso = id_ingreso LIMIT 1);
            INSERT INTO DatamartIngresos.agr_ingresos_mensuales (id_persona,fecha_ingreso,id_tipo_ingreso,total_ingreso_mensuale) VALUE(id,fecha_id,id_tp_ingreso,total);
        END IF;    
        UNTIL done END REPEAT;   
    CLOSE c_ingresos;
    SELECT  fechafi;
    END; //
delimiter ;