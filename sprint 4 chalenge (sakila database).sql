-- Movie streaming via ott
-- task 1
/*identify and display the film/movie id and existing no of copies for the following movies
brotherhood blanket
soup wisdom*/

use sakila;
select film_id,title, (select count(*) from inventory
where film.film_id=inventory.film_id) as no_of_copies from film
where title in ('Brotherhood Blanket','Soup Wisdom')
group by title;

-- task 2
/*calculate and display each no of movies from each genre*/

select name as genre,count(title) as no_of_movies from film
join film_category using(film_id)
join category using(category_id)
group by genre
order by genre;

-- task 3
/*display the first_name and last_name of the top 3 actors whose movies have the highest replacement_cost*/

select distinct first_name,last_name,replacement_cost from actor
join film_actor using (actor_id)
join film using(film_id)
where replacement_cost in (select replacement_cost from film)
order by replacement_cost desc limit 3;


-- task 4
/*movie can be based on actual incidents,political issues,mystery,fiction etc.
calculate and display the total sale amount for each type of movie  */

select category.name,sum(payment.amount) from film
join film_category using (film_id)
join category using (category_id)
join inventory on film.film_id=inventory.film_id
join rental using (inventory_id)
join payment using (rental_id) 
group by category.name;