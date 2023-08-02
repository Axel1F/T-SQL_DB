--====================================
--  Create database trigger template 
--====================================
USE [TestDb]
GO

CREATE TRIGGER dbo.TR_Basket_insert_update ON dbo.Basket
	
AS 
IF IS_MEMBER ('db_owner') = 0
BEGIN
   PRINT 'You must ask your DBA to drop or alter tables!' 
   ROLLBACK TRANSACTION
END
GO


---������� ������� (�� ������: ���� � ����������� dbo.TR_Basket_insert_update � ����� Triggers)
----6.1 ���� � ������� dbo.Basket �� ��� ����������� 2 � ����� ������� ������ ID_SKU, �� �������� � ���� DiscountValue, ��� ����� ID_SKU �������������� �� ������� Value * 5%, ����� DiscountValue = 0