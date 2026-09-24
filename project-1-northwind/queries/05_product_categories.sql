-- ========================================
-- File: 05_product_categories.sql
-- Business Question: Which product categories contribute most
--                    to revenue and order volume?
-- Author: JosteinCT
-- Date: 2026-09-24
-- ========================================

WITH category_metrics AS (
    -- Step 1: Aggregate by category (joining with categories table)
    SELECT 
        cat.category_name,
        COUNT(DISTINCT p.product_id) AS product_count,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(od.quantity) AS total_units_sold,
        ROUND(SUM(od.quantity * od.unit_price * (1 - COALESCE(od.discount, 0)))::numeric, 2) AS total_revenue,
        ROUND(AVG(od.unit_price)::numeric, 2) AS avg_product_price
    FROM products p
    INNER JOIN categories cat ON p.category_id = cat.category_id
    INNER JOIN order_details od ON p.product_id = od.product_id
    INNER JOIN orders o ON od.order_id = o.order_id
    GROUP BY cat.category_name
)

-- Step 2: Calculate revenue share and ranking
SELECT 
    category_name,
    product_count,
    total_units_sold,
    order_count,
    total_revenue,
    avg_product_price,
    ROUND((total_revenue / (SELECT SUM(total_revenue) FROM category_metrics)) * 100, 2) AS revenue_share_pct,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM category_metrics
ORDER BY total_revenue DESC;