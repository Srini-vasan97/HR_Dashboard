Create database HR_Project;
use hr_project;

select * from hr;

Alter table hr 
change column ï»¿id emp_id varchar(20)null;

describe hr;
select birthdate from hr;
set sql_safe_updates = 0;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;
alter table hr
modify column birthdate date;

select hire_date from hr;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;
alter table hr
modify column hire_date date;
    
select termdate from hr;

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%m:%s UTC'))
where termdate is not null and termdate != ' ';

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN Age int;

update hr
set age = timestampdiff(year,birthdate,curdate());

select * from hr;




