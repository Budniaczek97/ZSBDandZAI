-- Adrian Budniak
-- ZSBD
-- Nr albumu: 141290
-- Ćwiczenia 3

-- 1.

DECLARE
    number_max  departments.department_id%TYPE;
    new_name    departments.department_name%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO number_max
    FROM
        departments;

    INSERT INTO departments (
        department_id,
        department_name
    ) VALUES (
        number_max + 10,
        'EDUCATION'
    );

    dbms_output.put_line('Maksymalny numer departamentu jest równy: ' || number_max);
END;

-- 2.

DECLARE
    number_max       departments.department_id%TYPE;
    new_name         departments.department_name%TYPE;
    new_location_id  departments.location_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO number_max
    FROM
        departments;

    INSERT INTO departments (
        department_id,
        department_name
    ) VALUES (
        number_max + 10,
        'EDUCATION'
    );

    new_location_id := 3000;
    UPDATE departments
    SET
        location_id = new_location_id
    WHERE
        department_id = number_max + 10;

    dbms_output.put_line('Maksymalny numer departamentu jest równy: ' || number_max);
END;

-- 3.

CREATE TABLE new_table (
    new_column VARCHAR(10)
);

BEGIN
    FOR i IN 1..10 LOOP
        IF
            i != 4
            AND i != 6
        THEN
            INSERT INTO new_table ( new_column ) VALUES ( i );

        END IF;
    END LOOP;
END;

-- 4.

SET SERVEROUTPUT ON

DECLARE
    cw3_4_result countries%rowtype;
BEGIN
    SELECT
        *
    INTO cw3_4_result
    FROM
        countries
    WHERE
        country_id = 'CA';

    dbms_output.put_line('Nazwa Kraju = '
                         || cw3_4_result.country_name
                         || ' REGION_ID Kraju = '
                         || cw3_4_result.region_id);

END;

-- 5.

SET SERVEROUTPUT ON

DECLARE
    TYPE departments_names IS
        TABLE OF departments%rowtype INDEX BY VARCHAR2(5);
    d_names  departments_names;
    d_info   departments%rowtype;
BEGIN
    FOR i IN 1..10 LOOP
        SELECT
            *
        INTO d_info
        FROM
            departments
        WHERE
            department_id = i * 10;

        d_names(i) := d_info;
        dbms_output.put_line('departament_id:'
                             || i * 10
                             || ' '
                             || 'department_name:'
                             || to_char(d_names(i).department_name));

    END LOOP;
END;

-- 6.
	
SET SERVEROUTPUT ON

DECLARE
    TYPE departments_names IS
        TABLE OF departments%rowtype INDEX BY VARCHAR2(5);
    d_names  departments_names;
    d_info   departments%rowtype;
BEGIN
    FOR i IN 1..10 LOOP
        SELECT
            *
        INTO d_info
        FROM
            departments
        WHERE
            department_id = i * 10;

        d_names(i) := d_info;
        dbms_output.put_line('departament_id:'
                             || i * 10
                             || ' '
                             || 'department_name:'
                             || d_names(i).department_name
                             || ' '
                             || 'manager_id:'
                             || d_names(i).manager_id
                             || ' '
                             || 'location_id:'
                             || d_names(i).location_id);

    END LOOP;
END;

-- 7.

SET SERVEROUTPUT ON

DECLARE
    TYPE row_type IS RECORD (
        salary     NUMBER,
        last_name  VARCHAR2(25)
    );
    row_value     row_type;
    result_cw3_7  SYS_REFCURSOR;
BEGIN
    OPEN result_cw3_7 FOR 'SELECT SALARY, LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 ORDER BY LAST_NAME';

    LOOP
        FETCH result_cw3_7 INTO row_value;
        EXIT WHEN result_cw3_7%notfound;
        IF row_value.salary > 3100 THEN
            dbms_output.put_line(row_value.last_name || ' -> nie dawać podwyżki');
        ELSE
            dbms_output.put_line(row_value.last_name || ' -> dać podwyżke');
        END IF;

    END LOOP;

END;

-- 8a.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE cw_3_8 (
    min_salary        NUMBER,
    max_salary        NUMBER,
    part_of_the_name  VARCHAR2
) IS

    TYPE row_type IS RECORD (
        salary      NUMBER,
        first_name  VARCHAR2(25),
        last_name   VARCHAR2(25)
    );
    row_value     row_type;
    result_cw3_8  SYS_REFCURSOR;
BEGIN
    OPEN result_cw3_8 FOR 'SELECT SALARY, FIRST_NAME, LAST_NAME FROM EMPLOYEES '
                          || 'WHERE SALARY > '
                          || min_salary
                          || ' AND SALARY < '
                          || max_salary
                          || 'AND (FIRST_NAME LIKE ''%'
                          || lower(part_of_the_name)
                          || '%'' OR FIRST_NAME LIKE ''%'
                          || upper(part_of_the_name)
                          || '%'')';

    LOOP
        FETCH result_cw3_8 INTO row_value;
        EXIT WHEN result_cw3_8%notfound;
        dbms_output.put_line('SALARY = '
                             || row_value.salary
                             || ', '
                             || 'FULL_NAME = '
                             || row_value.first_name
                             || ' '
                             || row_value.last_name);

    END LOOP;

END;
/

BEGIN
    cw_3_8(1000, 5000, 'a');
END;
/

-- 8b.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE cw_3_8 (
    min_salary        NUMBER,
    max_salary        NUMBER,
    part_of_the_name  VARCHAR2
) IS

    TYPE row_type IS RECORD (
        salary      NUMBER,
        first_name  VARCHAR2(25),
        last_name   VARCHAR2(25)
    );
    row_value     row_type;
    result_cw3_8  SYS_REFCURSOR;
BEGIN
    OPEN result_cw3_8 FOR 'SELECT SALARY, FIRST_NAME, LAST_NAME FROM EMPLOYEES '
                          || 'WHERE SALARY > '
                          || min_salary
                          || ' AND SALARY < '
                          || max_salary
                          || 'AND (FIRST_NAME LIKE ''%'
                          || lower(part_of_the_name)
                          || '%'' OR FIRST_NAME LIKE ''%'
                          || upper(part_of_the_name)
                          || '%'')';

    LOOP
        FETCH result_cw3_8 INTO row_value;
        EXIT WHEN result_cw3_8%notfound;
        dbms_output.put_line('SALARY = '
                             || row_value.salary
                             || ', '
                             || 'FULL_NAME = '
                             || row_value.first_name
                             || ' '
                             || row_value.last_name);

    END LOOP;

END;
/

BEGIN
    cw_3_8(5000, 20000, 'u');
END;
/

-- 9a.

CREATE OR REPLACE PROCEDURE cw_3_9_a (
    new_job_id     VARCHAR2,
    new_job_title  VARCHAR2
) IS
BEGIN
    INSERT INTO jobs (
        job_id,
        job_title
    ) VALUES (
        new_job_id,
        new_job_title
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    cw_3_9_a('new_job_id', 'new job title');
END;
/

-- 9b.

CREATE OR REPLACE PROCEDURE cw_3_9_b (
    new_job_id     VARCHAR2,
    new_job_title  VARCHAR2
) IS
    my_exception_no_jobs_updated EXCEPTION;
    PRAGMA exception_init ( my_exception_no_jobs_updated, -20998 );
BEGIN
    UPDATE jobs
    SET
        job_title = new_job_title
    WHERE
        job_id = new_job_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data remained unchanged ');
    END IF;
EXCEPTION
    WHEN my_exception_no_jobs_updated THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    cw_3_9_b('AD_PRES', 'New President');
END;
/

-- 9c.

CREATE OR REPLACE PROCEDURE cw_3_9_c (
    delete_job_id VARCHAR2
) IS
    my_exception_no_jobs_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_jobs_deleted, -20998 );
BEGIN
    DELETE FROM jobs
    WHERE
        job_id = delete_job_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_jobs_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    cw_3_9_c('new_job_id');
END;
/

-- 9d.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE cw_3_9_d (
    input_employee_id  IN   NUMBER,
    out_salary         OUT  NUMBER,
    out_last_name      OUT  VARCHAR2
) IS

    TYPE row_type IS RECORD (
        salary     NUMBER,
        last_name  VARCHAR2(25)
    );
    row_result     row_type;
    result_cw3_9d  SYS_REFCURSOR;
BEGIN
    OPEN result_cw3_9d FOR 'SELECT SALARY, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID = ' || input_employee_id;

    FETCH result_cw3_9d INTO row_result;
    out_salary := row_result.salary;
    out_last_name := row_result.last_name;
END;
/

DECLARE
    out_salary     NUMBER;
    out_last_name  VARCHAR2(30);
BEGIN
    cw_3_9_d(110, out_salary, out_last_name);
    dbms_output.put_line('SALARY = ' || out_salary);
    dbms_output.put_line('LAST_NAME = ' || out_last_name);
END;
/

-- 9e.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE cw_3_9_e (
    new_first_name    VARCHAR2 DEFAULT 'John',
    new_last_name     VARCHAR2 DEFAULT 'Doe',
    new_e_mail        VARCHAR2 DEFAULT 'john.doe@example.com',
    new_phone_number  VARCHAR2 DEFAULT '666 777 888',
    new_salary        NUMBER DEFAULT 6666
) IS
    my_exception_salary_is_too_high EXCEPTION;
    PRAGMA exception_init ( my_exception_salary_is_too_high, -20998 );
    last_employee_id    NUMBER;
    last_department_id  NUMBER;
BEGIN
    IF new_salary > 20000 THEN
        raise_application_error(-20998, 'The salary cannot be higher than 20,000 ');
    END IF;
    SELECT
        MAX(employee_id)
    INTO last_employee_id
    FROM
        employees;

    SELECT
        MAX(department_id)
    INTO last_department_id
    FROM
        departments;

    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        salary,
        hire_date,
        job_id,
        department_id
    ) VALUES (
        last_employee_id + 1,
        new_first_name,
        new_last_name,
        new_e_mail,
        new_phone_number,
        new_salary,
        current_date,
        'PR_REP',
        last_department_id
    );

EXCEPTION
    WHEN my_exception_salary_is_too_high THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

--BEGIN
--    cw_3_9_e(new_last_name => 'Kowalski');
--END;
--/

BEGIN
    cw_3_9_e(new_salary =>'1000000');
END;
/
