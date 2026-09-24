# Northwind Sales Analysis

## Executive Summary

### Portfolio Overview
| Query | Business Question | Key Finding |
|-------|------------------|-------------|
| 01 | Top customer revenue concentration | Top 3 customers drive 25% of revenue |
| 02 | Monthly sales trends (1996-1998) | 1997 showed 50-110% YoY growth; May 1998 anomaly (-66%) |
| 03 | Customer retention/loyalty | 67% loyal customers (3 years), 95.5% overall retention |
| 04 | Geographic market analysis | Top 3 countries = 47.7% revenue (USA, Germany, Austria) |
| 05 | Product category performance | Beverages + Dairy = 39.7% of total revenue |

### Strategic Recommendations
1. **Prioritize top-tier customers** — 67% are loyal, focus on retention programs
2. **Investigate May 1998 anomaly** — 66% revenue collapse requires business context
3. **Expand in Europe** — Strong performance in Germany/Austria suggests opportunity
4. **Monitor category concentration** — Top 2 categories represent 40% of revenue
5. **Diversify geographic risk** — 48% revenue from 3 countries presents concentration risk

### Technical Skills Demonstrated
- PostgreSQL (CTEs, window functions, complex JOINs, date analysis)
- SQL optimization (type casting, COALESCE, GROUP BY refinement)
- Schema documentation (primary/foreign key mapping, column enumeration)
- Business insight translation (query → finding → recommendation)
- Documentation (README, CSV exports, version control)

## Data Source
- **Dataset:** Northwind Traders Sample Database
- **Original Source:** Microsoft SQL Server Samples (public domain)
- **PostgreSQL Conversion:** [https://github.com/pthom/northwind_psql](https://github.com/pthom/northwind_psql)
- **License:** Public Domain / MIT

## Business Objective
Identify revenue drivers and customer value segments to inform sales strategy and retention efforts.

## Key Questions Being Investigated
1. What are the top 10 customers by lifetime revenue, and what % of total revenue do they represent? [Complete]
2. How does monthly revenue trend over the 3-year period? Are there seasonal patterns? [Complete]
3. What is customer retention/churn rate? Which customers ordered across multiple years? [Complete]
4. Which product categories contribute most to profit margin? [Complete]
5. Which countries have highest average order value and customer loyalty? [Complete]

## Tools Used
- PostgreSQL 18 (database)
- SQL (CTEs, window functions, complex JOINs, date analysis)
- pgAdmin 4 (query execution)
- Git/GitHub (version control)

## Project Structure
- project-1-northwind/
  - README.md (project documentation)
  - LICENSE (MIT License)
  - .gitignore (git exclusion rules)
  - queries/ (SQL analysis scripts)
    - 00_schema_overview.sql (database verification)
    - 01_top_customers.sql (customer revenue ranking)
    - 02_monthly_sales_trend.sql (year-over-year growth)
    - 03_customer_retention.sql (multi-year loyalty tracking)
    - 04_geographic_analysis.sql (country-level analysis)
    - 05_product_categories.sql (category performance)
  - outputs/ (exported results)
    - top_10_customers.csv (Query 01 results)
    - monthly_sales_trend.csv (Query 02 results)
    - customer_retention_analysis.csv (Query 03 results)
    - geographic_analysis.csv (Query 04 results)
    - product_categories.csv (Query 05 results)

## Key Findings

### Customer Value Analysis (Query 01)
- Top 3 Customers: QUICK-Stop (Germany), Ernst Handel (Austria), Save-a-lot Markets (USA)
- Revenue Concentration: Top 3 customers contribute ~25% of total revenue
- Geographic Pattern: Europe dominates top tier, plus USA

*(See `/outputs/top_10_customers.csv` for full dataset)*

### Monthly Sales Trends (Query 02)
- **Overall Trend:** Strong growth through 1997 (+70% to +110% YoY)
- **Peak Performance:** March 1998 (+172% revenue vs. previous year)
- **Major Anomaly:** May 1998 (-66% revenue, -56% orders) — requires business investigation
- **Pattern:** Q1-Q2 1998 outperformed Q3-Q4 1997 significantly

*(See `/outputs/monthly_sales_trend.csv` for full dataset)*

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

### Product Category Analysis (Query 05)
- **Dominant Categories:** Beverages (21.16%) + Dairy Products (18.53%) = 39.7% of total revenue
- **Volume Over Price:** Meat/Poultry has highest avg price ($42.87) but lower revenue rank (#4)
- **Healthy Mix:** All 8 categories contribute meaningfully (7.5% to 21% each)
- **Insight:** High-volume categories (Beverages, Dairy) outperform high-margin categories

*(See `/outputs/product_categories.csv` for full category breakdown)*

## Status
🟢 **COMPLETE** — All 5 queries finished with documented findings and CSV exports.

## Completed Queries
1. ✅ Schema Overview (Query 00)
2. ✅ Customer Revenue Analysis (Query 01)
3. ✅ Monthly Sales Trends (Query 02)
4. ✅ Customer Retention Analysis (Query 03)
5. ✅ Geographic Performance (Query 04)
6. ✅ Product Category Analysis (Query 05)

## Files in This Repository
- **queries/** — 6 SQL scripts with inline documentation
- **outputs/** — 5 CSV files (one per analysis query)
- **README.md** — Full project documentation with executive summary
- **LICENSE** — MIT License
- **.gitignore** — Git exclusion rules

## Contact
- **Author:** JosteinCT
- **GitHub:** https://github.com/JosteinCT
- **Email:** [josteinct@gmail.com](mailto:josteinct@gmail.com)

---

*This project was developed using AI-assisted code validation and documentation review. All analytical decisions and business interpretations are the author's own work.*

## License
MIT License — see [LICENSE](LICENSE) file for details