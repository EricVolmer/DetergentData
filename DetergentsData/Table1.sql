CREATE TABLE [dbo].[Table1]
(
    [Soap] VARCHAR(50) NOT NULL, 
    [Dishdetergent] VARCHAR(50) NOT NULL, 
    [CategoryID] INT NOT NULL
)
WITH
(
    CLUSTERED COLUMNSTORE INDEX
)
GO
