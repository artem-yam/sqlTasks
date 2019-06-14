--13.1
CREATE OR REPLACE PROCEDURE GreatestOrders
    (order_date IN VARCHAR2,
    orders_amount IN NUMBER)
IS
    rows_output NUMBER(38,0);
    employee_name VARCHAR2(40 BYTE);
    order_id NUMBER(38,0);
    order_cost NUMBER(38,5);

    CURSOR C1 IS
        SELECT "Employee name",
               "Order",
               "Cost"
        FROM (
            SELECT FIRSTNAME||' '||LASTNAME "Employee name",
                   ORDERS.ORDERID "Order",
                   SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)) "Cost",
                   Row_number() OVER(
                        PARTITION BY FIRSTNAME||' '||LASTNAME
                        ORDER BY SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)) DESC) rn
            FROM ORDERS 
                JOIN ORDER_DETAILS
                    ON ORDERS.ORDERID=ORDER_DETAILS.ORDERID
                JOIN EMPLOYEES
                    ON ORDERS.EMPLOYEEID=EMPLOYEES.EMPLOYEEID
                WHERE EXTRACT(YEAR FROM ORDERDATE)=order_date 
                GROUP BY (FIRSTNAME||' '||LASTNAME), ORDERS.ORDERID
                ORDER BY 3 DESC)
            WHERE  rn = 1;
BEGIN

    rows_output:=0;
    DBMS_OUTPUT.ENABLE();
    OPEN C1;

    LOOP
       FETCH C1 INTO employee_name, order_id, order_cost;
       EXIT WHEN C1%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('Name: '||employee_name||'; Order: '
            ||order_id||'; Cost: '||order_cost);
       rows_output:=rows_output+1;
       EXIT WHEN rows_output>=orders_amount;
    END LOOP; 
END GreatestOrders;