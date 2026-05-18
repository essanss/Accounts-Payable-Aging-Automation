# AP Aging SQL Output - Detailed Report

## Report Columns

| Column | Description |
|--------|-------------|
| Vendor | Vendor company name |
| Invoice | Invoice number |
| Outstanding | Outstanding amount (invoice_amount - paid_amount) |
| Days | Days overdue (negative means not yet due) |
| Bucket | Aging bucket category |
| Priority | Payment priority level |

## Aging Buckets & Priority Levels

### Not Due
- **Days Overdue**: Negative (future due dates)
- **Priority**: Not Due
- **Action**: Monitor for upcoming due dates

### 1-30 Days
- **Days Overdue**: 1-30 days
- **Priority**: Low
- **Action**: Routine payment processing

### 31-60 Days
- **Days Overdue**: 31-60 days
- **Priority**: Medium
- **Action**: Follow-up with vendor if needed

### 61-90 Days
- **Days Overdue**: 61-90 days
- **Priority**: High
- **Action**: Urgent follow-up required

### 90+ Days
- **Days Overdue**: Over 90 days
- **Priority**: Critical
- **Action**: Immediate escalation and resolution

## Sample Output

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

## Key Metrics

- **Total Outstanding Amount**: ₹328,500 INR
- **Critical Priority (90+ Days)**: ₹31,500
- **High Priority (61-90 Days)**: ₹103,500
- **Medium Priority (31-60 Days)**: ₹66,000
- **Low Priority (1-30 Days)**: ₹60,000