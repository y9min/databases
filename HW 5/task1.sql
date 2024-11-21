-- List the dates and bill totals for customer Bob Crow
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- List the names of all customers whose last name is Smith. List each customer only once in the reverse lexicographical order.
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- List the names of all customers whose second names begin with 'C'. List each customer only once.
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';

-- List the names of all the headwaiters.
SELECT DISTINCT first_name, surname
FROM restStaff
WHERE staff_no IN (SELECT DISTINCT headwaiter FROM restRoom_management);

-- List all the details of bills dated February 2016.
SELECT *
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- List the dates the restaurant took money in 2015. List each date only once in the sorted order.
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 150101 AND 151231
ORDER BY bill_date;
