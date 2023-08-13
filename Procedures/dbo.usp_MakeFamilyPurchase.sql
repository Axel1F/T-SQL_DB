--USE [TestDb]
--GO

CREATE PROCEDURE MakeFamilyPurchase
(
@FamilySurName varchar(255)
)
AS
BEGIN
IF @FamilySurName IN (SELECT SurName FROM dbo.Family)
     BEGIN
	      DECLARE @SumValue INT
		  SELECT @SumValue = sum([Value]) 
                             from dbo.Basket
							 where dbo.Basket.ID_Family = (SELECT [ID identity] 
				                                           FROM dbo.Family
														   WHERE [SurName] = @FamilySurName)
          UPDATE dbo.Family
		  SET [BudgetValue] = ((SELECT BudgetValue 
                                FROM dbo.Family
								WHERE [SurName] = @FamilySurName) - @SumValue)
	      Where [SurName]= @FamilySurName;
	 END

Else print ('ошибка, такой семьи нет')
     END

