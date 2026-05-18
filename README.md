Accounts Payable Aging Report Automation using SQL and n8n
Project Overview
This project automates the Accounts Payable Aging Report process using MySQL SQL queries and n8n workflow automation. It identifies outstanding vendor invoices, calculates overdue days, classifies invoices into aging buckets, and sends a scheduled AP aging report to the finance team.
This project is useful for Accounts Payable, Finance Operations, Record-to-Report, and Shared Services roles.
---
Business Problem
Finance teams often prepare AP aging reports manually in Excel. This creates delays, manual errors, and poor visibility on overdue vendor payments.
This automation helps finance teams:
Track outstanding supplier invoices
Identify overdue payments
Prioritize critical vendor payments
Send scheduled reports automatically
Improve month-end and cash-flow visibility
---
Tools Used
MySQL - database, AP invoice data, aging calculation
n8n - workflow automation and email scheduling
CSV/Excel - report output
Gmail/SMTP - automated email delivery
---
Automation Workflow
n8n runs every morning at 9:00 AM.
n8n connects to MySQL database.
SQL query fetches open and partially paid AP invoices.
SQL calculates outstanding amount, overdue days, aging bucket, and priority.
n8n converts the SQL result into a report file.
n8n emails the AP aging report to the finance team.
---
AP Aging Logic
Condition	Aging Bucket
Due date is today or future date	Not Due
1 to 30 days overdue	1-30 Days
31 to 60 days overdue	31-60 Days
61 to 90 days overdue	61-90 Days
More than 90 days overdue	90+ Days
---
Project Structure
```text
ap-aging-automation/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_sample_data.sql
│   ├── 03_ap_aging_report.sql
│   ├── 04_ap_aging_summary.sql
│   └── 05_payment_due_alert.sql
├── n8n/
│   └── ap_aging_n8n_workflow.json
├── sample_data/
│   ├── vendors.csv
│   ├── ap_invoices.csv
│   └── sample_ap_aging_output.csv
├── screenshots/
│   ├── 01_database_tables.png
│   ├── 02_ap_aging_sql_output.png
│   ├── 03_n8n_workflow.png
│   └── 04_email_report_preview.png
└── docs/
    └── recruiter_project_summary.md
```
---
SQL Features Used
`JOIN`
`CASE WHEN`
`DATEDIFF()`
`CTE`
`GROUP BY`
`ORDER BY`
Aging bucket classification
Outstanding amount calculation
---
How to Run This Project
Step 1: Create Database and Tables
Run:
```sql
source sql/01_create_tables.sql;
```
Step 2: Insert Sample Data
Run:
```sql
source sql/02_insert_sample_data.sql;
```
Step 3: Generate Detailed AP Aging Report
Run:
```sql
source sql/03_ap_aging_report.sql;
```
Step 4: Generate AP Aging Summary
Run:
```sql
source sql/04_ap_aging_summary.sql;
```
Step 5: Import n8n Workflow
Open n8n.
Go to Workflows.
Click Import from File.
Upload `n8n/ap_aging_n8n_workflow.json`.
Add your MySQL and Gmail/SMTP credentials.
Activate the workflow.
---
n8n Workflow Nodes
Node	Purpose
Schedule Trigger	Runs report daily
MySQL	Executes AP aging SQL query
Spreadsheet File	Converts data into CSV/XLSX report
Send Email	Sends report to finance team
---
Sample Report Columns
Vendor Name
Vendor Email
Invoice Number
Invoice Date
Due Date
Invoice Amount
Paid Amount
Outstanding Amount
Days Overdue
Aging Bucket
Priority
---
Key Finance Controls Automated
Overdue invoice tracking
Vendor payment prioritization
Open invoice monitoring
AP aging summary by bucket
Payment due alert
Daily finance reporting
---

---
Future Enhancements
Add duplicate invoice detection
Add vendor payment approval workflow
Add Power BI dashboard
Add 3-way PO/GRN/Invoice match exceptions
Add Teams or Slack alerts for critical overdue invoices
