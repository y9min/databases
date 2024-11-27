-- List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT 
    DISTINCT b.cust_name
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
WHERE 
    b.bill_total > 450.00
    AND s.headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles');

-- A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT 
    s.first_name, 
    s.surname
FROM 
    restStaff s
JOIN 
    restRoom_management rm ON s.staff_no = rm.headwaiter
WHERE 
    rm.room_date = 160111 
    AND rm.room_name IN (
        SELECT room_name 
        FROM restBill b
        WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
    );

-- What are the names of customers with the smallest bill?
SELECT 
    b.cust_name
FROM 
    restBill b
WHERE 
    b.bill_total = (SELECT MIN(bill_total) FROM restBill);

-- List the names of any waiters who have not taken any bills.
SELECT 
    s.first_name, 
    s.surname
FROM 
    restStaff s
WHERE 
    s.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

-- Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT 
    b.cust_name, 
    CONCAT(s.first_name, ' ', s.surname) AS Headwaiter_Name, 
    rm.room_name
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
JOIN 
    restRoom_management rm ON rm.headwaiter = s.staff_no
WHERE 
    b.bill_total = (SELECT MAX(bill_total) FROM restBill);
