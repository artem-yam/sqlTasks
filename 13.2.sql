--13.2
CREATE OR REPLACE PROCEDURE ShippedOrdersDiff
    (specified_delay IN NUMBER)
IS
    order_id NUMBER(38,0);
    order_date DATE;
    shipped_date VARCHAR2(50);
    shipped_delay VARCHAR2(50);

    CURSOR C1 IS
        SELECT ORDERID, 
               ORDERDATE, 
               TO_CHAR(SHIPPEDDATE, 'dd.mm.yyyy'), 
              (SHIPPEDDATE-ORDERDATE) ShippedDelay
        FROM ORDERS
        WHERE (SHIPPEDDATE-ORDERDATE) IS NULL
            OR (SHIPPEDDATE-ORDERDATE)>specified_delay
        ORDER BY 4;
BEGIN

    DBMS_OUTPUT.ENABLE();
    OPEN C1;

    LOOP
        FETCH C1 INTO order_id, order_date, shipped_date, shipped_delay;
        EXIT WHEN C1%NOTFOUND;
       
        IF shipped_date IS NULL THEN 
            shipped_date:='Not shipped';
            shipped_delay:='Not shipped';
        END IF;
        DBMS_OUTPUT.PUT_LINE('Order: '||order_id||'; Ordered: '
            ||order_date||'; Shipped: '||shipped_date
            ||'; Delay: '||shipped_delay
            ||'; Specified delay: '||specified_delay);
    END LOOP; 
END ShippedOrdersDiff;