--task3

--creating database 

create database Task3
use Task3
--child table
create table Department
(
	DEPTID int primary key not null,
	DEPTNAME varchar(20) not null
)

insert into Department values(100,'Developer'),(101,'UI/UX')
--child table
create table ADDRESS
(
	ADDRESS_ID int primary key,
	CITY varchar(20) not null,
	STATE varchar(20) not null,
	PINCODE int
)
insert into ADDRESS values(1,'Manford','Oklahama(OK)',74044),(2,'Sydney','Ohio(OH)',45365)

--creating table(parent) Employee
create table Employee
(
	ID int primary key,
	NAME varchar(20) not null,
	DESIGNATION varchar(15) not null,
	DEPTID int not null references Department(DEPTID),
	MOBILE1 decimal,
	MOBILE2 decimal default null,
	STREET_ADDRESS varchar(30),
	ADDRESS_ID int not null references ADDRESS(ADDRESS_ID)
)
alter table Employee alter column ADDRESS_ID int

insert into Employee values(1,'JHON','DEVELOPER','100',98665741236,6325478962,'234 Hinton Rd',1)
insert into Employee values(2,'JAMES','DESIGNER','101',98665741236,6325478962,'234 Hinton Rd',2)

alter table Employee drop constraint DF__Employee__MOBILE__440B1D61
alter table Employee add constraint Fkey  foreign key(DEPTID) references Department(DEPTID) on update cascade

update Department set DEPTID=104 where DEPTNAME='DEVELOPER'
select * from Department;
select * from Employee;

alter table Employee drop constraint FK__Employee__ADDRES__44FF419A
alter table Employee add constraint Fkey_Address  foreign key(ADDRESS_ID) references ADDRESS(ADDRESS_ID) on delete set null 

delete from ADDRESS where ADDRESS_ID=2


select * from Employee;
select * from Department;
select * from ADDRESS;