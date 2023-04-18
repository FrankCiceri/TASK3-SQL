USE Task4_DB;
GO




CREATE TRIGGER add_vacancy 

ON dbo.project
AFTER INSERT
AS
BEGIN

	

	INSERT INTO dbo.vacancies (position_id)
	(SELECT pos.id 
	 FROM position as pos 
	 WHERE	pos.name = 'Project Manager')

	

END;

GO

ENABLE TRIGGER add_vacancy ON dbo.project

--DISABLE TRIGGER add_vacancy ON dbo.project
												
