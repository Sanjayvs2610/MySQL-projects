
-- task 1
/*identify the top cities that has the maximum number of employees*/

use hr;
select city,count(employee_id) as total_no_of_employees from employees 
join departments using(department_id) 
join locations using (location_id)
group by city 
order by count(employee_id) desc limit 5;


-- task 2
/*identify the first name , last name , country , city and salary of the employees in the top 5 cities*/

select first_name,last_name,country_name,city,department_name from employees 
inner join departments using(department_id) 
inner join locations  on departments.location_id = locations.location_id
right join countries using(country_id)
where city in ('South San Francisco', 'Oxford', 'Seattle', 'Southlake', 'Toronto');


-- task 3
/*list the cities in which the no of employees is lees than 10*/

select city,count(employee_id)  from employees 
join departments using (department_id)
join locations using (location_id)
group by city having count(employee_id)<10
order by count(employee_id);


-- task 4
/*identify the average experience (in years) of the employee identified in task 3*/


select city,count(employee_id),avg(year(now())-year(start_date)) from job_history
join departments using (department_id)
join locations using (location_id)
group by city having count(employee_id)<10
order by avg(year(now())-year(start_date));


-- task 5
/*The company wants to communicate with work from home plicy for those employees who are from the cities identified in task 1 
and also completed ten years in the organisation.*/


select city,count(employee_id),first_name,last_name,email,phone_number,year(now())-year(start_date) as experience from job_history
join employees using(employee_id)
join departments on departments.department_id = employees.department_id
join locations using(location_id)
where year(now())-year(start_date)>10
group by first_name,last_name,email,phone_number,year(now())-year(start_date)
order by count(employee_id) desc ;


-- task 6
/*list the id's of the managers of the employees identified in task 5*/

create view manager as select city,count(employee_id),first_name,last_name,email,phone_number,year(now())-year(start_date) as experience from job_history
join employees using(employee_id)
join departments on departments.department_id = employees.department_id
join locations using(location_id)
where year(now())-year(start_date)>10
group by first_name,last_name,email,phone_number,year(now())-year(start_date)
order by count(employee_id) desc ;

select distinct manager_id from employees
join manager using(first_name)
group by manager_id;


