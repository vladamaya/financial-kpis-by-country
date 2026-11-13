-- Proyecto 3: Análisis del desempeño financiero con SQL - Resumen ejecutivo
-- TripleTen Data Analyst, Sprint 3: Explorar KPIs con SQL
-- Parte 3 - Calcular KPIs financieros, Ejercicio 3/3, Tarea 3: Calcular Beneficio Bruto, Margen y ROI
-- Consulta aprobada en TripleTen ("Aprobado / Puedes continuar"), extraída el 2026-11-12

SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    SUM(p.ingresos)::integer - SUM(p.costos)::integer AS beneficio_bruto,
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0)
        / NULLIF(SUM(p.ingresos), 0) AS margen_pct,
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0)
        / NULLIF(SUM(c.costo_campana), 0) AS roi_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
    ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;
