
CREATE TRIGGER dbo.TR_Basket_insert_update ON dbo.Basket
	
AS 
IF IS_MEMBER ('db_owner') = 0
BEGIN
   PRINT 'You must ask your DBA to drop or alter tables!' 
   ROLLBACK TRANSACTION
END
GO

