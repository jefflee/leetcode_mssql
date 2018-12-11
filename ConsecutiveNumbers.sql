-- https://leetcode.com/problems/consecutive-numbers/

-- solution 1
SELECT distinct l1.Num AS ConsecutiveNums
FROM Logs AS l1 WITH (NOLOCK)
JOIN Logs AS l2 WITH (NOLOCK) on l1.Num = l2.Num
JOIN Logs AS l3 WITH (NOLOCK) on l1.Num = l3.Num
WHERE l2.Id - l1.Id = 1
    AND l3.Id - l1.Id = 2


-- solution 2 
SELECT DISTINCT num AS ConsecutiveNums 
FROM
(
SELECT num,LEAD(num) OVER(ORDER BY id) AS lead, LAG(num) OVER (ORDER BY id) AS lag
FROM Logs
)t
WHERE num=lead and num=lag;