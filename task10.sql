--10.1
SELECT *
FROM EMPLOYEES
    WHERE (SELECT COUNT(ORDERS.ORDERID) FROM ORDERS
                WHERE EMPLOYEES.EMPLOYEEID=ORDERS.EMPLOYEEID)>150