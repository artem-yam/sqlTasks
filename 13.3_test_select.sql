SELECT EMPLOYEEID, 
       LASTNAME||' '||FIRSTNAME Name,
       LEVEL
FROM EMPLOYEES
    START WITH REPORTSTO IS NULL
        CONNECT BY PRIOR EMPLOYEEID = REPORTSTO;