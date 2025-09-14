-- ======================================
-- Table creation
-- ======================================

-- Create payments table
CREATE TABLE IF NOT EXISTS payments (
    paymentDate DATE,
    amount DECIMAL(10, 2),
    checkNumber VARCHAR(20)
);

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
    customerName VARCHAR(100),
    country VARCHAR(50),
    creditLimit INT
);

-- Create orderdetails table
CREATE TABLE IF NOT EXISTS orderdetails (
    productCode VARCHAR(20),
    quantityOrdered INT,
    priceEach DECIMAL(10, 2)
);

-- ======================================
-- Data insertion
-- ======================================

-- Insert data into payments table
INSERT INTO payments (paymentDate, amount, checkNumber) VALUES
('2025-09-10', 1500.00, 'CHK001'),
('2025-09-10', 2000.00, 'CHK002'),
('2025-09-09', 1200.00, 'CHK003'),
('2025-09-08', 1800.00, 'CHK001'),
('2025-09-07', 1600.00, 'CHK004'),
('2025-09-07', 1400.00, 'CHK005'),
('2025-09-06', 1100.00, 'CHK002'),
('2025-09-05', 1000.00, 'CHK006'),
('2025-09-04', 1300.00, 'CHK007'),
('2025-09-03', 1250.00, 'CHK008');

-- Insert data into customers table
INSERT INTO customers (customerName, country, creditLimit) VALUES
('Alice Johnson', 'USA', 5000),
('Bob Smith', 'Canada', 7000),
('Clara Lee', 'USA', 6000),
('Daniel Kim', 'South Korea', 8000),
('Eva Martinez', 'Mexico', 4500),
('Frank Wilson', 'UK', 5500),
('Grace Brown', 'USA', 4000),
('Henry Davis', 'Canada', 6500);

-- Insert data into orderdetails table
INSERT INTO orderdetails (productCode, quantityOrdered, priceEach) VALUES
('P001', 10, 15.50),
('P002', 5, 25.00),
('P003', 20, 8.75),
('P001', 7, 15.50),
('P004', 12, 10.00),
('P002', 8, 25.00),
('P005', 6, 30.00),
('P003', 15, 8.75);

-- ======================================
-- Assignment Queries
-- ======================================

-- Question 1
-- Total payment amount per payment date, sorted descending, top 5 latest dates
SELECT 
    paymentDate, 
    SUM(amount) AS total_amount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;

-- Question 2
-- Average credit limit for each customer grouped by customer name and country
SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS average_credit_limit
FROM customers
GROUP BY customerName, country;

-- Question 3
-- Total price of products ordered grouped by product code and quantity ordered
SELECT 
    productCode, 
    quantityOrdered, 
    SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
GROUP BY productCode, quantityOrdered;

-- Question 4
-- Highest payment amount for each check number
SELECT 
    checkNumber, 
    MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;
