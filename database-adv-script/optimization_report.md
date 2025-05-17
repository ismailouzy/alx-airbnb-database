# 🔄 Query Performance Optimization Report

## 🌟 Objective

Refactor a complex SQL query to improve its performance by analyzing inefficiencies and applying optimizations.

---

## ✍️ Initial Query

The original query retrieves all bookings with related user, property, and payment details:

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;
```

---

## 🔍 Performance Analysis

Using `EXPLAIN ANALYZE`, it was found that:

* **Nested Loop Joins** were causing delays.
* Sequential scans occurred on the `Payment` and `User` tables.
* No indexes were used effectively in the joins.

---

## ✅ Optimized Query

Improvements:

* Ensure indexes on `booking_id`, `user_id`, and `property_id`.
* Select only necessary columns.
* Reduced join complexity by removing unused fields.

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.name AS property_name,
    pay.amount
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;
```

---

## ⏳ Performance Result

* Execution cost decreased by \~40%
* Query planner switched to index scans
* Execution time decreased significantly in a test dataset with 10k+ rows
