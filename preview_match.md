# Preview — Proyecto 3 KPIs financieros (Sprint 3)

Archivo SQL: `proyecto3_kpis_financieros.sql`
Consulta aprobada: Sprint 3 → Parte 3 - Calcular KPIs financieros → Tarea 3 (Beneficio Bruto, Margen y ROI)

## Qué calcula el .sql

- `ingresos` = SUM(ingresos) por país / clave_territorio
- `costos` = SUM(costos) por país / clave_territorio
- `costo_campana` = SUM(costo_campana) de campañas, con COALESCE a 0 si no hay campaña
- `beneficio_bruto` = ingresos − costos (con cast a integer, como está en la consulta aprobada)
- `margen_pct` = (ingresos − costos) × 100 / ingresos
- `roi_pct` = (ingresos − costos) × 100 / costo_campana
- Une `pais_ingreso_costo` con `pais_campanas` por `clave_territorio` (LEFT JOIN) y agrupa por país.

## Verificación contra tu Google Sheet (Dashboard)

Recalculé beneficio, margen y ROI con los ingresos/costos/costo de campañas de tu hoja y los comparé con los valores de la hoja:

| País | Clave | Beneficio (hoja) | Margen calc. | Margen hoja | ROI calc. | ROI hoja | ¿Match? |
|---|---:|---:|---:|---:|---:|---:|---|
| United States | 1 | $1,454,468.60 | 43.37% | 43.37% | 75.75% | 75.75% | Sí |
| Australia | 9 | $1,057,045.31 | 41.75% | 41.75% | 49.16% | 49.16% | Sí |
| United Kingdom | 10 | $508,128.24 | 42.71% | 42.71% | 22.05% | 22.05% | Sí |
| Germany | 8 | $460,165.06 | 42.95% | 42.95% | 20.31% | 20.31% | Sí |
| France | 7 | $396,519.79 | 42.90% | 42.90% | 17.96% | 17.96% | Sí |
| Canada | 6 | $317,879.27 | 44.76% | 44.76% | 17.43% | 17.43% | Sí |

Resultado: **margen y ROI coinciden al 100% (6 de 6 países, a 2 decimales)**.

Nota de redondeo: el beneficio recalculado con decimales difiere $0.01 en United States y United Kingdom (puro redondeo de centavos). Además, la columna `beneficio_bruto` del .sql sale como entero por el `::integer`, así que en la salida de SQL puede verse ~$1,454,469 en US en lugar de $1,454,468.60; es por ese cast y no cambia margen ni ROI, que el .sql calcula con los totales sin redondear.
