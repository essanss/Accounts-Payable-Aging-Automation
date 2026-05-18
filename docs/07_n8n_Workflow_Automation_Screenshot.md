# n8n Workflow - AP Aging Report Automation

## Workflow Architecture

```
┌─────────────────┐     ┌─────────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│  Daily 9 AM     │────>│ Run AP Aging SQL    │────>│ Convert Report   │────>│ Email AP Aging   │
│  Schedule       │     │ Query               │     │ to CSV           │     │ Report           │
└─────────────────┘     └─────────────────────┘     └──────────────────┘     └──────────────────┘
```

## Workflow Steps

### 1. Daily 9 AM Schedule (Trigger)

**Node Type**: Schedule Trigger

**Configuration**:
- **Frequency**: Daily
- **Time**: 9:00 AM
- **Timezone**: System default

**Purpose**: Automatically initiates the workflow every morning at 9:00 AM

**Output**: Triggers the next node in the workflow

---

### 2. Run AP Aging SQL Query

**Node Type**: MySQL Query Executor

**Database Connection**:
- **Host**: MySQL Finance DB server
- **Database**: finance_automation
- **Credentials**: Replace `REPLACE_WITH_MYSQL_CREDENTIAL_ID` with actual ID

**Query Logic**:
```sql
SELECT
  v.vendor_name,
  v.vendor_email,
  ai.invoice_number,
  ai.invoice_date,
  ai.due_date,
  ai.currency,
  ai.invoice_amount,
  ai.paid_amount,
  (ai.invoice_amount - ai.paid_amount) AS outstanding_amount,
  DATEDIFF(CURDATE(), ai.due_date) AS days_overdue,
  CASE
    WHEN DATEDIFF(CURDATE(), ai.due_date) <= 0 THEN 'Not Due'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 1 AND 30 THEN '1-30 Days'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 31 AND 60 THEN '31-60 Days'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 61 AND 90 THEN '61-90 Days'
    ELSE '90+ Days'
  END AS aging_bucket,
  CASE
    WHEN DATEDIFF(CURDATE(), ai.due_date) > 90 THEN 'Critical'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 61 AND 90 THEN 'High'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 31 AND 60 THEN 'Medium'
    WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 1 AND 30 THEN 'Low'
    ELSE 'Not Due'
  END AS priority
FROM ap_invoices ai
JOIN vendors v ON ai.vendor_id = v.vendor_id
WHERE ai.invoice_status IN ('Open', 'Partially Paid')
  AND (ai.invoice_amount - ai.paid_amount) > 0
ORDER BY days_overdue DESC, outstanding_amount DESC
```

**Data Extracted**:
- Vendor names and emails
- Invoice details (number, date, amounts)
- Outstanding balances
- Days overdue calculations
- Aging bucket classifications
- Payment priority assignments

**Filters**:
- Only Open and Partially Paid invoices
- Only invoices with outstanding amounts > 0

**Output**: Array of invoice records ready for conversion

---

### 3. Convert Report to CSV

**Node Type**: Spreadsheet File Converter

**Configuration**:
- **Format**: CSV (Comma-Separated Values)
- **Filename Pattern**: `ap_aging_report_={{$now.format('yyyy-MM-dd')}}.csv`
- **Example Filename**: ap_aging_report_2026-05-18.csv
- **Encoding**: UTF-8

**Input**: Query results from Step 2

**Output**: CSV file with report data

**File Contents**: 
- Headers from query columns
- All invoice rows sorted by days overdue
- Ready for email attachment

---

### 4. Email AP Aging Report

**Node Type**: Email Send (SMTP)

**Email Configuration**:

| Field | Value |
|-------|-------|
| From Email | finance.automation@example.com |
| To Email | finance.team@example.com |
| Subject | Daily AP Aging Report - {{$now.format('dd-MMM-yyyy')}} |
| Body Format | HTML |
| Attachment | CSV file from Step 3 |

**Email Credentials**:
- Replace `REPLACE_WITH_SMTP_CREDENTIAL_ID` with actual SMTP connection ID

**Email Body Template**:
```html
<p>Hello Team,</p>

<p>Please find attached the daily Accounts Payable Aging Report.</p>

<p><b>Report includes:</b></p>
<ul>
  <li>Outstanding vendor invoices</li>
  <li>Days overdue</li>
  <li>Aging bucket</li>
  <li>Payment priority</li>
</ul>

<p>Regards,<br>
Finance Automation Bot</p>
```

**Attachment**: CSV file with dynamic date in filename

**Output**: Email delivery confirmation

---

## Workflow Execution Flow

1. **9:00 AM Daily**: Schedule trigger fires
2. **Connect to Database**: MySQL node establishes connection
3. **Execute Query**: SQL query runs and fetches current AP data
4. **Transform Data**: Results passed to spreadsheet converter
5. **Create CSV**: File generated with today's date
6. **Send Email**: Report emailed to finance team with CSV attachment
7. **Complete**: Workflow execution finishes

## Error Handling

- Database connection errors will stop the workflow
- Email delivery failures will be logged
- Failed executions can be manually retried from n8n dashboard

## Performance Notes

- Query execution: ~1-2 seconds (depends on invoice volume)
- CSV conversion: <1 second
- Email delivery: ~5-10 seconds
- Total workflow time: ~10-15 seconds

## Monitoring & Maintenance

- Check workflow execution history daily
- Review email delivery logs in n8n dashboard
- Monitor database performance during peak hours
- Update query if database structure changes
- Test workflow after changing credentials