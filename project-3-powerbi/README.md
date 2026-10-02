# Power BI Attrition Monitoring Dashboard

## Executive Summary

This project transforms Python EDA insights into an interactive Power BI dashboard for HR leadership. The dashboard monitors employee attrition patterns with focus on department-level performance, compensation thresholds, and satisfaction correlations.

**Key Insight:** The dashboard enables HR to identify at-risk employee segments and prioritize retention interventions based on data-driven thresholds.

## Dataset & Integration

- **Source:** IBM HR Analytics Employee Attrition & Performance
- **Integration:** Extends Project 2 (Python EDA) cleaned dataset
- **Records:** 1,470 employees after cleaning
- **Link to Project 2:** [project-2-python](../project-2-python)

## Dashboard Features

| Feature | Description | Visual Element |
|---------|-------------|----------------|
| **Interactive Slicers** | Filter by department, age, tenure | Dropdowns/sliders |
| **KPI Cards** | Instant overview of key metrics | Top panel |
| **Trend Analysis** | Monthly/annual attrition patterns | Line chart |
| **Segment Comparison** | Department-wise breakdown | Bar chart |
| **Correlation Insights** | Income/satisfaction vs attrition | Scatter/heatmap |

## DAX Measures Implemented

| Measure | Formula | Purpose |
|---------|---------|---------|
| Attrition Rate | `DIVIDE(COUNT(Yes), COUNT(ALL))` | Primary metric |
| Avg Income | `AVERAGE(MonthlyIncome)` | Compensation baseline |
| Headcount by Dept | `CALCULATE(COUNTROWS(), GROUPBY(Department))` | Segment analysis |

## Power Query Transformations

1. Import cleaned CSV from Project 2
2. Create date table for trend analysis
3. Aggregate department-level metrics
4. Calculate derived columns (attrition flag, income brackets)
5. Optimize for visual performance

## Screenshots

*(Exported dashboard views for GitHub documentation)*

- [01 Executive Summary Card](outputs/01_executive_summary_card.png)
- [02 Attrition Trend Line](outputs/02_attrition_trend_line.png)
- [03 Department Comparison Bar](outputs/03_dept_comparison_bar.png)
- [04 Income Scatter Plot](outputs/04_income_scatter_plot.png)
- [05 Age Histogram](outputs/05_age_histogram.png)
- [06 Full Dashboard View](outputs/06_full_dashboard_view.png)

## Tools & Libraries

- **Platform**: Power BI Desktop Free Edition
- **Languages**: DAX (Data Analysis Expressions)
- **Environment**: Windows 11, Git/GitHub
- **Development Support**: AI-assisted coding and documentation review

## Limitations (Free Edition)

- Dashboard cannot be published to Power BI Service (cloud)
- Sharing requires manual distribution of PBIX file
- No scheduled refresh capability
- Screenshot exports used for GitHub documentation

## Appendix: Data Quality & Methodology Notes

*(Same cleaning summary from Project 2 - inherited dataset)*

---

*Last Updated: TBD*  
*Author: JosteinCT*  
*Portfolio Project 3: Power BI Dashboard*

## License

MIT License — See LICENSE file

## Attribution

Dataset source: [Kaggle - IBM HR Analytics Employee Attrition & Performance Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)