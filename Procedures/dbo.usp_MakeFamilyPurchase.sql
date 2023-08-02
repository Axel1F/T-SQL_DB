--USE [TestDb]
--GO

CREATE PROCEDURE MakeFamilyPurchase
(
@FamilySurName varchar(255)
)
AS
BEGIN
IF @FamilySurName IN (SELECT SurName FROM dbo.Family)

BEGIN
DECLARE @SumValue INT
SELECT @SumValue = sum([Value]) from dbo.Basket where dbo.Basket.ID_Family = (SELECT [ID identity] FROM dbo.Family WHERE [SurName] = @FamilySurName)
UPDATE dbo.Family
SET [BudgetValue] = ((SELECT BudgetValue FROM dbo.Family WHERE [SurName] = @FamilySurName) - @SumValue)
Where [SurName]= @FamilySurName;
END

Else print ('������, ����� ����� ���')
END


--������� ��������� (�� ������: ���� � ����������� dbo.usp_MakeFamilyPurchase � ����� Procedures
--5.1 ������� �������� (@FamilySurName varchar(255)) ���� �� �������� �������� SurName ������� dbo.Family
--5.2 ��������� ��� ������ ��������� ������ � ������� dbo.Family � ���� BudgetValue �� ������
--   5.2.1 dbo.Family.BudgetValue - sum(dbo.Basket.Value), ��� dbo.Basket.Value ������� ��� ���������� � ��������� �����
--   5.2.2 ��� �������� ��������������� dbo.Family.SurName ������������ �������� ������, ��� ����� ����� ���