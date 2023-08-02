--====================================
--  Create database trigger template 
--====================================
USE [TestDb]
GO

CREATE TRIGGER dbo.TR_Basket_insert_update ON dbo.Basket
	
AS 
IF IS_MEMBER ('db_owner') = 0
BEGIN
   PRINT 'You must ask your DBA to drop or alter tables!' 
   ROLLBACK TRANSACTION
END
GO


---Создать триггер (на выходе: файл в репозитории dbo.TR_Basket_insert_update в ветке Triggers)
----6.1 Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0