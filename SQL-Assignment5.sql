/*
What is an object in SQL?
A database object in a relational database is a data structure used to either store or reference data. The most common object that people interact with is the table. Other objects are indexes, stored procedures, sequences, views and many more.

What is Index? What are the advantages and disadvantages of using Indexes?
A SQL index is used to retrieve data from a database very fast. Indexes take additional disk space. Indexes slow down INSERT, UPDATE and DELETE, but will speed up UPDATE if the WHERE condition has an indexed field.  INSERT, UPDATE and DELETE becomes slower because on each operation the indexes must also be updated. 

What are the types of Indexes?
Clustered Index, Non-Clustered Index, Column Store Index, Filtered Index. Hash Index, Unique Index.

Can a table have multiple clustered index? Why?
There can be only one clustered index per table, because the data rows themselves can be stored in only one order.

Does SQL Server automatically create indexes when a table is created? If yes, under which constraints?
SQL Server will automatically create a clustered index on the specified column. It will under PRIMARY KEY constraint

Can an index be created on multiple columns? If yes, is the order of columns matter?
A composite index is an index on multiple columns. MySQL allows you to create a composite index that consists of up to 16 columns.

Can indexes be created on views?
Yes. An indexed view has a unique clustered index.

What is normalization? What are the steps (normal forms) to achieve normalization?
The purpose of Normalisation in SQL is to eliminate redundant (repetitive) data and ensure data is stored logically.
1NF (First Normal Form): Each table cell should contain a single value. Each record needs to be unique.
2NF (Second Normal Form): Be in 1NF. Single Column Primary Key that does not functionally dependant on any subset of candidate key relation
3NF (Third Normal Form): Be in 2NF. Has no transitive functional dependencies
 
What is denormalization and under which scenarios can it be preferable?
Denormalization is a database optimization technique in which we add redundant data to one or more tables. This can help us avoid costly joins in a relational database. Note that denormalization does not mean not doing normalization. It is an optimization technique that is applied after doing normalization.

How do you achieve Data Integrity in SQL Server?
Entity integrity ensures each row in a table is a uniquely identifiable entity. We can apply Entity integrity to the Table by specifying a primary key, unique key, and not null.

What are the different kinds of constraint does SQL Server have?
SQL Server contains the following 6 types of constraints: Not Null Constraint, Check Constraint, Default Constraint, Unique Constraint, Primary Constraint, Foreign Constraint.

What is the difference between Primary Key and Unique Key?
Primary key will not accept NULL values whereas Unique key can accept one NULL value. A table can have only primary key whereas there can be multiple unique key on a table. A Clustered index automatically created when a primary key is defined whereas Unique key generates the non-clustered index.

What is foreign key?
A Foreign Key is a database key that is used to link two tables together by referencing a field in the first table that contains the foreign key, called the Child table, to the PRIMARY KEY in the second table, called the Parent table. In other words, the foreign key column values in the child table must appear in the referenced PRIMARY KEY column in the parent table before inserting its value to the child table.

Can a table have multiple foreign keys?
A table may have multiple foreign keys, and each foreign key can have a different parent table. Each foreign key is enforced independently by the database system.

Does a foreign key have to be unique? Can it be null?
Not. it does not have to be unique. However, it can be NULL or duplicate.

Can we create indexes on Table Variables or Temporary Tables?
indexes on table variables can only be created implicitly by creating a UNIQUE or PRIMARY KEY constraint.
Adding indexes to the SQL temp tables will enhance its performance if the index is chosen correctly, otherwise, it can cause performance degradation.

What is Transaction? What types of transaction levels are there in SQL Server?
A transaction is the logical work unit that performs a single activity or multiple activities in a database. There are four types of transaction levels. Ex. READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, and SERIALIZABLE.
*/

/*
-Write an sql statement that will display the name of each customer and the sum of order totals placed by that customer during the year 2002
Create table customer(cust_id int,  name varchar (50))
create table order(order_id int, cust_id int, amount money, order_date smalldatetime)
*/

SELECT c.name, COUNT(o.order_id) AS theCount FROM customer c
JOIN  order O JOIN c.cust_id = O.cust_id
WHERE DATEPART(year, order_date) = 2002

/*
-The following table is used to store information about company’s personnel:
Create table person (id int, firstname varchar(100), lastname varchar(100))
write a query that returns all employees whose last names  start with “A”.
*/
SELECT lastname + ‘ ’ + firstname FROM person
WHERE lastname LIKE ‘A%’

/*
-The information about company’s personnel is stored in the following table:
Create table person(person_id int primary key, manager_id int null, name varchar(100) not null)
The filed managed_id contains the person_id of the employee’s manager. Please write a query that would return the names of all top managers(an employee who does not have a manager, and the number of people that report directly to this manager.
*/

SELECT person_id, COUNT(manager_id) AS theCount FROM person
WHERE manager_id IS NULL
GROUP BY person_id
ORDER BY 2 DESC

/*
-List all events that can cause a trigger to be executed.
Triggers are stored programs, which are automatically executed or fired when some event occurs. Triggers are written to be executed in response to any of the following events. Ex. A database manipulation (DML) statement (DELETE, INSERT, or UPDATE), A database definition (DDL) statement (CREATE, ALTER, or DROP), A database operation (SERVERERROR, LOGON, LOGOFF, STARTUP, or SHUTDOWN).

-Generate a destination schema in the 3rd Normal Form.  Include all necessary fact, join, and dictionary tables, and all Primary and Foreign Key relationships.  The following assumptions can be made:
a. Each Company can have one or more Divisions.
b. Each record in the Company table represents a unique combination 
c. Physical locations are associated with Divisions.
d. Some Company Divisions are collocated at the same physical of Company Name and Division Name.
e. Contacts can be associated with one or more divisions and the address, but are differentiated by suite/mail drop records. status of each association should be separately maintained and audited.
*/
CREATE TABLE Company (DepartmentID INT PRIMARY KEY, LocationID varchar(20), ContactID INT)

CREATE TABLE Contacts (ContactID INT, Name varchar(20), mail varchar(20))

CREATE TABLE Department (DepartmentID INT, Name varchar(20))

CREATE TABLE Locations (LocationID INT, Name varchar(20), Address varchar(20))



