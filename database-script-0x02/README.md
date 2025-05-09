
## 📂 File: `seed.sql`

This SQL script inserts **sample data** into all core tables:

* `User`
* `Property`
* `Booking`
* `Payment`
* `Review`
* `Message`

The sample data is designed to simulate real-world interactions between guests, hosts, and admins in a property rental platform.

---

## 🚀 How to Run the Script

### Prerequisites

* PostgreSQL database initialized with the schema from `schema.sql`
* PostgreSQL extension `pgcrypto` enabled for `gen_random_uuid()`

Enable extension (if not done yet):

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```

### Run the script

In `psql` terminal:

```bash
\i path/to/seed.sql
```

Or via command-line:

```bash
psql -U username -d database_name -f seed.sql
```

---

## 📝 Sample Data Overview

| Table        | Sample Rows                              |
| ------------ | ---------------------------------------- |
| **User**     | 3 users (guest, host, admin)             |
| **Property** | 1 property (hosted by Bob)               |
| **Booking**  | 1 booking (Alice booked Bob's property)  |
| **Payment**  | 1 payment (for Alice's booking)          |
| **Review**   | 1 review (Alice reviewed Bob's property) |
| **Message**  | 1 message (Alice messaged Bob)           |

---

## 📌 Notes

* UUIDs are generated dynamically using `gen_random_uuid()`.
* Dates, emails, and prices are illustrative and easily customizable.
* Relationships respect **foreign key constraints** (e.g., booking links guest and property).

---

## 🛠️ Next Steps

After seeding:

* Query tables to explore the data
* Test application features (e.g., login as different roles)

