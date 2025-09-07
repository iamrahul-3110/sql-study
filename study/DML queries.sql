use MyDatabase

select * from customers
select * from persons
-- Insert can add new rows in table
-- if no column are specified sql expects value for all columns.
-- rule- match the number of columns and values.
-- rule- column and values must be in same order.
-- rule- Matching data types, column count & constraints
-- you can skip to mention column name if you are putting values in each column
-- Note- columns not included in insert become null(unless a default or constraint exists)
insert into customers values(9, 'Andres', 'Germany', Null)
-- Insert using select: copy the data from 'customers' table to 'persons' table- 
create table persons (
	id int,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null,
	constraint pk_id primary key (id)
	);

insert into persons
select id, first_name, null, 'unknown'
from customers

-- Update- to change in existing rows
-- always use where to update all rows unintentionally.
-- task- change the score of customer with id 7 to 0
select * from customers
update customers set score=0 where id=7
-- change the score of customers with id 10 to 0 and update the country to uk
update customers set score=0, country='UK' where id=9
-- task- update all customers with a null score by setting their score to 0
update customers set score=0 where score is null

-- Delete- to delete existing rows inside a table
-- always use where to avoid deleting all rows unintentionally
-- delete from table_name where <condition>
-- task- delete all customers with id>5
delete from customers where id > 5
delete from persons -- to delete all from person

-- truncate is much faster than the delete for larger tables/data but table exists
truncate table persons
-- Truncate - clears the whole table at once without checking or logging