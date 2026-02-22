/*
----------------------------------------------------
Quality Checks
----------------------------------------------------

Purpose:
This script checks the data quality of the gold layer.
It ensures the data is accurate, consistent, and reliable.

Checks include:
- Surrogate keys in dimension tables are unique.
- Fact tables correctly link to dimension tables.
- Relationships are valid for reporting.

Note:
If any query returns unexpected results,
review and fix the data.
----------------------------------------------------
*/

-- ----------------------------------------------------
-- Checking: gold.dim_customers
-- ----------------------------------------------------
-- Check if Customer Key is unique
-- Expectation: No duplicate records
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ----------------------------------------------------
-- Checking: gold.dim_products
-- ----------------------------------------------------
-- Check if Product Key is unique
-- Expectation: No duplicate records
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ----------------------------------------------------
-- Checking 'gold.fact_sales'
-- ----------------------------------------------------
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
