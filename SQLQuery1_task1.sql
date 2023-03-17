create database Task1

use Task1

--creating table--
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY DECIMAL(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--adding records--
insert into Trainees values(100,'Arun','Joseph',20000,2022-03-23,'UI Designer')
insert into Trainees values(101,'Selva','Ganapathy',80000,'2022-02-21','Tester')
,(102,'Dhana','Prakash',65000,'2022-02-28','Developer'),
(103,'Arjun','VenkitRaman',40000,'2022-01-20','UX Designer'),
(104,'Vignesh','Shivan',47000,'2022-04-11','Trainer'),
(105,'Divya','Prakash',90000,'2022-01-18','Manager'),
(106,'Ranitha','Nagarajan',53000,'2021-02-26','Developer'),
(107,'Yamini','Priya',17000,'2021-08-21','Trainee'),
(108,'Harshmitha','G',30000,'2020-05-11','GM'),
(109,'Haritha','Nagarajan',22000,'2021-08-17','Tester'),
(110,'Srikanth','S',42000,'2023-01-06','Backend Developer'),
(111,'Priya','Dharshan',40000,'2022-02-21','Designer'),
(112,'Siva','Bharath',12000,'2009-02-21','Junior Developer'),
(113,'Karthick','R',10000,'2014-02-21','Backend'),
(114,'Hari','Karthick',90000,'2012-02-21','Tester'),
(115,'Vasanth','M',100000,'2021-02-21','Senior Developer'),
(116,'Vikram','K',35000,'2018-02-21','Team Lead'),
(117,'Hemanth','S',28000,'2022-02-21','Project Manager'),
(118,'Harshanth','G',19000,'2002-02-21','Trainee'),
(119,'Sharon','David',12000,'2013-02-21','CEO')


select * from Trainees

update Trainees set JOINING_DATE='2023-01-23' where Trainee_ID=100

--2) Salary Between 20000 and 50000

select * from Trainees where SALARY between 20000 and 50000

--3) All firstname ending with i

select * from Trainees where FIRST_NAME like '%i'

--4) All record whose department is Designer or Developer

select * from Trainees where DEPARTMENT='Designer' or DEPARTMENT='Developer'

--5) All record less than 5

select * from Trainees order by Trainee_ID offset 0 ROWS fetch next 5 rows only

--6)All records from 6 to 15

select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only


--7) first 5 records with ties

select top 5 with ties SALARY,FIRST_NAME from Trainees order by SALARY

--8) All records in descending order based on dept column

select * from Trainees order by DEPARTMENT desc

--9) All records with last_name include 3rd character a

select * from Trainees where LAST_NAME like '__a%'

--10) All records starting with [J-T] with differentiating upper and lower case
--lower

select * from Trainees where FIRST_NAME like 'se%' collate SQL_Latin1_General_CP1_CS_AS and FIRST_NAME between 'J' and 'T'

--lower and Uppercase

select * from Trainees where FIRST_NAME like 'Se%' collate SQL_Latin1_General_CP1_CS_AS and FIRST_NAME between 'J' and 'T'
