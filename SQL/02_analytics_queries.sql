/*=========================================================
   BUSINESS ANALYSIS QUERIES
   Saudi Logistics Data Warehouse
=========================================================*/
/*=========================================================
   KPI QUERIES
=========================================================*/
/*=========================================================
   KPI 1 : Total Imports Value
   الهدف: إجمالي قيمة الواردات
=========================================================*/

SELECT
    SUM(import_value) AS total_imports
FROM logistics.fact_imports;


/*=========================================================
   KPI 2 : Total Exports Value
   الهدف: إجمالي قيمة الصادرات
=========================================================*/

SELECT
    SUM(export_value) AS total_exports
FROM logistics.fact_exports;


/*=========================================================
   KPI 3 : Total Imports Weight
   الهدف: إجمالي وزن الواردات
=========================================================*/

SELECT
    SUM(net_weight_kg) AS total_import_weight
FROM logistics.fact_imports;


/*=========================================================
   KPI 4 : Total Exports Weight
   الهدف: إجمالي وزن الصادرات
=========================================================*/

SELECT
    SUM(net_weight_kg) AS total_export_weight
FROM logistics.fact_exports;


/*=========================================================
   KPI 5 : Total Countries
   الهدف: عدد الدول
=========================================================*/

SELECT
    COUNT(*) AS total_countries
FROM logistics.dim_country;


/*=========================================================
   KPI 6 : Total Products
   الهدف: عدد المنتجات
=========================================================*/

SELECT
    COUNT(*) AS total_products
FROM logistics.dim_product;


/*=========================================================
   KPI 7 : Import Transactions
   الهدف: عدد عمليات الاستيراد
=========================================================*/

SELECT
    COUNT(*) AS import_transactions
FROM logistics.fact_imports;


/*=========================================================
   KPI 8 : Export Transactions
   الهدف: عدد عمليات التصدير
=========================================================*/

SELECT
    COUNT(*) AS export_transactions
FROM logistics.fact_exports;
/*=========================================================
   COUNTRY ANALYSIS
=========================================================*/
/*=========================================================
   Top 10 Import Countries
   الهدف: أعلى 10 دول حسب قيمة الواردات
=========================================================*/

SELECT

    c.country_name,

    SUM(f.import_value) AS total_imports

FROM logistics.fact_imports f

JOIN logistics.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY total_imports DESC

LIMIT 10;
/*=========================================================
   Top 10 Export Countries
   الهدف: أعلى 10 دول حسب قيمة الصادرات
=========================================================*/

SELECT

    c.country_name,

    SUM(f.export_value) AS total_exports

FROM logistics.fact_exports f

JOIN logistics.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY total_exports DESC

LIMIT 10;
/*=========================================================
   Top Import Countries By Weight
=========================================================*/

SELECT

    c.country_name,

    SUM(f.net_weight_kg) AS total_weight

FROM logistics.fact_imports f

JOIN logistics.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY total_weight DESC

LIMIT 10;
/*=========================================================
   Top Export Countries By Weight
=========================================================*/

SELECT

    c.country_name,

    SUM(f.net_weight_kg) AS total_weight

FROM logistics.fact_exports f

JOIN logistics.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY total_weight DESC

LIMIT 10;
/*=========================================================
   PRODUCT ANALYSIS
=========================================================*/


/* Top Imported Products */
SELECT
    p.hs_code,
    SUM(f.import_value) AS total_imports
FROM logistics.fact_imports f
JOIN logistics.dim_product p
ON f.product_id = p.product_id
GROUP BY p.hs_code
ORDER BY total_imports DESC
LIMIT 10;


/* Top Exported Products */
SELECT
    p.hs_code,
    SUM(f.export_value) AS total_exports
FROM logistics.fact_exports f
JOIN logistics.dim_product p
ON f.product_id = p.product_id
GROUP BY p.hs_code
ORDER BY total_exports DESC
LIMIT 10;


/* Top Imported Products By Weight */
SELECT
    p.hs_code,
    SUM(f.net_weight_kg) AS total_weight
FROM logistics.fact_imports f
JOIN logistics.dim_product p
ON f.product_id = p.product_id
GROUP BY p.hs_code
ORDER BY total_weight DESC
LIMIT 10;


/* Top Exported Products By Weight */
SELECT
    p.hs_code,
    SUM(f.net_weight_kg) AS total_weight
FROM logistics.fact_exports f
JOIN logistics.dim_product p
ON f.product_id = p.product_id
GROUP BY p.hs_code
ORDER BY total_weight DESC
LIMIT 10;



/*=========================================================
   TIME ANALYSIS
=========================================================*/


/* Imports By Quarter */
SELECT
    d.year,
    d.quarter,
    SUM(f.import_value) AS total_imports
FROM logistics.fact_imports f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;


/* Exports By Quarter */
SELECT
    d.year,
    d.quarter,
    SUM(f.export_value) AS total_exports
FROM logistics.fact_exports f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;


/* Imports Weight By Quarter */
SELECT
    d.year,
    d.quarter,
    SUM(f.net_weight_kg) AS total_weight
FROM logistics.fact_imports f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;


/* Exports Weight By Quarter */
SELECT
    d.year,
    d.quarter,
    SUM(f.net_weight_kg) AS total_weight
FROM logistics.fact_exports f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;



/*=========================================================
   PORT ANALYSIS
=========================================================*/


/* Total Permits */
SELECT
    SUM(permits_count) AS total_permits
FROM logistics.fact_port_traffic;


/* Average Clearance Time */
SELECT
    ROUND(AVG(clearance_time),2) AS avg_clearance_time
FROM logistics.fact_port_traffic;


/* Permits By Quarter */
SELECT
    d.year,
    d.quarter,
    SUM(f.permits_count) AS total_permits
FROM logistics.fact_port_traffic f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;


/* Clearance Time By Quarter */
SELECT
    d.year,
    d.quarter,
    ROUND(AVG(f.clearance_time),2) AS avg_clearance
FROM logistics.fact_port_traffic f
JOIN logistics.dim_date d
ON f.date_id = d.date_id
GROUP BY d.year,d.quarter
ORDER BY d.year,d.quarter;
