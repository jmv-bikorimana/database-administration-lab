# Database Monitoring Guide

## Purpose

This document provides procedures for monitoring PostgreSQL databases to ensure availability, performance, reliability, and operational stability.

---

## Monitoring Objectives

- Ensure database availability
- Detect performance issues early
- Monitor resource utilization
- Track database growth
- Support proactive maintenance
- Improve operational reliability

---

## Key Monitoring Areas

### Database Availability

Verify PostgreSQL service status:

```bash
systemctl status postgresql
```

Verify connectivity:

```bash
psql -U postgres
```

---

### Active Connections

Monitor active sessions:

```sql
SELECT *
FROM pg_stat_activity;
```

Count active connections:

```sql
SELECT count(*)
FROM pg_stat_activity;
```

---

### Long Running Queries

Identify queries consuming excessive resources:

```sql
SELECT
    pid,
    usename,
    datname,
    now() - query_start AS runtime,
    query
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY runtime DESC;
```

---

### Database Size Monitoring

Check current database size:

```sql
SELECT pg_size_pretty(
       pg_database_size(current_database())
);
```

List database sizes:

```sql
SELECT
    datname,
    pg_size_pretty(pg_database_size(datname))
FROM pg_database;
```

---

### Table Growth Monitoring

Identify largest tables:

```sql
SELECT
    schemaname,
    tablename,
    pg_size_pretty(
        pg_total_relation_size(
            schemaname||'.'||tablename
        )
    ) AS size
FROM pg_tables
ORDER BY pg_total_relation_size(
    schemaname||'.'||tablename
) DESC;
```

---

### Lock Monitoring

Review database locks:

```sql
SELECT *
FROM pg_locks;
```

Detect blocking sessions:

```sql
SELECT
    pid,
    usename,
    application_name
FROM pg_stat_activity
WHERE wait_event IS NOT NULL;
```

---

### Backup Monitoring

Verify backup completion:

- Check backup logs
- Verify backup file creation
- Validate backup size
- Perform periodic restore testing

---

### Storage Monitoring

Monitor:

- Disk utilization
- Database growth trends
- Available storage capacity
- Backup storage utilization

Linux example:

```bash
df -h
```

---

## Monitoring Frequency

| Activity | Frequency |
|-----------|------------|
| Service Status | Daily |
| Active Connections | Daily |
| Database Size | Weekly |
| Table Growth | Weekly |
| Backup Validation | Daily |
| Recovery Testing | Monthly |
| Performance Review | Monthly |

---

## Monitoring Workflow

Database Service
↓
Connection Review
↓
Performance Review
↓
Storage Monitoring
↓
Backup Validation
↓
Reporting
↓
Corrective Action

---

## Expected Outcomes

- Improved database availability
- Early detection of performance issues
- Better capacity planning
- Reliable backup validation
- Improved operational readiness
- Reduced downtime risks
