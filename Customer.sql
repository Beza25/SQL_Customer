drop database Customers; -- only run this if you're starting over

create database Customers;
-- switc h to the customers database (it's case sensitive)
use Customers;

-- import customers.csv into a table called Customer (case-sensitive)
SELECT * FROM customers.customer;
select count(*) as 'Customer Count' from Customer;

select count(distinct company) as 'Distinct Compaies' from Customer;

-- alter table Customer add CustomerId int not null primary kety auto_increment;


