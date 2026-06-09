-- List databases
SELECT datname FROM pg_database;

-- List users
SELECT usename FROM pg_user;

-- Active sessions
SELECT * FROM pg_stat_activity;

-- Database size
SELECT pg_size_pretty(pg_database_size(current_database()));

-- Current connections
SELECT count(*) FROM pg_stat_activity;
