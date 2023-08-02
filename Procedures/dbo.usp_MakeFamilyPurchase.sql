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
SELECT @SumValue = sum([Value]) from dbo.Basket where dbo.Basket.ID_Family = (SELECT [ID identity] FROM dbo.Family WHERE [SurName] = @FamilySurName)
UPDATE dbo.Family
SET [BudgetValue] = ((SELECT BudgetValue FROM dbo.Family WHERE [SurName] = @FamilySurName) - @SumValue)
Where [SurName]= @FamilySurName;
END

Else print ('ошибка, такой семьи нет')
END


--Создать процедуру (на выходе: файл в репозитории dbo.usp_MakeFamilyPurchase в ветке Procedures
--5.1 Входной параметр (@FamilySurName varchar(255)) одно из значений атрибута SurName таблицы dbo.Family
--5.2 Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
--   5.2.1 dbo.Family.BudgetValue - sum(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
--   5.2.2 При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет