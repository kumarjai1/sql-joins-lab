#!/bin/sh

# TODO: Write queries to display:
# Employees working at macys
# Employee with the highest salary
# Companies in Boston
sudo -u jai psql -d companies -c "select first, Last from employee inner join job on employee.ssn like job.ssn where job.company = 'Macy''s';"
sudo -u jai psql -d companies -c "select company from job inner join employee on job.ssn like employee.ssn where employee.city = 'Boston';"
sudo -u jai psql -d companies -c "select employee from job inner join employee on job.ssn like employee.ssn order by salary desc limit 1;"
