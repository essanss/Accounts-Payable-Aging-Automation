# Email Report Preview

## Sample Email Output

**To**: finance.team@example.com

**Subject**: Daily AP Aging Report - 18-May-2026

---

### Email Body

Hello Team,

Please find attached the daily Accounts Payable Aging Report.

**Report includes:**
- Outstanding vendor invoices
- Days overdue
- Aging bucket
- Payment priority

**Attachment**: ap_aging_report_2026-05-18.csv

---

## Report Data Structure

The attached CSV contains the following columns:

| Column | Example | Description |
|--------|---------|-------------|
| vendor_name | ABC Office Supplies | Vendor company name |
| vendor_email | accounts@abcoffice.com | Vendor contact email |
| invoice_number | ABC-1002 | Invoice identifier |
| invoice_date | 2026-01-08 | Date invoice was created |
| due_date | 2026-02-07 | Payment due date |
| currency | INR | Currency code |
| invoice_amount | 31500 | Total invoice amount |
| paid_amount | 0 | Amount paid to date |
| outstanding_amount | 31500 | Balance due |
| days_overdue | 100 | Days past due date |
| aging_bucket | 90+ Days | Aging category |
| priority | Critical | Payment priority |

## Recipient Benefits

1. **Finance Team** - Daily visibility into outstanding invoices
2. **Accounts Payable Team** - Prioritized list for payment processing
3. **Management** - Cash flow and vendor analysis
4. **CFO/Controllers** - Month-end close preparation

## Delivery Guarantee

- ✅ Sent automatically at 9:00 AM every business day
- ✅ Always includes current day's data
- ✅ CSV format for easy Excel pivot table analysis
- ✅ Consistent format enables trend analysis

## Next Steps for Recipients

1. Review critical (90+ days) invoices immediately
2. Prioritize high-priority (61-90 days) invoices for payment
3. Track payment progress against aging buckets
4. Follow up with vendors on critical items