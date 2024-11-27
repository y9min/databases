-- Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates, and the number of bills they have taken.
SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    COUNT(b.bill_no) AS bills_taken
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
GROUP BY 
    s.first_name, s.surname, b.bill_date
HAVING 
    COUNT(b.bill_no) >= 2;

-- List the rooms with tables that can serve more than 6 people and how many of such tables they have.
SELECT 
    t.room_name, 
    COUNT(t.table_no) AS tables_count
FROM 
    restRest_table t
WHERE 
    t.no_of_seats > 6
GROUP BY 
    t.room_name;

-- List the names of the rooms and the total amount of bills in each room.
SELECT 
    t.room_name, 
    SUM(b.bill_total) AS total_bill_amount
FROM 
    restRest_table t
JOIN 
    restBill b ON t.table_no = b.table_no
GROUP BY 
    t.room_name;

-- List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
SELECT 
    s.first_name AS Headwaiter_First_Name, 
    s.surname AS Headwaiter_Surname, 
    SUM(b.bill_total) AS total_bill_amount
FROM 
    restStaff s
JOIN 
    restBill b ON b.waiter_no = s.staff_no
WHERE 
    s.staff_no IN (SELECT DISTINCT headwaiter FROM restStaff)
GROUP BY 
    s.first_name, s.surname
ORDER BY 
    total_bill_amount DESC;

-- List any customers who have spent more than £400 on average.
SELECT 
    b.cust_name
FROM 
    restBill b
GROUP BY 
    b.cust_name
HAVING 
    AVG(b.bill_total) > 400;

-- Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.
SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    COUNT(b.bill_no) AS bills_taken
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
GROUP BY 
    s.first_name, s.surname, b.bill_date
HAVING 
    COUNT(b.bill_no) >= 3;
