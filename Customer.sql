-- drop database Customers; -- only run this if you're starting over
-- Create the Customer Databas and import it 
create database Customers;

use Customers;
-- ------------------Nutralizing---------------------
-- see the table ordered by company
SELECT * FROM customers.customer order by company;
-- the count of the Customer table
select 
	count(*) as 'Customer Count' 
from 
	Customer;
-- select only the company column
select count(distinct company) as 'Distinct Compaies' from Customer order by company;
-- Creating cusomerId column in Customer
alter table Customer add CustomerId  int not null primary key auto_increment;

SELECT * FROM customers.customer;
-- Creating companyId  column in Customer
alter table Customer add companyId int ; -- is going to be nulll
-- see what companyID and company for customer
select companyId, company from Customer;
-- creating  a company table  that has companyID and company name 
create table Company(
companyID int not null auto_increment,
Company varchar(255),
primary key (companyID)
);
select * from Company;
-- insert the unique company in the Company.company 
insert into Company(company) select distinct company as 'Distinct Compaies' from Customer order by company;

-- if the company in Customer is the same as the company in Company 
-- set the companyID in customer to the companyId in the Company
select * from Company;
update 
	Customer c set c.companyID = (select t.companyID from Company t 
where 
	t.company=c.company);


-- check to see if the Customer table is updateded
SELECT * FROM customers.customer;
-- Look at the the matching
select 
	c.companyID, c.company, t.companyID, t.Company 
from 
	Customer c inner join Company t on c.CompanyID=t.CompanyID;

-- reomove the company column from the customer table

alter table Customer drop company;
select * from customer;
-- -------------------Concatinating ------------------------------------------
SELECT 
    FirstName,
    LastName,
   
    CONCAT(FirstName, ' ', LastName) FullName
FROM 
    Customer;

-- a query to bring it all back together
select CONCAT(`FirstName`,' ',`LastName`) as `Full Name`, company from Customer 
inner join Company on 
customer.companyid=Company.companyid;

-- ------------- List all the people in the customer's table who's last name is Smith.---
select * from 
	Customer
where 
	LastName = "Smith";
--  ---- List all the customers and their employers and positions that live in Flint-----
select Title, FirstName, LastName, company from
	Customer,  Company
where
	Customer.companyID = Company.companyID and
	city = "Flint";
-- -----List all the customers and their employers and positions that live in Virginia Beach---
select Title, FirstName, LastName, Position 
from 
	Customer
where city = "Virginia Beach";
-- ---Which is the most popular employer in our database?---
select * from Customer;


    

alter table customer 
	add FullName varchar(255) not null;
    
select * from customer;

update customer set customer.FullName = concat(`FirstName`, ' ', `LastName`) ;







