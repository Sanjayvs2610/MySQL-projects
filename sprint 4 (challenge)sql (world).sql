-- task 1
/*display all rows from the country table and calculate the number of rows in the table.disaplay the countries names and the population of the code(USA,GBR,ARE)*/

select * from country;
select name,population from country 
where code in('USA','GBR','ARE');

/* interpretation
there are totally 239 rows present in the country table
*/


-- task 2
/*dispaly the continents names and sum of population of all contries in continents in descending order*/

select continent,sum(population) as total_population from country 
group by Continent 
order by total_population desc;


-- task 3
/*display the names of those countries of  the European continent where language spoken is french*/

select name from country
where continent = 'European'
and code in (select countrycode from countrylanguage 
where language = 'French');



-- task 4
/*display the name of the country with the highest population from each cont9inent in the database */

select continent,name as country_name,population
from country
where (continent,Population) in (select continent, max(population)  from country
group by continent);

