--3.1
SELECT DISTINCT ORDERID
FROM ORDER_DETAILS
    WHERE QUANTITY BETWEEN 3 AND 10
    
--3.2
SELECT CUSTOMERID, COUNTRY
FROM CUSTOMERS
    WHERE SUBSTR(COUNTRY,1,1) BETWEEN 'B' AND 'G'
    ORDER BY COUNTRY
    
--3.3
SELECT CUSTOMERID, COUNTRY
FROM CUSTOMERS
    WHERE COUNTRY >= 'B' AND SUBSTR(COUNTRY,1,1) <= 'G'
    ORDER BY COUNTRY


