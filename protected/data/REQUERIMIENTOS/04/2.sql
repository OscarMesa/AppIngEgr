SELECT dte.id_tipo_egreso, (SUM(fac.total_egreso_dia)/COUNT(dte.id_tipo_egreso)) total 
FROM DatamartEgresos.fac_egresos_diarios fac 
INNER JOIN DatamartEgresos.dim_tipo_egreso dte ON (dte.id_tipo_egreso = fac.id_tipo_egreso)
GROUP BY dte.id_tipo_egreso