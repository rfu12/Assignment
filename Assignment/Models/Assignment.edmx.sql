
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/15/2019 14:31:51
-- Generated from EDMX file: A:\Fit5032\Assignment\Assignment\Assignment\Models\Assignment.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-Assignment-20190915115425];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [DateOfBirth] date NOT NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [BookId] int IDENTITY(1,1) NOT NULL,
    [Cost] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Desitination] nvarchar(max)  NOT NULL,
    [DateTime] date NOT NULL,
    [UserId] int  NOT NULL,
    [Taxi_TaxiId] int  NOT NULL
);
GO

-- Creating table 'TaxiSet'
CREATE TABLE [dbo].[TaxiSet] (
    [TaxiId] int IDENTITY(1,1) NOT NULL,
    [Capacity] nvarchar(max)  NOT NULL,
    [Color] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BookId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([BookId] ASC);
GO

-- Creating primary key on [TaxiId] in table 'TaxiSet'
ALTER TABLE [dbo].[TaxiSet]
ADD CONSTRAINT [PK_TaxiSet]
    PRIMARY KEY CLUSTERED ([TaxiId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_UserBooking]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBooking'
CREATE INDEX [IX_FK_UserBooking]
ON [dbo].[BookingSet]
    ([UserId]);
GO

-- Creating foreign key on [Taxi_TaxiId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingTaxi]
    FOREIGN KEY ([Taxi_TaxiId])
    REFERENCES [dbo].[TaxiSet]
        ([TaxiId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingTaxi'
CREATE INDEX [IX_FK_BookingTaxi]
ON [dbo].[BookingSet]
    ([Taxi_TaxiId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------