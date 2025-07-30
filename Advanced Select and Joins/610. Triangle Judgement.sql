-- link to problem: https://leetcode.com/problems/triangle-judgement/?envType=study-plan-v2&envId=top-sql-50
-- Triangle inequality:  length of any 2 sides must be greater than the third side. ||a + b|| = ||a|| = ||b||
SELECT *, IF(x+y>z and y+z>x and z+x>y, "Yes", "No") as triangle 
FROM Triangle
