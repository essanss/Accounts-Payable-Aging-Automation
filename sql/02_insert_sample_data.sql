-- Step 2: Insert sample vendors and AP invoices
USE finance_automation;

INSERT INTO vendors (vendor_id, vendor_name, vendor_email, payment_terms_days, status) VALUES
(101, 'ABC Office Supplies', 'accounts@abcoffice.com', 30, 'Active'),
(102, 'Bright IT Services', 'billing@brightit.com', 15, 'Active'),
(103, 'CloudNet Hosting', 'finance@cloudnet.com', 30, 'Active'),
(104, 'Delta Logistics', 'ap@deltalogistics.com', 45, 'Active'),
(105, 'Excel Facility Services', 'billing@excelfacility.com', 30, 'Active');

INSERT INTO ap_invoices
(vendor_id, invoice_number, invoice_date, due_date, invoice_amount, paid_amount, invoice_status, currency) VALUES
(101, 'ABC-1001', CURDATE() - INTERVAL 10 DAY, CURDATE() + INTERVAL 20 DAY, 25000.00, 0.00, 'Open', 'INR'),
(102, 'BIT-2401', CURDATE() - INTERVAL 35 DAY, CURDATE() - INTERVAL 20 DAY, 42000.00, 0.00, 'Open', 'INR'),
(103, 'CLD-9802', CURDATE() - INTERVAL 55 DAY, CURDATE() - INTERVAL 25 DAY, 18500.00, 0.00, 'Open', 'INR'),
(104, 'DL-7781', CURDATE() - INTERVAL 80 DAY, CURDATE() - INTERVAL 35 DAY, 76000.00, 10000.00, 'Partially Paid', 'INR'),
(105, 'EFS-3345', CURDATE() - INTERVAL 110 DAY, CURDATE() - INTERVAL 80 DAY, 56000.00, 0.00, 'Open', 'INR'),
(101, 'ABC-1002', CURDATE() - INTERVAL 130 DAY, CURDATE() - INTERVAL 100 DAY, 31500.00, 0.00, 'Open', 'INR'),
(102, 'BIT-2402', CURDATE() - INTERVAL 5 DAY, CURDATE() + INTERVAL 10 DAY, 22000.00, 0.00, 'Open', 'INR'),
(103, 'CLD-9803', CURDATE() - INTERVAL 95 DAY, CURDATE() - INTERVAL 65 DAY, 47500.00, 0.00, 'Open', 'INR');
