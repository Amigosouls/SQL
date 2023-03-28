create database Task10

use Task10

create table Employees
(
	EMPLOYEE_ID int primary key identity(1,1),
	FIRST_NAME varchar(20),
	LAST_NAME varchar(20),
	EMAIL varchar(50),
	PHONE_NUMBER decimal(11),
	HIRE_DATE date,
	JOB_ID int ,
	SALARY decimal(5)
)

insert into Employees(FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY) values
('Selva','Ganapathy','selva@gmail.com',1276318828,'2023-01-23',100,3600.23)
insert into Employees(FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY) values
('Dhana','Prakash','dhana@gmail.com',1276318828,'2023-01-26',101,4800.78),
('Arun','Joseph','arun@gmail.com',1278318828,'2023-01-24',102,3700.23),
('Arjun','Venkit','arjun@gmail.com',8276318828,'2023-01-22',103,6600.23),
('Vignesh','Vicky','svignesh@gmail.com',1267818828,'2023-01-21',104,1000.23),
('Divya','Prakash','divya@gmail.com',1273688828,'2
023-01-29',105,1500.23),
('Ranitha','R','ranitha@gmail.com',1272348678,'2023-01-25',106,2200.23),
('Yamini','M','yamini@gmail.com',9094678828,'2023-01-29',107,2700.23),
('Harshmitha','G','harshmitha@gmail.com',1166318828,'2023-01-23',108,5600.23),
('Haritha','H','haritha@gmail.com',1274679828,'2023-01-24',109,4200.23),
('Sri','Kanth','sri@gmail.com',1276276828,'2023-01-27',110,3300.23),
('Priya','Dharshan','priya@gmail.com',1274818828,'2023-01-28',111,2789.23),
('Karthikeyan','M','karthick@gmail.com',1245988828,'2023-01-23',112,2179.23),
('Hari','Karthick','hari@gmail.com',1276318806,'2023-01-23',113,3788.23),
('Vikram','K','vikram@gmail.com',1286318828,'2023-01-22',114,9734.23),
('Vasanth','M','vasanth@gmail.com',1276380828,'2023-01-20',115,7368.23),
('Siva','Bharath','siva@gmail.com',1227548828,'2023-01-26',116,2885.23),
('Harshanth','H','harshanth@gmail.com',1276318886,'2023-01-25',117,7542.23),
('Hemanth','M','hemanth@gmail.com',1276335628,'2023-01-28',118,4728.23),
('Sharon','David','sharon@gmail.com',1276323428,'2023-01-22',119,3818.23)
select * from Employees
update Employees set HIRE_DATE='2023-01-27' from Employees where EMPLOYEE_ID=7 

--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

select * from Employees where salary> (select salary from Employees where EMPLOYEE_ID=16)

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.

select FIRST_NAME,LAST_NAME,JOB_ID from Employees where HIRE_DATE=(select HIRE_DATE from Employees where EMPLOYEE_ID=11);

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME from Employees where salary>(select avg(SALARY) from Employees);

--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.

create table Manager
(
	managerid int,
	fname varchar(20),
	lname varchar(20),

)

insert into Manager values('101','Yamini','Priya');
insert into Manager values('102','Ranitha','R');
insert into Manager values('103','Haritha','R');
insert into Manager values('104','Harshmitha','R');

alter table Employees add managerid int

update Employees set managerid=101 where EMPLOYEE_ID between 1 and 5
update Employees set managerid=102 where EMPLOYEE_ID between 6 and 10
update Employees set managerid=103 where EMPLOYEE_ID between 11 and 15
update Employees set managerid=104 where EMPLOYEE_ID between 16 and 20

select * from Employees

select FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY,manrid=
(select managerid from Manager m  where m.managerid=e.managerid) from Employees as e where e.managerid in
(select managerid from Manager where managerid in (select managerid from Manager where fname='Yamini'))


--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.
select * from Employees where salary in(select salary from Employees group by salary having  salary between min(salary) and 2500) \


