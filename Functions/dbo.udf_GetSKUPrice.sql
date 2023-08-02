--Use TestDb
--Go

CREATE FUNCTION GetSKUPrice (@ID_SKU INT)
    RETURNS DECIMAL(18, 2)
    BEGIN
        DECLARE @addPrice DECIMAL(18, 2)
        SELECT @addPrice = [Value]/ [Quantity]
		FROM dbo.Basket 
		where ID_SKU = @ID_SKU
        RETURN @addPrice
    END;


--Создать функцию (на выходе: файл в репозитории dbo.udf_GetSKUPrice.sql в ветке Functions)
--3.1 Входной параметр @ID_SKU
--3.2 Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле
--   3.1.1 сумма Value по переданному SKU / сумма Quantity по переданному SKU
--3.3 На выходе значение типа decimal(18, 2)