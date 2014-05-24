-- Diarios
SELECT dp.nombre_completo, fed.total_egreso_dia, dt.fecha
FROM DatamartEgresos.fac_egresos_diarios fed
INNER JOIN DatamartEgresos.dim_tiempo dt ON ( fed.fecha_egreso = dt.id_fecha ) 
INNER JOIN DatamartEgresos.dim_persona dp ON ( dp.id_persona = fed.id_persona ) 
WHERE DATE_FORMAT( dt.fecha, "%Y-%m-%d" ) = DATE_FORMAT( NOW( ) , "%Y-%m-%d" ) 

-- Mensual
SELECT dp.nombre_completo, agrEM.total_egreso_mensuale, dt.fecha
FROM DatamartEgresos.agr_egresos_mensuales agrEM
INNER JOIN DatamartIngresos.dim_tiempo dt ON ( agrEM.fecha_egreso = dt.id_fecha ) 
INNER JOIN DatamartIngresos.dim_persona dp ON ( dp.id_persona = agrEM.id_persona  
WHERE DATE_FORMAT( dt.fecha, "%Y-%m" ) = DATE_FORMAT( NOW( ) , "%Y-%m" ) 

-- Tipo
SELECT dp.nombre_completo, SUM( fed.total_egreso_dia ) , dti.tipo_egreso
FROM DatamartEgresos.fac_egresos_diarios fed
INNER JOIN DatamartEgresos.dim_tipo_egreso dti ON ( fed.id_tipo_egreso = dti.id_tipo_egreso ) 
INNER JOIN DatamartEgresos.dim_persona dp ON ( dp.id_persona = fed.id_persona ) 
GROUP BY fed.id_tipo_egreso, fed.id_persona
ORDER BY fed.id_persona