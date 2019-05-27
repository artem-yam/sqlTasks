--2.1
SELECT CONTACTNAME, COUNTRY
FROM customers
    WHERE Country IN ('USA', 'Canada')
    ORDER BY CONTACTNAME,COUNTRY 

--2.2
SELECT CONTACTNAME, COUNTRY
FROM customers
    WHERE Country NOT IN ('USA', 'Canada')
    ORDER BY CONTACTNAME
    
--2.3
SELECT DISTINCT COUNTRY
FROM customers
    ORDER BY COUNTRY DESC