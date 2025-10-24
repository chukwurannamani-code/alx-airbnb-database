-- ============================================
-- 🧑‍💻 USERS
-- ============================================
INSERT INTO "Users" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Ayoade', 'Samuel', 'ayoade@example.com', 'hashed_pw_1', '08012345678', 'host', NOW()),
  ('22222222-2222-2222-2222-222222222222', 'Tomiwa', 'Johnson', 'tomiwa@example.com', 'hashed_pw_2', '08023456789', 'guest', NOW()),
  ('33333333-3333-3333-3333-333333333333', 'Jane', 'Doe', 'jane@example.com', 'hashed_pw_3', NULL, 'guest', NOW()),
  ('44444444-4444-4444-4444-444444444444', 'Admin', 'User', 'admin@example.com', 'hashed_pw_4', '08099887766', 'admin', NOW());

-- ============================================
-- 🏠 PROPERTIES
-- ============================================
INSERT INTO "Property" (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Ocean View Apartment', 'A lovely 2-bedroom apartment facing the beach.', 'Lagos', 250.00, NOW(), NOW()),
  ('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'City Loft', 'Modern loft in the heart of the city.', 'Abuja', 180.00, NOW(), NOW());

-- ============================================
-- 📅 BOOKINGS
-- ============================================
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book1111-bbbb-cccc-dddd-eeeeeeeeeeee', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-10-01', '2025-10-05', 1000.00, 'confirmed', NOW()),
  ('book2222-bbbb-cccc-dddd-ffffffffffff', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', '2025-09-15', '2025-09-17', 360.00, 'pending', NOW());

-- ============================================
-- 💳 PAYMENTS
-- ============================================
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay1111-1111-1111-1111-aaaaaaaaaaaa', 'book1111-bbbb-cccc-dddd-eeeeeeeeeeee', 1000.00, NOW(), 'credit_card'),
  ('pay2222-2222-2222-2222-bbbbbbbbbbbb', 'book2222-bbbb-cccc-dddd-ffffffffffff', 360.00, NOW(), 'paypal');

-- ============================================
-- ⭐ REVIEWS
-- ============================================
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev1111-aaaa-bbbb-cccc-dddddddddddd', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing stay! Beautiful view and friendly host.', NOW()),
  ('rev2222-aaaa-bbbb-cccc-eeeeeeeeeeee', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 4, 'Nice loft, great location.', NOW());

-- ============================================
-- 💬 MESSAGES
-- ============================================
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg1111-aaaa-bbbb-cccc-dddddddddddd', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi! Is the Ocean View Apartment available next weekend?', NOW()),
  ('msg2222-aaaa-bbbb-cccc-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Tomiwa! Yes, it’s available. Would you like to book?', NOW());
