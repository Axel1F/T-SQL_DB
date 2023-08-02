
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
[DiscountValue] FLOAT NOT NULL
);

