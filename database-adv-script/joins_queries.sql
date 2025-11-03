-- Retrieve all bookings and the respective users who made those bookings
SELECT 
  bookings.id AS booking_id,
  users.id AS user_id,
  users.name AS user_name,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date
FROM bookings
INNER JOIN users
ON bookings.user_id = users.id
ORDER BY bookings.id;

-- Retrieve all properties and their reviews, including properties with no reviews
SELECT 
  Property.property_id,
  Property.name,
  Property.location,
  Review.review_id,
  Review.rating,
  Review.comment
FROM Property
LEFT JOIN Review
  ON Property.property_id = Review.property_id
ORDER BY bookings.id;

-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
  users.id AS user_id,
  users.name AS user_name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date
FROM users
FULL OUTER JOIN bookings
ON users.id = bookings.user_id
ORDER BY users.id, bookings.id;
