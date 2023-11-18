-- task 1
/*create a database and make it use*/
create database techmac_db;
use techmac_db;


-- task 2
/*create tables and add primary_key for the table*/

create table techhyve_employees(employee_id int,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
create table techcloud_employees(employee_id int,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
create table techsoft_employees(employee_id int ,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
desc techhyve_employees;
alter table techhyve_employees add primary key(employee_id);
alter table techcloud_employees add primary key(employee_id);
alter table techsoft_employees add primary key(employee_id);
alter table techhyve_employees add constraint  check(age between 21 and 55);
alter table techcloud_employees add constraint check(age between 21 and 55);
alter table techsoft_employees add constraint  check(age between 21 and 55);
alter table techhyve_employees modify employee_id varchar(20);
alter table techcloud_employees modify  employee_id varchar(20);
alter table techsoft_employees modify  employee_id varchar(20); 
desc techsoft_employees;
desc techcloud_employees;

-- task 3
/*add column communication_proficiency default and add raange between 1 to 5*/

alter table techhyve_employees add column communication_proficiency int default 1; 
alter table techcloud_employees add column communication_proficiency int default 1; 
alter table techsoft_employees add column communication_proficiency int default 1; 
alter table techhyve_employees add check (communication_proficiency between 1 and 5);
alter table techcloud_employees add check (communication_proficiency between 1 and 5);
alter table techsoft_employees add check (communication_proficiency between 1 and 5);
desc techhyve_employees;

-- task 4
/* insert values from the excel sheet*/

insert into techhyve_employees values('TH0001','Eli','Evans','Male',26,1);
insert into techhyve_employees values('TH0002','Carlos','Simmons','Male',32,2);
insert into techhyve_employees values('TH0003','Kathie','Bryant','Female',25,1);
insert into techhyve_employees values('TH0004','Joey','Hughes','Male','41',4);
insert into techhyve_employees values('TH0005','Alice','Matthews','Female',52,4);
select*from  techhyve_employees;

select*from techcloud_employees;
insert into techcloud_employees(employee_id,first_name,last_name,gender,age,communication_proficiency) values
('TC0001','Teresa','Bryant','Female',39,2),
('TC0002','Alexis','Patterson','Male',48,5),
('TC0003','Rose','Bell','Female',42,3),
('TC0004','Gemma','Watkins','Female',44,3),
('TC0005','Kingston','Martinez','Male',29,2);

select*from techsoft_employees;
insert into techsoft_employees(employee_id,first_name,last_name,gender,age,communication_proficiency) values
('TS0001','Peter','Burtler','Male',	44,	4),
('TS0002','Harold','Simmons','Male',54,	4),
('TS0003','Juliana','Sanders','Female',36,2),
('TS0004','Paul','Ward','Male',29,2),
('TS0005','Nicole','Bryant','Female',30,2);


-- task 5
/*insert backup database and backup the three tables*/

create database backup_techmac_dp;
use backup_techmac_dp;

create table tachhyve_employees_bkp
select * from techmac_db.techhyve_employees;
select*from tachhyve_employees_bkp;

create table techcloud_employees_bkp select *from techmac_db.techcloud_employees;
select*from  techcloud_employees_bkp ;

create table techsoft_employees_bkp select*from techmac_db.techsoft_employees;
select*from techsoft_employees_bkp;

-- task 6
/*delete these employees details and make backup in the backup database*/

use techmac_db;
DELETE FROM techhyve_employees WHERE employee_id in ('TH0003','TH0005');
select*from techhyve_employees; 

delete from techmac_db.techcloud_employees where employee_id in ('TC0001','TC0004');
select * from  techcloud_employees;

-- task 7 
/*merge two tables and name as techhyvecloud_employees*/

create table techhyvecloud_employees (select * from techhyve_employees) union (select * from techcloud_employees);
select * from techmac_db.techhyvecloud_employees;
