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

## Status
[Active] Query 01 complete, analyzing sales trends next.

## Next Steps
1. Analyze sales trends over time
2. Investigate customer retention patterns
3. Explore product profitability