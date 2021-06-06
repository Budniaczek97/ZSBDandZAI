-- Adrian Budniak
-- ZSBD
-- Nr albumu: 141290
-- Ćwiczenia 2

-- I. Usunięcie wszystkich tabel z mojej bazy danych

DROP TABLE countries CASCADE CONSTRAINTS;

DROP TABLE departments CASCADE CONSTRAINTS;

DROP TABLE employees CASCADE CONSTRAINTS;

DROP TABLE job_history CASCADE CONSTRAINTS;

DROP TABLE jobs CASCADE CONSTRAINTS;

DROP TABLE locations CASCADE CONSTRAINTS;

DROP TABLE regions CASCADE CONSTRAINTS;

-- II. Kopiowanie tabel wraz z danymi od użytkowniak HR.
-- Ustawienie kluczy glównych i obcych

CREATE TABLE regions
    AS
        SELECT
            *
        FROM
            hr.regions;

CREATE TABLE countries
    AS
        SELECT
            *
        FROM
            hr.countries;

CREATE TABLE locations
    AS
        SELECT
            *
        FROM
            hr.locations;

CREATE TABLE jobs
    AS
        SELECT
            *
        FROM
            hr.jobs;

CREATE TABLE job_history
    AS
        SELECT
            *
        FROM
            hr.job_history;

CREATE TABLE departments
    AS
        SELECT
            *
        FROM
            hr.departments;

CREATE TABLE employees
    AS
        SELECT
            *
        FROM
            hr.employees;
			
ALTER TABLE regions ADD PRIMARY KEY ( region_id );

ALTER TABLE countries ADD PRIMARY KEY ( country_id );

ALTER TABLE locations ADD PRIMARY KEY ( location_id );

ALTER TABLE jobs ADD PRIMARY KEY ( job_id );

ALTER TABLE departments ADD PRIMARY KEY ( department_id );

ALTER TABLE employees ADD PRIMARY KEY ( employee_id );

ALTER TABLE countries
    ADD FOREIGN KEY ( region_id )
        REFERENCES regions ( region_id );

ALTER TABLE locations
    ADD FOREIGN KEY ( country_id )
        REFERENCES countries ( country_id );

ALTER TABLE job_history
    ADD FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id );

ALTER TABLE departments
    ADD FOREIGN KEY ( location_id )
        REFERENCES locations ( location_id );

ALTER TABLE employees
    ADD FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id );

ALTER TABLE employees
    ADD FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id );

ALTER TABLE employees
    ADD FOREIGN KEY ( manager_id )
        REFERENCES employees ( employee_id );

ALTER TABLE job_history
    ADD FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id );

ALTER TABLE job_history
    ADD FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE departments
    ADD FOREIGN KEY ( manager_id )
        REFERENCES employees ( employee_id );
		
-- III. Zapytania
-- 1.

SELECT
    last_name
    || '->'
    || salary AS wynagrodzenie
FROM
    employees
WHERE
    ( department_id = 20
      OR department_id = 50 )
    AND ( salary BETWEEN 2000 AND 7000 )
ORDER BY
    last_name;

-- 2.

SET SERVEROUT ON

CREATE OR REPLACE PROCEDURE cw2_2 (
    column_name VARCHAR2
) IS
    one_record_value  VARCHAR2(5000);
    result_cw2_2      SYS_REFCURSOR;
BEGIN
    OPEN result_cw2_2 FOR 'SELECT HIRE_DATE || '' '' ||  LAST_NAME || '' '' || '
                          || column_name
                          || ' FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL AND HIRE_DATE BETWEEN DATE ''2005-01-01'' AND DATE ''2005-12-31'' ORDER BY '
                          || column_name;

    LOOP
        FETCH result_cw2_2 INTO one_record_value;
        EXIT WHEN result_cw2_2%notfound;
        dbms_output.put_line(one_record_value);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

BEGIN
    cw2_2('FIRST_NAME');
END;
/

-- 3.

SET SERVEROUT ON

CREATE OR REPLACE PROCEDURE cw2_3 (
    part_of_the_name VARCHAR2
) IS

    TYPE record_value IS RECORD (
        full_name     VARCHAR2(50),
        salary        NUMBER,
        phone_number  VARCHAR2(20)
    );
    one_record_value  record_value;
    result_cw2_3      SYS_REFCURSOR;
BEGIN
    OPEN result_cw2_3 FOR 'SELECT FIRST_NAME || '' '' || LAST_NAME AS FULL_NAME, SALARY, PHONE_NUMBER FROM EMPLOYEES '
                          || 'WHERE INSTR(LAST_NAME, ''a'') = 3 AND FIRST_NAME LIKE ''%'
                          || part_of_the_name
                          || '%'''
                          || 'ORDER BY FULL_NAME DESC, SALARY ASC';

    LOOP
        FETCH result_cw2_3 INTO one_record_value;
        EXIT WHEN result_cw2_3%notfound;
        dbms_output.put_line('FULL_NAME = '
                             || one_record_value.full_name
                             || ', '
                             || 'SALARY = '
                             || one_record_value.salary
                             || ', '
                             || 'PHONE_NUMBER = '
                             || one_record_value.phone_number);

    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

BEGIN
    cw2_3('a');
END;
/

-- 4.

SELECT
    first_name,
    last_name,
    round(months_between(current_date, hire_date))         AS months,
    CASE
        WHEN round(months_between(current_date, hire_date)) > 200         THEN
            0.3 * salary
        WHEN round(months_between(current_date, hire_date)) > 150         THEN
            0.2 * salary
        ELSE
            0.1 * salary
    END                                                    AS wysokosc_dodatku
FROM
    employees
ORDER BY
    months;

-- 5.

SELECT
    d.department_name,
    SUM(e.salary)                     AS summary,
    round(AVG(e.salary), 2)           AS average
FROM
         departments d
    JOIN employees e ON e.department_id = d.department_id
GROUP BY
    d.department_name
HAVING
    MIN(e.salary) > 5000
ORDER BY
    d.department_name;

-- 6.
	
SELECT
    e.last_name,
    d.department_id,
    d.department_name,
    e.job_id
FROM
         employees e
    JOIN departments  d ON d.department_id = e.department_id
    JOIN locations    l ON d.location_id = l.location_id
WHERE
    l.city LIKE 'Toronto';	

-- 7.

SELECT
    e.first_name,
    e.last_name
FROM
         employees e
    JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.first_name = 'Jennifer'
    OR e.job_id IN (
        SELECT
            job_id
        FROM
            employees
        WHERE
            first_name = 'Jennifer'
    );

-- 8.

SELECT DISTINCT
    department_id,
    department_name
FROM
    departments
WHERE
    department_id NOT IN (
        SELECT DISTINCT
            department_id
        FROM
            employees
        WHERE
            department_id IS NOT NULL
    );

-- 9.

CREATE TABLE job_grades
    AS
        SELECT
            *
        FROM
            hr.job_grades;

-- 10.

SELECT
    e.first_name,
    e.last_name,
    e.job_id,
    d.department_name,
    e.salary,
    jg.grade
FROM
         employees e
    JOIN departments  d ON e.department_id = d.department_id
    JOIN job_grades   jg ON e.employee_id = jg.employee_id;

-- 11.

SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employees
    )
ORDER BY
    salary DESC;

-- 12.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_id IN (
        SELECT
            department_id
        FROM
            employees
        WHERE
            last_name LIKE '%u%'
    );
