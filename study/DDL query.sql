use MyDatabase;

-- Task- create a new table called persons with columns: id, person_name, birth_data, and phone
create table persons (
	id INT not null,
	person_name varchar(50),
	birt_date date,
	phone varchar(15) not null,
	constraint pk_persons primary key (id)
) 
select * from persons

-- Alter - add a new column called email to the persons table.
alter table persons add email varchar(50) not null
-- task- remove the column phone from the persons table
alter table persons drop column phone

-- Drop- delete the table persons from the database- it removes the schema def. of person table and the data as well
drop table persons