-- Bonus: invoices due within next 7 days
USE finance_automation;

SELECT
    v.vendor_name,
    v.vendor_email,
    ai.invoice_number,
    ai.due_date,
    (ai.invoice_amount - ai.paid_amount) AS outstanding_amount,
    DATEDIFF(ai.due_date, CURDATE()) AS days_to_due
FROM ap_invoices ai
JOIN vendors v ON ai.vendor_id = v.vendor_id
WHERE ai.invoice_status IN ('Open', 'Partially Paid')
  AND (ai.invoice_amount - ai.paid_amount) > 0
  AND ai.due_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY
ORDER BY ai.due_date;
