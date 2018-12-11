-- https://leetcode.com/problems/second-highest-salary/

Create table If Not Exists Employee (Id int, Salary int)
Truncate table Employee
insert into Employee (Id, Salary) values ('1', '100')
insert into Employee (Id, Salary) values ('2', '200')
insert into Employee (Id, Salary) values ('3', '300')

-- solution 1
with cte as (
select rank() OVER (ORDER BY Salary desc ) AS RankCol,  Salary 
from Employee  WITH (NOLOCK) 
)

SELECT ISNULL(
    (select top 1 salary from cte where RankCol=2)
    , null ) as SecondHighestSalary

-- solution 2
SELECT COALESCE(MAX(Salary), null) AS SecondHighestSalary
FROM Employee 
WHERE Salary < (SELECT MAX(Salary) FROM Employee);