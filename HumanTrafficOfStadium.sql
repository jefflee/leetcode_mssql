https://leetcode.com/problems/human-traffic-of-stadium/

-- the first day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id + 1
JOIN stadium as s3 on s3.id = s1.id + 2
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

UNION DISTINCT

-- the second day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id - 1
JOIN stadium as s3 on s3.id = s1.id + 1
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

UNION DISTINCT

-- the third day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id -2
JOIN stadium as s3 on s3.id = s1.id - 1
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

order by id