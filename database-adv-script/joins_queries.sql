-- Retrieve all bookings and the respective users who made those bookings
SELECT 
  Booking.booking_id,
  Booking.property_id,
  Booking.start_date,
  Booking.end_date,
  Booking.total_price,
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Users.email
FROM Booking
INNER JOIN Users
  ON Booking.user_id = Users.user_id;

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
  ON Property.property_id = Review.property_id;

-- Retrieve all users and all bookings, even if the user has no booking
-- or a booking is not linked to a user
SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Booking.booking_id,
  Booking.property_id,
  Booking.start_date,
  Booking.end_date
FROM Users
LEFT JOIN Booking
  ON Users.user_id = Booking.user_id

UNION

SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Booking.booking_id,
  Booking.property_id,
  Booking.start_date,
  Booking.end_date
FROM Booking
RIGHT JOIN Users
  ON Users.user_id = Booking.user_id;

