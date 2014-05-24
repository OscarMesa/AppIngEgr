-- Diarios
SELECT dp.nombre_completo, fid.total_ingreso_dia, dt.fecha
FROM DatamartIngresos.fac_ingresos_diarios fid
INNER JOIN DatamartIngresos.dim_tiempo dt ON ( fid.fecha_ingreso = dt.id_fecha ) 
INNER JOIN DatamartIngresos.dim_persona dp ON ( dp.id_persona = fid.id_persona ) 
WHERE DATE_FORMAT( dt.fecha, "%Y-%m-%d" ) = DATE_FORMAT( NOW( ) , "%Y-%m-%d" ) 


-- Mensuales
SELECT dp.nombre_completo, agrIM.total_ingreso_mensuale, dt.fecha
FROM DatamartIngresos.agr_ingresos_mensuales agrIM
INNER JOIN DatamartIngresos.dim_tiempo dt ON ( agrIM.fecha_ingreso = dt.id_fecha ) 
INNER JOIN DatamartIngresos.dim_persona dp ON ( dp.id_persona = agrIM.id_persona ) 
WHERE DATE_FORMAT( dt.fecha, "%Y-%m" ) = DATE_FORMAT( NOW( ) , "%Y-%m" ) 


-- Tipo
SELECT dp.nombre_completo, SUM( fid.total_ingreso_dia ) , dti.tipo_ingreso
FROM DatamartIngresos.fac_ingresos_diarios fid
INNER JOIN DatamartIngresos.dim_tipo_ingreso dti ON ( fid.id_tipo_ingreso = dti.id_tipo_ingreso ) 
INNER JOIN DatamartIngresos.dim_persona dp ON ( dp.id_persona = fid.id_persona ) 
GROUP BY fid.id_tipo_ingreso, fid.id_persona
ORDER BY fid.id_persona
