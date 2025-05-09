# Database Schema

## Entities and Attributes

### User

| Column        | Type                        | Constraints                          |
|---------------|-----------------------------|--------------------------------------|
| user_id       | UUID                        | Primary Key                          |
| first_name    | VARCHAR                     | NOT NULL                             |
| last_name     | VARCHAR                     | NOT NULL                             |
| email         | VARCHAR                     | UNIQUE, NOT NULL                     |
| password_hash | VARCHAR                     | NOT NULL                             |
| phone_number  | VARCHAR                     |                                      |
| role          | ENUM (guest, host, admin)   | NOT NULL                             |
| created_at    | TIMESTAMP                   |                                      |

---

### Property

| Column        | Type    | Constraints                    |
|---------------|---------|--------------------------------|
| property_id   | UUID    | Primary Key                    |
| host_id       | UUID    | Foreign Key → User(user_id)    |
| name          | VARCHAR | NOT NULL                       |
| description   | TEXT    | NOT NULL                       |
| location      | VARCHAR | NOT NULL                       |
| pricepernight | DECIMAL | NOT NULL                       |
| created_at    | TIMESTAMP |                              |
| updated_at    | TIMESTAMP |                              |

---

### Booking

| Column      | Type    | Constraints                          |
|-------------|---------|--------------------------------------|
| booking_id  | UUID    | Primary Key                          |
| property_id | UUID    | Foreign Key → Property(property_id)  |
| user_id     | UUID    | Foreign Key → User(user_id)          |
| start_date  | DATE    | NOT NULL                             |
| end_date    | DATE    | NOT NULL                             |
| total_price | DECIMAL | NOT NULL                             |
| status      | ENUM (pending, confirmed, canceled) | NOT NULL |
| created_at  | TIMESTAMP |                                    |

---

### Payment

| Column        | Type    | Constraints                          |
|---------------|---------|--------------------------------------|
| payment_id    | UUID    | Primary Key                          |
| booking_id    | UUID    | Foreign Key → Booking(booking_id)    |
| amount        | DECIMAL | NOT NULL                             |
| payment_date  | TIMESTAMP |                                    |
| payment_method| ENUM (credit_card, paypal, stripe) | NOT NULL |

---

### Review

| Column      | Type    | Constraints                          |
|-------------|---------|--------------------------------------|
| review_id   | UUID    | Primary Key                          |
| property_id | UUID    | Foreign Key → Property(property_id)  |
| user_id     | UUID    | Foreign Key → User(user_id)          |
| rating      | INTEGER | 1-5, NOT NULL                        |
| comment     | TEXT    | NOT NULL                             |
| created_at  | TIMESTAMP |                                    |

---

### Message

| Column       | Type    | Constraints                      |
|--------------|---------|----------------------------------|
| message_id   | UUID    | Primary Key                      |
| sender_id    | UUID    | Foreign Key → User(user_id)      |
| recipient_id | UUID    | Foreign Key → User(user_id)      |
| message_body | TEXT    | NOT NULL                         |
| sent_at      | TIMESTAMP |                                |

---

## Relationships

- **User to Property (One-to-Many)**  
  - A user (with `role=host`) can list many properties  
  - A property belongs to exactly one host

- **User to Booking (One-to-Many)**  
  - A user (guest) can make many bookings  
  - A booking belongs to exactly one guest

- **Property to Booking (One-to-Many)**  
  - A property can have many bookings  
  - A booking is for exactly one property

- **Booking to Payment (One-to-Many)**  
  - A booking can have multiple payments (though typically one)  
  - A payment belongs to exactly one booking

- **User to Review (One-to-Many)**  
  - A user can write many reviews  
  - A review is written by exactly one user

- **Property to Review (One-to-Many)**  
  - A property can have many reviews  
  - A review is for exactly one property

- **User to Message (Many-to-Many, implemented as two One-to-Many relationships)**  
  - A user can send many messages  
  - A user can receive many messages  
  - Each message has exactly one sender and one recipient


![ERD AIRBNB drawio](https://github.com/user-attachments/assets/ceff1cb9-6d51-4d0c-8086-31f94a2adf80)
