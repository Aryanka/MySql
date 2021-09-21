create database customer;
use customer;

select * from `case study data (1)`;

# 2) Write an SQL query to extract 10 of the oldest customers that paid the lowest bill  amounts? Please show the SQL query with correct syntax and the results. (Assume all  variables are present in table name=Table_Attr)
select * from `case study data (1)` order by  monthlycharge asc, weeks desc;

#
select customer_attrition, customer_id,calls_to_customer_care from `case study data (1)` order by weeks desc;

