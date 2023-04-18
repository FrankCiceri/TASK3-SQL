USE Task4_DB;
GO


SELECT pj.name
FROM dbo.project as pj
INNER JOIN dbo.employee emp ON pj.id = emp.project_id 
INNER JOIN dbo.position pos ON emp.position_id = pos.id
GROUP BY pj.name,pj.max_sum_rate
HAVING SUM(pos.rate) > pj.max_sum_rate

--in this query you can check for the rates of the employees, and the max_sum_rates where each one belongs
SELECT emp.first_name+' '+emp.last_name, pj.name, pj.max_sum_rate, pos.rate 
FROM dbo.project as pj
INNER JOIN dbo.employee emp ON pj.id = emp.project_id 
INNER JOIN dbo.position pos ON emp.position_id = pos.id
GROUP BY emp.first_name+' '+emp.last_name, pj.name,pj.max_sum_rate , pos.rate







----These Queries were made to understand how the tables will join on the final query
--SELECT dbo.employee.project_id, employee.id, employee.first_name,  dbo.project.name
--from dbo.project
--INNER JOIN dbo.employee
--ON dbo.project.id = dbo.employee.project_id 




--SELECT dbo.employee.position_id, employee.id, employee.first_name,rate 
--from dbo.position 
--INNER JOIN dbo.employee
--ON dbo.employee.position_id = dbo.position.id



--Select employee.first_name, [name] 
--from employee
--INNER JOIN project
--ON employee.project_id = project.id


 