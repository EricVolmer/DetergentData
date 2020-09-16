CREATE TABLE [dbo].[Detergents]
(
    [EAN] int NOT NULL, 
    [Title] NVARCHAR(50) NULL, 
    [Product Name] NVARCHAR(50) NOT NULL, 
    [Product Description] NVARCHAR(MAX) NULL, 
    [Valid From] DATETIME NOT NULL, 
    [ID] INT NOT NULL, 
    CONSTRAINT [PK_Detergents] PRIMARY KEY ([ID])
)
