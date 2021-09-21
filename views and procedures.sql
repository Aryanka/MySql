
#Sql view - view are virtual tables who's data is extracted from the physical table. We can create a view by selectong fields from one or more tables.
#This is used whenever i want to share something from physical data 
# user cannot update or delete any information from views.
use employees;
select * from employees;
select * from employees limit 1000;

#creating view
create view top_1000_emp as select * from employees limit 1000;
select * from top_1000_emp;


#SQL-Procedures (Stored procedures) - a stored procedure is prepared sql code that we can save and use it again and again.  

#Display firstName, lastName and salary of employeeNumber 10001
select first_name, last_name, salary FROM
    employees AS E
        INNER JOIN
    salaries AS S ON E.emp_no = S.emp_no
WHERE
    E.emp_no = 10002;
    
#creating procedures
create procedure emp_salary(in P_emp_no int) select first_name, last_name, salary FROM
    employees AS E
        INNER JOIN
    salaries AS S ON E.emp_no = S.emp_no
WHERE
  P_emp_no = E.emp_no;
    
call employees.emp_salary(10006);

# Order of excution in SQL - From , where, aggregate condition (group by), having , select, sort(order by), limit
    
# create procedure for extracting avg_salary of employees with there firstName.   
create procedure avg_sal(in P_first_name varchar(250)) select first_name, avg(salary) as avg_salary from employees as E inner join salaries as S on E.emp_no = S.emp_no where P_first_name = E.first_name;
call employees.avg_sal('Eberhardt');







