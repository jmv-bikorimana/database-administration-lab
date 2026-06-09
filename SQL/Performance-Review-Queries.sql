-- Long running queries

SELECT
    pid,
    usename,
    now() - query_start AS runtime,
    query
FROM pg_stat_activity
WHERE state='active';

-- Largest tables

SELECT
    schemaname,
    tablename,
    pg_size_pretty(
        pg_total_relation_size(
            schemaname||'.'||tablename
        )
    )
FROM pg_tables
ORDER BY pg_total_relation_size(
    schemaname||'.'||tablename
) DESC;

-- Current database size

SELECT pg_size_pretty(
    pg_database_size(current_database())
);
