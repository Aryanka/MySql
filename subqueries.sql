use world;

select * from city;
select * from country;
select * from countrylanguage;

# list each country name where the population is greater than India. 
select population from country where name='India';
select name from country where population > (select population from country where name='India');

#sub-queries are querie embeded query, subqueries are always written in the parantesis 
#there are two types of sub-query
#1- single row sub-query: whenever subquery returns single or 0 row output use comparision operators
#2- multiple row sub query : whenever sub-query return more than one record we use In Operator

#show the countries in Europe with avg_income per citizen. (GNP/Population) greater than United Kingdom
select (GNP/Population) as avg_income from country where name='united kingdom';
SELECT 
    name
FROM
    country
WHERE
    continent = 'europe'
        AND (GNP / Population) > (SELECT 
            (GNP / Population) AS avg_income
        FROM
            country
        WHERE
            name = 'united kingdom');
            
# list the name and continent of the country in the continent containing either Argentina or Australia
select continent from country where name in ('Argentina' ,'Australia');
select name, continent from country where continent in (select continent from country where name in ('Argentina' ,'Australia'));