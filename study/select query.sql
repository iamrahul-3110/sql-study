use MyDatabase

-- select & from
select *
from customers

select * 
from orders

-- select few colums
select 
customer_id, 
order_date 
from 
orders

-- where clause : filter data as per condition
select first_name, country from customers where score>500 and country='UK'

-- Order by : sort the data ( ASC, DESC)
select id, first_name, score, country from customers order by country asc, score desc

-- Nested Order By- priority basis first sort sales then order_date 
select order_id, order_date, sales from orders order by sales asc, order_date desc

-- Group By- 1. combines rows with the same value, 2. Aggregates a column by another column. 
select country, sum(score) from customers group by country
-- alias(as) shorthand name - giving a new name to our column
select country, sum(score) as total_score from customers group by country
-- Rule- all columns in the select must be either aggregated or included in the group by otherwise it gives error.
select country,first_name, sum(score) as total_score from customers group by country, first_name
-- task- find the total score and total number of customers for each country.
select sum(score) as total_score, count(id) as total_customers from customers group by country

-- having clause- filter data after the aggregation, I can only used with group by
select country, sum(score) as total_score from customers group by country having sum(score)>750
-- having vs where- where filters the data before aggregation while having after the aggregation.
select country, sum(score) as total_score from customers where score>400 group by country having sum(score)>800
-- task- find the average score for each country considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430
select country, avg(score) as avg_score from customers where score != 0 group by country having avg(score)>430

-- Distinct - Remove all duplicates/repeated values from table each value appears only once. 
-- don't use it if not necessary as it can slow down my query.
select distinct country from customers

-- TOP - restrict the number of rows returned
select top 3 * from customers order by score desc
select top 2 * from customers order by score asc
select top 3 * from orders order by order_date desc


-- execution order of queries- ( completely different from coding order
-- from -> where -> group by -> having -> select -> distinct -> order by -> top