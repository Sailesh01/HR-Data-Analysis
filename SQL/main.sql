SELECT *
FROM hrdata

SELECT COUNT(*) as employee_count
FROM hrdata

SELECT COUNT(*) as employee_count
FROM hrdata
WHERE education = 'High School'

SELECT COUNT(*) as employee_count
FROM hrdata
WHERE department = 'Sales'

SELECT COUNT(*) as employee_count
FROM hrdata
WHERE attrition = 'Yes' AND department = 'R&D' AND education_field = 'Medical'
AND education = 'High School'

SELECT ROUND((SELECT COUNT(*) FROM hrdata WHERE attrition = 'Yes')*100.00 / (SELECT COUNT(*) FROM hrdata),2)
as attrition_rate


SELECT (SELECT COUNT(*) FROM hrdata) - (SELECT COUNT(*) FROM hrdata WHERE attrition = 'Yes')
as active_employees

SELECT ROUND(AVG(age), 0) as average_age
FROM hrdata

SELECT gender, COUNT(attrition) as attrition_count
FROM hrdata
WHERE attrition = 'Yes' AND education = 'High School'
GROUP BY gender

SELECT department, COUNT(*) as employee_count,
ROUND(CAST(COUNT(*) as numeric)*100/(SELECT COUNT(*) FROM hrdata WHERE attrition='Yes'),2) as employee_percentage 
FROM hrdata
WHERE attrition = 'Yes'
GROUP By department

SELECT age_band, COUNT(*) as employee_count
FROM hrdata
WHERE gender = 'Male'
GROUP BY age_band
ORDER BY 2

SELECT education_field, COUNT(*) as attrition_count
FROM hrdata 
WHERE attrition = 'Yes'
GROUP BY education_field

SELECT age_band, gender, COUNT(*) as employee_count
FROM hrdata
GROUP BY age_band, gender
ORDER BY 3

SELECT *
FROM crosstab(
  'SELECT job_role, job_satisfaction, sum(employee_count)
   FROM hrdata
   GROUP BY job_role, job_satisfaction
   ORDER BY job_role, job_satisfaction'
	) AS ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
ORDER BY job_role;
CREATE EXTENSION IF NOT EXISTS tablefunc;
