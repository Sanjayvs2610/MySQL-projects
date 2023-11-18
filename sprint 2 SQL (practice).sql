-- task 1

use sakila;
select * from customer;
select * from customer where active=0;


-- task 2
/* identify the customers detail first_name,last_name,email of the customers who are inactive*/
select first_name,last_name,email from customer where active=0; 


-- task 3
/*identify the store id which have the highest number of inactive customers*/

select * from customer;
select store_id,count(store_id) from customer where active=0 group by store_id; 


-- task 4
/*names of movies that are rated as PG-13*/

select * from film;
select title from film where rating='PG-13';


-- task 5
/*identify the top three(3)movies in PG-13 rating that has longest running time*/
select* from film; 
select title,length  from film where rating='PG-13' order by length desc limit 3;


-- task 6

select title, rental_duration from film
where rating = 'PG-13'
order by rental_duration desc;




-- task 7
/*average rental cost of movies*/

select avg(rental_rate) from film ;


-- task 8
/*Total replcaement cost of all movies*/

select sum(replacement_cost)from film;



-- task 9
select category_id,name from category where name in('Animation' , 'Children');
select count(category_id),category_id from film_category where category_id in (2,3) group by category_id;

