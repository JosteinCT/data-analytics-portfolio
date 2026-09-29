# Python EDA: IBM HR Employee Attrition Analysis

## Executive Summary

This project explores employee attrition patterns at IBM using exploratory data analysis (EDA) techniques in Python. The goal is to identify key factors driving employee turnover and provide actionable retention recommendations for HR leadership.

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
| Duplicate Records | All | 50 rows | Removed via `drop_duplicates()` |
| Inconsistent Casing | BusinessTravel, OverTime | ~30% affected | Standardized to Title Case |
| Type Errors | MonthlyIncome | 30 values | `pd.to_numeric(errors='coerce')` |
| Outliers | Age, YearsAtCompany | 18 records | Verified & capped/removed |
| Special Characters | EmployeeName | 20 names | Sanitized for consistency |

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


## Tools & Libraries

- **Language**: Python 3.12
- **Libraries**: pandas, numpy, matplotlib, seaborn, jupyter
- **Environment**: VS Code, Git/GitHub

## Methodology

1. **Data Loading** — Import messy dataset, profile structure
2. **Data Cleaning** — Handle missing values, duplicates, type corrections
3. **Exploratory Analysis** — Univariate/multivariate distributions, correlations
4. **Visualization** — Charts, heatmaps, segmentations
5. **Insights** — Business recommendations based on findings

## Key Insights (To Be Completed After Analysis)

*[Will be filled after completing the EDA]*

## License

MIT License — See LICENSE file

## Attribution

Dataset source: [Kaggle - IBM HR Analytics Employee Attrition & Performance Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)