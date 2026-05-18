# AP Aging SQL Output - Detailed Report

## Report Overview

This detailed report provides a line-item view of all outstanding AP invoices, classified by aging bucket and priority level.

## Sample Report Data

| Vendor | Invoice | Outstanding | Days | Bucket | Priority |
|--------|---------|-------------|------|--------|----------|
| ABC Office Supplies | ABC-1002 | 31500 | 100 | 90+ Days | Critical |
| Excel Facility Services | EFS-3345 | 56000 | 80 | 61-90 Days | High |
| CloudNet Hosting | CLD-9803 | 47500 | 65 | 61-90 Days | High |
| Delta Logistics | DL-7781 | 66000 | 35 | 31-60 Days | Medium |
| CloudNet Hosting | CLD-9802 | 18500 | 25 | 1-30 Days | Low |
| Bright IT Services | BIT-2401 | 42000 | 20 | 1-30 Days | Low |
| ABC Office Supplies | ABC-1001 | 25000 | -20 | Not Due | Not Due |
| Bright IT Services | BIT-2402 | 22000 | -10 | Not Due | Not Due |

## Report Column Descriptions

### Vendor
- **Definition**: Vendor company name
- **Source**: vendors.vendor_name
- **Use**: Identify which vendor the invoice is from

### Invoice
- **Definition**: Unique invoice number
- **Source**: ap_invoices.invoice_number
- **Use**: Reference and tracking

### Outstanding
- **Definition**: Outstanding balance (invoice_amount - paid_amount)
- **Source**: Calculated in SQL query
- **Use**: Shows amount still due from vendor

### Days
- **Definition**: Days overdue from due date (negative = not yet due)
- **Source**: DATEDIFF(CURDATE(), due_date)
- **Use**: Measure of how overdue the invoice is

### Bucket
- **Definition**: Aging category based on days overdue
- **Source**: CASE WHEN statement in SQL
- **Categories**:
  - Not Due: Due date is today or in the future
  - 1-30 Days: 1 to 30 days overdue
  - 31-60 Days: 31 to 60 days overdue
  - 61-90 Days: 61 to 90 days overdue
  - 90+ Days: More than 90 days overdue

### Priority
- **Definition**: Payment priority level
- **Source**: CASE WHEN statement in SQL
- **Levels**:
  - Critical: 90+ Days (immediate action required)
  - High: 61-90 Days (urgent follow-up needed)
  - Medium: 31-60 Days (follow-up with vendor)
  - Low: 1-30 Days (routine processing)
  - Not Due: Future due dates (monitor)

## Key Metrics from Sample

| Metric | Value |
|--------|-------|
| Total Outstanding Amount | ₹328,500 |
| Critical Priority (90+ Days) | ₹31,500 |
| High Priority (61-90 Days) | ₹103,500 |
| Medium Priority (31-60 Days) | ₹66,000 |
| Low Priority (1-30 Days) | ₹60,000 |
| Not Yet Due | ₹47,000 |
| Total Invoices | 8 |
| Invoices Overdue | 6 |
| Invoices Not Yet Due | 2 |

## Report Sorting

The report is sorted by:
1. **Days Overdue** (DESC) - Most overdue first
2. **Outstanding Amount** (DESC) - Largest amounts first

This ensures critical items appear at the top for quick action.

## Using This Report

### For AP Teams
- Prioritize payments based on aging bucket
- Contact vendors about critical (90+) invoices
- Plan cash flow based on outstanding amounts

### For Finance Managers
- Monitor vendor payment performance
- Identify payment delays and issues
- Prepare cash flow forecasts
- Support month-end close activities

### For CFO/Controller
- Track total AP aging exposure
- Analyze trends over time
- Support financial planning and forecasting