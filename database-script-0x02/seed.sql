
-- Sample data for User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '123-456-7890', 'guest'),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '234-567-8901', 'host'),
  (gen_random_uuid(), 'Carol', 'Williams', 'carol@example.com', 'hashed_pw3', '345-678-9012', 'admin');

-- Sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
SELECT gen_random_uuid(), user_id, 'Cozy Apartment', 'A cozy apartment in downtown.', 'New York', 120.00
FROM User WHERE email = 'bob@example.com';

-- Sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT gen_random_uuid(), p.property_id, u.user_id, '2025-06-01', '2025-06-05', 480.00, 'confirmed'
FROM Property p, User u WHERE u.email = 'alice@example.com';

-- Sample data for Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT gen_random_uuid(), b.booking_id, 480.00, 'credit_card'
FROM Booking b;

-- Sample data for Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), p.property_id, u.user_id, 5, 'Excellent stay!'
FROM Property p, User u WHERE u.email = 'alice@example.com';

-- Sample data for Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT gen_random_uuid(), u1.user_id, u2.user_id, 'Hello! Is the property available?'
FROM User u1, User u2 WHERE u1.email = 'alice@example.com' AND u2.email = 'bob@example.com';
