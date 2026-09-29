"""
Inject realistic data quality issues into IBM HR dataset
Creates a 'raw/messy' version from the clean source
"""

import pandas as pd
import numpy as np
from pathlib import Path

# Set seed for reproducibility
np.random.seed(42)

# Load clean dataset
df = pd.read_csv('C:/Users/j384/Documents/portfolio/project-2-python/data/raw/HR-Employee-Attrition.csv')  # adjust filename

# Store original size
original_rows = len(df)
print(f"Original: {original_rows:,} rows")

# ========== 1. ADD MISSING VALUES (Random NaNs) ==========
missing_cols = ['Age', 'MonthlyIncome', 'JobSatisfaction', 
                'EducationField', 'Department']
for col in missing_cols:
    if col in df.columns:
        mask = np.random.rand(len(df)) < 0.05  # 5% missing
        df.loc[mask, col] = np.nan

# ========== 2. ADD DUPLICATE ROWS ==========
duplicate_idx = np.random.choice(len(df), size=50, replace=False)
duplicates = df.iloc[duplicate_idx].copy()
df = pd.concat([df, duplicates], ignore_index=True)
print(f"After duplicates: {len(df):,} rows (+{len(duplicates)})")

# ========== 3. INCONSISTENT TEXT FORMATTING ==========
if 'BusinessTravel' in df.columns:
    df['BusinessTravel'] = df['BusinessTravel'].apply(
        lambda x: x.lower() if isinstance(x, str) and np.random.rand() > 0.7 else x
    )
    
if 'OverTime' in df.columns:
    df['OverTime'] = df['OverTime'].replace(
        {'Yes': 'yes', 'No': 'NO'}  # inconsistent casing
    )

# ========== 4. INCORRECT DATA TYPES ==========
# Mix some numbers with text in numeric column
if 'MonthlyIncome' in df.columns:
    noisy_idx = np.random.choice(len(df), size=30, replace=False)
    noise_values = ['N/A', '', 'null', 'NULL', 'unknown']
    df.loc[noisy_idx, 'MonthlyIncome'] = np.random.choice(noise_values, size=30)

# ========== 5. OUTLIERS (Unrealistic values) ==========
if 'Age' in df.columns:
    outlier_idx = np.random.choice(len(df), size=10, replace=False)
    df.loc[outlier_idx, 'Age'] = np.random.choice([12, 95, 150, -5])
    
if 'YearsAtCompany' in df.columns:
    outlier_idx = np.random.choice(len(df), size=8, replace=False)
    df.loc[outlier_idx, 'YearsAtCompany'] = 500  # unrealistic tenure

# ========== 6. ADD SPECIAL CHARACTERS / ENCODING ISSUES ==========
if 'EmployeeName' not in df.columns:  # create dummy if missing
    df['EmployeeName'] = [f'Employee_{i}' for i in range(len(df))]
    
special_idx = np.random.choice(len(df), size=20, replace=False)
special_chars = ['John Ø''Dell', 'María García-Ramos', '李明', 'Björk ðæ', None]
df.loc[special_idx[:len(special_chars)], 'EmployeeName'] = special_chars

# Save messy version
Path('../data/raw/').mkdir(parents=True, exist_ok=True)
df.to_csv('C:/Users/j384/Documents/portfolio/project-2-python/data/raw/IBM_HR_Employee_Attrition_MESSY.csv', index=False, encoding='utf-8-sig')

# Backup clean version
df.to_csv('C:/Users/j384/Documents/portfolio/project-2-python/data/cleaned/IBM_HR_Employee_Attrition_CLEAN.csv', index=False)

print(f"\n✅ Created messy dataset with {len(df):,} rows")
print(f"📁 Saved to: data/raw/IBM_HR_Employee_Attrition_MESSY.csv")
print(f"📁 Clean backup: data/cleaned/IBM_HR_Employee_Attrition_CLEAN.csv")