-- ========================================
-- File: 04_geographic_analysis.sql
-- Business Question: Which countries generate most revenue
--                    and have highest customer loyalty?
-- Author: JosteinCT
-- Date: 2026-09-23
-- ========================================

WITH country_metrics AS (
    -- Step 1: Aggregate metrics by country
    SELECT 
        c.country,
        COUNT(DISTINCT c.customer_id) AS customer_count,
        COUNT(DISTINCT o.order_id) AS order_count,
        ROUND(SUM(od.quantity * od.unit_price * (1 - COALESCE(od.discount, 0)))::numeric, 2) AS total_revenue,
        ROUND(AVG(od.quantity * od.unit_price * (1 - COALESCE(od.discount, 0)))::numeric, 2) AS avg_order_line_value
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    INNER JOIN order_details od ON o.order_id = od.order_id
    GROUP BY c.country
)

-- Step 2: Rank and calculate revenue share directly
SELECT 
    ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank,
    country,
    customer_count,
    order_count,
    total_revenue,
    avg_order_line_value,
    ROUND((total_revenue / (SELECT SUM(total_revenue) FROM country_metrics)) * 100, 2) AS revenue_share_pct
FROM country_metrics
ORDER BY total_revenue DESC;