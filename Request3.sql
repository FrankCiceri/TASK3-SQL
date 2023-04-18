USE Task4_DB;
GO


DECLARE @get_projects table (id int, project_name nvarchar(max))

INSERT INTO @get_projects 
SELECT pj.id, pj.name FROM dbo.project AS pj
	INNER JOIN dbo.employee emp ON pj.id = emp.project_id 
	INNER JOIN dbo.position pos ON emp.position_id = pos.id GROUP BY 
	pj.id, pj.name, pj.max_sum_rate	HAVING SUM(pos.rate) > pj.max_sum_rate

SELECT * from @get_projects
--The query above is the same as request 2, which shows us the projects that their employee costs is more than the max_rate, but since It can be reutilized, 
--then I stored it into a query variable so now I can use it to get the employees that belong to the project


SELECT employee.first_name + ' ' + employee.last_name AS FullName, pjts.project_name
from employee
INNER JOIN @get_projects AS pjts 
ON employee.project_id =  pjts.id



