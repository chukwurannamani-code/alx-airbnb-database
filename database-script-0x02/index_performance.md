# Index Performance Report

## Overview
This document analyzes the performance impact of adding indexes to the **Users**, **Bookings**, and **Properties** tables in the Airbnb database.

## Indexes Created
| Table | Column | Index Name | Purpose |
|--------|---------|-------------|----------|
| Users | email | idx_users_email | Speed up user login and lookup queries |
| Properties | location | idx_properties_location | Improve search performance by location |
| Bookings | user_id | idx_bookings_user_id | Speed up lookups of bookings made by a specific user |
| Bookings | property_id | idx_bookings_property_id | Improve JOIN performance with the Properties table |
| Bookings | start_date | idx_bookings_start_date | Optimize date range and availability searches |

## Performance Comparison (Example)
| Query | Before (ms) | After (ms) | Improvement |
|--------|--------------|------------|--------------|
| SELECT * FROM bookings WHERE user_id='123...' | 75.2 ms | 2.3 ms | 97% faster |
| SELECT * FROM properties WHERE location='Lagos' | 120.5 ms | 5.*

