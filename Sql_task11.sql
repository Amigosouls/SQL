create database Sql_task11
use sql_task11

create table Students
(
	sid int primary key identity(1,1),
	sname varchar(25),
	department varchar(25),
	yearofcompletion int
)

insert into Students(sname,department,yearofcompletion) values ('Robin','IT','2024'),
('Gokul','CT','2025'),
('Derin','BCA','2022'),
('Kiran','CS','2023'),
('Bibin','IT','2022'),
('Mibil','CT','2025'),
('Anusree','CS','2024'),
('Sony','BCA','2023'),
('Neethu','IT','2025'),
('Sruthi','CT','2022'),
('Ashlin','BCA','2025'),
('Alento','IT','2024'),
('Vishnu','IT','2023'),
('Jagadiesh','IT','2022'),
('Stinu','BCA','2026'),
('Abinaya','CT','2025'),
('Aleesha','CS','2021'),
('Swetha','CT','2022'),
('Sandeep','IT','2023'),
('Ajith','BCA','2024'),
('Shajan','CS','2026'),
('Mridula','BCA','2022')


select department,[2021],[2022],[2023],[2024],[2025],[2026] from (select sid,department,yearofcompletion from students) as stu 
pivot(
count(sid) for yearofcompletion in ([2021],[2022],[2023],[2024],[2025],[2026])
)
as StudentPivot group by department

create database Library
use Library

create table Management
(
	rackno int primary key,
	section varchar(20) ,
	space_available int
)

create table Books
(
	bookno int primary key ,
	bookname varchar(30) not null,
	author varchar(30) not null,
	rackno int default 1 references Management(rackno) on update set default,
	
)


insert into Management values (1,'Thriller',10),
(2,'Thriller',9),
(3,'Novel',14),
(4,'Autobiography',3),
(5,'Fantasy Thriller',20),
(6,'Sci-Fic',7)


insert into books values(1,'White Out','Ken Follet',2),
(2,'Power Play','Joseph Finder',2),
(3,'The Day After Tomorrow','Allan Follsom',1),
(4,'In the Eye Of the needle','Ken Follet',5),
(5,'Marvel','Stan Lee',6)

select * from Books

update Management set rackno=7 where rackno=6;

select * from Books