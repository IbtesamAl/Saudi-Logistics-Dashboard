-- =========================================================
-- 1. Quarterly Import Performance
-- =========================================================

WITH quarterly_imports AS (
    SELECT
        d.year,
        d.quarter,
        SUM(f.import_value) AS total_imports
    FROM logistics.fact_imports f
    JOIN logistics.dim_date d
        ON f.date_id = d.date_id
    GROUP BY
        d.year,
        d.quarter
)

SELECT
    year,
    quarter,
    total_imports,

    LAG(total_imports) OVER (
        ORDER BY year, quarter
    ) AS previous_quarter_imports,

    total_imports
        - LAG(total_imports) OVER (
            ORDER BY year, quarter
        ) AS change_from_previous_quarter,

    ROUND(
        (
            total_imports
            - LAG(total_imports) OVER (
                ORDER BY year, quarter
            )
        )
        / NULLIF(
            LAG(total_imports) OVER (
                ORDER BY year, quarter
            ),
            0
        ) * 100,
        2
    ) AS percentage_change,

    CASE
        WHEN LAG(total_imports) OVER (
            ORDER BY year, quarter
        ) IS NULL THEN 'First Quarter'

        WHEN total_imports >
             LAG(total_imports) OVER (
                 ORDER BY year, quarter
             ) THEN 'Increase'

        WHEN total_imports <
             LAG(total_imports) OVER (
                 ORDER BY year, quarter
             ) THEN 'Decrease'

        ELSE 'No Change'
    END AS import_trend

FROM quarterly_imports
ORDER BY
    year,
    quarter;
	-- =========================================================
-- 2. Quarterly Export Performance
-- =========================================================

WITH quarterly_exports AS (
    SELECT
        d.year,
        d.quarter,
        SUM(f.export_value) AS total_exports
    FROM logistics.fact_exports f
    JOIN logistics.dim_date d
        ON f.date_id = d.date_id
    GROUP BY
        d.year,
        d.quarter
)

SELECT
    year,
    quarter,
    total_exports,

    LAG(total_exports) OVER (
        ORDER BY year, quarter
    ) AS previous_quarter_exports,

    total_exports
        - LAG(total_exports) OVER (
            ORDER BY year, quarter
        ) AS change_from_previous_quarter,

    ROUND(
        (
            total_exports
            - LAG(total_exports) OVER (
                ORDER BY year, quarter
            )
        )
        / NULLIF(
            LAG(total_exports) OVER (
                ORDER BY year, quarter
            ),
            0
        ) * 100,
        2
    ) AS percentage_change,

    CASE
        WHEN LAG(total_exports) OVER (
            ORDER BY year, quarter
        ) IS NULL THEN 'First Quarter'

        WHEN total_exports >
             LAG(total_exports) OVER (
                 ORDER BY year, quarter
             ) THEN 'Increase'

        WHEN total_exports <
             LAG(total_exports) OVER (
                 ORDER BY year, quarter
             ) THEN 'Decrease'

        ELSE 'No Change'
    END AS export_trend

FROM quarterly_exports
ORDER BY
    year,
    quarter;
	-- =========================================================
-- 3. Country Import and Export Ranking
-- =========================================================

WITH country_trade AS (
    SELECT
        COALESCE(i.country_name, e.country_name) AS country_name,

        COALESCE(i.total_imports, 0) AS total_imports,

        COALESCE(e.total_exports, 0) AS total_exports

    FROM (
        SELECT
            c.country_name,
            SUM(f.import_value) AS total_imports
        FROM logistics.fact_imports f
        JOIN logistics.dim_country c
            ON f.country_id = c.country_id
        GROUP BY
            c.country_name
    ) i

    FULL OUTER JOIN (
        SELECT
            c.country_name,
            SUM(f.export_value) AS total_exports
        FROM logistics.fact_exports f
        JOIN logistics.dim_country c
            ON f.country_id = c.country_id
        GROUP BY
            c.country_name
    ) e

    ON i.country_name = e.country_name
)

SELECT
    country_name,
    total_imports,
    total_exports,

    RANK() OVER (
        ORDER BY total_imports DESC
    ) AS import_rank,

    RANK() OVER (
        ORDER BY total_exports DESC
    ) AS export_rank

FROM country_trade

ORDER BY
    import_rank;
	-- =========================================================
-- 4. Trade Balance by Country
-- Trade Balance = Exports - Imports
-- =========================================================

WITH country_trade AS (
    SELECT
        COALESCE(i.country_name, e.country_name) AS country_name,

        COALESCE(i.total_imports, 0) AS total_imports,

        COALESCE(e.total_exports, 0) AS total_exports

    FROM (
        SELECT
            c.country_name,
            SUM(f.import_value) AS total_imports
        FROM logistics.fact_imports f
        JOIN logistics.dim_country c
            ON f.country_id = c.country_id
        GROUP BY
            c.country_name
    ) i

    FULL OUTER JOIN (
        SELECT
            c.country_name,
            SUM(f.export_value) AS total_exports
        FROM logistics.fact_exports f
        JOIN logistics.dim_country c
            ON f.country_id = c.country_id
        GROUP BY
            c.country_name
    ) e

    ON i.country_name = e.country_name
)

SELECT
    country_name,
    total_imports,
    total_exports,

    total_exports - total_imports AS trade_balance,

    RANK() OVER (
        ORDER BY
            total_exports - total_imports DESC
    ) AS trade_balance_rank

FROM country_trade

ORDER BY
    trade_balance_rank;
	