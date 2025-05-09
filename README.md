# 🏡 ALX Airbnb Clone — Database Project

This project is part of the comprehensive **ALX Airbnb Database Module**, focusing on database design, normalization, schema creation, and seeding. By working through these tasks, learners design and build a robust relational database for an Airbnb-like application, ensuring scalability, efficiency, and real-world functionality.

The project simulates a **production-level database system**, emphasizing high standards of design, development, and data handling.

---

## 📦 Project Structure

| File                              | Description                                                               |
| --------------------------------- | ------------------------------------------------------------------------- |
| `schema.sql`                      | Defines the database schema (tables, relationships, constraints, indexes) |
| `seed.sql`                        | Populates the database with sample data for testing                       |
| `README.md` (you’re reading this) | General project overview                                                  |
| `database-script-0x01/README.md`           | Explains the schema design and normalization process                      |
| `database-script-0x02/README.md`             | Explains how to populate and test the database with sample data           |

---

## 🛠️ Features & Entities

* **Users** (guests, hosts, admins)
* **Properties** (listed by hosts)
* **Bookings** (created by guests)
* **Payments** (linked to bookings)
* **Reviews** (written by guests)
* **Messages** (communication between users)

The database enforces proper **relationships**, **constraints**, and **normalization (3NF)** to ensure data integrity and scalability.

---

## 🚀 Quickstart

1️⃣ **Create Schema**

```bash
psql -U username -d database_name -f schema.sql
```

2️⃣ **Enable UUID generation**

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```

3️⃣ **Seed Sample Data**

```bash
psql -U username -d database_name -f seed.sql
```

4️⃣ **Explore**
Query tables, test joins, or integrate with your app backend.

---

## 📌 Notes

* PostgreSQL is recommended.
* Sample data includes 3 users and 1 booking scenario.
* The design is extendable for additional features (e.g., calendar availability, property photos).

