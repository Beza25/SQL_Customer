-- create database People;
-- use people;

create table person(
	id integer primary key,
    first_name varchar(50),
    last_name varchar(50),
    age integer
);
insert into person values (1,'Dave','wolf',99);
insert into person values (2, 'Bart', 'Simpson',10);
insert into person values (3, 'Crazy Cat Lady','', 99);

select * from person;

create table pet(
	id integer primary key,
    name varchar(50),
    breed varchar(50),
    age integer,
    dead integer
);
insert into pet values(10,'fifi','dog',4,1);
insert into pet values (11, 'toto', 'dog', 8, 1);
insert into pet values (12, 'cat1', 'cat', 5, 1);
insert into pet values (13, 'cat2', 'cat', 5, 1);
insert into pet values (14, 'cat3', 'cat', 6, 1);
insert into pet values (15, 'cat4', 'cat', 8, 1);
insert into pet values (16, 'cat5', 'cat', 3, 1);

select*from pet;

create table person_pet(
	person_id integer,
    pet_id integer
);
insert into person_pet values(1,10);
insert into person_pet values(2,11);
insert into person_pet values(2,10);
insert into person_pet values(3,12);
insert into person_pet values(3,13);
insert into person_pet values (3,14);
insert into person_pet values (3,15);
insert into person_pet values (3,16);
select*from person_pet;

update person_pet set person_id = 2 where pet_id =16;
select * from person inner join
person_pet on person.id = person_pet.person_id
inner join pet on person_pet.pet_id = pet.id;

select first_name, last_name, name as 'Pet Name', pet.age as 'Pet Age'
from person inner join 
person_pet on person.id = person_pet.person_id
inner join pet on person_pet.pet_id = pet.id;