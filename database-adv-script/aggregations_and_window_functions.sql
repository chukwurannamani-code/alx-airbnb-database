-- a query to find the total number of bookings made by each user
-- using COUNT function and GROUP BY clause

SELECT user_id,
       COUNT(*) as total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

SELECT property_id,
       COUNT(*) as total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
       ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS booking_rownum
FROM bookings
GROUP BY property_id
ORDER BY total_bookings DESC
