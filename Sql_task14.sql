create database Task14
use Task14

--a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
--1. insert records into the table using a stored procedure.
--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.
--3. Store the error details in an errorbackup table.

create table Hobbies
(
	HobbyId int primary key,
	HobbyName varchar(25) unique
)

CREATE TABLE Hobby_errors
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)


create procedure Insert_Proc (@id int, @hobby varchar(25))
as
begin try
	insert into dbo.Hobbies values(@id,@hobby)
	end try
	begin catch
	insert into dbo.Hobby_errors values
	(SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
   end catch
go

exec Insert_Proc 5,'Reading'

select * from Hobby_errors

--b. Create a procedure to accept 2 numbers, if the numbers are equal then 
--calculate the product else use RAISERROR to show the working of exception handling.

create procedure Product (@num1 int,@num2 int)
as 
begin try
	if @num1 = @num2
	RAISERROR('Numbers Cannot be the same, try different number',16,1) with log
	print 'The product is :'+ convert(varchar,@num1*@num2)
	end try
	begin catch
	PRINT ERROR_NUMBER()
    PRINT ERROR_MESSAGE()
    PRINT ERROR_SEVERITY()
    PRINT ERROR_STATE()
	end catch
go

exec Product 2,2

--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
 --   Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.

create table Friends
(
	Id int identity (1,1),
	Name varchar(25) unique
)

alter procedure Insert_Friends (@name varchar(25))
as
begin try
	if SUBSTRING(@name,1,1) not in ('A','D','H','K','P','R','S','T','V','Y')
	raiserror('Name should begin with only A,D,H,K,P,R,S,T,V,Y',16,1)
	insert into dbo.Friends values(@name)
	end try
	begin catch
	PRINT ERROR_NUMBER()
    PRINT ERROR_MESSAGE()
    PRINT ERROR_SEVERITY()
    PRINT ERROR_STATE()
   end catch
go

exec Insert_Friends 'Bala'
