--link to problem - https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- we need date, date + 1 column, then compare 

SELECT w2.id --executed last, naming the columns 
FROM Weather w1 --executed 1st 
LEFT JOIN Weather w2 --whole block executed 2nd, so table.column format used 
    ON w2.recordDate = w1.recordDate + INTERVAL 1 DAY
WHERE w2.temperature > w1.temperature; --executed 3rd, filtering column
