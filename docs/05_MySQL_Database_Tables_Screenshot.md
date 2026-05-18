# MySQL Database Tables - AP Aging Automation

## Overview

This document describes the database schema used in the AP Aging Automation project.

## Database Tables

| Table | Key Columns | Purpose |
|-------|-------------|----------|
| vendors | vendor_id, vendor_name, vendor_email, payment_terms_days, status | Vendor master data |
| ap_invoices | invoice_number, due_date, invoice_amount, paid_amount, invoice_status | Open invoice transactions |

## Table Relationships

```
vendors (1) ----< (many) ap_invoices
vendor_id (PK)        vendor_id (FK)
```

## Vendors Table Structure

| Column | Type | Length | Constraints | Purpose |
|--------|------|--------|-------------|----------|
| vendor_id | INT | - | PRIMARY KEY | Unique vendor identifier |
| vendor_name | VARCHAR | 100 | NOT NULL | Vendor company name |
| vendor_email | VARCHAR | 150 | NULL | Contact email for communications |
| payment_terms_days | INT | - | DEFAULT 30 | Standard payment terms in days |
| status | VARCHAR | 20 | DEFAULT 'Active' | Active or Inactive status |

## AP Invoices Table Structure

| Column | Type | Length | Constraints | Purpose |
|--------|------|--------|-------------|----------|
| invoice_id | INT | - | PRIMARY KEY, AUTO_INCREMENT | Unique invoice identifier |
| vendor_id | INT | - | NOT NULL, FOREIGN KEY | Link to vendors table |
| invoice_number | VARCHAR | 50 | NOT NULL | Unique invoice number from vendor |
| invoice_date | DATE | - | NOT NULL | Date invoice was created |
| due_date | DATE | - | NOT NULL | Payment due date |
| invoice_amount | DECIMAL | 12,2 | NOT NULL | Total invoice amount |
| paid_amount | DECIMAL | 12,2 | DEFAULT 0 | Amount paid to date |
| invoice_status | VARCHAR | 30 | DEFAULT 'Open' | Open, Partially Paid, or Closed |
| currency | VARCHAR | 10 | DEFAULT 'INR' | Currency code (INR, USD, etc.) |
| created_at | TIMESTAMP | - | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

## Key Design Features

- **Referential Integrity**: Foreign key relationship ensures data consistency
- **Flexible Status Tracking**: Supports Open, Partially Paid, and Closed invoices
- **Multi-Currency Support**: Currency field for international transactions
- **Audit Trail**: created_at timestamp for tracking record creation
- **Payment Terms**: Stored at vendor level for easy calculation of due dates