# PostgreSQL Administration Guide

## Purpose

This document provides standard procedures for PostgreSQL database administration in enterprise environments.

## Service Management

Check service status:

```bash
systemctl status postgresql
```

Start service:

```bash
systemctl start postgresql
```

Stop service:

```bash
systemctl stop postgresql
```

Restart service:

```bash
systemctl restart postgresql
```

---

## Create Database

```sql
CREATE DATABASE enterprise_finance_db;
```

Verify:

```sql
\l
```

---

## Create User

```sql
CREATE USER app_user WITH PASSWORD 'StrongPassword';
```

---

## Grant Privileges

```sql
GRANT ALL PRIVILEGES ON DATABASE enterprise_finance_db TO app_user;
```

---

## Check Active Sessions

```sql
SELECT * FROM pg_stat_activity;
```

---

## Check Database Size

```sql
SELECT pg_size_pretty(
       pg_database_size('enterprise_finance_db')
);
```

---

## Verify Connectivity

```bash
psql -U app_user -d enterprise_finance_db
```

## Expected Outcome

- PostgreSQL service operational
- Database created
- User configured
- Access verified
- Database available for application use
