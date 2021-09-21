use employees;
select * from employees;
select * from dept_manager;
# Disply emp_no,first_name,last_name of all the dept_manager -(Join)
#select column_names from table1 as t1 inner join table2 as t2 on t1.common_field=t2.common_filed.
select first_name, last_name, emp_no from employees as E inner join dept_manager as D on E.emp_no = D.emp_no;
select E.first_name, E.last_name, E.emp_no from employees as E inner join dept_manager as D on E.emp_no = D.emp_no;
select E.first_name, E.last_name, E.emp_no from employees as E left join dept_manager as D on E.emp_no = D.emp_no;
select E.first_name, E.last_name, E.emp_no from employees as E right join dept_manager as D on E.emp_no = D.emp_no;

#Display first_name,last_name, salary of all the employees
Select * from salaries;
select E.first_name, E.last_name, S.salary from employees as E inner join salaries as S on E.emp_no = S.emp_no;

select * from titles;
select E.first_name, T.title from employees as E inner join titles as T on E.emp_no = T.emp_no;

#Display the employee no, first_name, last_name and birth_date of all female employees who are earning more than 5ok
SELECT 
    E.first_name, E.last_name, E.emp_no, E.birth_date
FROM
    employees AS E
        INNER JOIN
    salaries AS S ON E.emp_no = S.emp_no
WHERE
    gender = 'f' AND salary > 50000;
    
#Display first_name, designation and salary of employee
#3 table join
SELECT 
    first_name, title, salary
FROM
    employees AS E
        INNER JOIN
    titles AS T ON E.emp_no = T.emp_no
        INNER JOIN
    salaries AS S ON E.emp_no = S.emp_no;

#Display department-wise average salary of employee
SELECT 
    dept_name, AVG(salary)
FROM
    departments AS D
        INNER JOIN
    dept_manager AS DM ON D.dept_no = Dm.dept_no
        INNER JOIN
    employees AS E ON E.emp_no = DM.emp_no
        INNER JOIN
    salaries AS S ON S.emp_no = E.emp_no
GROUP BY dept_name order by dept_name asc;

#display designation wise avg salaries of employees
SELECT 
    title, AVG(salary) AS avg_sal
FROM
    titles AS T
        INNER JOIN
    employees AS E ON T.emp_no = E.emp_no
        INNER JOIN
    salaries AS S ON S.emp_no = E.emp_no group by title;

#Display first_name, last_name, gender, shift(if gender  is male assign him night shift and if gender is female assign her general shift)
SELECT 
    first_name,
    last_name,
    gender,
    CASE
        WHEN gender = 'm' THEN 'night shift'
        ELSE 'general shift'
    END AS shift
FROM
    employees;
