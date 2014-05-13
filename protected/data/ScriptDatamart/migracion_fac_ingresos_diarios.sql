DROP PROCEDURE IF EXISTS migracion_fac_ingresos_diarios;
delimiter //
CREATE PROCEDURE migracion_fac_ingresos_diarios()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE valor DOUBLE;
    DECLARE done INT DEFAULT 0;
    DECLARE c_ingresos CURSOR;
   -- DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    SELECT MAX( fecha ) FROM DatamartIngresos.dim_tiempo INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @fi;
    END IF; 
     
    SELECT DATE_FORMAT(NOW(),'%Y-%m-%d') INTO @ff;
    
    OPEN c_ingresos FOR 
                    SELECT SUM( valor_ingreso ) valor , usuario_id, fecha_ingreso FROM IngresoEgresos.ingresos WHERE fecha_ingreso BETWEEN DATE_FORMAT(@fi,  '%Y-%m-%d' ) AND DATE_FORMAT(@ff,  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_ingreso;        

         LOOP
            FETCH c_ingresos INTO valor;     
          END LOOP;  
        CLOSE c_ingresos;
--     REPEAT
--         FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2,tipo_identificacion,fecha_creacion,fecha_modificacion,um_nombre1,um_apellido1;
--             IF NOT done THEN
--                 SET count = (SELECT COUNT(DIDP.id_persona) FROM DatamartIngresos.dim_persona DIDP WHERE DIDP.id_persona = id);
--                 IF count = 0 THEN
--                     INSERT INTO DatamartIngresos.dim_persona (id_persona,tipo_identificacion,nombre_completo,fecha_creacion,fecha_modificacion,usuario_modificador) VALUE(id,tipo_identificacion,CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion,fecha_modificacion,CONCAT(um_nombre1,' ',um_apellido1));
--                 ELSE
--                     UPDATE DatamartIngresos.dim_persona SET tipo_identificacion=tipo_identificacion,nombre_completo=CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion=fecha_creacion,fecha_modificacion=fecha_modificacion,usuario_modificador=CONCAT(um_nombre1,' ',um_apellido1)  WHERE id_persona =id;
--                 END IF;
--             END IF;
--     UNTIL done END REPEAT;
--     
END;//
delimiter ;

CALL migracion_fac_ingresos_diarios;