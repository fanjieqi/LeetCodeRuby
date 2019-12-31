# Write your MySQL query statement below

SELECT 
s1.Score,
(
    SELECT count(distinct Score)+1 
    FROM Scores s2
    WHERE s2.Score > s1.Score
) Rank 
FROM Scores s1 
ORDER BY Rank
;
