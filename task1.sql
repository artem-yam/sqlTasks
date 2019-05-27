--1.1
SELECT OrderID,ShippedDate,ShipVia
FROM orders
WHERE ShippedDate >= TO_DATE('1998-05-05', 'YYYY-MM-DD')
    AND ShipVia >= '2'

--1.2
SELECT OrderID,
    CASE 
    WHEN ShippedDate IS NULL
    THEN 'Not Shipped'
    END ShippedDate
FROM orders
WHERE ShippedDate IS NULL

--1.3
SELECT OrderID AS "Order Number",
       NVL(TO_CHAR(ShippedDate), 'Not Shiped') AS "Shipped Date"
  FROM orders
  WHERE ShippedDate > TO_DATE('1998-05-05', 'YYYY-MM-DD') 
    OR ShippedDate IS NULL