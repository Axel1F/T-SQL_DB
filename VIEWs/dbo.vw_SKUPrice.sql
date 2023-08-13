--DROP VIEW SKUPrice;

--Use TestDb
--Go

CREATE VIEW SKUPrice AS 
SELECT *, [Price]=([dbo].[GetSKUPrice]([ID identity]))
FROM dbo.SKU

