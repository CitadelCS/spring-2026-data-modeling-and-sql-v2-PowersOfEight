-- Specify the following queries on the \texttt{COMPANY} relational
-- database schema shown in Chapter 5 and also in the SQL scripts
-- from last week, using the relational operators. Also, show the
-- result of each query as it would apply to the database state
-- after executing \texttt{COMPANY_DATA.sql} script.
SET SEARCH_PATH TO COMPANY , PUBLIC;


-- (a) Retrieve the names of employees in department 5 who work more
-- than 10 hours per week on the 'ProductX' project.
SELECT
    fname ||
    CASE
        WHEN minit IS NOT NULL THEN
        ' ' || minit || ' '
        ELSE
            ' '
    END
    || lname AS "Employees from dept 5 with than 10 hours/week on ProductX"
FROM
    employee e
    INNER JOIN works_on wo
    ON e.ssn = wo.essn
    INNER JOIN project p
    ON wo.pno = p.pnumber
WHERE p.pname = 'ProductX'
AND wo.hours > 10
AND e.dno = 5;
;

-- (b) List the names of employees who have a dependent with the same first name as themselves.
SELECT
    fname ||
    CASE
        WHEN minit IS NOT NULL THEN
            ' ' || minit || ' '
        ELSE
            ' '
    END
    || lname AS "Employees with the same first name as dependent"
FROM
    employee e
    JOIN dependent d
    ON d.essn = e.ssn
WHERE
    d.dependent_name like e.fname || '%'
;

SELECT
    fname
FROM
    employee
where fname in (
SELECT
    dependent.dependent_name
FROM
    dependent);

SELECT
    dependent.dependent_name
FROM
    dependent, employee
WHERE dependent_name like employee.fname || '%';

WITH all_names as
(
SELECT
    dependent.dependent_name "name"
FROM
    dependent
UNION
SELECT
    fname
FROM
    employee)
SELECT
    name,
    count(*)
FROM all_names a
GROUP BY name;


-- (c) Find the names of employees that are directly supervised by 'Franklin Wong'.
SELECT
    e.fname ||
    CASE
        WHEN e.minit IS NOT NULL THEN
            ' ' || e.minit || ' '
        ELSE
            ' '
        END
        || e.lname AS "Employees who work for Franklin Wong"
--     , s.fname || ' ' || s.lname "Supervisor"
FROM
    employee e
    JOIN employee s
    ON e.super_ssn = s.ssn
    AND s.fname = 'Franklin' AND s.lname = 'Wong';

-- (d) For each project, list the project name and the total hours per week (by all employees) spent on that project.
SELECT
    p.pname "Project_name",
    SUM(w.hours) "Total_hours"
FROM
    project p
    JOIN company.works_on w on p.pnumber = w.pno
GROUP BY p.pname;

-- (e) Retrieve the names of employees who work on every project.
SELECT
    e.fname ||
    CASE
        WHEN e.minit IS NOT NULL THEN
            ' ' || e.minit || ' '
        ELSE
            ' '
        END
        || e.lname AS "Employees who worked on every project"
FROM
    employee e
WHERE NOT EXISTS (
    SELECT *
    FROM project p
    WHERE p.pnumber NOT IN (
        SELECT
            pno
        FROM works_on
        WHERE essn = e.ssn
        )
)
;

SELECT * FROM employee;
SELECT COUNT(*) FROM project;
SELECT COUNT(*) FROM project,employee;
SELECT
    essn,
    COUNT(pno)
FROM works_on
GROUP BY essn;
SELECT * from works_on;
-- SUBPART


