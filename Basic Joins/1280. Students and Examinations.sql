--Write your MySQL query statement below

--studentid, student name, subject name, attended exams as count of student attending subject 

WITH exam_count AS (SELECT student_id, subject_name, COUNT(*) AS attended_exams
FROM Examinations
GROUP BY student_id, subject_name) 


SELECT st.student_id, st.student_name, su.subject_name, COALESCE(e.attended_exams, 0) AS attended_exams
FROM Students st
CROSS JOIN Subjects su
LEFT JOIN exam_count e 
ON st.student_id = e.student_id AND su.subject_name = e.subject_name
ORDER BY st.student_id, su.subject_name
