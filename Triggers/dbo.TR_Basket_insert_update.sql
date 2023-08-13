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

