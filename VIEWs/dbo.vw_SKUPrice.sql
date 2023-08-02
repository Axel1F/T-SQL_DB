CREATE VIEW SKUPrice AS 
SELECT *, [Price]=([dbo].[GetSKUPrice]([ID identity]))
FROM dbo.SKU

