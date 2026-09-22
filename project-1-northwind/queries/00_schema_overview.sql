-- ========================================
-- File: 00_schema_overview.sql
-- Business Question: Verify tables loaded correctly
-- Author: JosteinCT
-- Date: 2026-09-22
-- ========================================

-- Check table count in database
SELECT COUNT(*) AS table_count 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE';

-- Show all table names
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
ORDER BY table_name;