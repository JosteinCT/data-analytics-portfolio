-- ========================================
-- File: 01_top_customers.sql
-- Business Question: What are the top 10 customers
--                    by lifetime revenue, and what
--                    percentage of total revenue do they represent?
-- Author: JosteinCT
-- Date: 2026-09-22
-- ========================================

-- Step 1: Calculate total revenue per customer
WITH customer_lifetime_value AS (
    SELECT 
        c.customer_id,
        c.company_name,
        c.country,
        SUM(od.quantity * od.unit_price * (1 - COALESCE(od.discount, 0))) AS total_revenue
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    INNER JOIN order_details od ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.company_name, c.country
),

-- Step 2: Calculate total company revenue for percentage
company_total AS (
    SELECT SUM(total_revenue) AS grand_total
    FROM customer_lifetime_value
)

-- Step 3: Display top 10 with percentage
SELECT 
    clv.customer_id,
    clv.company_name,
    clv.country,
    ROUND(clv.total_revenue::numeric, 2) AS lifetime_revenue,
    ROUND((clv.total_revenue / ct.grand_total)::numeric * 100, 2) AS revenue_percentage
FROM customer_lifetime_value clv
CROSS JOIN company_total ct
ORDER BY clv.total_revenue DESC
LIMIT 10;