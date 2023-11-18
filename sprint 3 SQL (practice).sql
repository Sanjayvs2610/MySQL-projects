-- TASK 1
/*List the id,first_name, last_name of the employees working in the IT department*/

use hr;

select employee_id,first_name, last_name from employees 
join departments using (department_id)
where department_name='IT';

-- task 2
/*Extract the minimum and maximum salaries of employees from each department*/

select department_name,max(salary),min(salary) from employees 
join departments using(department_id)
group by  department_name ;

-- task 3
/*identify the top 10 cities that have highest number of employees*/

select city,count(*) from employees 
inner join departments using(department_id)
inner join locations using (location_id)
group by city
order by count(*) desc limit 10; 


-- task 4
/*list the employees id,first_name,last_names for all those employees whose last working day in the organisation was 1999-12-31 */

select employee_id,first_name,last_name from employees 
inner join job_history using (employee_id)
where end_date='1999-12-31';


-- task 5
/*empoyee_id,first_name,department_name and total experience for all those employees who have the experience of atleast 25 years of experience*/

select employee_id,first_name,department_name, year(now())-year(start_date) as total_experience from employees
inner join departments using(department_id)
join job_history using(employee_id)
where year(now())-year(start_date)>=25
order by employees.employee_id;