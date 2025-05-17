# Database Advanced Scripting

## 📁 Directory: database-adv-script

This directory focuses on mastering SQL JOINs by writing advanced queries involving different types of joins.

## 📄 File: joins_queries.sql

This SQL script demonstrates:

### INNER JOIN

Retrieves all bookings and their corresponding users.

```sql
SELECT ...
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
```

### LEFT JOIN

Retrieves all properties and their associated reviews, including properties that have no reviews.

```sql
SELECT ...
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;
```

### FULL OUTER JOIN

Retrieves all users and all bookings, even if a user has no booking or a booking has no linked user.

```sql
SELECT ...
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
```

## ✅ How to Use

1. Ensure your PostgreSQL schema is created (`schema.sql`)
2. Optionally seed data using `seed.sql`
3. Run the queries using your preferred SQL client or psql:

```bash
psql -U username -d database_name -f joins_queries.sql
```
