--DROP VIEW SKUPrice;

--Use TestDb
--Go

CREATE VIEW SKUPrice AS 
SELECT *, [Price]=([dbo].[GetSKUPrice]([ID identity]))
FROM dbo.SKU


--������� ������������� (�� ������: ���� � ����������� dbo.vw_SKUPrice� ����� VIEWs)
--4.1 ���������� ��� �������� ��������� �� ������� dbo.SKU � ��������� ������� �� ���������� ������ �������� (��������� ������� dbo.udf_GetSKUPrice)