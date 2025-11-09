Here’s a **ready-to-use Markdown template** for your database performance monitoring report. You can fill in the specific queries, execution times, and improvements from your tests.

---

# Database Performance Monitoring Report

## Overview

This document presents the monitoring and refinement of query performance in the Airbnb database. We analyzed frequently used queries, identified bottlenecks, implemented schema adjustments, and measured the improvements.

---

## 1️⃣ Monitored Queries

The following queries were analyzed using `EXPLAIN ANALYZE`:

### Query 1 – Fetch Bookings with User and Property Details

```sql
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  u.first_name || ' ' || u.last_name AS user_fullname,
  p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
ORDER BY b.start_date DESC;
```

**Observations Before Optimization:**

* Execution Time: ~750 ms
* Scan Type: Sequential Scan on `bookings` table
* Bottleneck: No indexes on `user_id` or `property_id` for join operations

---

### Query 2 – Fetch Properties by Location

```sql
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Lagos';
```

**Observations Before Optimization:**

* Execution Time: ~120 ms
* Scan Type: Sequential Scan
* Bottleneck: No index on `location` column

---

## 2️⃣ Optimizations Implemented

### Indexes Added

```sql
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);
```

### Schema Adjustments

* Ensured primary and foreign keys exist for join optimization.
* Verified data types for columns used in filtering and joins to reduce type casting overhead.

---

## 3️⃣ Performance After Optimization

| Query                               | Execution Time Before | Execution Time After | Improvement |
| ----------------------------------- | --------------------- | -------------------- | ----------- |
| Fetch bookings with user & property | 750 ms                | 18 ms                | ~97% faster |
| Fetch properties by location        | 120 ms                | 5 ms                 | ~95% faster |

**Notes:**

* Indexes allowed PostgreSQL to use **Index Scans** instead of full sequential scans.
* Query execution time dropped drastically for frequently accessed tables.
* Schema adjustments ensured data integrity and efficient joins.

---

## 4️⃣ Recommendations

* Regularly monitor queries that involve joins on large tables.
* Consider **partitioning large tables** (like `bookings`) to improve range queries.
* Avoid over-indexing, as excessive indexes can slow down `INSERT` and `UPDATE` operations.
* Periodically run `EXPLAIN ANALYZE` after schema changes or data growth to catch new bottlenecks early.
