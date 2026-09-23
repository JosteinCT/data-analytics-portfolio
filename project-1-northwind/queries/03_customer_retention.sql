-- ========================================
-- File: 03_customer_retention.sql
-- Business Question: What is the customer retention/churn rate?
--                    Which customers ordered across multiple years?
-- Author: JosteinCT
-- Date: 2026-09-23
-- ========================================

-- Step 1: Identify customers and their ordering years
WITH customer_years AS (
    SELECT 
        c.customer_id,
        c.company_name,
        c.country,
        COUNT(DISTINCT EXTRACT(YEAR FROM o.order_date)) AS years_active,
        ARRAY_AGG(DISTINCT EXTRACT(YEAR FROM o.order_date)) AS active_years,
        MIN(o.order_date) AS first_order_date,
        MAX(o.order_date) AS last_order_date
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.company_name, c.country
),

customer_tiers AS (
    -- Step 2: Categorize customers by loyalty
    SELECT 
        cy.*,
        CASE 
            WHEN years_active = 1 THEN 'One-Time Customer'
            WHEN years_active = 2 THEN 'Repeat Customer (2 Years)'
            WHEN years_active = 3 THEN 'Loyal Customer (3 Years)'
            ELSE 'Unknown'
        END AS customer_tier,
        CASE 
            WHEN years_active = 3 THEN TRUE
            ELSE FALSE
        END AS is_fully_retained
    FROM customer_years cy
),

retention_summary AS (
    -- Step 3: Calculate overall retention metrics
    SELECT 
        customer_tier,
        COUNT(*) AS customer_count,
        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_total
    FROM customer_tiers
    GROUP BY customer_tier
)

-- Final Output: Tier summary + sample of loyal customers
SELECT 
    rs.customer_tier,
    rs.customer_count,
    rs.percentage_of_total,
    (SELECT STRING_AGG(ct.company_name, ', ') 
     FROM customer_tiers ct 
     WHERE ct.customer_tier = rs.customer_tier 
     LIMIT 5) AS sample_customers
FROM retention_summary rs
ORDER BY rs.customer_count DESC;