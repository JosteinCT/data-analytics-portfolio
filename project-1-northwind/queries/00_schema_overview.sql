-- ========================================
-- File: 00_schema_overview.sql
-- Business Question: Verify tables loaded correctly
--                    and document database structure
-- Author: JosteinCT
-- Date: 2026-09-22
-- ========================================

-- Step 1: Count tables in database
SELECT COUNT(*) AS table_count 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE';

-- Step 2: List all table names
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Step 3: Show primary keys per table
SELECT 
    tc.table_name,
    tc.constraint_name AS primary_key_name,
    ARRAY_AGG(kcu.column_name ORDER BY kcu.ordinal_position) AS pk_columns
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'PRIMARY KEY'
AND tc.table_schema = 'public'
GROUP BY tc.table_name, tc.constraint_name
ORDER BY tc.table_name;

-- Step 4: Show foreign key relationships
SELECT 
    tc.table_name AS child_table,
    kcu.column_name AS child_column,
    ccu.table_name AS parent_table,
    ccu.column_name AS parent_column,
    rc.delete_rule,
    rc.update_rule
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu 
    ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints rc 
    ON tc.constraint_name = rc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
AND tc.table_schema = 'public'
ORDER BY tc.table_name;

-- Step 5: List columns per table (sample: first 5 tables)
SELECT 
    t.table_name,
    t.column_name,
    t.data_type,
    t.character_maximum_length,
    t.is_nullable
FROM information_schema.columns t
WHERE t.table_schema = 'public'
AND t.table_name IN (
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public' 
    ORDER BY table_name
    LIMIT 5
)
ORDER BY t.table_name, t.ordinal_position;