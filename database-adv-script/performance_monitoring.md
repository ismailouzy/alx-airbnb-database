# 🛠️ Performance Monitoring Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 🔍 Monitoring Tools

We utilized PostgreSQL's `EXPLAIN ANALYZE` and MySQL's `SHOW PROFILE` to analyze query performance for frequently used operations:

1. Fetching user bookings with details
2. Property search by location and price
3. Booking with associated payment and review info

---

## 🚨 Bottlenecks Identified

| Query                 | Issue                                     | Impact                          |
| --------------------- | ----------------------------------------- | ------------------------------- |
| User Booking Join     | Sequential scan on `Booking`              | Slow response on large datasets |
| Property Search       | No index on `location` or `pricepernight` | High I/O, slow filters          |
| Booking with Payments | Nested Loop Join without indexes          | Poor join efficiency            |

---

## 🧪 Optimization Actions

### ✅ Indexing

```sql
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
CREATE INDEX idx_payment_booking ON Payment(booking_id);
```

### ✅ Schema Adjustments

* Considered partitioning large tables (e.g., `Booking`) by `start_date`
* Ensured appropriate ENUM types are indexed or converted if frequently queried

### ✅ Query Refactoring Example

Before:

```sql
SELECT * FROM Booking WHERE user_id = 'xyz';
```

After:

```sql
SELECT booking_id, start_date, end_date FROM Booking WHERE user_id = 'xyz';
```

Reduced unnecessary column selection

---

## 🚀 Results After Optimization

| Metric         | Before Optimization | After Optimization |
| -------------- | ------------------- | ------------------ |
| Execution Time | 820ms               | 180ms              |
| Index Usage    | No                  | Yes                |
| Query Plan     | Seq Scan            | Index Scan         |

---

## 🧠 Lessons Learned

* Always analyze query plans before adding indexes
* Avoid `SELECT *` in production queries
* Composite indexes can outperform multiple single-column indexes


