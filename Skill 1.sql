CREATE DATABASE 2520080063_Lalitha;
USE 2520080063_Lalitha;
CREATE TABLE bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);

ALTER TABLE bank_transactions
ADD account_no VARCHAR(20);

ALTER TABLE bank_transactions
MODIFY customer_name VARCHAR(100);

RENAME TABLE bank_transactions
TO customer_transactions;

CREATE TABLE bank_backup AS
SELECT * FROM customer_transactions;

INSERT INTO customer_transactions
(txn_id, customer_name, branch_name, transaction_type, amount, transaction_date)
VALUES
(101,'Ravi','Hyderabad','Deposit',5000,'2024-01-05'),
(102,'Sita','Hyderabad','Withdrawal',2000,'2024-01-06'),
(103,'Kiran','Vijayawada','Deposit',12000,'2024-01-08'),
(104,'Anil','Vizag','Deposit',8000,'2024-01-10'),
(105,'Priya','Hyderabad','Withdrawal',3500,'2024-01-11'),
(106,'Ramesh','Vizag','Deposit',15000,'2024-01-12'),
(107,'Keerthi','Vijayawada','Withdrawal',1000,'2024-01-13'),
(108,'Rahul','Hyderabad','Deposit',9000,'2024-01-14'),
(109,'Sneha','Vizag','Withdrawal',4000,'2024-01-15'),
(110,'Madhu','Vijayawada','Deposit',11000,'2024-01-16');

INSERT INTO customer_transactions
(txn_id, customer_name, branch_name, transaction_type, amount, transaction_date)
VALUES
(111,'Venu','Vizag','Deposit',7000,'2024-01-18');

UPDATE customer_transactions
SET amount = 5000
WHERE txn_id = 105;

DELETE FROM customer_transactions
WHERE txn_id = 111;

SELECT *
FROM customer_transactions;

CREATE USER 'Auditor1'@'localhost'
IDENTIFIED BY 'password123';
GRANT SELECT
ON 2520080063_Lalitha.customer_transactions
TO 'Auditor1'@'localhost';

CREATE USER 'BranchManager'@'localhost'
IDENTIFIED BY 'password123';
GRANT ALL
ON customer_transactions
TO 'BranchManager'@'localhost';

REVOKE SELECT
ON customer_transactions
FROM 'Auditor1'@'localhost';

SHOW GRANTS FOR 'BranchManager'@'localhost';
REVOKE ALL PRIVILEGES
ON 2520080063_lalitha.customer_transactions
FROM 'BranchManager'@'localhost';

UPDATE customer_transactions
SET amount = 6000
WHERE txn_id = 101;

COMMIT;

SAVEPOINT Before_Update;

SAVEPOINT Before_Update;

SAVEPOINT Before_Update;

START TRANSACTION;

SAVEPOINT Before_Update;

START TRANSACTION;

SAVEPOINT Before_Update;

UPDATE customer_transactions
SET amount = 99999
WHERE txn_id = 102;

ROLLBACK TO Before_Update;

START TRANSACTION;

UPDATE customer_transactions
SET amount = 7000
WHERE txn_id = 101;

SAVEPOINT SP1;

UPDATE customer_transactions
SET amount = 9000
WHERE txn_id = 102;

ROLLBACK TO SP1;

COMMIT;

