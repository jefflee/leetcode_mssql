-- https://leetcode.com/problems/rising-temperature/

SELECT w1.Id AS Id
FROM Weather AS w1 WITH (NOLOCK)
JOIN Weather  AS w2 WITH (NOLOCK) on w2.RecordDate = DateAdd(day,-1,w1.RecordDate)
WHERE w1.Temperature > w2.Temperature