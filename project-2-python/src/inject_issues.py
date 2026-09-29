"""
Inject realistic data quality issues into IBM HR dataset
Creates a 'raw/messy' version from the clean source
"""

import pandas as pd
import numpy as np
from pathlib import Path

# Set seed for reproducibility
np.random.seed(42)

# Define file paths (relative to script location)
SCRIPT_DIR = Path(__file__).parent  # src/ directory
PROJECT_ROOT = SCRIPT_DIR.parent    # project-2-python/

SOURCE_FILE = PROJECT_ROOT / "data/raw/HR-Employee-Attrition.csv"
MESSY_OUTPUT = PROJECT_ROOT / "data/raw/IBM_HR_Employee_Attrition_MESSY.csv"
CLEAN_OUTPUT = PROJECT_ROOT / "data/cleaned/IBM_HR_Employee_Attrition_CLEAN.csv"

# Ensure output directories exist
CLEAN_OUTPUT.parent.mkdir(parents=True, exist_ok=True)

# Load clean dataset
df_original = pd.read_csv(SOURCE_FILE)
original_rows = len(df_original)
print(f"Original source: {original_rows:,} rows")

# =====================================
# STEP 1: SAVE CLEAN BACKUP FIRST (BEFORE ANY MODIFICATIONS)
# =====================================
df_clean_backup = df_original.copy()
df_clean_backup.to_csv(CLEAN_OUTPUT, index=False)
print(f"✅ Clean backup saved: {len(df_clean_backup):,} rows")

# =====================================
# STEP 2: CREATE WORKING COPY AND MODIFY IT
# =====================================
df = df_original.copy()

# ========== 2.1 ADD MISSING VALUES (Random NaNs) ==========
missing_cols = ['Age', 'MonthlyIncome', 'JobSatisfaction', 
                'EducationField', 'Department']
for col in missing_cols:
    if col in df.columns:
        mask = np.random.rand(len(df)) < 0.05  # 5% missing
        df.loc[mask, col] = np.nan

# ========== 2.2 ADD DUPLICATE ROWS ==========
duplicate_idx = np.random.choice(len(df), size=50, replace=False)
duplicates = df.iloc[duplicate_idx].copy()
df = pd.concat([df, duplicates], ignore_index=True)
print(f"After duplicates: {len(df):,} rows (+{len(duplicates)})")

# ========== 2.3 INCONSISTENT TEXT FORMATTING ==========
if 'BusinessTravel' in df.columns:
    df['BusinessTravel'] = df['BusinessTravel'].apply(
        lambda x: x.lower() if isinstance(x, str) and np.random.rand() > 0.7 else x
    )
    
if 'OverTime' in df.columns:
    df['OverTime'] = df['OverTime'].replace(
        {'Yes': 'yes', 'No': 'NO'}  # inconsistent casing
    )

# ========== 2.4 INCORRECT DATA TYPES ==========
# Mix some numbers with text in numeric column
if 'MonthlyIncome' in df.columns:
    noisy_idx = np.random.choice(len(df), size=30, replace=False)
    noise_values = ['N/A', '', 'null', 'NULL', 'unknown']
    df.loc[noisy_idx, 'MonthlyIncome'] = np.random.choice(noise_values, size=30)

# ========== 2.5 OUTLIERS (Unrealistic values) ==========
if 'Age' in df.columns:
    outlier_idx = np.random.choice(len(df), size=10, replace=False)
    df.loc[outlier_idx, 'Age'] = np.random.choice([12, 95, 150, -5])
    
if 'YearsAtCompany' in df.columns:
    outlier_idx = np.random.choice(len(df), size=8, replace=False)
    df.loc[outlier_idx, 'YearsAtCompany'] = 500  # unrealistic tenure

# ========== 2.6 ADD SPECIAL CHARACTERS / ENCODING ISSUES ==========
if 'EmployeeName' not in df.columns:  # create dummy if missing
    df['EmployeeName'] = [f'Employee_{i}' for i in range(len(df))]
    
special_idx = np.random.choice(len(df), size=20, replace=False)
special_chars = ['John Ø\'Dell', 'María García-Ramos', '李明', 'Björk ðæ', None]
df.loc[special_idx[:len(special_chars)], 'EmployeeName'] = special_chars

# Save messy version (AFTER all modifications)
df.to_csv(MESSY_OUTPUT, index=False, encoding='utf-8-sig')

print(f"\n{'='*60}")
print("SUMMARY")
print('='*60)
print(f"Original source: {original_rows:,} rows")
print(f"Clean backup: {len(df_clean_backup):,} rows")
print(f"Messy dataset: {len(df):,} rows (+50 duplicates injected)")
print(f"\n📁 Saved to: {MESSY_OUTPUT}")
print(f"📁 Clean backup: {CLEAN_OUTPUT}")