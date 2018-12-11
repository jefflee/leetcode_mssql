-- https://leetcode.com/problems/nth-highest-salary/

-- solution 1
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    
    RETURN (
        /* Write your T-SQL query statement below. */
        
        SELECT ISNULL(
            (select top 1 salary from (
                select rank() OVER (ORDER BY Salary desc ) AS RankCol,  Salary 
                from Employee  WITH (NOLOCK) group by Salary
            ) as t where RankCol=@N)
            , null ) as SecondHighestSalary
        
    );
END

-- solution 2 - use DENSE_RANK()
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    
    RETURN (
        /* Write your T-SQL query statement below. */
        
        SELECT ISNULL(
            (select top 1 salary from (
                select DENSE_RANK() OVER (ORDER BY Salary desc ) AS RankCol,  Salary 
                from Employee  WITH (NOLOCK) 
            ) as t where RankCol=@N)
            , null ) as SecondHighestSalary
        
    );
END