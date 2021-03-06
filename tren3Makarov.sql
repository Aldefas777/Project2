USE [master]
GO
/****** Object:  Database [z3_Makarov]    Script Date: 14.12.2021 14:57:07 ******/
CREATE DATABASE [z3_Makarov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'z3_Makarov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\z3_Makarov.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'z3_Makarov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\z3_Makarov_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [z3_Makarov] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [z3_Makarov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [z3_Makarov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [z3_Makarov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [z3_Makarov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [z3_Makarov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [z3_Makarov] SET ARITHABORT OFF 
GO
ALTER DATABASE [z3_Makarov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [z3_Makarov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [z3_Makarov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [z3_Makarov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [z3_Makarov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [z3_Makarov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [z3_Makarov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [z3_Makarov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [z3_Makarov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [z3_Makarov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [z3_Makarov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [z3_Makarov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [z3_Makarov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [z3_Makarov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [z3_Makarov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [z3_Makarov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [z3_Makarov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [z3_Makarov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [z3_Makarov] SET  MULTI_USER 
GO
ALTER DATABASE [z3_Makarov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [z3_Makarov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [z3_Makarov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [z3_Makarov] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [z3_Makarov] SET DELAYED_DURABILITY = DISABLED 
GO
USE [z3_Makarov]
GO
/****** Object:  Table [dbo].[Ed_Izmeren]    Script Date: 14.12.2021 14:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ed_Izmeren](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_Ed_Izmeren] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 14.12.2021 14:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id] [int] NOT NULL,
	[Name] [nchar](100) NULL,
	[Izmeren_id] [int] NULL,
	[Ostatok] [decimal](18, 0) NULL,
	[Sklad_id] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sklad]    Script Date: 14.12.2021 14:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [nchar](100) NULL,
	[Type_id] [int] NULL,
	[Rasstoyanie] [int] NULL,
 CONSTRAINT [PK_Sklad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Material]    Script Date: 14.12.2021 14:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_Type_Material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ed_Izmeren] ON 

INSERT [dbo].[Ed_Izmeren] ([id], [Name]) VALUES (1, N'Kg                                                                                                  ')
INSERT [dbo].[Ed_Izmeren] ([id], [Name]) VALUES (2, N'M3                                                                                                  ')
INSERT [dbo].[Ed_Izmeren] ([id], [Name]) VALUES (3, N'T                                                                                                   ')
SET IDENTITY_INSERT [dbo].[Ed_Izmeren] OFF
INSERT [dbo].[Material] ([id], [Name], [Izmeren_id], [Ostatok], [Sklad_id]) VALUES (1232, N'Шпатлевка                                                                                           ', 1, CAST(234 AS Decimal(18, 0)), 3)
INSERT [dbo].[Material] ([id], [Name], [Izmeren_id], [Ostatok], [Sklad_id]) VALUES (1595, N'Известь                                                                                             ', 3, CAST(8 AS Decimal(18, 0)), 3)
INSERT [dbo].[Material] ([id], [Name], [Izmeren_id], [Ostatok], [Sklad_id]) VALUES (4565, N'Кирпич глиняный                                                                                     ', 2, CAST(61 AS Decimal(18, 0)), 5)
INSERT [dbo].[Material] ([id], [Name], [Izmeren_id], [Ostatok], [Sklad_id]) VALUES (7898, N'Краска                                                                                              ', 1, CAST(315 AS Decimal(18, 0)), 4)
INSERT [dbo].[Material] ([id], [Name], [Izmeren_id], [Ostatok], [Sklad_id]) VALUES (8542, N'Кирпич силикатный                                                                                   ', 2, CAST(108 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[Sklad] ON 

INSERT [dbo].[Sklad] ([id], [Adress], [Type_id], [Rasstoyanie]) VALUES (1, N'д.Крутово                                                                                           ', 1, 5)
INSERT [dbo].[Sklad] ([id], [Adress], [Type_id], [Rasstoyanie]) VALUES (2, N'пос.Веканово                                                                                        ', 2, 10)
INSERT [dbo].[Sklad] ([id], [Adress], [Type_id], [Rasstoyanie]) VALUES (3, N'пос.Заскочиха                                                                                       ', 2, 15)
INSERT [dbo].[Sklad] ([id], [Adress], [Type_id], [Rasstoyanie]) VALUES (4, N'д.Орлово                                                                                            ', 2, 8)
INSERT [dbo].[Sklad] ([id], [Adress], [Type_id], [Rasstoyanie]) VALUES (5, N'д.Комарово                                                                                          ', 3, 12)
SET IDENTITY_INSERT [dbo].[Sklad] OFF
SET IDENTITY_INSERT [dbo].[Type_Material] ON 

INSERT [dbo].[Type_Material] ([id], [Name]) VALUES (1, N'Сыпучие                                                                                             ')
INSERT [dbo].[Type_Material] ([id], [Name]) VALUES (2, N'Отделочные                                                                                          ')
INSERT [dbo].[Type_Material] ([id], [Name]) VALUES (3, N'Кирпич                                                                                              ')
SET IDENTITY_INSERT [dbo].[Type_Material] OFF
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Ed_Izmeren] FOREIGN KEY([Izmeren_id])
REFERENCES [dbo].[Ed_Izmeren] ([id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Ed_Izmeren]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Sklad] FOREIGN KEY([Sklad_id])
REFERENCES [dbo].[Sklad] ([id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Sklad]
GO
ALTER TABLE [dbo].[Sklad]  WITH CHECK ADD  CONSTRAINT [FK_Sklad_Type_Material] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Type_Material] ([id])
GO
ALTER TABLE [dbo].[Sklad] CHECK CONSTRAINT [FK_Sklad_Type_Material]
GO
USE [master]
GO
ALTER DATABASE [z3_Makarov] SET  READ_WRITE 
GO
