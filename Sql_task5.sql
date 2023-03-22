create database Task5
use Task5

--creating tables

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--inserting records
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--1)Write an SQL query to get the count of employees in each department.
select distinct count(DEPARTMENT)as 'Department_Count',DEPARTMENT from Trainees  group by DEPARTMENT

--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select  DATEADD(day,5,'2023-03-20') as 'induction_day',JOINING_DATE from Trainees

--3)Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
select DATENAME(month,JOINING_DATE) as 'Joining_Month',JOINING_DATE from Trainees

--4)Write an SQL query to perform the total and subtotal of salary in each department.

select coalesce (DEPARTMENT, 'All Departments') AS Department,
  sum(salary) as 'Salary' from Trainees group by cube (DEPARTMENT)

--5. Write an SQL query to retrieve first 3 records randomly.

--select cast(rand()*(8-0+1)+0 as int)
select top 3 *  from Trainees order by NEWID()

--6)Show the working of composite key with any example.

create table Orders
(	cust_id int,
	order_id int,
	prod_code varchar(5),
	prod_name varchar(7) 
	primary key(cust_id,prod_code)--composite key
)

insert into Orders values(001,121,'p12','p'),(003,123,'p10','Q'),(005,125,'p3','R');
insert into Orders values(007,126,'p3','S')

select * from Orders

--the reason we used both cust_id and prod_name as primary key is that
--1) prod_code cannot identify the cust_id and order_id of customers uniquely;
--example if we want to know order_id,cust_id of a customer by just using the prod_code, it is not possible

select * from Orders where prod_code='p3';
--executing above query results showing two records.
--5	125	p3	R
--7	126	p3	S

--hence we have to provide both cust_id and order_id
select * from Orders where prod_code='p3' and cust_id=5;
--cust_id	order_id	prod_code	prod_name
--	5		125				p3			R

--7. Show the working of IIF and CASE for the above table.

select TRAINEE_ID,FIRST_NAME, iif(SALARY>300000,'Yes','No')as 'Salary >300000' from Trainees 

--8) Show the working of Sequence.
--creating sequence
create sequence order_rate
as decimal start with 1 increment by 1

--creating table
create table Orders2
(	cust_id int,
	order_id int,
	prod_code varchar(5),
	prod_name varchar(7) 
	primary key(cust_id,prod_code)--composite key
)

--inserting column value using sequence object 
insert into Orders2 values(next value for dbo.order_rate,121,'p12','p'),
(next value for dbo.order_rate,123,'p10','Q'),
(next value for dbo.order_rate,125,'p3','R');

--9. Show the working of creation of Synonym for a table in DB1 from DB2.

--we have a table called Employee in database Task3. we are gonna create Synonym for that table from this database

create synonym Emp_table for Task3.dbo.Employee

select * from Emp_table

--10. Show the working of IDENTITY_INSERT.

create table Orders3
(	cust_id int identity(1,1),
	order_id int,
	prod_code varchar(5),
	prod_name varchar(7) 
	primary key(cust_id,prod_code)--composite key
)

insert into Orders3(order_id,prod_code,prod_name) values(121,'p12','p'),
(123,'p10','Q'),
(125,'p3','R');
--turning identity insert off
set identity_insert Orders3 on
insert into Orders3(cust_id,order_id,prod_code,prod_name) values(5,121,'p12','p')
--turning identity insert off
set identity_insert Orders3 off
insert into Orders3(order_id,prod_code,prod_name) values(121,'p17','p')