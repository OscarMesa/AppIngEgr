    DROP PROCEDURE IF EXISTS migracion_dim_tiempo_egresos;
    delimiter //
    CREATE PROCEDURE migracion_dim_tiempo_egresos()
    BEGIN

    -- menor 
    SELECT MAX( fecha ) FROM DatamartEgresos.dim_tiempo INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
     END IF; 
    -- mayor
    SELECT MAX( fecha_egreso ) FROM IngresoEgresos.egresos INTO @ff;  

    --  
    while (@fi <= @ff) DO 
      
    INSERT INTO DatamartEgresos.dim_tiempo
        (
            fecha,
            dia,
            dia_semana,
            mes,
            year,
            nombre_dia,
            nombre_dia_semana,
            mes3L,
            nombre_mes
        )
    SELECT (@fi) Fecha,
            RIGHT(concat('0',day(@fi)),2) Dia,
            weekday(@fi) DiaSemana,
            month(@fi) Mes,
            year(@fi) y,    
            concat(RIGHT(concat('0',day(@fi)),2),' ',monthname(@fi)) nombre_dia,
            dayname(@fi) nombre_dia_semana,
            LEFT(monthname(@fi),3) mes3L,
            monthname(@fi) nombre_mes;
     
    set @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
     
    END WHILE;

    END;//
    delimiter ;

CALL migracion_dim_tiempo_egresos();