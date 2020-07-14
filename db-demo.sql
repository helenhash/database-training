-- Create database
CREATE DATABASE testDB; 
SHOW DATABASES; 
DROP DATABASE testDB;
USE testDB;

-- Create Customers table
CREATE TABLE customers (
    id        INT NOT NULL,
    name      VARCHAR(20) NOT NULL,
    age       INT NOT NULL,
    address   CHAR(25),
    salary    DECIMAL(18, 2),
    PRIMARY KEY ( id )
);
-- Drop a Table
DROP TABLE CUSTOMERS; 

-- INSERT INTO Statement 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (3, 'kaushik', 23, 'Kota', 2000.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (6, 'Komal', 22, 'MP', 4500.00 );

-- update ADDRESS for a customer whose ID is 6: 
UPDATE CUSTOMERS SET ADDRESS = 'Pune' WHERE ID = 6; 

-- DELETE a customer, whose ID is 6
DELETE FROM CUSTOMERS WHERE ID = 6; 

-- display all the records from CUSTOMERS table where SALARY starts with 200
SELECT * FROM CUSTOMERS WHERE SALARY LIKE '200%'; 

-- fetch ID, Name and Salary fields of the customers available in CUSTOMERS table
SELECT
    id,
    name, salary FROM
customers;   

-- the total amount of salary on each customer, then GROUP BY query 
SELECT
    name,
    SUM(salary)
FROM
    customers
GROUP BY
    name;

-- To create a PRIMARY KEY constraint on the "ID" column when CUSTOMERS table already exists
ALTER TABLE CUSTOMER ADD PRIMARY KEY (ID);

-- Delete Primary Key
ALTER TABLE CUSTOMERS DROP PRIMARY KEY;

-- Forgein keys
CREATE TABLE ORDERS ( 
       ID          INT        NOT NULL, 
       DATE        DATETIME,  
       CUSTOMER_ID INT references CUSTOMERS(ID), 
       AMOUNT     double, 
       PRIMARY KEY (ID) 
);
-- OR
ALTER TABLE ORDERS  
   ADD FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS (ID); 
   
-- Join
SELECT
    id,
    name,
    amount,
    DATE
FROM
    customers
    INNER JOIN orders ON customers.id = orders.customer_id;
