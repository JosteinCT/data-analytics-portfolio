# Northwind Sales Analysis

## Business Objective
Identify revenue drivers and customer value segments to inform sales strategy and retention efforts.

## Key Questions Being Investigated
1. What are the top 10 customers by lifetime revenue, and what % of total revenue do they represent? [Complete]
2. How does monthly revenue trend over the 3-year period? Are there seasonal patterns?
3. What is customer retention/churn rate? Which customers ordered across multiple years?
4. Which product categories contribute most to profit margin?
5. Which countries have highest average order value and customer loyalty?

## Tools Used
- PostgreSQL 18 (database)
- SQL (CTEs, window functions, complex JOINs, date analysis)
- pgAdmin 4 (query execution)
- Git/GitHub (version control)

## Project Structure
- project-1-northwind/
  - queries/ (SQL scripts)
    - 00_schema_overview.sql
    - 01_top_customers.sql
  - outputs/ (CSV exports)
  - README.md

## Key Findings

### Customer Value Analysis (Query 01)
- Top 3 Customers: QUICK-Stop (Germany), Ernst Handel (Austria), Save-a-lot Markets (USA)
- Revenue Concentration: Top 3 customers contribute ~25% of total revenue
- Geographic Pattern: Europe dominates top tier, plus USA

### Monthly Sales Trends (Query 02)
- **Overall Trend:** Strong growth through 1997 (+70% to +110% YoY)
- **Peak Performance:** March 1998 (+172% revenue vs. previous year)
- **Major Anomaly:** May 1998 (-66% revenue, -56% orders) — requires business investigation
- **Pattern:** Q1-Q2 1998 outperformed Q3-Q4 1997 significantly

### Customer Retention Analysis (Query 03)
- **Loyal Customers:** 67.42% (60 customers) ordered across all 3 years
- **Repeat Customers:** 28.09% (25 customers) ordered for 2 years
- **One-Time Customers:** Only 4.49% (4 customers) — exceptionally low churn rate
- **Overall Retention:** ~95.5% of customers returned for subsequent orders
- **Insight:** Northwind demonstrates strong customer relationship management with minimal churn

*(See `/outputs/customer_retention_analysis.csv` for full customer list by tier)*

### Geographic Performance (Query 04)
- **Top 3 Markets:** USA (19.4%), Germany (18.2%), Austria (10.1%) = 47.7% of total revenue
- **Market Concentration Risk:** Nearly 50% revenue from 3 countries
- **European Strength:** 15 of 21 countries are European
- **Low-Volume Markets:** Poland, Norway, Argentina each <1% revenue
- **Insight:** Diversification opportunity in underperforming regions

*(See `/outputs/geographic_analysis.csv` for full 21-country breakdown)*

## Status
🟢 **Complete** — All core queries (01-03) finished with documented findings.

## Completed Queries
1. ✅ Customer Revenue Analysis (Query 01)
2. ✅ Monthly Sales Trends (Query 02)
3. ✅ Customer Retention Analysis (Query 03)