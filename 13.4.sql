--13.4
CREATE OR REPLACE FUNCTION IsBoss
    (employee_id IN NUMBER)
    RETURN INTEGER
IS
    subordinates_count INTEGER;

    CURSOR C1 IS
        SELECT COUNT(EMPLOYEEID)-1 
        FROM EMPLOYEES
            START WITH EMPLOYEEID=employee_id
                CONNECT BY PRIOR EMPLOYEEID = REPORTSTO;
BEGIN

    DBMS_OUTPUT.ENABLE();
    OPEN C1;

    FETCH C1 INTO subordinates_count;
    RETURN subordinates_count;
END IsBoss;