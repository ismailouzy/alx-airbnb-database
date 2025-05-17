# 📈 Index Performance Optimization

## 🌟 Objective

Improve query performance in high-traffic tables like `User`, `Booking`, and `Property` by creating indexes on frequently queried columns.

---

## 🛠️ Indexes Created

| Table      | Column(s)                | Reason                                                  |
| ---------- | ------------------------ | ------------------------------------------------------- |
| `User`     | `email`                  | Speeds up lookups for login and uniqueness validation.  |
| `Booking`  | `user_id`                | Optimizes joins and aggregates by user.                 |
| `Booking`  | `property_id`            | Enhances performance for queries filtering by property. |
| `Booking`  | `start_date`, `end_date` | Supports efficient date range searches.                 |
| `Property` | `location`               | Improves geographic/location-based queries.             |
| `Property` | `pricepernight`          | Speeds up sorting and filtering for pricing.            |

---

## 🔍 Performance Analysis

### Before Indexes

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 'UUID...';
```

> Result: Sequential scan with high cost (\~1000+).

---

### After Indexes

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 'UUID...';
```

> Result: Index scan with significantly reduced cost (\~10–20 range).

---


Indexing dramatically improves the performance of commonly executed queries, especially those used in `WHERE`, `JOIN`, or `ORDER BY` clauses. Ensure indexes are updated when data volume or access patterns evolve.
