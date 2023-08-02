CREATE FUNCTION GetSKUPrice (@ID_SKU INT)
    RETURNS DECIMAL(18, 2)
    BEGIN
        DECLARE @addPrice DECIMAL(18, 2)
        SELECT @addPrice = [Value]/ [Quantity]
		FROM dbo.Basket 
		where ID_SKU = @ID_SKU
        RETURN @addPrice
    END;

