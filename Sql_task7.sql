create database Task7
use Task7

create table Student_Details
(
	studentid int primary key identity (1,1),
	studentname varchar(25),
	department varchar(20),
	score int
)


insert into Student_Details(studentname,department,score) values  ('Arun','CS',80),
('Vicky','BCA',70),
('Jeeva','IT',83),
('Selva','BCA',62),
('Vikram','MBA',79),
('Karthick','BBA',74),
('Siva','Mcom',60),
('Srikanth','CT',88),
('Hemanth','MATHS',83),
('Harshanth','BBA CA',82),
('Yamini','CS',87),
('Ranitha','BCA',89),
('Harshmitha','MBA',65),
('Haritha','MCA',69),
('Priyadharshan','BCA',67),
('Amigo','CS',55),
('Arjun','BCA',58),
('Vasanth','Mcom',84),
('Divya','CT',80),
('Hari','IT',92),
('Raman','MATHS',95),
('Venkat','BCA',93),
('Raju','MCA',96),
('Kalpana','Mcom',99),
('Lakshmi','BBA CA',100)
insert into Student_Details values ('Lakshmi','BBA CA',100)

--1. Create a non-clustered index for department.

create index BCA_Index  ON Student_Details(department);

--2. Create a filtered index for department='BCA'
create index BCA_Index2 on Student_Details(department) where department='BCA'

--3. Create a view for students in BCA department.

create view BCA_Students
as
select * from Student_Details
where department='BCA'

select * from BCA_Students

--4) Apply Rank() for all the students based on score.
select  studentid, studentname, department ,rank() over (order by score desc) as Rank from Student_Details

--5 Apply Dense_Rank() for students in each department based on score
select  studentid, studentname, department ,dense_rank() over (partition by department order by score desc) as Rank from Student_Details

--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).
create table Manager
(
	id int primary key,
	name varchar(20),
)

create table Employee
(
	eid int primary key,
	ename varchar(25),
	mid int references Manager(id) default 6,
	department varchar(20),
)

drop table Employee
drop table Manager
insert into Manager values(1,'Jhon'),(2,'Peter'),(3,'Andrews'),(4,'Carl')
insert into Manager values(7,'Veer')

insert into Employee values(1,'Vic',2,'Design'),(2,'Julia',1,'Dev'),(3,'Hugo',3,'FrontEnd'),(4,'Rajendran',1,'Manager')
insert into Employee values(8,'Java',3,'UI'),(6,'Java',2,'Ux')

select * from Employee
select * from Manager
  
alter table Employee add constraint FK_Employee1 foreign key(mid) references Manager(id) on update set default on delete cascade

insert into Manager values (6,'Robin')
insert into Manager values (3,'Monica')

update Manager set id=11 where id=3
delete Manager where id=1

