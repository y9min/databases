-- List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT 
    s.first_name AS Waiter_First_Name, 
    s.surname AS Waiter_Surname
FROM 
    restStaff s
JOIN 
    restBill b ON s.staff_no = b.waiter_no
WHERE 
    b.cust_name = 'Tanya Singh';

-- On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT 
    rm.room_date
FROM 
    restRoom_management rm
JOIN 
    restStaff s ON rm.headwaiter = s.staff_no
WHERE 
    s.first_name = 'Charles' 
    AND rm.room_name = 'Green' 
    AND rm.room_date BETWEEN 160201 AND 160229;

-- List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT 
    s.first_name, 
    s.surname
FROM 
    restStaff s
WHERE 
    s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

-- List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.
SELECT 
    b.cust_name AS Customer_Name, 
    b.bill_total AS Amount_Spent, 
    CONCAT(s.first_name, ' ', s.surname) AS Waiter_Name
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
ORDER BY 
    b.bill_total DESC;

-- List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT 
    s.first_name, 
    s.surname
FROM 
    restStaff s
JOIN 
    restBill b ON s.staff_no = b.waiter_no
WHERE 
    b.table_no IN (
        SELECT DISTINCT b1.table_no 
        FROM restBill b1
        WHERE b1.bill_no IN (00014, 00017)
    );

-- List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT DISTINCT 
    s.first_name, 
    s.surname
FROM 
    restStaff s
WHERE 
    s.staff_no IN (
        SELECT DISTINCT b.waiter_no 
        FROM restBill b
        JOIN restRest_table t ON b.table_no = t.table_no
        WHERE t.room_name = 'Blue' AND b.bill_date = 160312
    )
OR 
    s.staff_no = (
        SELECT DISTINCT rm.headwaiter
        FROM restRoom_management rm
        WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
    );
