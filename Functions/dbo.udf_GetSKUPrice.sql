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


--������� ������� (�� ������: ���� � ����������� dbo.udf_GetSKUPrice.sql � ����� Functions)
--3.1 ������� �������� @ID_SKU
--3.2 ������������ ��������� ������������� �������� �� ������� dbo.Basket �� �������
--   3.1.1 ����� Value �� ����������� SKU / ����� Quantity �� ����������� SKU
--3.3 �� ������ �������� ���� decimal(18, 2)