use Task8

alter procedure Conditional_Search(@name varchar(20))
as
begin
	if @name like 'Paaru'
	select * from Student where studentname=@name 
	else
	select * from Student where studentname!=@name


end

select * from Student

exec Conditional_Search 'Paaru'

create procedure Remarks
as
begin
select studentname,studentid,semester, securedmarks,
	case securedmarks 
		when '450' then 'OutStanding'
		when '400' then 'Very Good'
		when '350' then 'Good'
		when '300' then 'Poor'
		else 'nan'
end as Remarks
from Student;
end;

exec Remarks



--temporary table variable
declare @Details table 
(
	id int,
	name varchar(20),
	age int
)
insert into @Details values('1','Abdul',23)
select * from @Details

--local table creation
create table #Fruits
(
	fruitcode int,
	fruitname varchar(20),
	origin varchar(20)
)

--global table creation
create table ##Sweets
(
	sweetcode int,
	sweetname varchar(20),
	origin varchar(20)
)

--Local procedures
create procedure #Hello_World
as
begin
	print 'Hello World'
end

--global procedures

create procedure ##global_hello
as
begin
	print 'Global hello World'

end