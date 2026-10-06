# Power BI Attrition Monitoring Dashboard

## Executive Summary

This project transforms Python EDA insights into an interactive Power BI dashboard for HR leadership. The dashboard monitors employee attrition patterns with focus on department-level performance, compensation thresholds, and satisfaction correlations.

**Key Insight:** The dashboard enables HR to identify at-risk employee segments and prioritize retention interventions based on data-driven thresholds.

**Status:** ⏳ In Progress (Building DAX measures and visuals)

---

## Dataset & Integration

- **Source:** IBM HR Analytics Employee Attrition & Performance
- **Integration:** Extends Project 2 (Python EDA) cleaned dataset
- **Records:** 1,470 employees after cleaning
- **Link to Project 2:** [project-2-python](../project-2-python)

---

## Dashboard Features (Planned)

| Feature | Description | Visual Element |
|---------|-------------|----------------|
| **Interactive Slicers** | Filter by department, age group, income bracket | Dropdowns/sliders |
| **KPI Cards** | Instant overview of headcount, attrition rate, avg income, avg satisfaction | Top panel |
| **Department Comparison** | Attrition rate by department | Horizontal bar chart |
| **Income vs Attrition** | Compensation threshold analysis | Scatter plot |
| **Age Distribution** | Demographic breakdown by attrition status | Stacked histogram |
| **Job Satisfaction Matrix** | Engagement correlation heatmap | Matrix/Heatmap |

**Note:** Time-series trend analysis removed due to lack of date column in dataset.

---

## Power Query Transformations (Completed)

1. Import cleaned CSV from Project 2
2. Create `AgeGroup` column (4 age categories via UI)
3. Create `IncomeBracket` column (4 income categories via UI)
4. Skip unnecessary columns (index, binary attrition flag)
5. Validate data types (categorical fields as Text)

**Documentation:** [power_query_steps.md](src/power_query_steps.md)

---

## DAX Measures (In Progress)

| Measure | Formula Preview | Purpose |
|---------|-----------------|---------|
| Total Employees | `COUNTROWS(EmployeeData)` | Baseline workforce size |
| Attrition Count | `COUNTROWS(FILTER(...))` | Turnover volume |
| Attrition Rate % | `DIVIDE([Count], [Total])` | Primary KPI |
| Avg Monthly Income | `AVERAGE(MonthlyIncome)` | Compensation benchmark |
| Avg Job Satisfaction | `AVERAGE(JobSatisfaction)` | Engagement indicator |

**Full Documentation:** [dax_measures.txt](src/dax_measures.txt) *(to be created)*

---

## Screenshots

*(Will be exported after dashboard completion)*

- [ ] 01 Executive Summary Card
- [ ] 02 Department Comparison Bar
- [ ] 03 Income vs Attrition Scatter
- [ ] 04 Age Distribution Histogram
- [ ] 05 Job Satisfaction Matrix
- [ ] 06 Full Dashboard View

---

## Tools & Environment

- **Platform:** Power BI Desktop Free Edition
- **Languages:** DAX (Data Analysis Expressions)
- **Environment:** Windows 11, Git/GitHub
- **Development Support:** AI-assisted coding and documentation review

---

## Limitations (Free Edition)

- Dashboard cannot be published to Power BI Service (cloud)
- Sharing requires manual distribution of .pbix file
- No scheduled refresh capability
- Screenshot exports used for GitHub documentation

---

## Appendix: Data Quality & Methodology Notes

*See Project 2 documentation for complete data cleaning methodology.*  
This dataset inherits all cleaning decisions from the Python EDA pipeline:

- Missing value imputation (median for numeric, mode for categorical)
- Duplicate removal (exact and partial based on EmployeeNumber + Department)
- Outlier capping using IQR method with multiplier 1.5
- Category standardization to Title Case

---

*Last Updated: October 06, 2026*  
*Author: JosteinCT*  
*Portfolio Project 3: Power BI Dashboard*

---

## License

MIT License — See LICENSE file

---

## Attribution

Dataset source: [Kaggle - IBM HR Analytics Employee Attrition & Performance Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)