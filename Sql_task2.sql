
--creating database
create database ABCCompany

use ABCCompany

--creating a Schema
create schema Employee
--1)Creating Table 
create table Employee.EmployeeDetails
(
	empid int primary key,
	emp_name varchar(20) unique not null,
	gender varchar(7) check(gender='male' or gender='female'),
	emp_desig varchar(10) default 'Trainee'
)

--2) Renaming Table databse and schema

--renaming Table
exec sp_rename 'Employee.EmployeeDetails','EmpDetails'

--renaming Schema
create schema Emp;
alter schema Emp transfer Employee.EmpDetails;
drop schema Employee

--renaming a database
alter database ABCCompany modify name=Task2
use Task2
--3) create table fields and perform following
--a) id as identity column name,salary,increement , computed column as revised salary(sal+inc)

--creating table
create table Emp.EmpRecord
(
	id int identity(0,2),
	name varchar(20),
	salary decimal,
	increement decimal,
)
--adding record 
insert into Emp.EmpRecord(name,salary,increement) values ('Jhon',15020,1000),
('Donald',22000,3000),
('Victor',32010,1200);
--viewing table Emp.Record
select * from Emp.EmpRecord
--adding computed column
alter table Emp.EmpRecord add Revised_Salary as salary + increement 
select * from Emp.EmpRecord
--b) retrive records from above table where salary>20000 and move to new table.

select * into Emp.EmpRecord2 from Emp.EmpRecord where salary>20000;
select * from Emp.EmpRecord2