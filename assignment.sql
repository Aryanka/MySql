#Queries for Classic model Assignment
use classicmodels;
#1.	List the first name, last name and office city of each employee.
select E.firstname, E.lastname, O.city from employees as E inner join offices as O on E.officecode = O.officecode;

#2.	List the customer name, employee first name, employee last name and payment date and amount of all payments.
SELECT 
    E.firstname,
    E.lastname,
    C.customername,
    P.paymentdate,
    P.amount
FROM
    employees AS E
        INNER JOIN
    customers AS C ON E.employeenumber = C.salesrepemployeenumber
        INNER JOIN
    payments AS P ON C.customernumber = P.customernumber;
    
    
#3.	Display customer name and most recent order for all customers.
#whenever want all info use left or right join and in common use inner
SELECT 
    C.customername, max(orderdate) as recentorderdate
FROM
    customers AS C
        left JOIN
    orders AS O ON C.customernumber = O.customernumber group by customername;
    
#4. Find all customers employee relationships. Display customer number and employee number. (some customer aren't attached to employees and some employees aren't attached t customers. Show those as well).
select * from customers;
SELECT 
    C.customernumber, E.employeenumber
FROM
    employees AS E
        LEFT JOIN
    Customers AS C ON E.employeenumber = C.salesrepemployeenumber 
    
UNION 

SELECT C.customernumber, E.employeenumber
FROM
    employees AS E
        RIGHT JOIN
    Customers AS C ON E.employeenumber = C.salesrepemployeenumber;

#5 Your manager needs a report from the Retailer database. Find the office city, the sales rep last and first name, the customer name, the order date and the product name for all orders of Gift Ideas Corp.
SELECT 
    O.city,
    E.firstname,
    E.lastname,
    C.customername,
    C.salesrepemployeenumber,
    P.productname,
    od.orderdate
FROM
    employees AS E
        INNER JOIN
    offices AS O ON E.officecode = O.officecode
        INNER JOIN
    customers AS C ON E.employeenumber = C.salesrepemployeenumber
        INNER JOIN
    orders AS od ON C.customernumber = od.customernumber
        INNER JOIN
    orderdetails AS ods
        INNER JOIN
    products AS P ON ods.productcode = P.productcode
WHERE
    customername = 'gift ideas corp.'; 
    
#6.	You need to find who all employees report to. Display all employees (firstName lastName) and their title, as well as their manager (firstName lastName) and the managers title. If the employee doesn't report to anyone, still show this information.
SELECT 
    CONCAT(E1.firstname, E1.lastname) AS employeesname,
    CONCAT(E2.firstname, E2.lastname) AS managername,
    E1.jobtitle AS Employees_job_title,
    E2.jobtitle AS managers_job_title
FROM
    employees AS E1
        LEFT JOIN
    employees AS E2 ON E1.reportsto = E2.employeenumber;


#7.	Display the customer name, their most recent order date and their most recent shipped date for customers having a name starting with 'A'. Note that some customers have never made an order. Please display their information as well.
select C.customername, max(orderdate)as mostrecentdate, max(shippeddate) as mostrecentshippeddate
FROM
    customers AS C
        left JOIN
    orders AS O ON C.customernumber = O.customernumber
WHERE
    customername LIKE 'A%'
group BY customername;	
    
#8.	Find the product line that has the highest number of sales. Display the product line and the total revenue per line (quantity * price). Note that you don't need to round the sales total.
#select p.productline, (od.quantityordered * od.priceeach) as sales from products as p inner join orderdetails as od on p.productcode = od.productcode where sales = max group by productline ;
SELECT 
    productline, sum(od.quantityordered * od.priceeach) AS Totalrevenue 
FROM
    orderdetails AS od
        INNER JOIN
    products AS pl ON od.productcode = pl.productcode group by productline order by totalrevenue desc limit 1 ;

#9.	You need to determine popularity of product lines. Display all product lines and the number of unique customers who have purchased from that product line.

SELECT count(distinct O.customernumber) as uniquecustomers, p.productline
FROM
    customers AS C
        INNER JOIN
    orders AS o on C.customernumber = O.customernumber
        INNER JOIN
    orderDetails as OD on OD.orderNumber=O.orderNumber
    inner join
    products as P on P.productCode=OD.productCode group by productline order by uniquecustomers desc limit 1;
    