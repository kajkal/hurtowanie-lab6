--DROP TABLE [hurtownie].[dbo].[lab6_fakt_operacje]
DROP TABLE [hurtownie].[dbo].[lab6_wymiar_loty]
DROP TABLE [hurtownie].[dbo].[lab6_wymiar_linie_lotnicze]
DROP TABLE [hurtownie].[dbo].[lab6_wymiar_porty_lotnicze]

CREATE TABLE [hurtownie].[dbo].[lab6_wymiar_porty_lotnicze] (
    [IATA lotniska] varchar(50),
    [typ lotniska] varchar(50),
    [kontynent] varchar(50),
    [kraj] varchar(50),
    [region] varchar(50),
    [miasto] varchar(50),
    [nazwa lotniska] varchar(150),
    [współrzędne GPS lotniska] varchar(100),
    CONSTRAINT PK_kod_IATA_lotniska PRIMARY KEY CLUSTERED ([IATA lotniska])
)

CREATE TABLE [hurtownie].[dbo].[lab6_wymiar_linie_lotnicze] (
    [aktywna] varchar(50),
    [kraj] varchar(50),
    [linia lotnicza] varchar(100),
    [kod IATA] varchar(50),
    [kod ICAO] varchar(50),
    CONSTRAINT PK_kod_IATA_lini_lotniczej PRIMARY KEY CLUSTERED ([kod IATA])
)

CREATE TABLE [hurtownie].[dbo].[lab6_wymiar_loty] (
    [numer lotu] bigint IDENTITY(1,1),
    [linia lotnicza IATA] varchar(50),
    [kontynent src] varchar(50),
    [kontynent dst] varchar(50),
    [kraj src] varchar(50),
    [kraj dst] varchar(50),
    [lotnisko src] varchar(50),
    [lotnisko dst] varchar(50),
    [liczba międzylądowań] varchar(50),
    [maszyny obsługujące lot] varchar(50),
    CONSTRAINT PK_numer_lotu PRIMARY KEY CLUSTERED ([numer lotu]),
    CONSTRAINT FK_lotnisko_src FOREIGN KEY ([lotnisko src])
    REFERENCES [hurtownie].[dbo].[lab6_wymiar_porty_lotnicze] ([IATA lotniska]),
    CONSTRAINT FK_lotnisko_dst FOREIGN KEY ([lotnisko dst])
    REFERENCES [hurtownie].[dbo].[lab6_wymiar_porty_lotnicze] ([IATA lotniska]),
    CONSTRAINT FK_linia_lotnicza FOREIGN KEY ([linia lotnicza IATA])
    REFERENCES [hurtownie].[dbo].[lab6_wymiar_linie_lotnicze] ([kod IATA])
)

-- CREATE TABLE [hurtownie].[dbo].[lab6_fakt_operacje] (
--     [numer lotu] int,
--     [id] nvarchar(50),
--     [start] datetime2(7),
--     [lądowanie] datetime2(7),
--     [ilość pasażerów na pokładzie] int,
--     [procentowe obłożenie miejsc na pokładzie] float,
--     CONSTRAINT PK_id_operacji PRIMARY KEY CLUSTERED (id),
--     CONSTRAINT FK_numer_lotu FOREIGN KEY ([numer lotu])
--     REFERENCES [hurtownie].[dbo].[lab6_wymiar_loty] ([numer lotu])
-- )

