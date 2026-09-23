-- ========================================
-- File: 02_monthly_sales_trend.sql
-- Business Question: How does monthly revenue trend
--                    over the 3-year period? Are there
--                    seasonal patterns?
-- Author: JosteinCT
-- Date: 2026-09-23
-- ========================================

WITH monthly_metrics AS (
    -- Step 1: Aggregate by month
    SELECT 
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        EXTRACT(MONTH FROM o.order_date) AS order_month,
        TO_CHAR(o.order_date, 'Month') AS month_name,
        COUNT(DISTINCT o.order_id) AS order_count,
        COUNT(DISTINCT o.customer_id) AS customer_count,
        ROUND(SUM(od.quantity * od.unit_price * (1 - COALESCE(od.discount, 0)))::numeric, 2) AS total_revenue
    FROM orders o
    INNER JOIN order_details od ON o.order_id = od.order_id
    GROUP BY 
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date),
        TO_CHAR(o.order_date, 'Month')
),

monthly_with_comparison AS (
    -- Step 2: Calculate YoY comparisons for all metrics
    SELECT 
        order_year,
        order_month,
        TRIM(month_name) AS month_name,
        order_count,
        customer_count,
        total_revenue,
        LAG(order_count, 12) OVER (ORDER BY order_year, order_month) AS prev_year_order_count,
        LAG(customer_count, 12) OVER (ORDER BY order_year, order_month) AS prev_year_customer_count,
        LAG(total_revenue, 12) OVER (ORDER BY order_year, order_month) AS prev_year_revenue
    FROM monthly_metrics
)

-- Step 3: Calculate growth percentages for all metrics
SELECT 
    order_year,
    order_month,
    month_name,
    order_count,
    prev_year_order_count,
    CASE 
        WHEN prev_year_order_count IS NULL THEN NULL
        ELSE ROUND(((order_count - prev_year_order_count)::numeric / prev_year_order_count) * 100, 2)
    END AS order_yoy_growth_pct,
    customer_count,
    prev_year_customer_count,
    CASE 
        WHEN prev_year_customer_count IS NULL THEN NULL
        ELSE ROUND(((customer_count - prev_year_customer_count)::numeric / prev_year_customer_count) * 100, 2)
    END AS customer_yoy_growth_pct,
    total_revenue,
    COALESCE(prev_year_revenue, 0) AS prev_year_revenue,
    CASE 
        WHEN prev_year_revenue IS NULL THEN NULL
        ELSE ROUND(((total_revenue - prev_year_revenue)::numeric / prev_year_revenue) * 100, 2)
    END AS revenue_yoy_growth_pct
FROM monthly_with_comparison
ORDER BY order_year, order_month;