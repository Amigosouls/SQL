CREATE DATABASE ORG;
USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'Raja', 'Bhai', 65000, '2000-06-22', 'Accounts'),
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin');

CREATE TABLE Bonus (

WORKER_REF_ID INT, BONUS_AMOUNT INT, BONUS_DATE DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)

ON DELETE CASCADE);

INSERT INTO Bonus

(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES

(001,	5000,	'2016-02-02'),
(002,	3000,	'2016-06-01'),
(003,	4000,	'2016-02-02'),
(001,	4500,	'2016-02-02'),
(002,	3500,	'2016-06-01');

CREATE TABLE Title (

WORKER_REF_ID INT, WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title

(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

--1) First_name from worker using alias <Worker_NAME>

select FIRST_NAME as WORKER_NAME from Worker 

--2)Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case
select UPPER(FIRST_NAME) from Worker

--3) Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(DEPARTMENT) from Worker

--4) Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
select SUBSTRING(FIRST_NAME,1,3) from Worker

--5)Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select  distinct DEPARTMENT,len(DEPARTMENT) as LEN_FIRST_NAME from Worker 

--6)Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select FIRST_NAME+space(1)+LAST_NAME AS COMPLETE_NAME from Worker 

--7)Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table
select * from Worker where FIRST_NAME like 'Vipul' or FIRST_NAME like 'Satish'

--8)Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select  * from Worker where DEPARTMENT='Admin'

--9) Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker where FIRST_NAME like '%a'

--10)Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where FIRST_NAME like '%a%'