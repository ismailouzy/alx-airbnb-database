

## 1. Schema Review

The following entities and attributes are part of the current database design:

### **Entities**

* **User**
* **Property**
* **Booking**
* **Payment**
* **Review**
* **Message**

### **Relationships**

* One-to-Many (User → Property)
* One-to-Many (User → Booking)
* One-to-Many (Property → Booking)
* One-to-Many (Booking → Payment)
* One-to-Many (User → Review)
* One-to-Many (Property → Review)
* Many-to-Many (User → Message, implemented via two One-to-Many relationships)

## 2. Normalization Review

### First Normal Form (1NF)

* ✅ All columns have atomic values.
* ✅ All tables have primary keys.

### Second Normal Form (2NF)

* ✅ No partial dependency as no table uses a composite primary key.

### Third Normal Form (3NF)

#### **Potential Issues Identified:**

| Table   | Attribute              | Issue                                                                        | Resolution                                        |
| ------- | ---------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------- |
| User    | role (ENUM)            | Acceptable but may reduce flexibility if roles grow                          | Optional normalization (Role table)               |
| Payment | payment\_method (ENUM) | Acceptable but may reduce flexibility if methods expand                      | Optional normalization (PaymentMethod table)      |
| Booking | total\_price (Derived) | Derived from price per night and dates — technically denormalized            | Kept intentionally to preserve historical pricing |
| User    | phone\_number          | Only allows one number per user — could normalize if multiple numbers needed | No change needed                                  |

## 3. Adjustments to Achieve 3NF

Since all functional dependencies are preserved and acceptable denormalizations are intentional, **no mandatory changes** are required to meet 3NF.

### **Optional Enhancements** (Future-proofing)

#### Role Table

```sql
CREATE TABLE Role (
  role_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL
);
```

#### PaymentMethod Table

```sql
CREATE TABLE PaymentMethod (
  method_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL
);
```

---

The current schema **satisfies 3NF**. All identified minor denormalizations are deliberate design choices that balance performance and business requirements.

**No critical modifications** are necessary.

Optional refinements (Role, PaymentMethod tables) can be implemented if the project scope evolves.

