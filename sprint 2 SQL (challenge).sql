-- task 1
/*count of all employees in the organisation*/
use hr;
select count(employee_id) as Employee_count from employees;


-- task 2
/*department_id wise employees count*/

select department_id,count(department_id) from employees group by department_id;


-- task 3
/*find the first_name, last_name and salary of those employees whose salary is greater than $6000*/

select first_name,last_name,salary from employees where salary>6000;



-- task 4
/*The count of employees who are earning a salary greater than $20,000*/

select salary, count(*) from employees where salary>20000;


-- task 5
/*the details of employees, who get commission to decide the percentage of bonus they receive*/

select * from employees where commission_pct>0;



-- task 6
/*the HR departments want to semd an invite to all employees who get commision, the invite will address the employee with their full name*/
select commission_pct,concat (first_name,' ',last_name)as full_names from employees
where commission_pct>0;

-- task 7
/*details of employees who get commission*/

select employee_id as Employee_ID,concat (first_name,' ',last_name)as Employee_Full_Name,email as Email_ID,phone_number as Phone_Number 
from employees 
where commission_pct>0; 

-- task 8
/*top three departments_id that have the highest total salary of employees*/

select department_id,sum(salary) as total_salary from employees
group by department_id 
order by sum(salary) desc
limit 3;


-- task 9
/*details of employees from IT department*/

select * from employees where department_id=60;

-- task 10
/*find the count of employees from IT department and their average salary*/

select count(employee_id)as IT_department_employees,avg(salary) from employees
where department_id=60;


-- task 11
/*the department_id and the number of employees for the department in which the salary range from $7000 to $10000*/
select department_id as Department_id,count(employee_id) as Number_of_Employees
from employees 
where salary between 7000 and 10000
group by department_id;