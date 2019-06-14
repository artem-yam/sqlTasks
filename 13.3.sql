--13.2
CREATE OR REPLACE PROCEDURE SubordinationInfo
    (start_employee_id IN NUMBER)
IS
    employee_id NUMBER;
    employee_name VARCHAR2(50);
    hierarchy_level NUMBER;

    CURSOR C1 IS
        SELECT EMPLOYEEID, 
               LASTNAME||' '||FIRSTNAME Name,
               LEVEL
        FROM EMPLOYEES
            START WITH EMPLOYEEID=start_employee_id
                CONNECT BY PRIOR EMPLOYEEID = REPORTSTO;
BEGIN

    DBMS_OUTPUT.ENABLE();
    OPEN C1;

    LOOP
        FETCH C1 INTO employee_id, employee_name, hierarchy_level;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: '||employee_id||'; Name: '
            ||employee_name||'; Level: '||hierarchy_level);
    END LOOP; 
END SubordinationInfo;