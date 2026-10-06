# Power Query Transformation Log

## Step 0: Evaluated Index Column Addition

**Decision:** SKIP adding EmployeeID index column

**Rationale:**
- `EmployeeNumber` already serves as unique identifier (1,470 unique values)
- Artificial index adds no business value to dashboard
- Fewer columns = better performance
- Maintains semantic clarity (stakeholders understand EmployeeNumber)
- Non-sequential EmployeeNumber IDs still guarantee uniqueness

**Principle Applied:** Avoid adding derived columns unless they serve clear analytical or UX purposes.

**Date:** October 05, 2026  
**Reviewer:** JosteinCT (validated by AI assistant review)

---

## Step 1: Add AgeGroup Column

**Date Completed:** October 05, 2026  
**Purpose:** Segment employees by age range for dashboard filtering and analysis  

**Implementation Method:** Power Query UI (Add Conditional Column)  
*(UI method chosen over handwritten M code for easier maintenance and transparency)*

**Conditional Logic:**
| Condition | Result |
|-----------|--------|
| Age < 30 | Under 30 |
| Age ≥ 30 AND < 40 | 30-39 |
| Age ≥ 40 AND < 50 | 40-49 |
| Age ≥ 50 | >50 |

**Result:** New column `AgeGroup` with 4 categorical values  
**Data Type:** Text (manual adjustment from General)  
**Validation:** Verified 4 distinct categories in preview  
**Benefit:** Enables age-segmented slicers on dashboard without complex DAX

**Notes:** Using UI-based conditional column instead of M formula for easier maintenance and transparency.

---

## Step 2: Add IncomeBracket Column

**Date Completed:** October 05, 2026  
**Purpose:** Categorize employees by compensation level for attrition correlation analysis  

**Implementation Method:** Power Query UI (Add Conditional Column)  

**Conditional Logic:**
| Condition | Result |
|-----------|--------|
| MonthlyIncome < $4,000 | Low (<$4,000) |
| MonthlyIncome ≥ $4,000 AND < $7,000 | Medium ($4,000-$7,000) |
| MonthlyIncome ≥ $7,000 AND < $12,000 | High ($7,000-$12,000) |
| MonthlyIncome ≥ $12,000 | Very High (≥$12,000) |

**Result:** New column `IncomeBracket` with 4 categorical values  
**Data Type:** Text (manual adjustment from General)  
**Validation:** Verified 4 distinct categories in preview  
**Benefit:** Enables income-segmented analysis (correlates with attrition per Project 2 findings)

**Notes:** Thresholds aligned with Project 2 Python EDA findings (mean income $4,760 for attrited vs $6,692 for retained).

---

## Step 3: Evaluated AttritionFlag Binary Column Addition

**Decision:** SKIP adding AttritionFlag binary column

**Rationale:**
- Original `Attrition` column ("Yes"/"No") already usable in DAX
- Binary flag provides marginal simplicity at cost of extra column
- Can calculate attrition rate using FILTER function without new column
- Fewer columns = cleaner data model

**DAX Alternative (Text-Based):**
```dax
// Instead of SUM(AttritionFlag), use:
Attrition Rate % = DIVIDE(
    COUNTROWS(FILTER(EmployeeData, EmployeeData[Attrition] = "Yes")),
    COUNTROWS(EmployeeData)
)
```

**Principle Applied:** Minimize transformation steps unless they serve clear analytical or UX purposes.

**Date:** October 06, 2026  
**Reviewer:** JosteinCT (validated by AI assistant review)

---

## Step 4: Evaluated Date Table Creation

**Decision:** SKIP creating date table in Power Query

**Rationale:**
- Original dataset has no temporal dimension (no hire date, attrition date columns)
- Cannot create meaningful time-series analysis without dates
- Dashboard will focus on cross-sectional analysis instead

**Impact:** Attrition Trend Line chart will show department-wise breakdown instead of monthly trends

**Principle Applied:** Do not fabricate temporal data that doesn't exist in the source.

**Date:** October 06, 2026  
**Reviewer:** JosteinCT (validated by AI assistant review)

---

## Step 5: Evaluated Star Schema Modeling

**Decision:** SKIP — retain single flat table model

**Rationale:**
- Single fact source (1 table, 1,470 rows) with no shared dimensions
- `AgeGroup`, `IncomeBracket`, `Department` function as implicit dimensions within the table
- Splitting into dimension tables would add relationship management complexity with zero analytical benefit
- Star schemas deliver value with multiple fact tables, conformed dimensions, or large volumes — none apply here

**Principle Applied:** Model complexity must be justified by analytical need, not methodology for its own sake.

**Date:** October 06, 2026
**Reviewer:** JosteinCT




