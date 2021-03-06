﻿/*
Deployment script for DetergentsData

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DetergentsData"
:setvar DefaultFilePrefix "DetergentsData"
:setvar DefaultDataPath "C:\Users\289663\AppData\Local\Microsoft\VisualStudio\SSDT\DetergentsData"
:setvar DefaultLogPath "C:\Users\289663\AppData\Local\Microsoft\VisualStudio\SSDT\DetergentsData"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Rename refactoring operation with key cbc0c614-12c5-4aaa-931b-70dccde8889e is skipped, element [dbo].[Table1] (SqlTable) will not be renamed to [Detergents]';


GO
PRINT N'Rename refactoring operation with key 828c76e9-c944-438e-8181-286a24e2fe0f is skipped, element [dbo].[Detergents].[col1] (SqlSimpleColumn) will not be renamed to EAN';


GO
PRINT N'Rename refactoring operation with key 45c5a369-74f8-4c05-909c-3cb8cb3aaaf2 is skipped, element [dbo].[Table1].[col1] (SqlSimpleColumn) will not be renamed to Soap';


GO
PRINT N'Creating [dbo].[Detergents]...';


GO
CREATE TABLE [dbo].[Detergents] (
    [EAN]                 INT            NOT NULL,
    [Title]               NVARCHAR (50)  NULL,
    [Product Name]        NVARCHAR (50)  NOT NULL,
    [Product Description] NVARCHAR (MAX) NULL,
    [Valid From]          DATETIME       NOT NULL,
    [ID]                  INT            NOT NULL,
    CONSTRAINT [PK_Detergents] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
PRINT N'Creating [dbo].[Table1]...';


GO
CREATE TABLE [dbo].[Table1] (
    [Soap]          VARCHAR (50) NOT NULL,
    [Dishdetergent] VARCHAR (50) NOT NULL,
    [CategoryID]    INT          NOT NULL
);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cbc0c614-12c5-4aaa-931b-70dccde8889e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cbc0c614-12c5-4aaa-931b-70dccde8889e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '828c76e9-c944-438e-8181-286a24e2fe0f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('828c76e9-c944-438e-8181-286a24e2fe0f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '45c5a369-74f8-4c05-909c-3cb8cb3aaaf2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('45c5a369-74f8-4c05-909c-3cb8cb3aaaf2')

GO

GO
PRINT N'Update complete.';


GO
