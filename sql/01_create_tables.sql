-- AP Aging Report Automation - MySQL
-- Step 1: Create database and tables

CREATE DATABASE IF NOT EXISTS finance_automation;
USE finance_automation;

DROP TABLE IF EXISTS ap_invoices;
DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    vendor_email VARCHAR(150),
    payment_terms_days INT DEFAULT 30,
    status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE ap_invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_id INT NOT NULL,
    invoice_number VARCHAR(50) NOT NULL,
    invoice_date DATE NOT NULL,
    due_date DATE NOT NULL,
    invoice_amount DECIMAL(12,2) NOT NULL,
    paid_amount DECIMAL(12,2) DEFAULT 0,
    invoice_status VARCHAR(30) DEFAULT 'Open',
    currency VARCHAR(10) DEFAULT 'INR',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);
