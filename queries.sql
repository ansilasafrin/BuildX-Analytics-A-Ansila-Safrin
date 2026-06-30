-- Find all students who got placed
SELECT *
FROM cleaned_dataset
WHERE status = 'Placed';


-- Count students in each specialization
SELECT specialisation,
       COUNT(*) AS total_students
FROM cleaned_dataset
GROUP BY specialisation;


-- Find students whose specialization contains HR
SELECT *
FROM cleaned_dataset
WHERE specialisation LIKE '%HR%';


-- Display top 10 highest salary packages
SELECT sl_no,
       gender,
       specialisation,
       salary
FROM cleaned_dataset
ORDER BY salary DESC
LIMIT 10;


-- Show specializations where average salary is greater than 300000
SELECT specialisation,
       AVG(salary) AS avg_salary
FROM cleaned_dataset
GROUP BY specialisation
HAVING AVG(salary) > 300000;


-- Analyze placed students by specialization
SELECT specialisation,
       COUNT(*) AS placed_students,
       AVG(mba_p) AS avg_mba,
       AVG(salary) AS avg_salary
FROM cleaned_dataset
WHERE status = 'Placed'
GROUP BY specialisation
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;

