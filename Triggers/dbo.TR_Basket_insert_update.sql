--USE [TestDb]
--GO

--DROP TRIGGER dbo.TR_Basket_insert_update;
--Go

CREATE TRIGGER dbo.TR_Basket_insert_update 
ON dbo.Basket
AFTER INSERT
AS
BEGIN
UPDATE dbo.Basket
SET [DiscountValue]=Value * 5/100
WHERE [ID identity] IN (SELECT [ID identity] 
                        FROM inserted 
						WHERE [ID_SKU] IN (SELECT [ID_SKU] 
						                   FROM inserted 
										   GROUP BY [ID_SKU] 
										   HAVING COUNT([ID_SKU])>1) 
			            GROUP BY [ID identity])
UPDATE dbo.Basket
SET [DiscountValue]=0
WHERE [ID identity] IN (SELECT [ID identity] 
                        FROM inserted 
						WHERE [ID_SKU] IN (SELECT [ID_SKU] 
						                   FROM inserted 
										   GROUP BY [ID_SKU] 
										   HAVING COUNT([ID_SKU])=1) 
						GROUP BY [ID identity])
END

---Создать триггер (на выходе: файл в репозитории dbo.TR_Basket_insert_update в ветке Triggers)
----6.1 Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0