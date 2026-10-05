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

## Step 1: Add AgeGroup Column

**Date Completed:** October 05, 2026  
**Purpose:** Segment employees by age range for dashboard filtering and analysis  

**Implementation Method:** Power Query UI (Add Conditional Column)  
*(Not handwritten M code — UI method is more maintainable)*

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
*(Not handwritten M code — UI method is more maintainable)*

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

**Notes:** Using UI-based conditional column instead of M formula for easier maintenance and transparency.

## Step 3: Evaluated AttritionFlag Addition

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

Principle Applied: Minimize transformation steps unless they serve clear analytical or UX purposes.

Date: October 05, 2026 Reviewer: JosteinCT (validated by AI assistant review)

