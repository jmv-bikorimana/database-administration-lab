# Database Backup and Recovery Procedure

## Purpose

This document provides procedures for database backup, recovery, validation, and restoration activities in enterprise environments.

---

## Backup Objectives

- Protect critical data
- Support business continuity
- Reduce data loss risks
- Support disaster recovery

---

## Backup Types

### Full Backup

Complete database backup.

### Incremental Backup

Backup only changed data.

### Differential Backup

Backup data changed since the last full backup.

---

## PostgreSQL Backup

### Backup Single Database

```bash
pg_dump -U postgres enterprise_finance_db > backup.sql
```

### Backup Compressed

```bash
pg_dump -U postgres -Fc enterprise_finance_db > backup.dump
```

### Backup All Databases

```bash
pg_dumpall -U postgres > full_backup.sql
```

---

## Backup Verification

Verify backup file exists:

```bash
ls -lh backup.sql
```

Verify backup integrity.

---

## Recovery Procedure

### Restore SQL Backup

```bash
psql -U postgres enterprise_finance_db < backup.sql
```

### Restore Compressed Backup

```bash
pg_restore -U postgres -d enterprise_finance_db backup.dump
```

---

## Validation

Verify:

- Database accessibility
- User authentication
- Table integrity
- Application connectivity

---

## Recovery Workflow

Backup
↓
Verification
↓
Storage
↓
Recovery Testing
↓
Validation

---

## Expected Outcomes

- Reliable backup procedures
- Successful recovery capability
- Reduced data loss risk
- Improved business continuity
