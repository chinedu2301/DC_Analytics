/* Durham College Data Analytics for Business Decision Making
   DATA1202: Data Analysis Tools; Assignment1 - PartB
   Name: Chinedu Onyeka
*/

# This converts an ER diagram to a schema

DROP DATABASE IF EXISTS dc_employees;
CREATE DATABASE IF NOT EXISTS dc_employees; # creates the database
USE dc_employees;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dependents;

# Create the tables

/* Create the regions table
regions(region_id(PK), region_name)
*/
CREATE TABLE regions(
region_id INT PRIMARY KEY AUTO_INCREMENT,
region_name VARCHAR(50) NOT NULL

);

/* Create the countries table
countries(country_id(PK), country_name, region_id(FK))
*/
CREATE TABLE countries(
country_id VARCHAR(10) PRIMARY KEY NOT NULL,
country VARCHAR(50) NOT NULL,
region_id INT NOT NULL REFERENCES regions(region_id) ON DELETE CASCADE ON UPDATE CASCADE

);

/* Create the locations table
locations(location_id(PK), street_address, postal_code, city, state_province, country_id(FK))
*/
CREATE TABLE locations(
location_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
street_address VARCHAR(200) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
state_province VARCHAR(50) NOT NULL,
country_id VARCHAR(10) NOT NULL REFERENCES countries(country_id) ON DELETE CASCADE ON UPDATE CASCADE

);

/* Create departments table
departments(department_id(PK), department_name, location_id(FK))
*/
CREATE TABLE departments(
department_id VARCHAR(20) PRIMARY KEY NOT NULL,
department_name VARCHAR(100) NOT NULL,
location_id INT NOT NULL REFERENCES locations(location_id) ON DELETE CASCADE ON UPDATE CASCADE

);

/* Create jobs table
jobs(job_id(PK), job_title, min_salary, max_salary)
*/
CREATE TABLE jobs(
job_id INT PRIMARY KEY NOT NULL,
job_title VARCHAR(50) NOT NULL,
min_salary INT NOT NULL,
max_salary INT NOT NULL
 
);

/* Create employees table
employees(employee_id(PK), first_name, last_name, email, phone_number, hire_date, job_id(FK), salary, manager_id(FK))
*/
CREATE TABLE employees(
employee_id INT PRIMARY KEY NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_number VARCHAR(20) UNIQUE NOT NULL,
hire_date VARCHAR(50) NOT NULL,
job_id INT NOT NULL REFERENCES jobs(job_id) ON DELETE CASCADE ON UPDATE CASCADE,
salary VARCHAR(20) NOT NULL,
manager_id INT REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE

);

/* Create dependents table
dependents(dependent_id(PK), first_name, last_name, relationship, employees(FK))
*/
CREATE TABLE dependents(
dependent_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
relationship VARCHAR(50) NOT NULL,
employee_id INT NOT NULL REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE

);

### Insert at least two (2) records in each table

# Populate the regions table

# Populate the regions table
INSERT INTO regions
VALUES 
(1, "North America"),
(2, "Europe"),
(3, "Asia"),
(4, "Africa");

# Populate the countries table
INSERT INTO countries
VALUES
("CAN", "Canada", 1),
("IND", "India", 3),
("NGN", "Nigeria", 4);

# Populate the locations table
INSERT INTO locations
VALUES
(1, "1265 King Street East", "L1H 1J2", "Oshawa", "ON", "CAN"),
(2, "10 Nwobodo Street", "410001", "Abuja", "FCT", "NGN"),
(3, "573 Gupta Road", "L58 IND", "Delhi", "Delhi", "IND");

# Populate departments table
INSERT INTO departments
VALUES
(1, "Chemistry", 1),
(2, "Data Analytics", 2),
(3, "Biology", 3);

# Populate the jobs table
INSERT INTO jobs
VALUES
(1, "Associate", 40000, 70000),
(2, "Data Scientist", 65000, 110000),
(3, "Engineer", 45000, 95000);

#Populate the employees table
INSERT INTO employees
VALUES
(1, "Noopa", "Gandhi", "noopagandhi@mail.com", 9052780124, 9/7/2005, 2, 105000, NULL),
(2, "Prati", "Patel", "pratipatel@dcmail.gov", 7284012312, 8/17/2019, 3, 50000, 1),
(3, "John", "Wickland", "johnwickland@anymail.com", 9812348954, 8/15/2020, 1, 45000, 1),
(4, "Joshua", "Vinny", "joshuavinny@mail.ca", 8203459876, 9/23/2021, 1, 41000, 2);

# Populate the dependents table
INSERT INTO dependents
VALUES
(1, "Vicky", "Onyx", "Child", 3),
(2, "Jeremie", "Gitsim", "Brother", 4),
(3, "Pratish", "Pushkar", "Spouse", 1);

# Select the tables

#SELECT * FROM employees;
#SELECT * FROM dependents;
#SELECT * FROM jobs;
#SELECT * FROM deparments;
#SELECT * FROM locations;
#SELECT * FROM countries;
#SELECT * FROM regions;
