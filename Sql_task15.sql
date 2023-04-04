--1. Auto-commit and Auto-rollback transactions.

use Sql_task11
select * from student_11


insert into student_11 values (13,'Marcelieno','bba',2022);
--The above statement is an auto commit , where it performs the transactions and saves the table

update student_11 set s_id='7' where sname='diego';
--The above statement is an auto roll back statement, as when the error(violation of primary key) occurs, it terminates the
--statement and rollback the table to previous state

select * from student_11

--2. Implicit transactions
-- setting implicit transactions on
set implicit_transactions on

--performing an dml statement
update student_11 set sname='sana' where s_id=4;
update student_11 set sname='sana' where s_id=4;
insert into student_11 values (21,'marco rues','btech',2027);

--checking the state of transactions
select iif(@@OPTIONS & 2=2,'Impli Trans mode ON','Impli Trans mode OFF') as 'Tmode';
--checking transactions count
select @@TRANCOUNT as TransCount
-- commit statement ends the transaction and sets transaction to 0,
commit tran
select @@TRANCOUNT as TransCount

set implicit_transactions off



--3. Explicit transactions
--    a. Only Commit - insert statement
--    b. Only Rollback - update statement
--    c. Savepoint - commit update and insert statements, rollback delete statement
--a
begin tran
insert into student_11 values (24,'Hugo','ct',2022)
select @@TRANCOUNT as TransCount
commit
select @@TRANCOUNT as TransCount

--b
begin tran
update student_11 set sname='vic' where s_id=10;
select @@TRANCOUNT as TransCount
commit
select @@TRANCOUNT as TransCount

--c
begin tran
update student_11 set sname='vugo' where s_id=11;
insert into student_11 values (28,'Casa','ct',2022)
commit
save transaction Update_delete_save
delete student_11 where s_id=28;
rollback Update_delete_save
commit

select * from student_11