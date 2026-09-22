# Northwind Sales Analysis

## Business Objective
Identify revenue drivers and customer value segments to inform sales strategy and retention efforts.

## Key Questions Being Investigated
1. What are the top 10 customers by lifetime revenue, and what % of total revenue do they represent?
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
```
project-1-northwind/ ├── queries/ ← SQL scripts organized by analysis topic ├── outputs/ ← CSV exports and visualizations └── README.md ← This file
```

## Key Findings

### Customer Value Analysis (Query 01)
- **Top 3 Customers:** QUICK-Stop (Germany, $110,277), Ernst Handel (Austria, $104,875), Save-a-lot Markets (USA, $104,362)
- **Revenue Concentration:** Top 3 customers contribute ~25% of total revenue
- **Geographic Pattern:** Europe dominates top tier (Germany, Austria), plus USA

*(See `/queries/01_top_customers.sql` for methodology)*

## Status
🟢 **Active Progress** — Query 01 complete, analyzing sales trends next.

## Next Steps
1. Analyze sales trends over time (Queries 02-03)
2. Investigate customer retention patterns (Query 04)
3. Explore product profitability and geographic performance (Queries 05+)