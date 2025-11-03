-- ===================================================
-- DATABASE INDEX CREATION AND PERFORMANCE ANALYSIS
-- ===================================================

-- 1. Measure performance BEFORE creating indexes
EXPLAIN ANALYZE 
SELECT * FROM bookings WHERE user_id = '12345678-aaaa-bbbb-cccc-123456789abc';

EXPLAIN ANALYZE 
SELECT * FROM properties WHERE location = 'Lagos';

EXPLAIN ANALYZE 
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-01-10';

-- ===================================================
-- 2. Create Indexes to Improve Query Performance
-- ===================================================

-- On Users table
CREATE INDEX idx_users_email ON users(email);

-- On Properties table
CREATE INDEX idx_properties_location ON properties(location);

-- On Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- ===================================================
-- 3. Measure performance AFTER creating indexes
-- ===================================================

EXPLAIN ANALYZE 
SELECT * FROM bookings WHERE user_id = '12345678-aaaa-bbbb-cccc-123456789abc';

EXPLAIN ANALYZE 
SELECT * FROM properties WHERE location = 'Lagos';

EXPLAIN ANALYZE 
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-01-10';

