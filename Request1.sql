USE Task4_DB;
GO

SELECT (first_name + ' ' + last_name) as [Full Name], dbo.employee.id
FROM dbo.employee
WHERE project_id IS NULL

--SELECT * FROM dbo.employee --Uncomment If you want to check th table values when executing the query

