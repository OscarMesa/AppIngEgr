DROP PROCEDURE IF EXISTS gastoXMes;
DELIMITER //
CREATE PROCEDURE gastoXMes(IN fecha DATE)
BEGIN
SELECT (SELECT aem.total_egreso_mensuale FROM DatamartEgresos.agr_egresos_mensuales aem 
        INNER JOIN DatamartEgresos.dim_tiempo t ON (t.id_fecha=aem.fecha_egreso) 
        WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha) LIMIT 1)/COUNT(fac.total_egreso_dia) total
        FROM DatamartEgresos.fac_egresos_diarios fac 
                INNER JOIN DatamartEgresos.dim_tiempo t ON (fac.fecha_egreso = t.id_fecha)
                WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha);
END
//