https://leetcode.com/problems/swap-salary/

Solution1
UPDATE Salary
SET sex = CASE WHEN sex='m' THEN 'f' 
            ELSE 'm'
            END

Solution2 
UPDATE Salary
SET sex = CASE sex 
            WHEN 'm' THEN 'f' 
            ELSE 'm'
            END