# Database Advanced Scripting

## 📁 Directory: database-adv-script

This directory focuses on mastering SQL JOINs, subqueries, aggregations, and window functions by writing advanced queries.

## 📄 File: joins_queries.sql

This SQL script demonstrates:

### INNER JOIN

Retrieves all bookings and their corresponding users.

```

## 📄 File: aggregations_and_window_functions.sql

This SQL script demonstrates:

### Aggregation (COUNT + GROUP BY)

Calculates the total number of bookings made by each user.

```sql
SELECT ... FROM User u LEFT JOIN Booking b ON u.user_id = b.user_id GROUP BY u.user_id, u.first_name, u.last_name;
```

### Window Function (RANK)

Ranks properties based on the total number of bookings they have received.

```sql
SELECT ... FROM Property p LEFT JOIN Booking b ON p.property_id = b.property_id GROUP BY p.property_id, p.name RANK() OVER (ORDER BY COUNT(b.booking_id) DESC);
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

## 📄 File: subqueries.sql

This SQL script demonstrates:

### Non-Correlated Subquery

Finds all properties where the average rating is greater than 4.0.

```sql
SELECT ... FROM Property p WHERE ( SELECT AVG(r.rating) FROM Review r WHERE r.property_id = p.property_id ) > 4.0;
```

### Correlated Subquery

Retrieves users who have made more than 3 bookings.

```sql
SELECT ... FROM User u WHERE ( SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id ) > 3;
```

1. Ensure your PostgreSQL schema is created (`schema.sql`)
2. Optionally seed data using `seed.sql`
3. Run the queries using your preferred SQL client or psql:

```bash
psql -U username -d database_name -f joins_queries.sql
```
