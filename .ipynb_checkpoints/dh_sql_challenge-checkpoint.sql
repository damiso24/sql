-- CREATE TABLES

--employees table
CREATE TABLE employees (
  emp_no SERIAL PRIMARY KEY,
  emp_title_id varchar not null,
  birth_date date NOT NULL,
  first_name VARCHAR not null,
  last_name varchar not null,
  sex varchar not null,
  hire_date date not null
);

---salaries table
create table salaries(
	emp_no int not null,
	salary money not null	
);

---titles table
create table titles(
	title_id varchar primary key,
	title varchar not null
);

---departments table
create table departments(
	dept_no varchar primary key,
	dept_name varchar
);

---dept_emp table
create table dept_emp(
	emp_no int not null,
	dept_no varchar not null
);

---dept_manager table
create table dept_manager(
	dept_no varchar not null,
	emp_no int not null
);



--1.  List the last name, first name, sex and salary of each employee

select 
employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no
order by emp_no


--2. List first name, last name, and hire date for employees who were hired in 1986.

select 
first_name, last_name, hire_date
from employees
WHERE extract(year from hire_date) = 1986


--3. List the manager of each department with the following information: 
-----department number, department name, the manager's employee number, last name, first name.

--(dept_manager, departments, employees)

select 
departments.dept_no, departments.dept_name, employees.last_name, employees.first_name, dept_manager.emp_no
from employees
inner join dept_manager on
dept_manager.emp_no = employees.emp_no
inner join departments on 
dept_manager.dept_no = departments.dept_no


---4. List the department of each employee with the following information: 
------employee number, last name, first name, and department name.

--(employees, dept_emp, departments)

select 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on 
dept_emp.dept_no = departments.dept_no
order by emp_no 


---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees
where first_name = 'Hercules' and
last_name like 'B%'


---6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select count(emp_no) from dept_emp
where dept_no = 'd007'
---52,245

select 
dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on 
dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
order by emp_no


---7. List all employees in the Sales and Development departments, including their 
------employee number, last name, first name, and department name.

select 
dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on 
dept_emp.dept_no = departments.dept_no
where dept_name in ('Sales', 'Development')
order by emp_no


---8. In descending order, list the frequency count of employee last names, 
------i.e., how many employees share each last name.
select count(first_name), last_name from employees
group by last_name
order by count


--------------------
select first_name, last_name from employees where emp_no = '499942'
