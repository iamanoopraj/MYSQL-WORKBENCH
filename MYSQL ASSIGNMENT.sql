select * from project_details;
use ref_employees;
-- 1. Get the salary of all the managers

select
m.manager_id,
ei.firstname,
d.dept_name,
ed.salary
from managers m
join employees_info ei
     on m.manager_id = ei.emp_id
join departments d 
     on m.dept_id = d.dept_id
join employees_dept ed
     on ed.emp_id = m.manager_id;
     
-- 2. Get the department name of all employees whose  salary is above 40000

select * from departments;
select * from employees_dept;

select * from employees_dept
where salary>40000;

-- 3. Get the emp_id,email and department name of all employees

select ei.emp_id,email,d.dept_name
from 
    employees_info ei
    join
    employees_dept ed
    on ei.emp_id=ed.emp_id
	join departments d
    on ed.dept_id=d.dept_id;
    
    --  4. Get the name of all employees and if the employee is manager, get their email as well
     
select ei1.firstname,ei1.lastname,t.email
from employees_info ei1
left join
	 (select m.manager_id,ei.email
     from employees_info ei
     join managers m
     on ei.emp_id = m.manager_id) t
on ei1.emp_id = t.manager_id;


--  5. Get the name of all employees and if the employee is in dept 503, get their salary as
--     well

select avg(salary) from employees_dept
where dept_id=203;

-- 6. Get the name of all project leads

SELECT project_key
FROM project_details
WHERE commencement_month = 'November';





-- 7. Get the name of all projects whose status is Completed.

select project_key,project_status 
from project_details
where project_status = 'Completed';


-- 8. Get the count of all the project status.


select project_status, count(*) as status_count
from project_details
group by project_status;



use ref_employees;