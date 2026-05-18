# n8n Workflow - AP Aging Report Automation

## Workflow Overview

Automated daily process that runs at 9:00 AM to:
1. Extract AP aging data from MySQL
2. Convert to CSV format
3. Email report to finance team

## Workflow Steps

### Step 1: Daily 9 AM Schedule
- **Node Type**: Schedule Trigger
- **Frequency**: Daily at 9:00 AM
- **Purpose**: Initiates the workflow automatically

### Step 2: Run AP Aging SQL Query
- **Node Type**: MySQL Query
- **Database**: Finance Automation DB
- **Query**: Executes SQL to extract:
  - Vendor names and emails
  - Invoice details (number, date, amount)
  - Outstanding amounts
  - Days overdue
  - Aging buckets
  - Payment priority levels
- **Filter**: Only includes Open and Partially Paid invoices
- **Sort**: By days overdue (descending), then outstanding amount (descending)

### Step 3: Convert Report to CSV
- **Node Type**: Spreadsheet File
- **Format**: CSV
- **Filename**: ap_aging_report_YYYY-MM-DD.csv
- **Purpose**: Converts query results to downloadable CSV format

### Step 4: Email AP Aging Report
- **Node Type**: Email Send
- **From**: finance.automation@example.com
- **To**: finance.team@example.com
- **Subject**: Daily AP Aging Report - DD-MMM-YYYY
- **Attachment**: CSV file with current date
- **Email Body**: Professional HTML template with report summary

## Automation Flow

```
Daily 9 AM Schedule → Run AP Aging SQL Query → Convert Report to CSV → Email AP Aging Report
```

## Configuration Requirements

### MySQL Credentials
- Replace `REPLACE_WITH_MYSQL_CREDENTIAL_ID` with actual MySQL connection ID
- Database: finance_automation
- Requires SELECT permissions on vendors and ap_invoices tables

### SMTP Email Credentials
- Replace `REPLACE_WITH_SMTP_CREDENTIAL_ID` with actual SMTP connection ID
- Configure sender email and SMTP server details

## Email Template Details

**Subject**: Daily AP Aging Report - 18-May-2026

**Body**:
```
Hello Team,

Please find attached the daily Accounts Payable Aging Report.

Report includes:
• Outstanding vendor invoices
• Days overdue
• Aging bucket
• Payment priority

Regards,
Finance Automation Bot
```

## Benefits

- ✅ Automated daily execution - no manual intervention
- ✅ Real-time visibility into aging invoices
- ✅ Consistent reporting format
- ✅ Easy distribution to stakeholders
- ✅ CSV format enables further analysis in Excel
- ✅ Improves cash flow planning and vendor relationship management