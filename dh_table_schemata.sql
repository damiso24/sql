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


