# Email Report Preview

## Sample Email Output

### Email Headers

| Field | Value |
|-------|-------|
| **From** | finance.automation@example.com |
| **To** | finance.team@example.com |
| **Subject** | Daily AP Aging Report - 18-May-2026 |
| **Date Sent** | Daily at 9:00 AM |
| **Attachment** | ap_aging_report_2026-05-18.csv |

---

## Email Body Content

```
Hello Team,

Please find attached the daily Accounts Payable Aging Report.

Report includes:
• Outstanding vendor invoices
• Days overdue
• Aging bucket
• Payment priority

Attachment: ap_aging_report_2026-05-18.csv

Regards,
Finance Automation Bot
```

---

## Attached CSV Report Structure

The attachment contains the following columns:

| # | Column | Type | Example | Description |
|---|--------|------|---------|-------------|
| 1 | vendor_name | TEXT | ABC Office Supplies | Vendor company name |
| 2 | vendor_email | TEXT | accounts@abcoffice.com | Vendor contact email |
| 3 | invoice_number | TEXT | ABC-1002 | Unique invoice identifier |
| 4 | invoice_date | DATE | 2026-01-08 | Date invoice was created |
| 5 | due_date | DATE | 2026-02-07 | Payment due date |
| 6 | currency | TEXT | INR | Currency code |
| 7 | invoice_amount | DECIMAL | 31500 | Total invoice amount |
| 8 | paid_amount | DECIMAL | 0 | Amount paid to date |
| 9 | outstanding_amount | DECIMAL | 31500 | Balance due |
| 10 | days_overdue | INTEGER | 100 | Days past due date |
| 11 | aging_bucket | TEXT | 90+ Days | Aging category |
| 12 | priority | TEXT | Critical | Payment priority |

---

## Sample Report Data (First 5 Rows)

```csv
vendor_name,vendor_email,invoice_number,invoice_date,due_date,currency,invoice_amount,paid_amount,outstanding_amount,days_overdue,aging_bucket,priority
ABC Office Supplies,accounts@abcoffice.com,ABC-1002,2026-01-08,2026-02-07,INR,31500,0,31500,100,90+ Days,Critical
Excel Facility Services,billing@excelfacility.com,EFS-3345,2026-01-28,2026-02-27,INR,56000,0,56000,80,61-90 Days,High
CloudNet Hosting,finance@cloudnet.com,CLD-9803,2026-02-12,2026-03-14,INR,47500,0,47500,65,61-90 Days,High
Delta Logistics,ap@deltalogistics.com,DL-7781,2026-02-27,2026-04-13,INR,76000,10000,66000,35,31-60 Days,Medium
```

---

## Key Report Metrics

### Summary Statistics

| Metric | Value | Notes |
|--------|-------|-------|
| Total Outstanding Amount | ₹328,500 | All open balances |
| Total Invoices | 8 | Includes all statuses |
| Overdue Invoices | 6 | Items with days_overdue > 0 |
| Not Yet Due | 2 | Items with negative days_overdue |

### Priority Breakdown

| Priority | Count | Amount | Action Required |
|----------|-------|--------|------------------|
| Critical (90+ Days) | 1 | ₹31,500 | Immediate action |
| High (61-90 Days) | 2 | ₹103,500 | Urgent follow-up |
| Medium (31-60 Days) | 1 | ₹66,000 | Follow-up with vendor |
| Low (1-30 Days) | 2 | ₹60,000 | Routine processing |
| Not Due | 2 | ₹47,000 | Monitor for due date |

---

## Recipient Workflows

### For Accounts Payable Team

1. **Open Email**: Read daily report in inbox
2. **Download CSV**: Save attachment for reference
3. **Review Critical Items**: Focus on 90+ day overdue invoices
4. **Contact Vendors**: Reach out regarding overdue invoices
5. **Process Payments**: Prioritize based on aging bucket
6. **Update Records**: Mark invoices as paid when applicable

### For Finance Manager

1. **Scan Summary**: Check outstanding amount trend
2. **Review Priority Items**: Note any critical invoices
3. **Analyze by Vendor**: Identify repeat problem vendors
4. **Plan Cash Flow**: Use outstanding amounts for forecasting
5. **Take Action**: Escalate critical items if needed
6. **Track Improvements**: Monitor aging trends over time

### For CFO/Controller

1. **Review Total Exposure**: Check total outstanding amount
2. **Analyze Trends**: Compare to previous days/weeks
3. **Prepare Reports**: Use data for executive dashboards
4. **Support Planning**: Use for cash flow and financial forecasts
5. **Monitor Controls**: Ensure AP process is working properly
6. **Strategic Decisions**: Identify vendor payment patterns

---

## Email Configuration

### SMTP Settings

- **Protocol**: SMTP/TLS
- **Port**: 587 (TLS) or 465 (SSL)
- **Frequency**: Daily at 9:00 AM
- **Retry Policy**: Retry on failure up to 3 times
- **Timeout**: 30 seconds

### Email Features

✅ **Advantages**
- Automated daily delivery
- Always includes current data
- CSV format for Excel analysis
- Professional HTML template
- Consistent timing and content
- No manual intervention needed

---

## How to Use the CSV Report

### In Excel

1. Open the CSV file in Excel
2. Use AutoFilter to sort by priority
3. Create pivot tables for analysis
4. Generate charts for management
5. Export to specific departments

### Common Analyses

- **By Vendor**: Identify vendors with most overdue invoices
- **By Bucket**: Aggregate amounts in each aging category
- **By Currency**: Separate analysis by currency if needed
- **Trend Analysis**: Compare daily reports over time
- **Payment Terms**: Cross-reference with vendor payment terms

---

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| Email not received | Network issues or wrong email address | Check SMTP credentials in n8n |
| Attachment missing | File conversion error | Check spreadsheet node configuration |
| Empty report | No overdue invoices | This is normal - empty CSV will still be sent |
| Wrong date in subject | System time incorrect | Verify server time settings |
| Formatting issues in CSV | Character encoding problem | Re-export with UTF-8 encoding |

---

## Best Practices

- ✅ Archive old reports for audit trail
- ✅ Share critical items immediately
- ✅ Follow up on high-priority invoices daily
- ✅ Use data to improve vendor relationships
- ✅ Monitor trends to forecast cash flow
- ✅ Reconcile report with GL periodically