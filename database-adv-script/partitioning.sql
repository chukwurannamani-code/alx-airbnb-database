-- ===============================================
-- partitioning.sql
-- Partitioning Booking table by start_date
-- ===============================================

-- 1️⃣ Drop existing partitioned table if exists (safety)
DROP TABLE IF EXISTS booking_partitioned CASCADE;

-- 2️⃣ Create the new partitioned table using RANGE partitioning
CREATE TABLE booking_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "User"(user_id)
)
PARTITION BY RANGE (start_date);

-- 3️⃣ Create monthly partitions for 2024 (example)
CREATE TABLE booking_2024_01 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE booking_2024_02 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE booking_2024_03 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

-- Add more partitions as needed...

-- 4️⃣ Insert existing booking data into partitioned table
INSERT INTO booking_partitioned
SELECT *
FROM booking;

-- 5️⃣ Sample performance test query using EXPLAIN ANALYZE
-- Fetch bookings in a date range (improved by partition pruning)
EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date
FROM booking_partitioned
WHERE start_date >= '2024-01-01'
  AND start_date < '2024-02-01';

-- 6️⃣ Another test using BETWEEN
EXPLAIN ANALYZE
SELECT *
FROM booking_partitioned
WHERE start_date BETWEEN '2024-02-01' AND '2024-02-28';
