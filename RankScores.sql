-- https://leetcode.com/problems/rank-scores/

select Score, DENSE_RANK() OVER (ORDER BY Score  desc ) AS [Rank]  
    from Scores  WITH (NOLOCK) 
