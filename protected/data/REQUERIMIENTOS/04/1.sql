SELECT (SUM(fac.total_egreso_mensuale)/COUNT(fac.id_ing_mensuales)) total
FROM DatamartEgresos.agr_egresos_mensuales fac 
