# MySQL Database Tables - AP Aging Automation

| Table | Key Columns | Purpose |
|-------|-------------|----------|
| vendors | vendor_id, vendor_name, vendor_email, payment_terms_days, status | Vendor master data |
| ap_invoices | invoice_number, due_date, invoice_amount, paid_amount, invoice_status | Open invoice transactions |

## Table Relationships
- ap_invoices.vendor_id → vendors.vendor_id (Foreign Key)

## Key Fields

### vendors Table
- **vendor_id** (INT): Primary key
- **vendor_name** (VARCHAR): Vendor company name
- **vendor_email** (VARCHAR): Contact email for vendor communications
- **payment_terms_days** (INT): Standard payment terms in days
- **status** (VARCHAR): Active/Inactive status

### ap_invoices Table
- **invoice_id** (INT): Primary key, auto-increment
- **vendor_id** (INT): Foreign key to vendors table
- **invoice_number** (VARCHAR): Unique invoice identifier
- **invoice_date** (DATE): Date invoice was created
- **due_date** (DATE): Payment due date (calculated from invoice_date + payment_terms_days)
- **invoice_amount** (DECIMAL): Total invoice amount
- **paid_amount** (DECIMAL): Amount paid to date
- **invoice_status** (VARCHAR): Open, Partially Paid, or Closed
- **currency** (VARCHAR): Currency code (e.g., INR, USD)
- **created_at** (TIMESTAMP): Record creation timestamp