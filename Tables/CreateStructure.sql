--USE [TestDb]
--GO

--IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL
--DROP TABLE dbo.Basket;
--IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL
--DROP TABLE dbo.Family;
--IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL
--DROP TABLE dbo.SKU;

CREATE TABLE dbo.SKU
(
[ID identity] INT PRIMARY KEY IDENTITY,
[Code] AS ('S' + CONVERT(VARCHAR, [ID identity])) PERSISTED UNIQUE,
[Name] VARCHAR(30) NOT NULL
);

CREATE TABLE dbo.Family
(
[ID identity] INT PRIMARY KEY IDENTITY,
[SurName] VARCHAR(255) NOT NULL,
[BudgetValue] INT NOT NULL
);

CREATE TABLE dbo.Basket
(
[ID identity] INT PRIMARY KEY IDENTITY,
[ID_SKU] INT REFERENCES dbo.SKU([ID identity]) NOT NULL,
[ID_Family] INT REFERENCES dbo.Family([ID identity]) NOT NULL,
[BudgetValue] INT NOT NULL,
[Quantity] INT CHECK([Quantity]!<0) NOT NULL,
[Value] INT CHECK([Value]!<0) NOT NULL,
[PurchaseDate] DATE DEFAULT(SYSDATETIME()),
[DiscountValue] FLOAT NULL
);

--INSERT INTO dbo.SKU ([Name])
--VALUES 
--('Mi6'), ('Xiaomi')

--INSERT INTO dbo.Family ([SurName],[BudgetValue])
--VALUES 
--('A', 20)

--INSERT INTO dbo.Basket ([ID_SKU],[ID_Family],[BudgetValue],[Quantity],[Value],[DiscountValue]  )
--VALUES 
--(1,1,20,10,30,10),(2,1,20,10,30,10)

--Select *
--From dbo.SKU

--Select *
--From dbo.Family

--Select *
--From dbo.Basket



--������� ������� (�� ������: ���� � ����������� CreateStructure.sql � ����� Tables)
--2.1 dbo.SKU (ID identity, Code, Name)
--   2.1.1 ����������� �� ������������ ���� Code
--   2.1.2 ���� Code �����������: "s" + ID
--2.2 dbo.Family (ID identity, SurName, BudgetValue)
--2.3 dbo.Basket (ID identity, ID_SKU (������� ���� �� ������� dbo.SKU), ID_Family (������� ���� �� ������� dbo.Family) Quantity, Value, PurchaseDate, DiscountValue)
--   2.3.1 �����������, ��� ���� Quantity � Value �� ����� ���� ������ 0
--  2.3.2 �������� �������� �� ��������� ��� ���� PurchaseDate: ���� ���������� ������ (������� ����)