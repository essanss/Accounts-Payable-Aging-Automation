-- Step 3: AP Aging detailed invoice-level report
USE finance_automation;

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
ORDER BY days_overdue DESC, outstanding_amount DESC;
