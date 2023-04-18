USE Task4_DB;
GO


SELECT emp.first_name + ' ' + emp.last_name as FullName, 
pj.name as project_name, 
pj.max_sum_rate - (pos.rate + SUM(ISNULL(eq.price,0))/12) as diff
	from employee emp
	LEFT JOIN equipment eq
		ON eq.user_id = emp.id
		INNER JOIN position pos
		ON pos.id = emp.position_id
		INNER JOIN project pj
		ON emp.project_id = pj.id
	GROUP BY emp.id ,emp.first_name,emp.last_name,pj.name ,pos.rate, pj.max_sum_rate
	HAVING (pos.rate + SUM(ISNULL(eq.price,0))/12) >  pj.max_sum_rate 


--this query is for you to check the values
SELECT emp.first_name + ' ' + emp.last_name as FullName, 
pj.name as project_name, 
pos.rate,
SUM(eq.price)/12 as equip_montly,pj.max_sum_rate,
(pos.rate + SUM(ISNULL(eq.price,0))/12) as MonthlyCost_EQ, --, eq.name, eq.price
pj.max_sum_rate - (pos.rate + SUM(ISNULL(eq.price,0))/12) as diff
	from employee emp
	LEFT JOIN equipment eq
		ON eq.user_id = emp.id
		INNER JOIN position pos
		ON pos.id = emp.position_id
		INNER JOIN project pj
		ON emp.project_id = pj.id
	GROUP BY emp.id ,emp.first_name,emp.last_name,pj.name ,pos.rate, pj.max_sum_rate

