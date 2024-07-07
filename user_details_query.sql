CREATE TABLE user_details (
   user_id serial primary key,
   username varchar(255)not null,
   first_name varchar(50)not null,
   last_name varchar(50)not null,
   gender varchar(10)not null,
   password varchar(50)not null,
   status int
  ) 
select * from user_details
	-- 5 rows copy
copy  user_details from 'E:/DA8/practice/Sql_Practice/Task_data/user_details-1000_rows.csv' DELIMITER ',' CSV header
-- 995 rows copy
copy user_details from 'E:/DA8/practice/Sql_Practice/Task_data/user_details-1000_rows.csv' DELIMITER ',' CSV header

-- 2 table 
CREATE TABLE customers (
   "Index" serial primary key,
   "Customer id" varchar(500)not null,
   "First Name" varchar(50)not null,
   "Last Name" varchar(50)not null,
   Company varchar(155)not null,
   City varchar(50)not null,
   Country varchar (150)not null,
   "Phone 1" bigint,
	"Phone 2" bigint,
	Email varchar (150),
	"Subscription Date" date,
	Website varchar (250)
	)
	select *  from customers
	alter table customers alter column "Phone 1" type varchar (250)
	alter table customers alter column "Phone 2" type varchar (250)


-- copy data

copy customers from 'E:DA8/practice/Sql_Practice/Task_data/customers-1000.csv' DELIMITER ',' CSV header
select *  from customers

	-- 3 table
	create table organization (
   "Index" serial primary key,
   "Organization Id" varchar(500)not null,
   "Name" varchar(50)not null,
   "Website" varchar(500)not null,
   Country varchar(155)not null,
   Description varchar(500)not null,
   Founded int,
   Industry varchar (500),
   "Number of employees" int
	)
	select * from organization
	
	-- copy data
	
copy organization from 'E:/DA8/practice/Sql_Practice/Task_data/organizations-1000.csv' DELIMITER ',' CSV header
-- using joins
-- joins (contains functions like where,group by,having,limit and order by)
select * from customers
select * from user_details
select * from organization

-- inner join
select c.country,c.email,
o.country,o.description from customers as c
inner join organization as o
on c.country = o.country

-- left join
select c.country,c.email,
o.country,o.description from customers as c
left join organization as o
on c.country = o.country
	
-- using where
select count("Number of employees") from organization where founded between '1970' and '2005'

-- using group by and like
select count ("Customer id"),(company),(country) from customers group by ("Customer id"),(company),(country),(city)
having city like 'Leeborough'

-- using order by and limit

select username,gender from user_details order by user_details desc  limit 100

	


   