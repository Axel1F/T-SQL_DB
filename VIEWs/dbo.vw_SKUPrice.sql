--DROP VIEW SKUPrice;

--Use TestDb
--Go

CREATE VIEW SKUPrice AS 
SELECT *, [Price]=([dbo].[GetSKUPrice]([ID identity]))
FROM dbo.SKU


--Создать представление (на выходе: файл в репозитории dbo.vw_SKUPriceв ветке VIEWs)
--4.1 Возвращает все атрибуты продуктов из таблицы dbo.SKU и расчетный атрибут со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)