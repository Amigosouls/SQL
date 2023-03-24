create database Task8
use Task8

--creating Table
--(Create a table with studentid, studentname, semester, securedmarks, totalmarks)

create table Student
(
	studentid int primary key identity(1,1),
	studentname varchar(25),
	semester varchar(10),
	securedmarks int,
	totalmarks int 
)
--inserting records

insert into Student values('Joshua','Sem 1',420,500),('Mithali','Sem 1',420,500),
('Rahul','Sem 1',410,500),
('Benjamin','Sem 1',320,500),
('Vishwa','Sem 1',422,500),
('Kohli','Sem 1',480,500),
('Luka','Sem 1',411,500),
('Paaru','Sem 1',380,500)
insert into Student values('Paathu','Sem 3',380,500),
('Chaaru','Sem 3',320,500),
('Thilak','Sem 3',378,500),
('Ram','Sem 3',326,500),
('Moideen','Sem 3',500,500)

select * from Student
--1. Create User-define Scalar function to calculate percentage of all students after creating the following table

Alter function Stu_Percentage()
returns decimal
as begin
	declare @Tot decimal
	set @Tot = (select convert(decimal ,sum(securedmarks))/convert(decimal,sum(totalmarks))*100 from Student)
	return @Tot
end
-- calling percentage function
select dbo.Stu_Percentage() as Percentage


--2. Create user-defined function to generate a table that contains result of Sem 3 students
create function Sem_3Students(@sem varchar(10))
returns table
as
	return select * from Student where semester=@sem


select * from  dbo.Sem_3Students('Sem 3')


--3 Write SQL stored procedure to retrieve all students details. (No parameters)

Alter procedure Stu_Details
as
begin
Select * from Student
end

exec Stu_Details

--4 Write SQL store procedure to display Sem 1 students details. (One parameter)

create procedure Sem1_Students(@sem as varchar(10))
as 
begin
select * from Student where semester=@sem
end

exec Sem1_Students @SEM='Sem 1'


--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

create procedure Stu_Total(@total int output)
as
begin
select @total= count(studentname) from Student
end

declare @tot int
exec Stu_Total @tot output
print 'Number_of_Students is  '+ convert(varchar(10),@tot)

--6 Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--Note: Update few values in students details so that you can see the working of UPDATE

merge Sem_1Backup s1
using Student s 
on (s.studentid=s1.studentid and s1.semester='Sem 1')
when matched then update set
	s1.studentname=s.studentname,
	s1.semester=s.semester,
	s1.securedmarks=s.securedmarks,
	s1.totalmarks=s.totalmarks

when not matched by target and s.semester='Sem 1'
	then insert (studentid,studentname,semester,securedmarks,totalmarks)
	values(s.studentid,s.studentname,s.semester,s.securedmarks,s.totalmarks) 
when not matched by source then delete;

update Student set studentname='Mohan' where studentid=7
create table Sem_1Backup
(
	studentid int primary key ,
	studentname varchar(25),
	semester varchar(10),
	securedmarks int,
	totalmarks int 

)

select * from Sem_1Backup