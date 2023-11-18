-- task 1
/*create database as stylexcarz_db and make it use */ 

create database stylexcarz_db;
use stylexcarz_db;


-- task 2
/*create tables as salespersons,customers and orders and set primary key for the certain columns*/

create table salesperson (salespersonid int primary key not null,salesperson_name varchar(50) not null,salesperson_city varchar(100)not null,commission_rate int not null); 
create table customers (customerid int primary key not null ,c_firstname varchar(50) not null,c_lastname varchar(100)not null,c_city varchar(100) not null,c_rating int not null); 
create table orders (orderid int not null primary key,amount int  not null,orderdate date not null,
salespersonid int  not null, 
foreign key (salespersonid) references salesperson(salespersonid),
customerid int not null,
foreign key (customerid)references customers (customerid));
desc salesperson;
desc customers;
desc orders;


-- task 3
/*insert the values from the excel sheet for the three tables salesperson,customers,orders*/

insert into salesperson (salespersonid,salesperson_name,salesperson_city,commission_rate) values
(1001,	'William',	'New York',	12),
(1002,	'Liam',	'New Jersey',	13),
(1003,	'Axelrod',	'San Jose',	10),
(1004,	'James',	'San Diego',11),
(1005,	'Fran',	'Austin',	26),
(1007,	'Oliver',	'New York',	15),
(1008	,'John'	, 'Atlanta',	2),
(1009,	'Charles',	'New Jersey',2);
select * from salesperson;

insert into customers(customerid,c_firstname,c_lastname,c_city,c_rating) values
(2001,	'Hoffman',	'Anny',	'New York',	1),
(2002,	'Giovanni',	'Jenny',	'New Jersey',	2),
(2003,	'Liu',	'Williams',	'San Jose',	3),
(2004,	'Grass',	'Harry',	'San Diego',	3),
(2005,	'Clemens',	'John',	'Austin',	4),
(2006,	'Cisneros',	'Fanny',	'New York',	4),
(2007,	'Pereira',	'Jonathan',	'Atlanta',	3);
select * from customers;

insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3001,23,'2020-02-01', 1009,2007);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3002,20,'2021-02-23', 1007,2007);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3003,89,'2021-03-06',1003,2002);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3004,67,'2021-04-02', 1004,2002);
insert into orders(orderid, amount, orderdate, salespersonid, customerid) values 
(3005, 30, '2021-07-30', 1001, 2007);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3006,35,'2021-09-18', 1001,2004);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3007, 1,'2021-10-02',1001,2001);
insert into orders(orderid,amount,orderdate,salespersonid,customerid) values 
(3008,21,'2021-10-09',1003,2003);
insert into orders(orderid, amount, orderdate, salespersonid, customerid) values 
(3009, 45, '2021-10-10',1009, 2005);
select * from orders;

-- task 4
/*increase the commision rate for those , whose commission rate are below 15%*/

update  salesperson set commission_rate=15
where salespersonid in (1001,1002,1003,1004,1008,1009);


-- task 5
/*create a backup database for the oerders table*/

create database backup_stylexcarz_db;
use backup_stylexcarz_db;
create table orders_bkp
select * from stylexcarz_db.orders;
select * from orders_bkp;

-- task 6
/*update costomers who have gone service for multiple times , rate the customers extra +3 in customer rating , so they can get discount*/
use stylexcarz_db;
update customers set c_rating=c_rating+3 
where customerid in(2007,2002);
select * from customers


