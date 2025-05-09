# Database Schema Normalization

## 1. Schema Review

The following entities and relationships are included in the database design:

### **Entities**
- User
- Property
- Booking
- Payment
- Review
- Message

### **Relationships**
- One-to-Many (User → Property)
- One-to-Many (User → Booking)
- One-to-Many (Property → Booking)
- One-to-Many (Booking → Payment)
- One-to-Many (User → Review)
- One-to-Many (Property → Review)
- Many-to-Many (User → Message, via two One-to-Many)

## 2. Normalization Review

### First Normal Form (1NF)
- ✅ Atomic values in all columns
- ✅ Primary keys defined

### Second Normal Form (2NF)
- ✅ No partial dependencies (no composite PKs)

### Third Normal Form (3NF)

| Table    | Attribute             | Issue | Resolution |
|----------|-----------------------|-------|------------|
| User     | role (ENUM)           | Acceptable; limits flexibility if roles grow | Optional Role table |
| Payment  | payment_method (ENUM) | Acceptable; limits flexibility if methods grow | Optional PaymentMethod table |
| Booking  | total_price (derived) | Denormalized | Kept for historical pricing |
| User     | phone_number          | One number allowed | Acceptable |

## 3. Adjustments to Achieve 3NF

The schema satisfies 3NF. All identified denormalizations are intentional and acceptable for the current business context.

### Optional Refinements (Future-proof)

- Normalize **Role** and **PaymentMethod** into separate tables if business requirements expand.

## 4. SQL Schema Definitions

See [`schema.sql`](schema.sql)

## 5. Conclusion

✅ Database schema meets **3NF**  
✅ Constraints and indexes included for integrity and performance

