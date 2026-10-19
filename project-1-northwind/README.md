# Northwind Sales Analysis

## Executive Summary

### Analysis Highlights
| Query | Business Question | Key Finding |
|-------|------------------|-------------|
| 01 | Top customer revenue concentration | Top 3 customers drive 25% of revenue |
| 02 | Monthly sales trends (July 1996–May 1998) | May 1998: -66% revenue vs Apr 1998 (final month of dataset; possible truncation) |
| 03 | Customer retention/loyalty | 67% loyal customers (3 years), 95.5% overall retention |
| 04 | Geographic market analysis | Top 3 countries = 47.7% revenue concentration risk |
| 05 | Product category performance | Beverages + Dairy = 39.7% of total revenue |

### Strategic Recommendations
1. **Prioritize top-tier customers** — 67% are loyal, focus on retention programs
2. **Investigate May 1998 anomaly** — Requires business context for root cause
3. **Expand in Europe** — Strong performance in Germany/Austria suggests opportunity
4. **Monitor category concentration** — Top 2 categories represent 40% of revenue
5. **Diversify geographic risk** — 48% revenue from 3 countries presents concentration risk

### Technical Skills Demonstrated
- PostgreSQL (CTEs, window functions, complex JOINs, date analysis)
- SQL optimization (type casting, COALESCE, GROUP BY refinement)
- Schema documentation (primary/foreign key mapping)
- Business insight translation (query → finding → recommendation)
- Documentation (README, CSV exports, version control)

## Data Source
- **Dataset:** Northwind Traders Sample Database
- **Original Source:** Microsoft SQL Server Samples (public domain)
- **PostgreSQL Conversion:** [pthom/northwind_psql](https://github.com/pthom/northwind_psql)
- **Date Period:** July 1996 – May 1998 
- **License:** Public Domain / MIT

## Database Schema

**Tables:** customers, orders, order_details, products, suppliers, categories  
**Key Relationships:** orders.customer_id → customers | products.category_id → categories | order_details.product_id → products

*(See `queries/00_schema_overview.sql` for complete PK/FK documentation)*

## Business Objective
Identify revenue drivers and customer value segments to inform sales strategy and retention efforts.

## Key Questions Investigated
1. What are the top 10 customers by lifetime revenue? ✅
2. How does monthly revenue trend over the 3-year period? ✅
3. What is customer retention/churn rate? ✅
4. Which product categories contribute most to revenue? ✅
5. Which countries have highest average order value? ✅

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
| Metric | Value |
|--------|-------|
| Top 3 Customers | QUICK-Stop (DE), Ernst Handel (AT), Save-a-lot Markets (US) |
| Revenue Concentration | Top 3 = ~25% of total revenue |
| Geographic Pattern | Europe dominates top tier + USA |

[View Full Results](./outputs/top_10_customers.csv)

### Monthly Sales Trends (Query 02)
| Metric | Value |
|--------|-------|
| Overall Trend | Strong growth through 1997 (+70% to +110% YoY) |
| Peak Performance | March 1998 (+172% revenue vs. previous year) |
| Data Boundary | Dataset ends May 6, 1998 — 14 orders across 6 days |
| Reported Anomaly | May 1998 (-66% revenue, -56% orders) — truncation artifact, not demand collapse |
| Pattern | Q1-Q2 1998 outperformed Q3-Q4 1997 significantly |
| Scope Note | Trend conclusions drawn through April 1998; May 1998 excluded from YoY comparisons |

### Data Range Note

This dataset spans **July 1996 to May 1998**. The May 1998 revenue drop (-66% vs. April) coincides with the dataset's endpoint. Without June–August 1998 data, we cannot distinguish whether this reflects genuine demand collapse or truncated record-keeping. Further investigation would require the complete fiscal year.

[View Full Results](./outputs/monthly_sales_trend.csv)

### Customer Retention Analysis (Query 03)
| Metric | Value |
|--------|-------|
| Loyal Customers (3 years) | 67.42% (60 customers) |
| Repeat Customers (2 years) | 28.09% (25 customers) |
| One-Time Customers | Only 4.49% (4 customers) |
| Overall Retention Rate | ~95.5% |

[View Full Results](./outputs/customer_retention_analysis.csv)

### Geographic Performance (Query 04)
| Metric | Value |
|--------|-------|
| Top 3 Markets | USA (19.4%), Germany (18.2%), Austria (10.1%) |
| Concentration Risk | Nearly 50% revenue from 3 countries |
| European Presence | 15 of 21 countries are European |

[View Full Results](./outputs/geographic_analysis.csv)

### Product Category Analysis (Query 05)
| Metric | Value |
|--------|-------|
| Dominant Categories | Beverages (21.16%) + Dairy (18.53%) = 39.7% |
| Highest Avg Price | Meat/Poultry ($42.87) but lower revenue rank (#4) |
| Category Distribution | All 8 categories contribute 7.5% to 21% each |

[View Full Results](./outputs/product_categories.csv)

## Status
🟢 **COMPLETE** — All 5 queries finished with documented findings and CSV exports.

## Contact
- **Author:** JosteinCT
- **GitHub:** [github.com/JosteinCT](https://github.com/JosteinCT)
- **Email:** [josteinct@gmail.com](mailto:josteinct@gmail.com)

---

*This project was developed using AI-assisted code validation and documentation review. All analytical decisions and business interpretations are the author's own work.*

## License
MIT License — see [LICENSE](LICENSE) file for details