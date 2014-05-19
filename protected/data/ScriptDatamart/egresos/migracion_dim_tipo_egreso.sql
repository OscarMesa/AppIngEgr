DROP PROCEDURE IF EXISTS migracion_dim_tipo_egreso;
delimiter //
CREATE PROCEDURE migracion_dim_tipo_egreso()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE tipo_egreso VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_tp_egreso CURSOR FOR SELECT intpi.id,intpi.descripcion FROM IngresoEgresos.tipo_egresos intpi;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_tp_egreso;

    REPEAT
        FETCH c_tp_egreso INTO id, tipo_egreso;
            IF NOT done THEN
                SET count = (SELECT COUNT(DITI.cod_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso DITI WHERE DITI.cod_tipo_egreso = id);
                IF  count = 0 THEN  
                    INSERT INTO DatamartEgresos.dim_tipo_egreso (cod_tipo_egreso,tipo_egreso) VALUE(id,tipo_egreso);
                ELSE
                    UPDATE DatamartEgresos.dim_tipo_egreso SET tipo_egreso = tipo_egreso WHERE cod_tipo_egreso = id;
                END IF;     
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_tp_egreso;
END;//
delimiter ;