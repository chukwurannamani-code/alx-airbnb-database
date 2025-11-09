-- =========================================================
-- perfomance.sql
-- Query optimization: initial + EXPLAIN ANALYZE, then indexes, then optimized + EXPLAIN ANALYZE
-- Uses actual table names: booking, "User", property, payment
-- Includes WHERE and AND clauses as required
-- =========================================================

-- ===============================
-- 1) INITIAL COMPLEX QUERY (with WHERE + AND)
-- ===============================

EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name AS property_name,
  p.location,
  pay.payment_id,
  pay.amount
FROM booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '90 days'    -- example filter (WHERE)
  AND b.status = 'confirmed'                              -- example additional filter (AND)
ORDER BY b.start_date DESC;

-- =========================================================
-- 2) CREATE INDEXES (to help JOINs and ORDER BY)
--    (use same table names your DB shows)
-- =========================================================

-- Indexes on booking table (foreign keys & ordering column)
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking (user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking (property_id);
CREATE INDEX IF NOT EXISTS idx_booking_start_date ON booking (start_date);

-- Index on payment (FK)
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON payment (booking_id);
