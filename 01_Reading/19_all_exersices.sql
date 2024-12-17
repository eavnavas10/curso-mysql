-- Select all
select * from users;

-- Select
select * from users where user_id between 1 and 7;

-- Distinct
select distinct email from users;

-- Where
select * from users where user_id = 2;

-- Order by
select * from users order by user_id desc;

-- Like
select * from users where email like '%@gmail.com';

-- and, or, not
select * from users where age is not null and user_id between 1 and 9; 

-- Limit
select * from users limit 5;

-- null
select * from users where init_date is null;

-- min, max
select min(age) from users;
select max(age) from users;

-- count
select count(user_id) from users;

-- sum
select sum(age) from users;

-- avg
select avg(age) from users;

-- in
select * from users where surname in('Villatoro','Navas');

-- between
select * from users where age between 1 and 22;

-- alias
select user_id, concat(name,' ',surname) as 'half name', age, init_date as 'init date', email from users;

-- group by
select age from users where age is not null group by age order by age asc;

-- having
select age from users group by age having age > 19;

-- case
select user_id, name, surname, age, init_date,
	case
		when email is null then 'EMAIL IS EMPTY'
		else email
	end as 'Email'
from users;