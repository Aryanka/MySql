use employees;
select * from employees;
select * from dept_emp;
select * from departments;
select * from dept_manager;
select * from salaries;
select * from titles;



#Display first_name, Last_name of employees
select first_name, last_name from employees;
#Disply all details of employees who's first_name is denis (where)
select * from employees where first_name = 'denis';
#Disply all details of male employees who's first_name is denis 
select * from employees where gender = 'M' and first_name = 'denis';
#Display all details of employees who's first_name is Denis OR Elvis
select * from employees where first_name ='denis' or first_name= 'elvis';
#Display all details of female employees who's first_name is Kellie or Aruna 
select * from employees where gender ='f' and (first_name='kellie' or first_name='aruna');
#Display all details of employees who's first_name is Denis OR Elvis OR Cathie OR Mark OR Nathan
select * from employees where (first_name='denis' or first_name='elvis' or first_name='cathie' or first_name='nathan');
select * from employees where first_name in ('denis','elvis','cathie','nathan');
#Display all details of employees who's first_name is not Denis OR Elvis OR Cathie OR Mark OR Nathan
select * from employees where first_name not in ('denis','elvis','cathie','nathan');
#Display all details of employees who's first_name is starting with Character 'Mar'(like)
select * from employees where first_name like 'mar%';
#Display all details of employees who's first_name ending with Character 'A'
select * from employees where first_name like '%a';
#Display all details of employees who's first_name having character 'B' 
select * from employees where first_name like '%B%';
#Display all details of employees who's first_name is not starting with Character 'Mar' (not like)
select * from employees where first_name not like 'mar%';
#Display all details of employees who's first_name is not ending with Character 'A'
select * from employees where first_name not like '%a';
#Display all details of employees who's first_name is not having letter 'B' 
select * from employees where first_name not like '%b%';
#Display first_name,last_name,hire_date of employees who got hired BETWEEN JAN 1990 AND JAN 2000(between and)
select first_name, last_name, hire_date from employees where hire_date between '1900-01-01' and '2000-01-31';
#Display first_name, last_name of female emplyees who got hired after jan 2000 (comparison operators =,<,>,>=,=<,!=)
select first_name, last_name from employees where gender='f' and hire_date > '2000-01-31';
#Display unique designation of employees (distinct)
select * from titles;
select distinct(title) from titles;
#aggregate functions in sql-count(),min(),max(),avg(),stdev()
#Display number of records in salary table 
select * from salaries;
select count(salary) as no_of_records from salaries;
select count(*) as n from salaries;
#Display maximum salary from salaries table 
select max(salary) as max_salary from salaries;
#Display minimum salary from salaries table 
select min(salary) as min_salary from salaries;
#Display average salary from salaries table 
select avg(salary) as avg_salary from salaries;
#Display salary from salaries table in descending order (order by )
select salary from salaries order by salary desc;
#Display first_name of employees in descending order
select first_name from employees order by first_name desc;
#Display top 10 maximum salary from salaries
select salary from salaries order by salary desc limit 10;
#Display bottom 10 minimum salary from salaries
select salary from salaries order by salary asc limit 10;
#Display the unique first_names of employees along with their name_counts(number of employees with similar name)
# whenever we have any aggregate function in the select clause always use group by
#groupby always comes before order by
select first_name, count(first_name) as name_counts from employees group by first_name order by first_name asc; 
#Display  first_name of employees who's name_counts is greater than 250
# whenever we have a condition on aggregate functions always use HAVING instead of where	
select first_name, count(first_name) as name_counts from employees group by first_name having count(first_name)>250;

