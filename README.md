# Análisis del desempeño financiero por país con SQL

Proyecto de portafolio — TripleTen Data Analyst, Sprint 3: Explorar KPIs con SQL (Proyecto 3).

## Pregunta de negocio

- ¿Cuánto estamos ganando por país?
- ¿Qué tan rentable es cada mercado considerando el gasto en campañas de marketing?

## Qué hice

Construí en SQL una tabla por país con ingresos, costos y costo de campañas, calculé beneficio bruto, margen y ROI, y entregué un resumen ejecutivo para el director de finanzas en formato CFI (Contexto – Hallazgos – Implicación).

## Herramientas

- SQL (PostgreSQL)
- Google Sheets (resumen ejecutivo / dashboard)

## Datos

Tablas del entorno de práctica de TripleTen:

- `pais_ingreso_costo`: ingresos y costos por país y `clave_territorio`
- `pais_campanas`: costo de campaña por `clave_territorio`

La consulta une ambas tablas con `LEFT JOIN` por `clave_territorio` y agrupa por país. Los datos crudos del curso no se incluyen en este repositorio; aquí se comparte la consulta y los resultados agregados.

## Métricas

- `beneficio_bruto` = ingresos − costos
- `margen_pct` = (ingresos − costos) × 100 / ingresos
- `roi_pct` = (ingresos − costos) × 100 / costo_campana

## Consulta principal

Ver [`proyecto3_kpis_financieros.sql`](./proyecto3_kpis_financieros.sql) — consulta aprobada en TripleTen, Parte 3: Calcular KPIs financieros (Tarea 3: Beneficio Bruto, Margen y ROI).

## Resultados

| País | ClaveTerritorio | Ingresos | Costos | Costo de campañas | Beneficio bruto | Margen % | ROI % |
|---|---:|---:|---:|---:|---:|---:|---:|
| United States | 1 | $3,353,939.92 | $1,899,471.33 | $1,920,000.00 | $1,454,468.60 | 43.37% | 75.75% |
| Australia | 9 | $2,532,003.49 | $1,474,958.18 | $2,150,400.00 | $1,057,045.31 | 41.75% | 49.16% |
| United Kingdom | 10 | $1,189,636.78 | $681,508.55 | $2,304,000.00 | $508,128.24 | 42.71% | 22.05% |
| Germany | 8 | $1,071,460.42 | $611,295.36 | $2,265,600.00 | $460,165.06 | 42.95% | 20.31% |
| France | 7 | $924,316.93 | $527,797.14 | $2,208,000.00 | $396,519.79 | 42.90% | 17.96% |
| Canada | 6 | $710,205.18 | $392,325.91 | $1,824,000.00 | $317,879.27 | 44.76% | 17.43% |

![Margen y ROI de campaña por país](images/margen_roi_por_pais.png)

Verificación: el margen y el ROI recalculados con la consulta coinciden con la hoja de resultados en los 6 países. Nota: `beneficio_bruto` sale como entero por el cast `::integer` de la consulta, por eso puede diferir en centavos respecto a la hoja.

## Insights (formato CFI)

**Contexto:** Se analizó el desempeño de las campañas en diversos territorios vs. el ingreso presentado, usando ingresos, costos, costos de campaña, beneficios, margen y ROI, para comprender el beneficio efectivo de las campañas.

**Hallazgos:**
1. El país con el mayor ROI fue United States (75.75%) y fue el 2.º con el mayor margen.
2. El país con el menor ROI de campaña fue Canada (17.43%, la campaña menos efectiva), sin embargo presentó el mayor margen (44.76%).
3. Los márgenes son relativamente similares entre los países.

**Implicación:**
1. Manteniendo las condiciones actuales, una estrategia de expansión o reasignación presupuestal hacia Estados Unidos tendría mayor probabilidad de generar retornos adicionales que incrementar la inversión en mercados con ROI inferiores al 25%.
2. Dado que la rentabilidad operativa es relativamente consistente entre países, las diferencias de desempeño parecen estar relacionadas principalmente con la efectividad de las campañas; una redistribución parcial del presupuesto desde mercados con ROI bajo hacia mercados con ROI alto podría incrementar el retorno total sin aumentar el gasto global de marketing.

## Reflexión

- El margen mide el beneficio contra la venta; el ROI mide la rentabilidad de la inversión en campañas.
- El ROI de Estados Unidos es alto porque, en comparación con otros países, su costo de campaña es menor en relación con el ingreso y el beneficio bruto, por lo que la inversión produce más beneficio por dólar.
- Si el gasto en campañas aumentara 50% sin cambiar el beneficio, el ROI disminuiría en términos generales.

## Estructura del repositorio

```text
.
├── README.md
├── proyecto3_kpis_financieros.sql
└── preview_match.md
```

## Autor

Vlad — Analista de datos en formación (TripleTen).
