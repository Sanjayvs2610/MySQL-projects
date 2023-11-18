-- task 1
/*display the employee_id,first_name,last_name and department_name of all employees using subqueries*/
use hr;
select employee_id,first_name,last_name,
(select department_name from departments 
where employees.department_id= departments.department_id) from employees ;


-- task 2
/*display the first_name,last_name and salaries of the employees.
whose salaries are greater than the average salary of all employees,grouped by the department_id*/

select first_name,last_name,salary,department_id from employees
where salary>(select avg(salary) from employees)
group by department_id;


-- task 3
/*Display the first_names , last_names of those employees of the sales department 
who salary is less than the average salary of all employee sof the sales department*/

select first_name,last_name from employees
where department_id in (select department_id from departments where department_name="sales")
and salary<(select avg(salary) from employees where department_id in (select department_id from departments where department_name ="sales"));


-- task 4
/*Display the first_name,last_name and salary of employees whose salaries are greater than the salary of all it programmers .
display the details of the employees in ascending order according to the salary ,using subqueries*/

select first_name,last_name,salary from employees
where salary>(select max(salary) from employees  where job_id ='IT_PROG')
order  by first_name,last_name,salary asc;

-- task 5
/*Display the records of the employees with the minimum salary in the employees table ,
grouped by job_id column and arrange in ascending order of salaries*/

select * from employees
where salary=(select min(salary) from employees)
group by job_id 
order by min(salary) asc; 

-- task 6 
/*                      Display the first_name ,last_name and department_id of the employees whose salary is greater than 60%
of sum of salaries of all the employees with thir respective department */

select first_name,last_name,department_id from employees
where salary>0.6*(select sum(salary) from employees)
group by department_id;

-- task 7
/*Display the first_name,last_name of all employees whose managers are based out of UK,using subquery*/

select first_name,last_name from employees 
where manager_id in (select manager_id from departments) and
location_id in(locations.location_id=departments.location_id)
group by manager_id
having country_id not in("UK");



