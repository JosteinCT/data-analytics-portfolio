# Python EDA: IBM HR Employee Attrition Analysis

## Executive Summary

This project explores employee attrition patterns at IBM using exploratory data analysis (EDA) techniques in Python. Through systematic data cleaning and statistical analysis, I identified key factors driving employee turnover and provided actionable retention recommendations for HR leadership.

**Key Finding:** The overall attrition rate is **16.1%**, with younger employees, lower-income workers, and those in Sales showing the highest turnover risk.

## Business Questions

1. What factors correlate most strongly with employee attrition?
2. Which departments have highest/lowest turnover rates?
3. Is there a relationship between compensation and attrition risk?
4. How do tenure, age, and job satisfaction interact with attrition?
5. What retention strategies would you recommend based on the findings?

## Dataset & Data Quality Issues

### Source
- **Dataset**: IBM HR Analytics Employee Attrition & Performance
- **Original Record Count**: ~1,470 employees
- **Record Count After Duplicates**: 1,520 employees (50 synthetic duplicates added)
- **Features**: 36 columns (35 original + 1 generated EmployeeName)

### Original Dataset Link
[Kaggle - IBM HR Analytics Employee Attrition & Performance Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

### Raw Data Issues Documented

| Issue Type | Columns Affected | Frequency | Resolution |
|-----------|------------------|-----------|------------|
| Missing Values | Age, MonthlyIncome, JobSatisfaction, EducationField, Department | ~5% per column | Median imputation (numeric), Mode (categorical) |
| Duplicate Records | All | 50 rows | Removed via `drop_duplicates(subset='EmployeeNumber')` |
| Inconsistent Casing | BusinessTravel, OverTime | ~30% affected | Standardized to Title Case |
| Type Errors | MonthlyIncome | 110 values | `pd.to_numeric(errors='coerce')` |
| Outliers | Age, YearsAtCompany | 18 records | Capped at business thresholds (Age 18-70, Tenure ≤40) |
| Special Characters | EmployeeName | 20 names | Column dropped (no analytical value) |

### Project Structure
- project-2-python/
  - .gitignore
  - LICENSE
  - README.md
  - data/
    - raw/
      - HR-Employee-Attrition.csv (original clean source from Kaggle)
      - IBM_HR_Employee_Attrition_MESSY.csv (messy version for cleaning demo)
    - cleaned/
      - IBM_HR_Employee_Attrition_CLEAN.csv (final cleaned dataset)
  - notebooks/
    - 01_hr_attrition_eda.ipynb (main EDA notebook)
  - src/
    - inject_issues.py (script that created messy data)
  - outputs/ (exported charts & CSVs)
    - 01_outlier_diagnostics.png
    - 02_attrition_distribution.png
    - 03_correlation_heatmap.png
    - 04_attrition_vs_age.png
    - 05_attrition_vs_income.png
    - 06_attrition_by_department.png
    - 07_attrition_vs_satisfaction.png

## Tools & Libraries

- **Language**: Python 3.12
- **Libraries**: pandas, numpy, matplotlib, seaborn, jupyter
- **Environment**: VS Code, Git/GitHub
- **Development Support**: AI-assisted coding, documentation review, and validation

## Methodology

1. **Data Loading** — Import messy dataset, profile structure
2. **Data Cleaning** — Handle missing values, duplicates, type corrections, outliers
3. **Exploratory Analysis** — Univariate/multivariate distributions, correlations
4. **Visualization** — Charts, heatmaps, segmentations
5. **Insights** — Business recommendations based on findings

## Key Insights & Business Recommendations

### Key Findings

| Finding | Metric | Impact |
|---------|--------|--------|
| Younger employees leave more frequently | Mean age: 34.1 (leavers) vs 37.8 (stayers) | Early-career retention programs needed |
| Lower-income employees have higher turnover | Monthly income: $4,760 vs $6,692 | Compensation review for low-paying roles |
| Sales department has highest attrition rate | Sales: 20.8% | Investigate Sales-specific issues |
| Job satisfaction strongly predicts attrition | Satisfaction: 2.46 vs 2.79 | Engagement surveys and improvement plans |
| High-income workers stay longer | Top earners: <5% attrition | Retention bonuses for high performers |

### Business Recommendations

1. **Early-Career Retention Program**
   - Target employees aged 18-35 with mentorship initiatives
   - Create clear career progression pathways
   - Implement 6-month and 1-year retention check-ins

2. **Compensation Review for Sales Department**
   - Investigate why Sales has 20.8% attrition (vs 13.9% for R&D)
   - Review commission structures and base salary alignment
   - Compare compensation to industry benchmarks

3. **Job Satisfaction Improvement**
   - Conduct engagement surveys to identify pain points
   - Address work-life balance concerns
   - Provide recognition programs and growth opportunities

4. **High-Income Employee Retention**
   - Identify critical high-earning talent (<5% of workforce but high impact)
   - Develop succession planning for senior roles
   - Consider retention bonuses for institutional knowledge holders

5. **Data-Driven Monitoring**
   - Track attrition metrics quarterly by department
   - Set early warning thresholds (e.g., if satisfaction drops below 2.5)
   - Build predictive models to identify at-risk employees

## Appendix: Data Quality & Methodology Notes

### Data Cleaning Summary
| Issue | Count | Resolution |
|-------|-------|------------|
| Duplicate Records | 50 | Removed via `EmployeeNumber` |
| Missing Values | 394 | Median/Mode imputation |
| Type Errors | 110 | `MonthlyIncome` coerced to float |
| Inconsistent Casing | 2 columns | Standardized to Title Case |
| Outliers | 18 | Capped at business thresholds |
| Irrelevant Columns | 2 | Dropped (`EmployeeName`, `Over18`) |

### Model Limitations

- **Cross-sectional data**: Single point in time limits causal inference
- **Self-reported variables**: Some measures may be subject to bias
- **No longitudinal tracking**: Cannot confirm if patterns persist over time

### Code Validation Notes

- Generated by: Python 3.12 with pandas 2.x, seaborn 1.x, matplotlib 3.x
- AI-assisted development: Code snippets validated with AI assistant
- All cleaning decisions documented with business rationale
- Transparent acknowledgment: AI tools used for documentation review and code suggestions

---

*Last Updated: October 01, 2026*  
*Author: JosteinCT*  
*Portfolio Project 2: Python EDA*

## License

MIT License — See LICENSE file

## Attribution

Dataset source: [Kaggle - IBM HR Analytics Employee Attrition & Performance Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)