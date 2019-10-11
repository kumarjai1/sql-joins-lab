#!/bin/sh

# TODO: Create database and initialize database table structure
# NOTE: This was created for a linux machine so change as needed
sudo -u jai psql -c 'CREATE DATABASE companies';
sudo -u jai psql -d companies   -c "

CREATE TABLE Employee (
    employees_id SERIAL NOT NULL,
    SSN VARCHAR(11) PRIMARY KEY,
    First VARCHAR(255),
    Last VARCHAR(255),
    year_of_birth INT,
    City VARCHAR(255),
    UNIQUE(SSN, First, Last, year_of_birth, City)
);

CREATE TABLE Job (
    job_id SERIAL PRIMARY KEY NOT NULL,
    SSN VARCHAR(11),
    Company VARCHAR(100),
    Salary INT,
    Experience INT
);"

sudo -u jai psql -d companies -c "\copy employee(ssn, First, Last, year_of_birth, City) FROM employees.csv DELIMITER ',' CSV HEADER;"
sudo -u jai psql -d companies -c "\copy job(ssn, Company, Salary,Experience) FROM jobs.csv DELIMITER ',' CSV HEADER;

ANALYZE employee;
ANALYZE job;"
