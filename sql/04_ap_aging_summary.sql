-- Step 4: AP Aging summary by bucket
USE finance_automation;

WITH aging_report AS (
    SELECT
        ai.invoice_id,
        (ai.invoice_amount - ai.paid_amount) AS outstanding_amount,
        CASE
            WHEN DATEDIFF(CURDATE(), ai.due_date) <= 0 THEN 'Not Due'
            WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 1 AND 30 THEN '1-30 Days'
            WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 31 AND 60 THEN '31-60 Days'
            WHEN DATEDIFF(CURDATE(), ai.due_date) BETWEEN 61 AND 90 THEN '61-90 Days'
            ELSE '90+ Days'
        END AS aging_bucket
    FROM ap_invoices ai
    WHERE ai.invoice_status IN ('Open', 'Partially Paid')
      AND (ai.invoice_amount - ai.paid_amount) > 0
)
SELECT
    aging_bucket,
    COUNT(invoice_id) AS invoice_count,
    SUM(outstanding_amount) AS total_outstanding
FROM aging_report
GROUP BY aging_bucket
ORDER BY
    CASE aging_bucket
        WHEN 'Not Due' THEN 1
        WHEN '1-30 Days' THEN 2
        WHEN '31-60 Days' THEN 3
        WHEN '61-90 Days' THEN 4
        WHEN '90+ Days' THEN 5
    END;
