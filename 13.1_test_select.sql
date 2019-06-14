SELECT FIRSTNAME||' '||LASTNAME "Employee name",
       ORDERS.ORDERID "Order",
       SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)) "Cost"
FROM ORDERS 
    JOIN ORDER_DETAILS
        ON ORDERS.ORDERID=ORDER_DETAILS.ORDERID
    JOIN EMPLOYEES
        ON ORDERS.EMPLOYEEID=EMPLOYEES.EMPLOYEEID
    WHERE EXTRACT(YEAR FROM ORDERDATE)=&order_date 
        AND ORDERS.EMPLOYEEID=&employee
    GROUP BY (FIRSTNAME||' '||LASTNAME), ORDERS.ORDERID
    ORDER BY 3 DESC
