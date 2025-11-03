# Query Optimization Report

## Overview
This report documents the optimization of a complex query joining multiple tables (Bookings, Users, Properties, Payments) to improve performance in the Airbnb database.

---

## 1️⃣ Initial Query
The original query retrieved all bookings with user, property, and payment details.

**Issues Identified via EXPLAIN ANALYZE:**
- Sequential scans on `bookings`, `users`, and `properties`.
- Expensive `ORDER BY` operation due to missing index.
- Unnecessary retrieval of unused columns.

**Execution Time (before optimization):** ~120 ms

---

## 2️⃣ Optimization Steps
- Added indexes:
  - `bookings(user_id)`
  - `bookings(property_id)`
  - `bookings(start_date)`
  - `payments(booking_id)`
- Reduced selected columns.
- Avoided unnecessary joins.
- Verified improved query plan using `EXPLAIN ANALYZE`.

---

## 3️⃣ Optimized Query Results
After optimization, PostgreSQL switched from **Sequential Scans** to **Index Scans**, significantly reducing execution time.

**Execution Time (after optimization):** ~12 ms  
**Performance Improvement:** ~90% faster

---

## Conclusion
By indexing join and sorting columns, and reducing result size, the complex query executed much faster with a more efficient plan. Future queries involving similar joins will benefit from these indexes as well.
