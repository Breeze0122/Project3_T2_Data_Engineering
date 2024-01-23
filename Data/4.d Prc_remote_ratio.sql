--4.a. - Get the avg salary according the experience level. SANTIAGO
--4.b. - Get the top 3 countries and review the minimum wage and max wage and compare them. SOFIA
--4.c. - Show the avg wage of the top 3. SANTIAGO
--4.d. - Show the % of the remote ratio through the years. ANA BRISA
--4.e. - Using leaflet show in a map how the countries avg salaries are and by layers show the job title. SOFIA
--4.f. - Get the size of the company and how many employees are. ANA BRISA

--4.d 

Select d.remote_ratio_description
,d.work_year
,count(d.remote_ratio_description)as "num_employees_by_ratio"
,b.num_employees
,((count(d.remote_ratio_description)*100)::decimal(10,2)/b.num_employees::decimal(10,2))::decimal(10,2) as "prc_by_remote_ratio"
from(
Select es.id_employee
,es.job_title
,es.salary_in_usd
,es.id_work_year
,wy.work_year
,es.id_remote_ratio
,rr.remote_ratio
,rr.remote_ratio_description
from "Employee_salary" es
inner join "remote_ratio" rr
on es.id_remote_ratio = rr.id_remote_ratio
inner join "work_year" wy
on es.id_work_year = wy.id_work_year)D
inner join (
Select count(es.id_employee) as "num_employees"
,wy.work_year
from "Employee_salary" es
inner join "remote_ratio" rr
on es.id_remote_ratio = rr.id_remote_ratio
inner join "work_year" wy
on es.id_work_year = wy.id_work_year
group by wy.work_year)B
on B.work_year= D.work_year 
Group by d.remote_ratio_description
,d.work_year
,b.num_employees
order by D.work_year


