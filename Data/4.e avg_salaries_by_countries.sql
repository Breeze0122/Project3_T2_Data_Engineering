--4.a. - Get the avg salary according the experience level. SANTIAGO
--4.b. - Get the top 3 countries and review the minimum wage and max wage and compare them. SOFIA
--4.c. - Show the avg wage of the top 3. SANTIAGO
--4.d. - Show the % of the remote ratio through the years. ANA BRISA
--4.e. - Using leaflet show in a map how the countries avg salaries are and by layers show the job title. SOFIA
--4.f. - Get the size of the company and how many employees are. ANA BRISA

--4.e avg salaries by countries and years
Select wy.work_year
,cld.location_name
,ROUND(AVG(es.salary_in_usd::numeric),2)  "avg_salaries_usd"
from "Employee_salary" es
inner join "Company_Data" cd
on es.id_company = cd.id_company
inner join "company_size" cz
on cd.id_company_size = cz.id_company_size
inner join "work_year" wy
on es.id_work_year = wy.id_work_year
inner join "company_location_description" cld
on cd.id_company_location = cld.id_company_location
group by wy.work_year
,cld.location_name
order by 1,2 asc