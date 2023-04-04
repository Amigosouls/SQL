--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.
use Task5
select * from Trainees

create trigger DMLRestriction
on Trainees
for insert,update,delete
as 
begin
	if DATEPART(DW,GETDATE())=7 and DATEPART(DW,GETDATE())=1
	print 'You cannot perform dml on saturday or sunday'
	rollback transaction
end

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.

create trigger DeleteRestriction
on Trainees
for delete
as 
begin
	if DATEPART(HH,GETDATE()) > 11 and DATEPART(HH,GETDATE())<15
	print 'You cannot perform dml on saturday or sunday'
	rollback transaction
end

delete Trainees where TRAINEE_ID=6

--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed
alter trigger DeleteRestriction
on database
for create_table,alter_table,drop_table,rename
as 
begin
	print 'You performerd a DDL on '+ cast(getdate() as varchar)
end
drop table car

create table Car
(
	chasi_num int primary key,
	name varchar(20),
	engine_number int unique,

)
