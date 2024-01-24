SELECT * 
FROM "Employee_salary";

SELECT 
job_title,
AVG(SALARY_IN_USD::numeric)
FROM "Employee_salary"
GROUP BY job_title
ORDER BY job_title;

SELECT *
FROM (
SELECT 
cld.location_name,
AVG(es.SALARY_IN_USD::numeric)
FROM "Employee_salary" es
INNER JOIN "Company_Data" cd
ON es.id_company = cd.id_company
INNER JOIN "company_location_description" cld
ON cd.id_company_location = cld.id_company_location
GROUP BY cld.location_name	
)
ORDER BY 2 desc	
LIMIT 10
;
