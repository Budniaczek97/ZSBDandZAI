-- Adrian Budniak
-- ZSBD
-- Nr albumu: 141290
-- Ćwiczenia 1

CREATE TABLE regions (
    region_id    INT PRIMARY KEY,
    region_name  VARCHAR(50)
);

CREATE TABLE countries (
    country_id    INT PRIMARY KEY,
    country_name  VARCHAR(50) UNIQUE,
    region_id     INT,
    FOREIGN KEY ( region_id )
        REFERENCES regions ( region_id )
);

CREATE TABLE locations (
    location_id     INT PRIMARY KEY,
    city            VARCHAR(30),
    state_province  VARCHAR(30),
    country_id      INT,
    FOREIGN KEY ( country_id )
        REFERENCES countries ( country_id )
);

CREATE TABLE jobs (
    job_id      INT PRIMARY KEY,
    job_title   VARCHAR(50),
    min_salary  FLOAT
);

CREATE TABLE job_history (
    employee_id    INT,
    start_date     DATE,
    end_date       DATE,
    job_id         INT,
    department_id  INT,
    FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id )
);

CREATE TABLE departments (
    department_id    INT PRIMARY KEY,
    department_name  VARCHAR(50),
    manager_id       INT,
    location_id      INT,
    FOREIGN KEY ( location_id )
        REFERENCES locations ( location_id )
);

CREATE TABLE employees (
    employee_id     INT PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    hire_date       DATE,
    job_id          INT,
    salary          FLOAT,
    commission_pct  VARCHAR(30),
    manager_id      INT,
    department_id   INT,
    FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id ),
    FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id )
);

ALTER TABLE locations ADD street_address VARCHAR(30);

ALTER TABLE locations ADD postal_code VARCHAR(15);

ALTER TABLE jobs ADD max_salary FLOAT;

ALTER TABLE employees ADD email VARCHAR(50);

ALTER TABLE employees ADD phone_number VARCHAR(15);

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

ALTER TABLE jobs ADD CHECK ( max_salary - min_salary >= 2000 );