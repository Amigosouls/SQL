
--Creation of Database--
create database Game

--using the Databse--

use Game

--Creating Table--

create Table Game_Characters
( characterName varchar(20),
characterRole varchar(20),
age int,
noOfMissions int
)

--inserting values into table..

insert into Game_Characters values('Claude','Protagonist',28,72),('Carl Jhonson','Protagonist',30,113),('Sonny','Villain',28,20);

--printing--

select * from Game_Characters