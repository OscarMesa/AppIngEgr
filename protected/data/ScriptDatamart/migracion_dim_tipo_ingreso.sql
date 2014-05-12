DROP PROCEDURE IF EXISTS migracion_dim_tipo_ingreso;
delimiter //
CREATE PROCEDURE migracion_dim_tipo_ingreso()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE tipo_ingreso VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_tp_ingreso CURSOR FOR SELECT intpi.id,intpi.descripcion FROM IngresoEgresos.tipo_ingresos intpi;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_tp_ingreso;

    REPEAT
        FETCH c_tp_ingreso INTO id, tipo_ingreso;
            IF NOT done THEN
                SET count = (SELECT COUNT(DITI.cod_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso DITI WHERE DITI.cod_tipo_ingreso = id);
                IF  count = 0 THEN  
                    INSERT INTO DatamartIngresos.dim_tipo_ingreso (cod_tipo_ingreso,tipo_ingreso) VALUE(id,tipo_ingreso);
                ELSE
                    UPDATE DatamartIngresos.dim_tipo_ingreso SET tipo_ingreso = tipo_ingreso WHERE cod_tipo_ingreso = id;
                END IF;     
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_tp_ingreso;
END;//
delimiter ;
