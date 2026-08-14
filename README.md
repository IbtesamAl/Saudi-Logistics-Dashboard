# Saudi Logistics Dashboard

## Project Overview

Saudi Logistics Dashboard is a data analytics project that uses Saudi open data to analyze imports, exports, and port traffic activity.

The project uses PostgreSQL to prepare, store, and analyze the data, and Power BI to visualize the results through an interactive dashboard.

![Saudi Logistics Dashboard](Documentation/Saudi_Logistics_Dashboard)

## Objectives

- Analyze import and export activity over time.
- Identify major import and export partner countries.
- Compare import and export performance.
- Analyze quarterly changes in trade activity.
- Examine port traffic and permit activity.
- Calculate and analyze the trade balance.
- Transform raw government data into structured analytical datasets.

## Data Source

The project uses open data published by the Zakat, Tax and Customs Authority (ZATCA).

### Data Scope

The analysis covers the period from Q1 2024 to Q2 2025:

- 2024: Q1, Q2, Q3, Q4
- 2025: Q1, Q2

This six-quarter period was selected to maintain a consistent time range across imports, exports, and port traffic data.

Data from 2023 was excluded because it was published using a different structure, while the 2024–2025 data provided a more consistent structure for data preparation and comparison.

## Data Preparation

The final datasets used in the project are:

- `imports_2024_2025_utf8`
- `exports_2024_2025_utf8`
- `port_traffic_2024_2025_utf8`

The source files were merged and prepared with UTF-8 encoding before being loaded into PostgreSQL staging tables. Data cleaning and transformation were then performed in PostgreSQL before loading the data into the data warehouse.

Data preparation included:

- Checking for missing values.
- Checking for duplicate records.
- Standardizing country names.
- Removing unnecessary spaces.
- Cleaning numeric values.
- Converting numeric fields into appropriate data types.
- Preparing the data for analytical use.

## Data Warehouse

A Star Schema was implemented in PostgreSQL.

### Staging Tables

- `stg_imports`
- `stg_exports`
- `stg_port_traffic`

### Dimension Tables

- `dim_date`
- `dim_country`
- `dim_product`

### Fact Tables

- `fact_imports`
- `fact_exports`
- `fact_port_traffic`

The import and export fact tables are connected to the date, country, and product dimensions.

The port traffic fact table is connected to the date dimension and contains port type, permit count, and clearance time.

## SQL Analytics

SQL was used to analyze trade activity at quarterly and country levels.

The analysis includes:

- Total imports.
- Total exports.
- Quarterly import and export performance.
- Import and export country rankings.
- Quarterly changes.
- Trade balance analysis.

## Advanced SQL Analytics

Advanced SQL techniques were used to generate additional analytical insights.

The project includes:

- Common Table Expressions (CTEs)
- Window Functions
- `LAG()`
- `RANK()`
- `CASE`
- `COALESCE`
- `FULL OUTER JOIN`
- Aggregations
- SQL Views

### Analytical Views

- `vw_quarterly_import_performance`
- `vw_quarterly_export_performance`
- `vw_country_trade_ranking`
- `vw_trade_balance`

## Power BI Dashboard

Power BI was used to visualize the results of the SQL analysis through an interactive dashboard.

The dashboard includes key indicators and visualizations such as:

- Total Imports
- Total Exports
- Total Permits
- Top Import Countries
- Top Export Countries
- Total Imports and Total Exports by Year-Quarter
- Quarterly Import Growth
- Quarterly Export Growth

## Project Files

- [Power BI Dashboard](PowerBI/Saudi%20Logistics%20Dashboard.pbix)
- [Data](Data/)
- [SQL Scripts](SQL/)
- [Documentation](Documentation/)

## Tools and Technologies

- PostgreSQL
- SQL
- Power BI
- CSV / Excel source files

## Project Workflow

Raw ZATCA Open Data  
↓  
Data Preparation  
↓  
Staging Tables  
↓  
Dimensions & Fact Tables  
↓  
SQL Analytics  
↓  
Advanced SQL Views  
↓  
Power BI Dashboard  
↓  
Insights

## Key Insights

- Total imports reached approximately SAR 1.02 trillion, compared with SAR 353.81 billion in total exports during the analyzed period.
- The total import value exceeded the total export value, while total import net weight was also higher than total export net weight during the analyzed period.
- China was the leading import partner, while the United Arab Emirates ranked first among export destinations in the dashboard.
- Import activity included approximately 166K transactions, compared with 56K export transactions.
- Both imports and exports declined in Q1 2025 before recovering in Q2 2025.
- Export growth showed a stronger rebound in Q2 2025, reaching approximately 9.99%, while import growth reached approximately 0.96%.
