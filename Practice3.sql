select p.name as physian, d.name as department from physian as p,department as d where p.employeeid=d.name;

select p.name as physian, d.name as department from physian as p,department as d, affiliated_with as a where p.employeeid=a.physician and d.departmentid=a.department ;

select p.name from  physian as p, proceduree as pr, trained_in as t where p.employeeid = t.physician and pr.code=t.treatment;

select p.name as physian, d.departmentid as department from physian as p,department as d, affiliated_with as a where p.employeeid=a.physician and a.department=d.departmentid and primaryaffiliation ='f';

select p.name, a.name from patient as p inner join appointment as a on p.ssn=a.patient inner join physician as ph on a.physician=ph.physician where a.prepnurse =null;

SELECT 
    p.name,
    ph.name,
    n.name,
    u.proceduree,
    s.end_time,
    s.room,
    r.blockfloor,
    r.blockcode
FROM
    patient AS p
        INNER JOIN
    undergoes AS u ON u.patient = p.ssn
        INNER JOIN
    physician AS ph ON u.physician = ph.employeeid
        INNER JOIN
    nurse AS n ON u.assistingnurse = n.employeeid
        INNER JOIN
    stay AS s ON s.patient = u.patient
        INNER JOIN
    room AS r ON s.room = r.roomnumber;
    
    
select p.name, ph.name from patient as p inner join physician as ph on p.pcp=ph.employeeid inner join department as d on d.departmentid =p.pcp in 



select city, length(city) from station
order by length(city),city asc
limit 1;
select city, length(city) from station
order by length(city) desc
limit 1;

#select city start from aeiou
select distinct city from station where city REGEXP "^[aeiou].*";

#select city ends from aeiou
select distinct city from station where city REGEXP "[aeiou]$";

#select city not start from aeiou
select distinct city from station where city REGEXP "^[^aeiou].*";






select author_name, sum(books.sold_copies) as s from authors as a, books as b where a.book_name=b.book_name group by sold_copies order by s desc limit 3;

select count(*) from (select count(event_date_time) as img_per_user from event_log) where img_per_user <2000 and img_per_user >1000;

select department_name,avg(s.salary) from employee as e join salaries as s on e.employee_id=s.employee_id group by department_name having avg(s.salary)<500;






select first_name, last_name, salary from employees where salary >(select salary from employees where las_name='bull');
select first_name, last_name, salary from employees where depart_id in (select dep_id FROM departments WHERE department_name='IT');
select first_name, last_name from employees where MANAGER_ID in(select emp_id from employees where dep_id in (select dep_id from departments where loc_id in (select loc_id from location where loc = 'usa')));
select first_name, last_name from employees where emp_id in(select man_id from employees);
select first_name, last_name, salary from employees where salary in(select salary from employees where salary> avg(salary));
select first_name, last_name, salary from employees as e where e.salary =(select min_sal from jobs as j where e.job_id=j.job_id);
select first_name, last_name, salary from employees as e where dep_id in (select dep_id from dep where dep_name like "IT%") and salary >(select avg(salary) from employees);
select first_name, last_name, salary from employees where sal >(select sal from employees where lname='bill');
select first_name, last_name, salary from employees where sal =(select min(sal) from employees);
select first_name, last_name, salary from employees where sal>(select avg(sal) from employees group by dep_id);
select first_name, last_name, salary from employees where sal> all(select sal from employees where JOB_ID = 'SH_CLERK' order by salary);
select first_name, last_name, salary from employees as e where not exists(select * from employees where e.managerId=e.emp_id);
select first_name, last_name, salary, emp_id from employees where e.sal>(select avg(sal) from employees where dep_id=e.dep_id);
select distinct(sal) from employee where 5 = (select count(distinct sal) from employees as e2 where e1.sal>=e2.sal);
select distinct sal from employee where 4 =(select count(distinct sal) from employees as e2 where e1.sal<=e2.sal);



select * from employee order by salary desc limit 3;
-- 3> Write a SQL query to find the count of employees working in department 'Admin'
select count(*) from employees where dep='admin';

-- 4> Write a SQL query to fetch department wise count employees sorted by department count in desc order.
select count(*), dep from employees group by dep order by count(dep) desc;
select substring_index2(fullname, ' ', 1)firstname from username;
select emp from employee as e1 join employee as e2 where e1.empno=e2.manno;
select emp from employee e1, employee e2 where e1.empno=e2.manno;
select fname from employee where empid in(select fname from employee where bonempid=empid);
select * from employee where mod(empid, 2)=1;
select concat(fname, lname) from employee;
select * from employee where year(joiningdate)=2017 and month(joiningdate)=1;
select count(*), dep from employee group by dep order by count(dep);
select * from employee where empid =(select max(empid) from employee);
select * from employee where empid =(select min(empid) from employee);
select empid from employee where empid in (select empid from employee having max(sal));
select empid, max(sal) as maxsal from employee group by dep order by maxsal desc ;
select dep, sum(sal) as cal from employees group by dep order by cal;
select firstname, lastname, department, bonus where empid in (select empid from employee having max(bonus));
select empid, e1.sal from employee as e1 , employee as e2 where e1.sal=e2.sal and e1.empid!=e2.empid;
select count(attendance_events.stid) / (select count(stid) from all_students) * 100 as percent from attendance_events as a join  attendance_events as e on a.stid=e.stid where month(attendance_events)= month(allstu.dob) and day(attendance_events.date_event) = day(all_students.date_of_birth);
select logintime, count(distinct userid) from logininfo as a left join logininfo as l on a.userid=l.userid where a.logintime = l.logintime - interval 1 day group by 1;
select count(u.user_id_who_sent)/ (select count(a.user_id_who_sent) from user_id_who_sent ) * 100 as ovrl_acp_r from user_action as u right join user_action as a on u.user_id_who_sent=a.user_id_who_sent;
select msg, userid from  message_detail order by msg desc limit 10;
select distinct (substring_index2(fullname, ' ',1))firstname from username;
select (number_of_clicks)/(number_of_impressions) as crate from dialoglog where type='click' group  by appid;
select (total_number_of_acceptance / total_number_of_requests) from Friend_request as f join Request_accepted as r on f.reqid=r.reqid;

