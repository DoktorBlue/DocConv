USE [master]
GO
/****** Object:  Database [ConvCtrl]    Script Date: 20-1-2020 09:57:12 ******/
CREATE DATABASE [ConvCtrl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sonar', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sonar.mdf' , SIZE = 35952256KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sonar_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sonar_log.ldf' , SIZE = 18685952KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConvCtrl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConvCtrl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConvCtrl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConvCtrl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConvCtrl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConvCtrl] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConvCtrl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConvCtrl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConvCtrl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConvCtrl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConvCtrl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConvCtrl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConvCtrl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConvCtrl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConvCtrl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConvCtrl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConvCtrl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConvCtrl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConvCtrl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConvCtrl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConvCtrl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConvCtrl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConvCtrl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConvCtrl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConvCtrl] SET  MULTI_USER 
GO
ALTER DATABASE [ConvCtrl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConvCtrl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConvCtrl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConvCtrl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConvCtrl', N'ON'
GO
USE [ConvCtrl]
GO
/****** Object:  User [TEST\SMU042]    Script Date: 20-1-2020 09:57:12 ******/
CREATE USER [TEST\SMU042] FOR LOGIN [TEST\SMU042] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TEST\rma123]    Script Date: 20-1-2020 09:57:12 ******/
CREATE USER [TEST\rma123] FOR LOGIN [TEST\rma123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TEST\lwi085]    Script Date: 20-1-2020 09:57:12 ******/
CREATE USER [TEST\lwi085] FOR LOGIN [TEST\lwi085] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TEST\dsa011]    Script Date: 20-1-2020 09:57:12 ******/
CREATE USER [TEST\dsa011] FOR LOGIN [TEST\dsa011] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bla]    Script Date: 20-1-2020 09:57:12 ******/
CREATE USER [bla] FOR LOGIN [bla] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TEST\SMU042]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TEST\SMU042]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TEST\SMU042]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TEST\rma123]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TEST\lwi085]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TEST\lwi085]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TEST\dsa011]
GO
ALTER ROLE [db_owner] ADD MEMBER [bla]
GO
/****** Object:  Table [dbo].[AOS_Codes]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AOS_Codes](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Classificatie] [smallint] NOT NULL,
	[Aandachtsgebied] [nvarchar](255) NOT NULL,
	[Onderwerp] [nvarchar](255) NOT NULL,
	[SubOnderwerp] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit EA]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit EA](
	[Aandachtsgebied] [nvarchar](255) NULL,
	[Onderwerp] [nvarchar](255) NULL,
	[SubOnderwerp] [nvarchar](255) NULL,
	[NaamApplicatiedomein] [nvarchar](255) NULL,
	[EA] [uniqueidentifier] NULL,
	[BSN] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit Sonar]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit Sonar](
	[DOCUMENT_TITEL] [varchar](500) NULL,
	[TEMPATE_GEN] [varchar](255) NULL,
	[TEMPLATE_DET] [varchar](255) NULL,
	[BSN] [varchar](10) NULL,
	[ROW_ID_WZ] [varchar](20) NULL,
	[Aanmaak] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch Status]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch Status](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sort] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcStart] [datetime] NULL,
	[ProcEnd] [datetime] NULL,
	[Run] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Created] [datetime] NULL,
	[Linked] [datetime] NULL,
	[Exported] [datetime] NULL,
	[Error] [varchar](8000) NULL,
	[Success] [bit] NULL,
	[License loaded] [int] NULL,
	[License set] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bericht Buffer]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bericht Buffer](
	[FileName] [varchar](255) NULL,
	[EigenPers] [bit] NOT NULL,
	[BSN] [varchar](20) NULL,
	[BerichtNr] [uniqueidentifier] NOT NULL,
	[Moment] [datetime] NOT NULL,
	[Doc] [int] NOT NULL,
	[Doc/Klant] [int] NULL,
	[Batch] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classificaties]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classificaties](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Classificatiecode] [nvarchar](255) NOT NULL,
	[Aandachtsgebied ID] [smallint] NULL,
	[Aandachtsgebied] [nvarchar](255) NOT NULL,
	[Onderwerp ID] [smallint] NULL,
	[Onderwerp] [nvarchar](255) NOT NULL,
	[Subonderwerp ID] [smallint] NULL,
	[Subonderwerp] [nvarchar](255) NULL,
	[Beveiligingsniveau] [nvarchar](255) NOT NULL,
	[CODE_EFlow] [nvarchar](255) NULL,
	[Actief] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control Params]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control Params](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[ValNum] [int] NULL,
	[ValStr] [varchar](255) NULL,
	[ValDate] [datetime] NULL,
	[Step] [tinyint] NOT NULL,
	[Param] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirTest]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirTest](
	[ID] [tinyint] NOT NULL,
	[Path] [varchar](50) NOT NULL,
	[FileSize] [int] NOT NULL,
	[Inserted] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc DropOut]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc DropOut](
	[Sonar ID] [int] NOT NULL,
	[SonarSrc] [tinyint] NOT NULL,
	[Doc Status] [tinyint] NOT NULL,
	[Inserted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sonar ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc per Klant]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc per Klant](
	[Sonar] [varchar](15) NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Contact] [varchar](15) NOT NULL,
	[BSN Status] [tinyint] NULL,
	[Klant] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BerichtNr] [uniqueidentifier] NOT NULL,
	[ProcStatus] [tinyint] NOT NULL,
	[EA] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Doc per __3214EC26A8B8099D] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX Doc per Klt]    Script Date: 20-1-2020 09:57:12 ******/
CREATE UNIQUE CLUSTERED INDEX [UX Doc per Klt] ON [dbo].[Doc per Klant]
(
	[Source] ASC,
	[Sonar] ASC,
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document Types]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document Types](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Template] [smallint] NULL,
	[Doc Count] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[InDB] [bit] NOT NULL,
	[InXls] [bit] NOT NULL,
	[AOS] [smallint] NULL,
	[Inserted] [datetime] NOT NULL,
	[Mask] [nvarchar](255) NULL,
	[VolgNr] [smallint] NULL,
	[generic] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocStatus] [tinyint] NOT NULL,
	[CurrentStep] [tinyint] NOT NULL,
	[ProcStatus] [tinyint] NOT NULL,
	[DocType] [smallint] NULL,
	[Sonar] [int] NOT NULL,
	[FileType] [smallint] NOT NULL,
	[xFdF Template] [smallint] NULL,
	[SAF] [int] NULL,
	[Source] [tinyint] NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[DossierDate] [datetime] NOT NULL,
	[DocName] [varchar](255) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Inserted] [datetime] NOT NULL,
	[User] [int] NULL,
 CONSTRAINT [PK__Documents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dosering Schema]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dosering Schema](
	[Datum] [datetime] NOT NULL,
	[Van] [tinyint] NOT NULL,
	[Tot] [smallint] NOT NULL,
	[Dosering] [smallint] NOT NULL,
 CONSTRAINT [PK Dosering Schema] PRIMARY KEY CLUSTERED 
(
	[Datum] ASC,
	[Van] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorCodes]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorCodes](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Inserted] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[EA_Code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileTypes](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DocCount] [int] NOT NULL,
	[Kan] [bit] NOT NULL,
	[Moet] [bit] NOT NULL,
	[Sort] [smallint] NOT NULL,
	[Main] [smallint] NULL,
	[Inserted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FS]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FS](
	[FileSize] [int] NULL,
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FS Update]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FS Update](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Path] [tinyint] NOT NULL,
	[FS] [int] NOT NULL,
	[DB] [int] NOT NULL,
	[Ins] [int] NOT NULL,
	[Upd] [int] NOT NULL,
	[Del] [int] NOT NULL,
	[Inserted] [datetime] NOT NULL,
	[Finished] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klanten]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klanten](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ROW_ID] [varchar](20) NULL,
	[SOC_SECURITY_NUM] [varchar](20) NULL,
	[ValidBSN] [bit] NULL,
	[LastDoc] [datetime] NULL,
	[EigenPers] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[L]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[L](
	[Mask] [varchar](50) NULL,
	[VolgNr] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetadataStatus]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetadataStatus](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sort] [tinyint] NOT NULL,
	[DoConvert] [bit] NOT NULL,
	[Final] [smallint] NOT NULL,
	[DropOut Agreed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module Types]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module Types](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manual] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module Versions]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module Versions](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Version] [varchar](25) NULL,
	[Datum] [datetime] NOT NULL,
	[Module] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Type] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules per MainStep]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules per MainStep](
	[Step] [tinyint] NOT NULL,
	[Module] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Step] ASC,
	[Module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MQ]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MQ](
	[PutDateTime] [datetime] NULL,
	[ReasonCode] [int] NULL,
	[BerichtNr] [uniqueidentifier] NULL,
	[Doc GUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MQ Response]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MQ Response](
	[MessageBody] [nvarchar](max) NULL,
	[PutDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MS test]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MS test](
	[ID] [int] NULL,
	[Before] [datetime2](7) NULL,
	[Tussen] [datetime2](7) NULL,
	[after] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Params]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Params](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Type] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParamType]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParamType](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piek test]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piek test](
	[FileName] [varchar](39) NULL,
	[ID] [int] NULL,
	[Bericht] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessDetails]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Doc] [int] NOT NULL,
	[Moment] [datetime] NOT NULL,
	[File] [varchar](255) NULL,
	[FileSize_KB] [int] NULL,
	[Elapsed] [int] NOT NULL,
	[Batch] [int] NOT NULL,
	[Doc/Klant] [int] NULL,
 CONSTRAINT [PK__ProcessDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessDetails Test]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessDetails Test](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Doc] [int] NOT NULL,
	[Moment] [datetime] NOT NULL,
	[File] [varchar](255) NULL,
	[FileSize_KB] [int] NULL,
	[Elapsed] [int] NOT NULL,
	[Batch] [int] NOT NULL,
	[Doc/Klant] [int] NULL,
 CONSTRAINT [PK__ProcessDetails Test] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessErrors]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[Doc] [int] NOT NULL,
	[Error] [varchar](8000) NOT NULL,
	[Batch] [int] NOT NULL,
 CONSTRAINT [PK__ProcessErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessStatus]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessStatus](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessSteps]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessSteps](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sort] [tinyint] NOT NULL,
	[Main] [tinyint] NULL,
	[IsMainStep] [bit] NOT NULL,
	[Caption] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Release Details]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release Details](
	[Release] [smallint] NOT NULL,
	[Version] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Release] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Runs]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[# Batches] [int] NULL,
	[# Extend] [int] NULL,
	[Created] [datetime] NULL,
	[ScriptRoot] [varchar](255) NULL,
	[Software] [smallint] NULL,
 CONSTRAINT [PK_Runs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoftwareVersion]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoftwareVersion](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Vanaf] [datetime] NOT NULL,
	[Step] [tinyint] NOT NULL,
	[Major] [tinyint] NOT NULL,
	[Minor] [tinyint] NOT NULL,
	[Build] [smallint] NOT NULL,
 CONSTRAINT [PK Software] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonar]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [varchar](15) NOT NULL,
	[SonarSrc] [tinyint] NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[DocName] [nvarchar](255) NULL,
	[Ext] [varchar](20) NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[FileSize] [int] NOT NULL,
	[Owner] [varchar](255) NOT NULL,
	[Template Version] [nvarchar](255) NULL,
	[Template Alias] [nvarchar](255) NULL,
	[Template ID] [varchar](20) NULL,
	[Created] [datetime] NOT NULL,
	[Last_Updated] [datetime] NOT NULL,
	[# Docs] [smallint] NOT NULL,
	[Inserted] [datetime] NOT NULL,
	[Code] [varchar](30) NULL,
	[Opm] [nvarchar](2000) NULL,
	[Flag] [char](1) NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK__Sonar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonar Files]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](21) NOT NULL,
	[Path] [tinyint] NOT NULL,
	[FileSize] [int] NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Actief] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonar Paths]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar Paths](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](50) NOT NULL,
	[CurrentYear] [bit] NOT NULL,
	[SiebelFS] [varchar](255) NOT NULL,
	[Refresh] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SonarSrc]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SonarSrc](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Prefix] [nvarchar](50) NULL,
	[Relevant] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standen]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standen](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Moment] [datetime] NOT NULL,
	[Name] [varchar](255) NULL,
	[Type] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standen Metadata]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standen Metadata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Stand] [smallint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Cont Mut] [int] NOT NULL,
	[Cont Stand] [int] NOT NULL,
	[Case Mut] [int] NOT NULL,
	[Case Stand] [int] NOT NULL,
	[Act Mut] [int] NOT NULL,
	[Act Stand] [int] NOT NULL,
	[Totaal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standen Proces]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standen Proces](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Stand] [smallint] NOT NULL,
	[Step] [tinyint] NOT NULL,
	[Open] [int] NOT NULL,
	[Running] [int] NOT NULL,
	[Success] [int] NOT NULL,
	[Failed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standen Report]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standen Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Stand] [smallint] NOT NULL,
	[MD Uitval] [int] NOT NULL,
	[MD Onbeslist] [int] NOT NULL,
	[Open] [int] NOT NULL,
	[Running] [int] NOT NULL,
	[Success] [int] NOT NULL,
	[Failed] [int] NOT NULL,
	[Sonar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandTypen]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandTypen](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template Versions per Alias]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template Versions per Alias](
	[Template Version] [smallint] NOT NULL,
	[Template Alias] [smallint] NOT NULL,
	[Doc Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Template Version] ASC,
	[Template Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Templates]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Templates](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Doc Count] [int] NOT NULL,
	[Inserted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [varchar](20) NOT NULL,
	[LogIn] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilization]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilization](
	[Moment] [datetime] NOT NULL,
	[CPU] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Moment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFdF Status]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFdF Status](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFdF Templates]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFdF Templates](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Doc Count] [int] NULL,
	[InDB] [bit] NOT NULL,
	[InFS] [bit] NOT NULL,
	[FileSize] [int] NULL,
	[FileType] [smallint] NULL,
	[Status] [tinyint] NOT NULL,
	[Inserted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AOS Export]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AOS Export] AS SELECT top 999999 [Document Types].Name AS Template, sum([Doc Count]) AS Aantal,  IsNull(AOS_Codes.Aandachtsgebied, '') AS Aandachtsgebied, IsNull(AOS_Codes.Onderwerp, '') AS Onderwerp, IsNull(AOS_Codes.SubOnderwerp, '') AS SubOnderwerp,  [Document Types].InDB,[Document Types].InXls, case when Name like '%bijlage%' AND AOS is null then 1 else 0 end as Generic FROM            [Document Types] left outer JOIN                          AOS_Codes ON [Document Types].AOS = AOS_Codes.ID group by [Document Types].Name, IsNull(AOS_Codes.Aandachtsgebied, ''), IsNull(AOS_Codes.Onderwerp, ''), IsNull(AOS_Codes.SubOnderwerp, ''), [Document Types].InDB,[Document Types].InXls, case when Name like '%bijlage%' AND AOS is null then 1 else 0 end  ORDER BY [Document Types].Name
GO
/****** Object:  View [dbo].[DocPath]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DocPath] as
select ID,
'\' + right('000' + cast(ID % 355 as varchar(9)),3) +
'\' + right('000000' + cast(ID % 126025 as varchar(9)),6) +
'\' + right('000000000' + cast(ID as varchar(9)),9) AS Path
from documents
GO
/****** Object:  View [dbo].[DropOutReport]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DropOutReport]
AS
SELECT        TOP 100 *,ContStand+CasStand+ActStand AS Totaal From (select ID, Final, DoConvert, Sort, Name,
case Sort when 0 then 0 else IsNull(-[1], 0) end as ContMut,
(Select Count(1) from Sonar Where SonarSrc = 1) +
sum(case Sort when 0 then 0 else IsNull(-[1], 0) end) over(order by Sort rows unbounded preceding) AS ContStand
,case Sort when 0 then 0 else IsNull(-[2], 0) end as CasMut,
(Select Count(1) from Sonar Where SonarSrc = 2) +
sum(case Sort when 0 then 0 else IsNull(-[2], 0) end) over(order by Sort rows unbounded preceding) AS CasStand
,case Sort when 0 then 0 else IsNull(-[3], 0) end as ActMut,
(Select Count(1) from Sonar Where SonarSrc = 3) +
sum(case Sort when 0 then 0 else IsNull(-[3], 0) end) over(order by Sort rows unbounded preceding) AS ActStand
FROM            (
SELECT   C.ID,     C.Name, IsNull(D.SonarSrc,0) AS SonarSrc, COUNT(1) AS Aantal, C.Sort , C.Final, C.DoConvert
FROM            (
                          SELECT        [Doc Status], SonarSrc
                                                    FROM            [Doc DropOut]
                                                    UNION ALL
                                                    SELECT        DocStatus, Source
                                                    FROM            [Documents]
                                                    ) AS D right outER JOIN
                                                    MetadataStatus AS C ON D .[Doc Status] = C.ID
                          GROUP BY C.ID, C.Name, C.Sort, IsNull(D.SonarSrc,0), C.Final, C.DoConvert
                                          Having C.Sort > 0
Union All
Select 3 AS ID, 'Sonar' AS [Name], SonarSrc, Count(1) AS Aantal, 0 as Sort, -1 AS Final, 0 AS DoConvert
From Sonar
Group by SonarSrc
) AS S
PIVOT (sum(Aantal) FOR SonarSrc IN ([0], [1], [2], [3])) AS P
) V
ORDER BY Sort
GO
/****** Object:  View [dbo].[EaProgress]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[EaProgress] as
SELECT        Doc, BSN, Status, BerichtNr, Prepared, Queued, Received, EA, CASE prepind + queind + recind WHEN 1 THEN '1-Prepared' WHEN 2 THEN CASE WHEN Queued IS NULL 
                         THEN '4-Failed' ELSE '2-Queued' END WHEN 3 THEN case when EA is null then '4-Failed'else '3-Received' end ELSE '?' END AS Ind, XML, 1 as Cnt
FROM            (SELECT        A.BSN, A.Status, A.BerichtNr, A.Prepared, CASE WHEN Prepared IS NULL THEN 0 ELSE 1 END AS PrepInd, B.Queued, CASE WHEN Queued IS NULL THEN 0 ELSE 1 END AS QueInd, C.Received, 
                                                    CASE WHEN Received IS NULL OR
                                                    Queued IS NULL THEN 0 ELSE 1 END AS RecInd, A.EA, A.XML, A.Doc
                          FROM            (SELECT        K.SOC_SECURITY_NUM AS BSN, P.Moment AS Prepared, X.BerichtNr, X.ID, P.Batch, S.Name AS Status, P.[File] AS XML, P.Doc, X.EA
                                                    FROM            Batches AS B INNER JOIN
                                                                              ProcessDetails AS P ON B.ID = P.Batch INNER JOIN
                                                                              [Doc per Klant] AS X ON P.[Doc/Klant] = X.ID INNER JOIN
                                                                              Documents AS D ON P.Doc = D.ID INNER JOIN
                                                                              Klanten AS K ON X.Klant = K.ID INNER JOIN
                                                                              ProcessStatus AS S ON X.ProcStatus = S.ID
                                                    WHERE        (P.Step = 19) AND (D.DocStatus = 2)) AS A LEFT OUTER JOIN
                                                        (SELECT        Moment AS Queued, [Doc/Klant], Batch
                                                          FROM            ProcessDetails AS P
                                                          WHERE        (Step = 27)) AS B ON A.Batch = B.Batch AND A.ID = B.[Doc/Klant] LEFT OUTER JOIN
                                                        (SELECT        P.Moment AS Received, P.[Doc/Klant], P.Batch
                                                          FROM            ProcessDetails AS P INNER JOIN
                                                                                    [Doc per Klant] ON P.[Doc/Klant] = [Doc per Klant].ID
                                                          WHERE        (P.Step = 26)) AS C ON A.Batch = C.Batch AND A.ID = C.[Doc/Klant]) AS V
--ORDER BY BSN
GO
/****** Object:  View [dbo].[ExecOverview]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[ExecOverview] as
Select operation_id, package_name, [Start], min(Moment) AS Moment
, sum([10]) AS PreValidate
, sum([20]) AS PostValidate
, sum([30]) AS PreExecute
, sum([40]) AS PostExecute
, sum([120]) AS Error
, sum([130]) AS TaskFailed From (
Select * from (
SELECT  G.operation_id, package_name, G.Start, cast(message_time as datetime) AS Moment, 
datediff(millisecond, lag(message_time,1) over (partition by M.message_source_name, M.operation_id order by message_time), message_time) AS Elapsed, 
message_type, event_name
FROM  SSISdb.internal.event_messages M  inner join SSISDB.internal.operation_messages O on M.event_message_id = O.operation_message_id
inner join (SELECT  MIN('''' + CONVERT(varchar(20), CAST(message_time AS smalldatetime), 120)) AS Start, O.operation_id, E.message_source_name
FROM  SSISDB.internal.event_messages E inner join SSISDB.internal.operation_messages O on E.event_message_id = O.operation_message_id
GROUP BY O.operation_id, message_source_name) G 
on M.operation_id=G.operation_id and G.message_source_name=M.message_source_name
WHERE (M.message_source_name + '.dtsx' = package_name)
 and message_type not in  (70, 110)
 and package_name in ('ProcF - Receive from EA - Master.dtsx', 'ProcE - Send to EA - Master.dtsx', 'MigStraat C-D.dtsx', 'ProcB - Load Werkvoorraad.dtsx',
 'ProcA - Import Sonar - Master.dtsx')
 ) A
  Pivot (sum(Elapsed) for [message_type] in ([10], [20], [30], [40], [120], [130]) ) P
  ) V
group by  operation_id, package_name, [Start]

GO
/****** Object:  View [dbo].[Main ProcessSteps]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Main ProcessSteps]
AS
SELECT        ID, Name
FROM            dbo.ProcessSteps
WHERE        (IsMainStep = 1)
GO
/****** Object:  View [dbo].[ModuleOverview]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ModuleOverview] as
SELECT        T.Name AS Type, M.ID as ModID, M.Name AS Module, M.Path, V.ID as VerID, V.Version, V.Datum, P.PrimairProces
FROM            (SELECT        MAX(ID) AS MaxID, Module
                          FROM            [Module Versions]
                          GROUP BY Module) AS [Current Version] INNER JOIN
                         [Module Versions] AS V ON [Current Version].MaxID = V.ID RIGHT OUTER JOIN
                         Modules AS M INNER JOIN
                         [Module Types] AS T ON M.Type = T.ID ON V.Module = M.ID LEFT OUTER JOIN
                             (SELECT        Module, COUNT(1) AS PrimairProces
                               FROM            [Modules per MainStep]
                               GROUP BY Module) AS P ON P.Module = M.ID
WHERE        (M.Active = 1)
GO
/****** Object:  View [dbo].[ParamOverzicht]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ParamOverzicht] as
select Type, ID, Parameter, 
  [A - Sonar]
, [A3 - Activity]
, [A2 - Case]
, [A1 - Contact]
, [B - Validatie]
, [B1 - Hard]
, [B2 - Zacht]
, [C1 - Unzip]
, [C2 - PDF/A]
, [C3 - XML4EA]
, [E - EA Send]
, [F - EA Response]
FROM            (
SELECT        S.Caption AS Step, P.Name AS Parameter, V.Param AS ID, ParamType.Name AS Type, CAST(V.ValNum AS varchar(255)) AS Waarde
FROM            Params AS P INNER JOIN
                         [Control Params] AS V ON P.ID = V.Param INNER JOIN
                         ProcessSteps AS S ON V.Step = S.ID INNER JOIN
                         ParamType ON P.Type = ParamType.ID
                          WHERE        (P.Type = 1)
                          UNION
SELECT        S.Caption AS Step, P.Name AS Parameter, V.Param AS ID, ParamType.Name AS Type, CAST(V.ValDate AS varchar(255)) AS Waarde
FROM            Params AS P INNER JOIN
                         [Control Params] AS V ON P.ID = V.Param INNER JOIN
                         ProcessSteps AS S ON V.Step = S.ID INNER JOIN
                         ParamType ON P.Type = ParamType.ID
WHERE        (P.Type = 3)
                          UNION
SELECT        S.Caption AS Step, P.Name AS Parameter, V.Param AS ID, ParamType.Name AS Type, CAST(V.ValStr AS varchar(255)) AS Waarde
FROM            Params AS P INNER JOIN
                         [Control Params] AS V ON P.ID = V.Param INNER JOIN
                         ProcessSteps AS S ON V.Step = S.ID INNER JOIN
                         ParamType ON P.Type = ParamType.ID
WHERE        (P.Type = 2)
) AS A
pivot ( max(Waarde) for Step in (
  [A - Sonar]
, [A3 - Activity]
, [A2 - Case]
, [A1 - Contact]
, [B - Validatie]
, [B1 - Hard]
, [B2 - Zacht]
, [C1 - Unzip]
, [C2 - PDF/A]
, [C3 - XML4EA]
, [E - EA Send]
, [F - EA Response]
) ) Z
GO
/****** Object:  View [dbo].[PerfOverview]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*ORDER BY Name, Run, Batch*/
CREATE VIEW [dbo].[PerfOverview]
AS
SELECT        Name, Run AS RunID, Batch AS BatchID, Software, Moment, Elapsed, Aantal, ROUND(CAST(Elapsed AS float) / Aantal, 2) AS [Doc Gem], Procstart
FROM            (SELECT        S.Name, R.ID AS Run, Y.Batch, Y.Moment, ISNULL(SUM(Y.Aantal), 0) AS Aantal, SUM(Y.Elapsed) AS Elapsed, V.Name AS Software, R.Created AS Procstart
                          FROM            SoftwareVersion AS V INNER JOIN
                                                    Runs AS R ON V.ID = R.Software LEFT OUTER JOIN
                                                        (SELECT        B.ProcStart, B.Run, D.Step, D.Batch, LEFT(CONVERT(varchar(20), B.ProcStart, 120), 13) AS Moment, COUNT(*) AS Aantal, DATEDIFF(SECOND, B.ProcStart, B.ProcEnd) AS Elapsed
                                                          FROM            Batches AS B INNER JOIN
                                                                                    ProcessDetails AS D ON B.ID = D.Batch
                                                          WHERE        (B.ProcEnd IS NOT NULL)
                                                          GROUP BY B.Run, D.Step, D.Batch, B.ProcStart, B.ProcEnd) AS Y ON R.ID = Y.Run AND R.Step = Y.Step INNER JOIN
                                                    ProcessSteps AS S ON R.Step = S.ID
                          GROUP BY S.Name, R.ID, Y.Batch, Y.Moment, V.Name, R.Created) AS X
GO
/****** Object:  View [dbo].[ProcProgress]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProcProgress]
AS
SELECT        D.ID, S.Name AS Step, O.Name AS Status, P.[File] AS Path, P.KB AS [Path Ind], U.[File] AS SAF, U.KB AS [SAF KB], X.[File] AS XFDF, X.KB AS [XFDF KB], F.[File] AS PDF, F.KB AS [PDF KB], L.[File] AS XML, 
                         L.KB AS [XML KB], T.Name AS Template, Y.Name AS Ext, E.Error, CASE WHEN isnull(p.kb, - 1) = - 1 THEN '1-Path' WHEN isnull(u.kb, - 1) = - 1 THEN '2-SAF' WHEN isnull(x.kb, - 1) 
                         = - 1 THEN '3-Content' WHEN isnull(f.kb, - 1) = - 1 THEN '4-PDF' WHEN isnull(l.kb, - 1) = - 1 THEN '5-XML' ELSE '6-OK' END AS Audit, 1 AS Cnt
FROM            dbo.Documents AS D INNER JOIN
                         dbo.ProcessSteps AS S ON S.ID = D.CurrentStep INNER JOIN
                         dbo.ProcessStatus AS O ON D.ProcStatus = O.ID INNER JOIN
                         dbo.MetadataStatus AS M ON D.DocStatus = M.ID LEFT OUTER JOIN
                             (SELECT        Doc, COUNT(1) AS Error
                               FROM            dbo.ProcessErrors
                               GROUP BY Doc) AS E ON D.ID = E.Doc LEFT OUTER JOIN
                         dbo.[xFdF Templates] AS T ON D.[xFdF Template] = T.ID LEFT OUTER JOIN
                         dbo.FileTypes AS Y ON T.FileType = Y.ID LEFT OUTER JOIN
                             (SELECT        Doc, [File], FileSize_KB AS KB
                               FROM            dbo.ProcessDetails
                               WHERE        (Step = 34)) AS P ON D.ID = P.Doc LEFT OUTER JOIN
                             (SELECT        Doc, [File], FileSize_KB AS KB
                               FROM            dbo.ProcessDetails AS ProcessDetails_2
                               WHERE        (Step = 35)) AS U ON D.ID = U.Doc LEFT OUTER JOIN
                             (SELECT        Doc, [File], FileSize_KB AS KB
                               FROM            dbo.ProcessDetails AS ProcessDetails_1
                               WHERE        (Step = 22)) AS X ON D.ID = X.Doc LEFT OUTER JOIN
                             (SELECT        Doc, [File], FileSize_KB AS KB
                               FROM            dbo.ProcessDetails AS ProcessDetails_1
                               WHERE        (Step = 5)) AS F ON D.ID = F.Doc LEFT OUTER JOIN
                             (SELECT        Doc, [File], FileSize_KB AS KB
                               FROM            dbo.ProcessDetails AS ProcessDetails_1
                               WHERE        (Step = 24)) AS L ON D.ID = L.Doc
WHERE        (M.DoConvert = 1)
GO
/****** Object:  View [dbo].[RunOverview]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[RunOverview] as
SELECT        TOP (9999999) Proces, Moment, SUM(Soll) AS Soll, SUM(Ist) AS Ist, Versie, Vanaf, Created
FROM            (SELECT   Created,     P.Name AS Proces, SW.Name AS Versie, SW.Vanaf, RIGHT('000' + CAST(DATEDIFF(day, V.Van, R.Created) AS varchar(9)), 3) + ' ' + RIGHT('00' + CAST(DATEPART(hour, R.Created) AS varchar(9)), 2) 
                                                    + ':' + RIGHT('00' + CAST(DATEPART(minute, R.Created) AS varchar(9)), 2) + ':' + RIGHT('00' + CAST(DATEPART(second, R.Created) AS varchar(9)), 2) AS Moment, R.[# Batches] * R.[# Extend] AS Soll, 
                                                    ISNULL(X.Ist, 0) AS Ist
                          FROM            (SELECT        (SELECT        MAX(Created) AS Expr1
                                                                               FROM            Runs AS Y
                                                                               WHERE        (Step = 16) AND (ID <= Z.ID)) AS Created, ID, [# Batches], [# Extend], Software, Step
                                                    FROM            Runs AS Z) AS R INNER JOIN
                                                    SoftwareVersion AS SW ON R.Software = SW.ID INNER JOIN
                                                    ProcessSteps AS P ON SW.Step = P.ID LEFT OUTER JOIN
                                                        (SELECT        D.Step, B.Run, COUNT(DISTINCT D.Doc) AS Ist
                                                          FROM            ProcessDetails AS D INNER JOIN
                                                                                    Batches AS B ON D.Batch = B.ID
                                                          GROUP BY D.Step, B.Run) AS X ON R.Step = X.Step AND R.ID = X.Run INNER JOIN
                                                        (SELECT        MIN(Created) AS Van
                                                          FROM            Runs) AS V ON R.Created >= V.Van
                          WHERE        (R.Step BETWEEN 16 AND 19)) AS V
GROUP BY Proces, Moment, Versie, Vanaf, Created
ORDER BY Created
GO
/****** Object:  View [dbo].[StandReport View]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StandReport View]
AS
SELECT        M.Moment, D.[MD Uitval] AS [U1 MD Akkoord], D.[MD Onbeslist] AS [U2 Open], D.[Open] AS [P1 Open], D.Running AS [P2 Running], D.Success AS [P4 Success], D.Failed AS [U3 Process]
FROM            dbo.Standen AS M INNER JOIN
                         dbo.[Standen Report] AS D ON M.ID = D.Stand
GO
/****** Object:  View [dbo].[TableExtents]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TableExtents] as 
SELECT Top 200
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    7 desc
GO
/****** Object:  View [dbo].[UtilOverview]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[UtilOverview]
AS
SELECT        TOP (999999) 
RIGHT('000' + CAST(DATEDIFF(day, R.Van, U.Moment) AS varchar(9)), 3) + ' ' + RIGHT('00' + CAST(DATEPART(hour, U.Moment) AS varchar(9)), 2) + ':' + RIGHT('00' + CAST(DATEPART(minute, 
                         U.Moment) AS varchar(9)), 2) + ':' + RIGHT('00' + CAST(DATEPART(second, U.Moment) AS varchar(9)), 2) AS Label, Moment
, CASE CPU WHEN 0 THEN 105 ELSE cpu END AS CPU
FROM            dbo.Utilization AS U INNER JOIN
                             (SELECT        MIN(Created) AS Van
                               FROM            dbo.Runs) AS R ON U.Moment >= R.Van
Where DATEPART(Second, Moment) = 0
ORDER BY Moment
GO
/****** Object:  View [dbo].[X]    Script Date: 20-1-2020 09:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[X] as
Select cast('B749B93D-ED69-4548-B188-8238956C44ED' AS uniqueidentifier) AS BNr,  cast('9BCB0D88-FA4C-429A-B2BA-AC487488F45C' AS uniqueidentifier) AS ENr Union
Select cast('12E6B96B-32BC-46AE-979F-A3D02AF83593' AS uniqueidentifier) AS BNr,  cast('16B4F930-2C48-4943-B796-7D6D196CA042' AS uniqueidentifier) AS Enr Union
Select cast('F88078F6-6A16-4544-AD9A-FB2975A0502E' AS uniqueidentifier) AS BNr,  cast('9BDAFFA9-6B54-4940-9DB1-E46346577446' AS uniqueidentifier) AS Enr Union
Select cast('FCBDCA68-1D25-435B-B151-01B310FDE153' AS uniqueidentifier) AS BNr,  cast('115DE9C2-3CD2-49FF-8FFF-38314B48D8CA' AS uniqueidentifier) AS Enr Union
Select cast('5947CB0A-9C82-4EA0-AFCB-3988CEBE76C8' AS uniqueidentifier) AS BNr,  cast('02989605-B763-4FF2-A4CF-73F47694D3B0' AS uniqueidentifier) AS Enr Union
Select cast('73467F26-3C0E-4173-A8B0-550CEA20E5AB' AS uniqueidentifier) AS BNr,  cast('EFCD0915-EF7A-463C-9C69-BBE8D8BDB3EC' AS uniqueidentifier) AS Enr Union
Select cast('4D4A0382-91F1-4EAA-9916-FB749172CB77' AS uniqueidentifier) AS BNr,  cast('93BCAD52-7B44-4F68-AC40-7E8405972B7E' AS uniqueidentifier) AS Enr Union
Select cast('A21B08E3-E389-4F05-9053-DB91A108DEDF' AS uniqueidentifier) AS BNr,  cast('B3504D39-1E73-47E7-B280-0F1420F409AB' AS uniqueidentifier) AS Enr Union
Select cast('C09B5AEF-91E9-436E-9747-09A4668CB11B' AS uniqueidentifier) AS BNr,  cast('8A138A33-B667-49D4-8B1D-D6F033694BFB' AS uniqueidentifier) AS Enr Union
Select cast('A473BA00-C995-4811-961C-2B33CB801762' AS uniqueidentifier) AS BNr,  cast('41E80DD1-93BC-4691-B0FB-6A746539A7BA' AS uniqueidentifier) AS Enr Union
Select cast('E7137D39-E9D7-4A44-8B62-A992A3F1420D' AS uniqueidentifier) AS BNr,  cast('A27CB9BC-A1FB-4DD6-A657-18BF17A1BBF9' AS uniqueidentifier) AS Enr Union
Select cast('89BA7B51-5562-49AC-8662-9274C0B02BEB' AS uniqueidentifier) AS BNr,  cast('22421BA8-F0F8-4B5D-AF33-D11B505D9068' AS uniqueidentifier) AS Enr Union
Select cast('658B5428-D787-4640-AF53-6251BBCF5263' AS uniqueidentifier) AS BNr,  cast('4679D2F4-36C9-4BE8-A709-40A3CCBBA751' AS uniqueidentifier) AS Enr Union
Select cast('171BC207-2BD1-40DB-8C51-0B9C81640C94' AS uniqueidentifier) AS BNr,  cast('F40A3F8D-2DA1-42ED-8C29-420A3B21DF8E' AS uniqueidentifier) AS Enr Union
Select cast('A82FDC0C-9A3B-4962-90E4-78620B840312' AS uniqueidentifier) AS BNr,  cast('E7E1D078-BEC6-415D-B765-DE16A68E4AD3' AS uniqueidentifier) AS Enr Union
Select cast('634A189B-FB75-465C-97EF-EA8276DDA4BE' AS uniqueidentifier) AS BNr,  cast('0502B396-1C78-489E-9134-7DF1BCF25B3E' AS uniqueidentifier) AS Enr Union
Select cast('AE088D11-F25C-4E33-848A-106F9BCB40A5' AS uniqueidentifier) AS BNr,  cast('3D827871-6024-4AFA-9E1C-3B1ED44E5461' AS uniqueidentifier) AS Enr Union
Select cast('6B172ABE-DF24-497C-85AB-9BF7C37A30EE' AS uniqueidentifier) AS BNr,  cast('9DD00C88-8D77-48C8-9D6F-97A9F5344670' AS uniqueidentifier) AS Enr Union
Select cast('1F4BA236-C116-4A70-B5B8-CD6930D486E1' AS uniqueidentifier) AS BNr,  cast('35F0264A-9EC7-4AD8-8EC0-B21B5E9AD1E5' AS uniqueidentifier) AS Enr Union
Select cast('1D5087E0-4A25-4602-98E2-646558D7AA5A' AS uniqueidentifier) AS BNr,  cast('F6A07BC8-13B6-40CF-BFC1-AC9D2EB9A086' AS uniqueidentifier) AS Enr Union
Select cast('13E4FF90-F4A9-4AD5-97D3-094824DFD84F' AS uniqueidentifier) AS BNr,  cast('69850538-0635-4BF6-A751-21DF5966799B' AS uniqueidentifier) AS Enr Union
Select cast('8153244D-A14A-491C-BEC8-2F7B0424B354' AS uniqueidentifier) AS BNr,  cast('D172EA00-9FDE-4266-8237-84C563A7B4D0' AS uniqueidentifier) AS Enr Union
Select cast('00E6A835-61BC-4DCA-8798-BB3FC94E44D4' AS uniqueidentifier) AS BNr,  cast('E968FC61-94A0-4CA3-A20B-2ED2FF066F65' AS uniqueidentifier) AS Enr Union
Select cast('5A4FB177-857D-4058-A942-D242C586C1C0' AS uniqueidentifier) AS BNr,  cast('E1964EC9-057F-4067-B9BC-6178011F6DE1' AS uniqueidentifier) AS Enr Union
Select cast('FFADA969-5400-404F-A6D3-75F7FB1DFCDF' AS uniqueidentifier) AS BNr,  cast('0ED66698-F2ED-40FD-B5FF-B30D776A92FC' AS uniqueidentifier) AS Enr Union
Select cast('59A81949-8ABB-486A-B6FD-DB834B3D9888' AS uniqueidentifier) AS BNr,  cast('0BE34558-DE61-4F13-9430-74D188F0D240' AS uniqueidentifier) AS Enr Union
Select cast('6DC3E1F5-C7D8-4FDE-88C8-12A4AAEE0D81' AS uniqueidentifier) AS BNr,  cast('42DB41B8-F35B-4954-8927-449B85B312F8' AS uniqueidentifier) AS Enr Union
Select cast('0FD7B8DE-09DF-4E8D-9233-0309EBD13FFD' AS uniqueidentifier) AS BNr,  cast('A45B48B4-8E47-4E93-B4E5-649B262723CE' AS uniqueidentifier) AS Enr Union
Select cast('36D273E6-1913-443E-A66F-C8967E079FF9' AS uniqueidentifier) AS BNr,  cast('FE6E546D-0CB7-4EA3-84C0-503477BB298B' AS uniqueidentifier) AS Enr Union
Select cast('DB5D3643-B0D8-4FCD-8B4F-6F990D3AAE15' AS uniqueidentifier) AS BNr,  cast('A7BB64D0-FD1B-4828-817D-FC111A2AD05B' AS uniqueidentifier) AS Enr Union
Select cast('57CBB8B3-1163-4471-A666-DD3587CE7F54' AS uniqueidentifier) AS BNr,  cast('A8F46DE3-064D-4FAD-92A7-68E7A6DBD1AD' AS uniqueidentifier) AS Enr Union
Select cast('2C93FD73-4A2A-49AD-AB86-EAA2BC002D52' AS uniqueidentifier) AS BNr,  cast('8F71AC49-2140-4B9D-A331-1FF8E977941C' AS uniqueidentifier) AS Enr Union
Select cast('DB3F14B0-D67C-4E63-841B-15FDCCE2ED1E' AS uniqueidentifier) AS BNr,  cast('3BD0E8DC-EDF0-4767-A573-B1A497C9CF1D' AS uniqueidentifier) AS Enr Union
Select cast('76F85E50-6F49-468F-9B53-D3A7E97638CD' AS uniqueidentifier) AS BNr,  cast('538FFFC6-4EA6-4850-A4E7-08FC54F08E86' AS uniqueidentifier) AS Enr Union
Select cast('0A96327C-C0CA-4597-863E-E560FD85DA77' AS uniqueidentifier) AS BNr,  cast('79072B5A-7FD2-4BA2-8EB2-17E3C205FCCB' AS uniqueidentifier) AS Enr Union
Select cast('F3792E2F-3C9A-41A1-83B7-DECF68730B32' AS uniqueidentifier) AS BNr,  cast('B9049EAC-69CC-4005-98A7-F7713F3C327A' AS uniqueidentifier) AS Enr Union
Select cast('0965995A-A443-479A-9B66-2191F5812C83' AS uniqueidentifier) AS BNr,  cast('FF72ECF4-F0D1-4A63-B4C0-4BB9E0EDEA57' AS uniqueidentifier) AS Enr Union
Select cast('02FCF335-F444-4293-8B1C-82E614A40E8C' AS uniqueidentifier) AS BNr,  cast('99824D17-1B11-4EBC-AE82-CAC149D45D2A' AS uniqueidentifier) AS Enr Union
Select cast('AADB1083-13E2-432D-B714-F1346D35A34E' AS uniqueidentifier) AS BNr,  cast('62339374-B914-4044-AE6E-C063CEA84E3C' AS uniqueidentifier) AS Enr Union
Select cast('7543EDEC-52C6-4996-B71D-63B820549905' AS uniqueidentifier) AS BNr,  cast('0353A11C-53AA-4CD3-8CCD-E0F0D0FBFA84' AS uniqueidentifier) AS Enr Union
Select cast('8DFDBEC0-DF9E-4501-B099-C89AFDC463B3' AS uniqueidentifier) AS BNr,  cast('C7FE838C-1225-420C-8926-64B5C78C1DF9' AS uniqueidentifier) AS Enr Union
Select cast('6E8A991C-5105-4C81-9641-D89324872B45' AS uniqueidentifier) AS BNr,  cast('E7A76AF1-B04D-451B-B903-B8AB72A38A79' AS uniqueidentifier) AS Enr Union
Select cast('C267D327-3CEE-4A97-96C5-7593E8C77337' AS uniqueidentifier) AS BNr,  cast('1155248E-0EAE-4D7A-BC60-8ECF87663C2B' AS uniqueidentifier) AS Enr Union
Select cast('60567DF2-76F7-4091-9F45-9BAB7F4E9A46' AS uniqueidentifier) AS BNr,  cast('0E2ECA35-40C9-4C83-BD45-D593DC43CF23' AS uniqueidentifier) AS Enr Union
Select cast('FB0CBB52-42ED-4ACF-8D28-2AD9A9B3C73C' AS uniqueidentifier) AS BNr,  cast('986484F0-76D7-4BCB-868E-C95D765F49E9' AS uniqueidentifier) AS Enr Union
Select cast('ADAEE678-5281-49E2-915A-A1DBF2F9EAF2' AS uniqueidentifier) AS BNr,  cast('858DF4D8-CB00-4095-937E-431A614696EE' AS uniqueidentifier) AS Enr Union
Select cast('E235CBF8-5A7A-4367-89FA-168128FCDD58' AS uniqueidentifier) AS BNr,  cast('43C835F0-9898-4953-89CE-6380D21B3CE8' AS uniqueidentifier) AS Enr Union
Select cast('9135CC49-4DE5-4024-A904-1CB13CEA2E4B' AS uniqueidentifier) AS BNr,  cast('2F101BDB-AFE2-495E-9403-1FFCDC9DB630' AS uniqueidentifier) AS Enr Union
Select cast('6852F9F3-0876-479A-AA01-58A88AC4CF88' AS uniqueidentifier) AS BNr,  cast('79F41F4F-7332-4324-B4A4-FD43CF73CE8B' AS uniqueidentifier) AS Enr Union
Select cast('C07D4B32-89C0-4382-96B4-D12DBE850425' AS uniqueidentifier) AS BNr,  cast('9E485402-2767-4B06-9FC6-6416CE7F169C' AS uniqueidentifier) AS Enr Union
Select cast('B1C4CC4E-8FF5-48E9-8C02-FF063862B079' AS uniqueidentifier) AS BNr,  cast('F8E72B23-D02D-467C-ACF7-B6E7863FAF2D' AS uniqueidentifier) AS Enr Union
Select cast('C217E08A-E84E-410A-80C7-4665F09C6282' AS uniqueidentifier) AS BNr,  cast('C78AAA02-37A3-4F43-A0FA-4E8D6A8BDD16' AS uniqueidentifier) AS Enr Union
Select cast('AA4CAB1F-170C-4E8D-9F47-0534E9350180' AS uniqueidentifier) AS BNr,  cast('F42EE009-D190-4E9E-8D7F-3F6A36D60E87' AS uniqueidentifier) AS Enr Union
Select cast('052E5A4D-0F2F-4B04-9152-16F38DF56EE5' AS uniqueidentifier) AS BNr,  cast('96E6DAE8-C6B5-4E4A-B647-D7F0E6A3C5B8' AS uniqueidentifier) AS Enr Union
Select cast('A43E8823-B523-44C6-9117-3BE8C1FE519C' AS uniqueidentifier) AS BNr,  cast('41C8CDF1-A5EC-4DCC-A49D-E42A7CC5393A' AS uniqueidentifier) AS Enr Union
Select cast('5DF5DD9C-7B91-4299-80F0-9F91CA83E822' AS uniqueidentifier) AS BNr,  cast('44BCB4A5-CE50-4AA6-8151-ED5532BAE54D' AS uniqueidentifier) AS Enr Union
Select cast('EB53EC97-E48B-42D3-A0E8-192022399C4D' AS uniqueidentifier) AS BNr,  cast('A2DCC6DE-7CCA-4191-B064-7E26B649A9DE' AS uniqueidentifier) AS Enr Union
Select cast('A0C0F821-439E-41A3-B877-BD0172E40AD5' AS uniqueidentifier) AS BNr,  cast('EF385221-6AE0-4417-BF06-0204FA21A0F0' AS uniqueidentifier) AS Enr Union
Select cast('4B88DE02-7363-411F-A73E-3873B8067B7C' AS uniqueidentifier) AS BNr,  cast('E364026B-3B06-4B1E-99C6-77A5254DFB2C' AS uniqueidentifier) AS Enr Union
Select cast('0D21C8A6-16E7-4F08-9393-4376C6431693' AS uniqueidentifier) AS BNr,  cast('B99228DA-1CB1-43AE-8D36-D8F62963CDF3' AS uniqueidentifier) AS Enr Union
Select cast('A777E33C-3CBB-4094-954E-59F80BA2E346' AS uniqueidentifier) AS BNr,  cast('C8133E37-141D-40FE-9825-29F4ED8CA9DA' AS uniqueidentifier) AS Enr Union
Select cast('71DB8CB6-2601-498C-8982-51BDF4CD1674' AS uniqueidentifier) AS BNr,  cast('762575AE-5A79-48C7-AFCB-7A82B980C54A' AS uniqueidentifier) AS Enr Union
Select cast('C71AB7DF-89DC-49AC-BE49-C82A9FD34413' AS uniqueidentifier) AS BNr,  cast('EF08CEB4-F06B-45B7-98E0-C1BD1DD206DF' AS uniqueidentifier) AS Enr Union
Select cast('AE0EC42C-2CD9-4874-BC47-2E05E7AFE015' AS uniqueidentifier) AS BNr,  cast('73765326-10EA-42D3-90F9-4383B4153ECF' AS uniqueidentifier) AS Enr Union
Select cast('7C6AF85E-DBB7-4D26-80CD-AD15D43FB1BC' AS uniqueidentifier) AS BNr,  cast('140D8E01-6DCD-4180-B402-CA53D030F70C' AS uniqueidentifier) AS Enr Union
Select cast('40427FE2-4F49-4464-886A-9EFC1671287F' AS uniqueidentifier) AS BNr,  cast('8C573785-3FC2-4173-BB62-CF55FFD3F15A' AS uniqueidentifier) AS Enr Union
Select cast('2CF12AA9-CCD5-439F-8F28-5E8951963F12' AS uniqueidentifier) AS BNr,  cast('231C79DA-0FDA-46B5-8B88-593CFFCF4DEC' AS uniqueidentifier) AS Enr Union
Select cast('EC13F3F3-99D0-4527-82D1-734C21980206' AS uniqueidentifier) AS BNr,  cast('F15AD50B-AB4D-44B8-9D44-2C05B157DCBA' AS uniqueidentifier) AS Enr Union
Select cast('A6534321-FD58-46F0-BD23-46CAD755FA21' AS uniqueidentifier) AS BNr,  cast('FFF8158A-2030-4673-B7DF-4F13E3B51EA0' AS uniqueidentifier) AS Enr Union
Select cast('B4D710CF-D1C0-4752-A42A-0F7EDA400EFC' AS uniqueidentifier) AS BNr,  cast('9AA26DF4-6F3B-4AE2-B23C-2E53FF4D88D8' AS uniqueidentifier) AS Enr Union
Select cast('8BB79F1C-8243-4C02-8E9F-184DE22789D0' AS uniqueidentifier) AS BNr,  cast('984F796F-3057-4BFE-B7C7-6D06E087A196' AS uniqueidentifier) AS Enr Union
Select cast('89D7C09D-8001-4AE8-9B40-AFF2EE9E22AF' AS uniqueidentifier) AS BNr,  cast('FACCE67E-60FA-4C83-82D9-E2064F608809' AS uniqueidentifier) AS Enr Union
Select cast('3DE3D7FE-4C6E-42FF-901C-AAABDC7146FE' AS uniqueidentifier) AS BNr,  cast('4BC9E087-C6B8-4068-B945-5C09C92FB64C' AS uniqueidentifier) AS Enr Union
Select cast('C90808FA-A8BE-46EC-8975-8E6A27B3E826' AS uniqueidentifier) AS BNr,  cast('72D64EA9-1086-4BC9-974C-AF01D2B176A7' AS uniqueidentifier) AS Enr Union
Select cast('92328078-B873-44EB-985E-7A2D02959B79' AS uniqueidentifier) AS BNr,  cast('7E13C1E6-FB98-48A0-BA82-EECF9B26BD6E' AS uniqueidentifier) AS Enr Union
Select cast('E23D32AF-9C18-4D60-AB1A-4D555A9EE91F' AS uniqueidentifier) AS BNr,  cast('EC99326F-40E5-481C-AF1F-07C87DB20147' AS uniqueidentifier) AS Enr Union
Select cast('DC3E0EBA-8158-425B-B7B9-AF660D359FF6' AS uniqueidentifier) AS BNr,  cast('6867C14E-82D8-477E-A109-98E6DC4E4130' AS uniqueidentifier) AS Enr Union
Select cast('81D4C27B-6D03-439E-9B20-500CB559901A' AS uniqueidentifier) AS BNr,  cast('62F3B9F3-DAB3-48A2-8856-379C8ABB1ABC' AS uniqueidentifier) AS Enr Union
Select cast('92398EE0-60A9-4672-A7DD-A206BE5300E8' AS uniqueidentifier) AS BNr,  cast('8F7EA284-6C54-455A-8007-531419B14023' AS uniqueidentifier) AS Enr Union
Select cast('2ABF35A7-981A-4389-88B8-61A46468E371' AS uniqueidentifier) AS BNr,  cast('16E2811E-D408-43CD-AC65-0134E17622B6' AS uniqueidentifier) AS Enr Union
Select cast('05CA14B0-4CF9-4425-B966-CCA7EA2FA5AD' AS uniqueidentifier) AS BNr,  cast('6004F1E5-D357-4C60-A238-E3DC8DAB8D78' AS uniqueidentifier) AS Enr Union
Select cast('F359FCF2-EAED-43B7-8EE3-2319C3B7B60A' AS uniqueidentifier) AS BNr,  cast('E1546304-D05D-422A-A2FC-A4F08311667D' AS uniqueidentifier) AS Enr Union
Select cast('0FD2980D-AAF0-43FE-B659-66E212BDF257' AS uniqueidentifier) AS BNr,  cast('3A8432D0-F3A4-4F38-B519-5BD023F17151' AS uniqueidentifier) AS Enr Union
Select cast('9AEF12FA-A9D2-433C-AD9E-0FA2D16E80A2' AS uniqueidentifier) AS BNr,  cast('AAFC7F4B-509E-4C39-BEA8-4776EEBF90F8' AS uniqueidentifier) AS Enr Union
Select cast('269E8FF1-2A3A-44F3-BECA-A0338531385B' AS uniqueidentifier) AS BNr,  cast('15D8796F-3A96-48DF-AA9A-E1EA3DF0D717' AS uniqueidentifier) AS Enr Union
Select cast('E4967EE1-B6F3-4EC1-B48C-DF0940382EB9' AS uniqueidentifier) AS BNr,  cast('B53E7076-FEC6-4DCB-A4BF-8C3E7BD03B68' AS uniqueidentifier) AS Enr Union
Select cast('390CFCBC-92D6-41F1-8D24-12DC458A1EBB' AS uniqueidentifier) AS BNr,  cast('88EA89EF-A43B-49AA-B3EB-3789C1D1CDEC' AS uniqueidentifier) AS Enr Union
Select cast('714BC018-9B25-4177-BC29-C9DD45B1F825' AS uniqueidentifier) AS BNr,  cast('2D3A4E7B-F707-4BD0-9D11-0DE1E725A160' AS uniqueidentifier) AS Enr Union
Select cast('BE94A98F-A059-4492-9600-81872DBCBD67' AS uniqueidentifier) AS BNr,  cast('53A778A6-4E03-419A-B123-5F4909958639' AS uniqueidentifier) AS Enr Union
Select cast('325FE7B8-A25E-4557-8300-A8A59BD02BE1' AS uniqueidentifier) AS BNr,  cast('485BB97A-8966-41D1-A6C1-E1A3C634EDF9' AS uniqueidentifier) AS Enr Union
Select cast('3D8BC4BC-C3B9-4D66-B676-2BA82CCF3A32' AS uniqueidentifier) AS BNr,  cast('4FCAC986-869E-4597-90CA-DB93AA275CA5' AS uniqueidentifier) AS Enr Union
Select cast('CF6DC912-0D9C-49DF-9F63-BBC25AB82788' AS uniqueidentifier) AS BNr,  cast('982624DF-2197-407A-87DE-E3FA667839FA' AS uniqueidentifier) AS Enr Union
Select cast('3C86986B-4550-48FB-A7E1-E0C1A6D562DA' AS uniqueidentifier) AS BNr,  cast('86721344-EB08-4807-BEC0-0D10330E225C' AS uniqueidentifier) AS Enr Union
Select cast('50A2A7B7-63B2-4DE9-A111-F04AACE83CB8' AS uniqueidentifier) AS BNr,  cast('DD3217E9-83DE-4E89-87D2-5B9EAFDFBDFB' AS uniqueidentifier) AS Enr Union
Select cast('763EC2AD-A57C-46BA-9599-26C91C4CA33F' AS uniqueidentifier) AS BNr,  cast('B6731B36-7627-4625-B835-61F71DDA613A' AS uniqueidentifier) AS Enr Union
Select cast('AA2ABE16-403E-45DE-BF58-31748676503B' AS uniqueidentifier) AS BNr,  cast('21443A9A-06A8-4D73-B287-8BE965767580' AS uniqueidentifier) AS Enr Union
Select cast('31CF9CE1-E663-41E6-976F-1EC162017A4F' AS uniqueidentifier) AS BNr,  cast('7335E871-A2DD-4EE2-AC93-E43F0C3B848C' AS uniqueidentifier) AS Enr Union
Select cast('DF49AEFB-C1DC-4F1A-806B-C54F9A8F6014' AS uniqueidentifier) AS BNr,  cast('4D73F404-785D-4A2C-9E36-A5635504A9F5' AS uniqueidentifier) AS Enr Union
Select cast('32117163-7577-44A2-8BFD-FD467AC89FC8' AS uniqueidentifier) AS BNr,  cast('09FFDC3F-9CAC-4B47-AB7C-F18056E08300' AS uniqueidentifier) AS Enr Union
Select cast('6DE4293A-C5DD-4874-9243-34C6FB277A4D' AS uniqueidentifier) AS BNr,  cast('01BFA634-B2B5-4C54-AF5D-101503CED3EC' AS uniqueidentifier) AS Enr Union
Select cast('DEA9641D-AE7E-44A0-88D4-7A88A90524B8' AS uniqueidentifier) AS BNr,  cast('2292AF82-755B-4C54-AF0E-0CCD7231D4BB' AS uniqueidentifier) AS Enr Union
Select cast('C7971E41-F004-4E4E-950C-A05C209A036B' AS uniqueidentifier) AS BNr,  cast('615A30B5-0404-43E6-9717-F3E77450DBD3' AS uniqueidentifier) AS Enr Union
Select cast('A48B76AD-BE7E-40B9-A118-DCFE5D74C5CA' AS uniqueidentifier) AS BNr,  cast('3B19F4ED-AEE3-447A-AD0C-FA42746AC955' AS uniqueidentifier) AS Enr Union
Select cast('2A567E9B-A34C-4348-A93B-960A060581CF' AS uniqueidentifier) AS BNr,  cast('721F67A7-7712-4EA2-8AB2-8077C7371384' AS uniqueidentifier) AS Enr Union
Select cast('22804B4F-37B5-431C-A6F9-687DFACBE372' AS uniqueidentifier) AS BNr,  cast('2987D3E3-E988-42D1-B474-17CBF373343C' AS uniqueidentifier) AS Enr Union
Select cast('FC65A960-E4C6-48D2-AC8D-8C05184862B1' AS uniqueidentifier) AS BNr,  cast('FB62FED9-A090-4A0E-ACED-2D2D4CDEC509' AS uniqueidentifier) AS Enr Union
Select cast('83D183AA-42AE-4C1B-8FA4-51DBA4BFE764' AS uniqueidentifier) AS BNr,  cast('DE4F4215-1C40-4AAE-8E87-1E80C26E9C8C' AS uniqueidentifier) AS Enr Union
Select cast('1B9F8226-61EB-4D5F-BAB0-A6F42754A332' AS uniqueidentifier) AS BNr,  cast('EB1F5384-DE03-4B9F-8303-F24BA925B926' AS uniqueidentifier) AS Enr Union
Select cast('53D01B1D-325E-45F4-8518-35EBB49343AB' AS uniqueidentifier) AS BNr,  cast('C3EEB81B-0923-4160-A623-D87B700ECE33' AS uniqueidentifier) AS Enr Union
Select cast('F506F742-F856-4F37-A5C8-9499FD02B0D5' AS uniqueidentifier) AS BNr,  cast('D965B625-9A67-436E-B343-8D7564E8A0B0' AS uniqueidentifier) AS Enr Union
Select cast('7BA8F8D0-341F-4B9F-9724-B45293776015' AS uniqueidentifier) AS BNr,  cast('E02F26D9-258B-4CBF-8728-B653D6A71D04' AS uniqueidentifier) AS Enr Union
Select cast('A18F5F7F-3E69-40FA-9BB1-967C6D42BA75' AS uniqueidentifier) AS BNr,  cast('98ED3444-19FA-46A1-A9A7-B0992242E715' AS uniqueidentifier) AS Enr Union
Select cast('8479D6A5-284A-4125-B550-6AA619C6C040' AS uniqueidentifier) AS BNr,  cast('818277A7-F470-4602-8863-4B588F5FF5DB' AS uniqueidentifier) AS Enr Union
Select cast('747E9126-2181-4F6D-B9E5-B7FC9479E2F9' AS uniqueidentifier) AS BNr,  cast('92F76861-9A84-4CE4-97AE-7331CF67B740' AS uniqueidentifier) AS Enr Union
Select cast('473FFE64-3E2C-4D89-BCA4-3A930B94EB60' AS uniqueidentifier) AS BNr,  cast('0C12CE62-3B84-42EF-BBBB-6C98BCA590C9' AS uniqueidentifier) AS Enr Union
Select cast('1F0E269F-46E1-467C-A60E-BE6DC351284B' AS uniqueidentifier) AS BNr,  cast('A6F10390-EFB0-425D-B4CA-B2DA345042CF' AS uniqueidentifier) AS Enr Union
Select cast('E86ECA42-7E0D-4CB1-B41C-159555A2BFAE' AS uniqueidentifier) AS BNr,  cast('27887EBC-52C2-4936-9E7D-D6A1A0D66C76' AS uniqueidentifier) AS Enr Union
Select cast('5A613C5E-F87D-4C6D-B6C7-EDD5D11AACF9' AS uniqueidentifier) AS BNr,  cast('53922E99-68D6-43CA-B1BA-1A199440432A' AS uniqueidentifier) AS Enr Union
Select cast('632CC532-A38B-40AE-93F2-871B4A99EA09' AS uniqueidentifier) AS BNr,  cast('1CDD1646-1262-4DC5-A570-E97578E97074' AS uniqueidentifier) AS Enr Union
Select cast('E9D08A8B-16B1-4F76-89B5-1E41D07001B2' AS uniqueidentifier) AS BNr,  cast('B52F3512-383B-4F28-8EB1-68DBE3873CAA' AS uniqueidentifier) AS Enr Union
Select cast('BE9F9A8F-5444-4320-AF8E-86BF2CC75E94' AS uniqueidentifier) AS BNr,  cast('10F16EF4-2FFA-46BF-A755-4BD37684BE6F' AS uniqueidentifier) AS Enr Union
Select cast('4FB4D601-C5EE-4939-A973-97F9ECB5F1C5' AS uniqueidentifier) AS BNr,  cast('9C9740B4-EF6E-4D29-8741-FB80F19F0247' AS uniqueidentifier) AS Enr Union
Select cast('F98B521D-0B22-460E-BFD7-50824BC0B980' AS uniqueidentifier) AS BNr,  cast('8741C88C-BE37-4F37-8F75-7C4A45C8046F' AS uniqueidentifier) AS Enr Union
Select cast('22366A70-0ED0-43E2-BD75-280C53BB6091' AS uniqueidentifier) AS BNr,  cast('D0C29239-2232-4635-8FAA-400DC41634C0' AS uniqueidentifier) AS Enr Union
Select cast('E6202DCC-5D4F-42E1-AA8B-CD33971540D2' AS uniqueidentifier) AS BNr,  cast('563C2C4B-727F-4467-8700-5D6EB98979C6' AS uniqueidentifier) AS Enr Union
Select cast('865A595B-031D-4CD7-8ED5-6FF46F13129E' AS uniqueidentifier) AS BNr,  cast('BFFE26C5-981A-4739-870E-01DBE3F630A7' AS uniqueidentifier) AS Enr Union
Select cast('7987B755-B8F6-47A4-8EE2-B0063F951218' AS uniqueidentifier) AS BNr,  cast('9314E6C6-4A3F-4841-88C0-C4E837AE26B0' AS uniqueidentifier) AS Enr Union
Select cast('12DB1ECE-D1B5-4C1C-A3C7-90E4B452880F' AS uniqueidentifier) AS BNr,  cast('1D456E83-95DE-4DBD-B47F-991309545A55' AS uniqueidentifier) AS Enr Union
Select cast('C1E724E0-2AB2-4252-8D32-46F01D978CF3' AS uniqueidentifier) AS BNr,  cast('12F539BD-7E02-4208-BA09-FB10675081BD' AS uniqueidentifier) AS Enr Union
Select cast('46909BA7-0990-434E-AFFD-1657E75DB881' AS uniqueidentifier) AS BNr,  cast('F133DB07-06FB-4BC2-B83F-507854F936D5' AS uniqueidentifier) AS Enr Union
Select cast('59CA1EF9-4DA6-40B8-926A-917EB59DAFCA' AS uniqueidentifier) AS BNr,  cast('77FA8B08-98AD-43B3-8772-DF5F3B29C34A' AS uniqueidentifier) AS Enr Union
Select cast('93AA46D2-6872-49C1-9055-07D86BA2B5DF' AS uniqueidentifier) AS BNr,  cast('6E23B6AA-27CB-42DC-9FCE-D75062F2B981' AS uniqueidentifier) AS Enr Union
Select cast('AA2591B0-1785-4116-B690-A47B96E0E866' AS uniqueidentifier) AS BNr,  cast('5A503504-496D-4C42-A6A1-25ECBA4C4340' AS uniqueidentifier) AS Enr Union
Select cast('CBD43F0F-9DEE-4AF1-B353-6651BD0B2E50' AS uniqueidentifier) AS BNr,  cast('29969057-2DAF-4C9A-A6FC-86D754C7378F' AS uniqueidentifier) AS Enr Union
Select cast('0ADE3D3F-3250-4514-A3F8-63DC5D05818C' AS uniqueidentifier) AS BNr,  cast('AAC1653C-D967-46D9-BBFC-D6156AEB5F6F' AS uniqueidentifier) AS Enr Union
Select cast('3D912678-5676-4EFE-A576-469F579D2BED' AS uniqueidentifier) AS BNr,  cast('5629EC44-D4AB-48DA-847E-6537BA128908' AS uniqueidentifier) AS Enr Union
Select cast('246903F2-65DC-4EEF-AA6C-E3B65DFE0678' AS uniqueidentifier) AS BNr,  cast('70C03608-C50F-46CE-8B6B-36D392384930' AS uniqueidentifier) AS Enr Union
Select cast('4B39DD43-8624-4763-BF53-6C50CD260AB6' AS uniqueidentifier) AS BNr,  cast('F5057A86-21DA-4C6D-AFD6-1DBE3E97336E' AS uniqueidentifier) AS Enr Union
Select cast('76691E8F-929F-41E3-9AA1-480A1D58DF79' AS uniqueidentifier) AS BNr,  cast('CF118D78-BC02-4B5E-8981-3779513C6070' AS uniqueidentifier) AS Enr Union
Select cast('A64C1CC0-E313-40DD-A531-8BE7DAF93EFF' AS uniqueidentifier) AS BNr,  cast('00D0385F-150B-45B0-B17C-25317242E2FC' AS uniqueidentifier) AS Enr Union
Select cast('3EE70718-B4E7-44FC-A142-4307D3607FE5' AS uniqueidentifier) AS BNr,  cast('8D0A8AAB-1525-4C11-BF34-6549F705B8E0' AS uniqueidentifier) AS Enr Union
Select cast('DFF3C83B-8DAF-4566-8C82-B03C05A8FECD' AS uniqueidentifier) AS BNr,  cast('1B7F9382-1F39-40B2-9957-149C61FD135F' AS uniqueidentifier) AS Enr Union
Select cast('45E8558D-9465-4B24-8788-F2EAAABC9365' AS uniqueidentifier) AS BNr,  cast('89BDE3AF-B533-41C0-A6B6-596F16614F21' AS uniqueidentifier) AS Enr Union
Select cast('F2843616-E2D1-4DA9-87A5-19365A237EBE' AS uniqueidentifier) AS BNr,  cast('E60C1932-2683-441D-AB07-AC629A62A04B' AS uniqueidentifier) AS Enr Union
Select cast('13A5645C-B933-4337-9F6A-74C0ABD33BD2' AS uniqueidentifier) AS BNr,  cast('5045F8EB-8CBD-4F5B-8187-1F42B039825D' AS uniqueidentifier) AS Enr Union
Select cast('48ED22E9-03BE-40EB-B6FD-196F28247C73' AS uniqueidentifier) AS BNr,  cast('53CADB3B-B7F1-4BCA-8158-A843399DB3C5' AS uniqueidentifier) AS Enr Union
Select cast('4324647E-F10B-4DFD-B562-0734C37EC289' AS uniqueidentifier) AS BNr,  cast('B668A8E6-E23F-414E-9D26-C3498B0F3132' AS uniqueidentifier) AS Enr Union
Select cast('748423C8-8852-4AA8-A0A7-C83F5ED55129' AS uniqueidentifier) AS BNr,  cast('8D8603F0-FD8C-4B27-BE34-64C080A68643' AS uniqueidentifier) AS Enr Union
Select cast('534078E5-206F-419F-A361-3C55E672104B' AS uniqueidentifier) AS BNr,  cast('7174D498-6161-41EF-814A-7F54A4D6AA5B' AS uniqueidentifier) AS Enr Union
Select cast('8F422789-94B0-4EA9-959D-9D761205F430' AS uniqueidentifier) AS BNr,  cast('4964F68B-4C2D-4333-AFCE-3AB8E440C7E8' AS uniqueidentifier) AS Enr Union
Select cast('EB0D807A-158C-41D6-B3D0-E0EEC5BE9CEA' AS uniqueidentifier) AS BNr,  cast('0EB103DB-6FAF-4A9C-B510-72A82A0BC459' AS uniqueidentifier) AS Enr Union
Select cast('3784C78C-EBE7-4ABC-BB8F-0BD43B7BEE43' AS uniqueidentifier) AS BNr,  cast('FAFE1A23-4E94-4AEE-9003-E84443DC8042' AS uniqueidentifier) AS Enr Union
Select cast('F781B651-E81A-41B7-ADD3-5586EAF26954' AS uniqueidentifier) AS BNr,  cast('9DEE53BE-FE61-4204-91E1-32A568952CB9' AS uniqueidentifier) AS Enr Union
Select cast('9CD07F9E-270B-4E01-94AF-CEE07EA321D4' AS uniqueidentifier) AS BNr,  cast('2B23B92B-A059-49DA-ABF3-5FC9B5F65E4D' AS uniqueidentifier) AS Enr Union
Select cast('11B864EB-1BA2-46CF-AB6E-61C1C1DC60A7' AS uniqueidentifier) AS BNr,  cast('769728FC-309E-4715-A515-704AD07201C2' AS uniqueidentifier) AS Enr Union
Select cast('8375F7B7-70D0-4E78-A1A0-93F340EE62F8' AS uniqueidentifier) AS BNr,  cast('A0825389-87FA-4304-81F8-A4795D7D3CE6' AS uniqueidentifier) AS Enr Union
Select cast('A93013C6-403E-44CB-B996-1CC2F0F6B871' AS uniqueidentifier) AS BNr,  cast('AF208412-D858-49D6-8DFD-340B7A93BF51' AS uniqueidentifier) AS Enr Union
Select cast('3FE5AE5B-82E3-4CD8-BD39-2ED69FF8A313' AS uniqueidentifier) AS BNr,  cast('4C881BB6-475D-4486-AFD8-B8499CB06F39' AS uniqueidentifier) AS Enr Union
Select cast('E5E140FD-14DC-4610-9938-2D164169C43A' AS uniqueidentifier) AS BNr,  cast('13C6A1C8-523F-46E4-87BC-8BA6DEF3E60D' AS uniqueidentifier) AS Enr Union
Select cast('2A13D656-BB34-4F3F-8982-EE24C330F1C5' AS uniqueidentifier) AS BNr,  cast('BA72F6ED-E5A7-4B2C-AD07-EFC82145785C' AS uniqueidentifier) AS Enr Union
Select cast('AB3AEC19-1529-4554-8496-EF1D717EF2B7' AS uniqueidentifier) AS BNr,  cast('BECA3E92-A51D-483A-97E0-3D62C3946938' AS uniqueidentifier) AS Enr Union
Select cast('FE29D0DE-470D-4D9F-AB5B-157FF861E7F5' AS uniqueidentifier) AS BNr,  cast('DF647BDC-CDB6-4C0D-BA21-2DE599300E22' AS uniqueidentifier) AS Enr Union
Select cast('A5F29D68-1676-4802-9C73-8705D8E3A7EA' AS uniqueidentifier) AS BNr,  cast('FACF16A1-5B52-4DB0-AC82-0F390554002B' AS uniqueidentifier) AS Enr Union
Select cast('5B47F9CA-7572-4FD9-A23C-167BAFF41BA6' AS uniqueidentifier) AS BNr,  cast('3A43FA8D-F6D3-4E67-82BB-F04EF1FCC77B' AS uniqueidentifier) AS Enr Union
Select cast('C29EA07E-6E9E-4120-B473-7CBB679F42D4' AS uniqueidentifier) AS BNr,  cast('540A96B4-45E7-4125-B6F5-727089EEE66E' AS uniqueidentifier) AS Enr Union
Select cast('DCEEE525-A6E7-45F8-BABC-BCBD9D3E9626' AS uniqueidentifier) AS BNr,  cast('938609B9-E66F-49F6-A2CC-7B29B49546CB' AS uniqueidentifier) AS Enr Union
Select cast('62FAD1A6-32E7-460E-BA49-35F60CCCA5BB' AS uniqueidentifier) AS BNr,  cast('A54FB93C-665C-4D05-8620-1CD0AE85D463' AS uniqueidentifier) AS Enr Union
Select cast('F235250B-AA7B-4184-9B29-9EC831477437' AS uniqueidentifier) AS BNr,  cast('FF43B86E-D897-47A1-9E73-160B302B2D87' AS uniqueidentifier) AS Enr Union
Select cast('77C0A305-1239-4554-8EEE-DEFB8C73F17B' AS uniqueidentifier) AS BNr,  cast('8654F326-B9C5-4997-B9DE-19B73F03CD63' AS uniqueidentifier) AS Enr Union
Select cast('47D269B0-9AC1-4F0B-B56A-C778AF0DAECD' AS uniqueidentifier) AS BNr,  cast('ED3EF6FB-AEAF-4A30-B714-43205B88CDFB' AS uniqueidentifier) AS Enr Union
Select cast('8F224A19-09D0-4BFC-B61C-291CF962267D' AS uniqueidentifier) AS BNr,  cast('ED4771F6-0D59-44E2-8071-0835C092D44B' AS uniqueidentifier) AS Enr Union
Select cast('0CB82B0A-C71E-4758-B50D-D8CE0AF26161' AS uniqueidentifier) AS BNr,  cast('581C1A77-5AE0-4394-A9FF-338C2E7C72A8' AS uniqueidentifier) AS Enr Union
Select cast('D6221250-343E-498E-895A-6CDE8B570F9B' AS uniqueidentifier) AS BNr,  cast('55D4C482-DC8C-4CE3-84BF-A66D8EF4C2F9' AS uniqueidentifier) AS Enr Union
Select cast('D2F612ED-774A-4E9F-94CF-D9A87E250483' AS uniqueidentifier) AS BNr,  cast('3317DE88-9564-49B4-9191-67AE93CD0416' AS uniqueidentifier) AS Enr Union
Select cast('E77B5EA8-EE10-433C-82FE-BF0856F1E504' AS uniqueidentifier) AS BNr,  cast('27F9BB67-57E1-46FC-8E70-8CCF14CBFF9E' AS uniqueidentifier) AS Enr Union
Select cast('B56E022D-9704-42DD-A6E7-55193F8287F5' AS uniqueidentifier) AS BNr,  cast('597DD992-B3BE-434A-8F59-564E8A3ED963' AS uniqueidentifier) AS Enr Union
Select cast('A10DD7A2-52E9-4BBD-A9A9-179FB212E564' AS uniqueidentifier) AS BNr,  cast('F63E0C73-A1FF-4404-B492-241890BFDCF0' AS uniqueidentifier) AS Enr Union
Select cast('05A256D4-343B-4F76-A350-DD7DBAAF3759' AS uniqueidentifier) AS BNr,  cast('3B64385F-31D8-4BAD-9ACA-7F4154596719' AS uniqueidentifier) AS Enr Union
Select cast('4C7F36B5-084F-4C60-A787-DA4CB0224083' AS uniqueidentifier) AS BNr,  cast('E3B4CB7F-E359-4FB1-817C-B79B3576F432' AS uniqueidentifier) AS Enr Union
Select cast('4BAD2DEF-6502-405E-833B-8592D1947424' AS uniqueidentifier) AS BNr,  cast('606A7A19-88D6-4A47-A16B-EB04B4BBA624' AS uniqueidentifier) AS Enr Union
Select cast('4AB8DE7D-DC6E-4081-ACFE-A2BDBE6A549A' AS uniqueidentifier) AS BNr,  cast('9AB47733-110E-4095-835E-16F81A232680' AS uniqueidentifier) AS Enr Union
Select cast('DE2B96BA-B66F-43FF-9966-B6D69ACE51C8' AS uniqueidentifier) AS BNr,  cast('231D1859-E21E-41F7-A649-D0AC21E941FD' AS uniqueidentifier) AS Enr Union
Select cast('EABD13C2-7D43-47E7-815D-B3332BB9981A' AS uniqueidentifier) AS BNr,  cast('941595DC-2B95-40FD-86D9-7CB4FEBBA924' AS uniqueidentifier) AS Enr Union
Select cast('9A0D42B9-9A2D-4BB3-8281-237C4757A689' AS uniqueidentifier) AS BNr,  cast('147E2AF0-A66F-4630-B1F2-180855820A0E' AS uniqueidentifier) AS Enr Union
Select cast('1B7A770A-D985-4DDE-97DC-08E027D81990' AS uniqueidentifier) AS BNr,  cast('0778306E-51BE-49DB-9752-744C08C5F10B' AS uniqueidentifier) AS Enr Union
Select cast('D2225B52-6EA2-4358-A662-C6269174829B' AS uniqueidentifier) AS BNr,  cast('811EA54D-A819-4904-9D05-4754CD43D3A2' AS uniqueidentifier) AS Enr Union
Select cast('F42015E7-1EFB-46F4-877E-2EAB9C3DBA32' AS uniqueidentifier) AS BNr,  cast('6C6F0982-E880-40A5-A065-E71F12DDA78E' AS uniqueidentifier) AS Enr Union
Select cast('ED9A5A89-F21E-428C-AFBE-11C447B25A27' AS uniqueidentifier) AS BNr,  cast('9D0830D4-D4CB-4554-888B-C103B406ACE9' AS uniqueidentifier) AS Enr Union
Select cast('56ACD034-6228-4AD1-8757-F2C8DF9F7D2B' AS uniqueidentifier) AS BNr,  cast('CE257817-C7D9-4846-87CD-07D50FCB5794' AS uniqueidentifier) AS Enr Union
Select cast('0BB7191E-3BAB-4600-89E6-C87D9556F11E' AS uniqueidentifier) AS BNr,  cast('7B52B7A9-85E9-447F-8D28-E8A063F4F2D8' AS uniqueidentifier) AS Enr Union
Select cast('5FF2AD8A-5F27-4BC1-8FC1-F9629F7CE8DD' AS uniqueidentifier) AS BNr,  cast('E612AC4D-6EEF-4D49-BEA7-9B0921F62FCE' AS uniqueidentifier) AS Enr Union
Select cast('1AF6BEAE-DF6A-49C4-8CD2-CA3DDC6CE49B' AS uniqueidentifier) AS BNr,  cast('ED8BE229-5A83-49EE-884C-0DFBC459BCD7' AS uniqueidentifier) AS Enr Union
Select cast('6ADBBB55-22EA-4C35-9978-6EF48B7A05E0' AS uniqueidentifier) AS BNr,  cast('86DF3A83-9C80-45AB-967D-2EC245E9603B' AS uniqueidentifier) AS Enr Union
Select cast('AA2C7D6B-B108-41B0-BC63-CA8B1A7D6267' AS uniqueidentifier) AS BNr,  cast('84D804E7-D7E0-4416-86C3-129B256DAA04' AS uniqueidentifier) AS Enr Union
Select cast('8EA031E1-06A0-4015-86A4-E9B14BD708B7' AS uniqueidentifier) AS BNr,  cast('EDDA8898-CE9B-40F2-8649-F8F36C3FC3F7' AS uniqueidentifier) AS Enr Union
Select cast('265A8E12-DFF8-464B-A6E8-4A650A5A7DB4' AS uniqueidentifier) AS BNr,  cast('7FADCA65-EE4E-4E1C-A430-6BC432F54F48' AS uniqueidentifier) AS Enr Union
Select cast('D3C254AB-5566-4DA0-A865-865D9F2FE709' AS uniqueidentifier) AS BNr,  cast('5D152545-6606-4E42-A409-344BEFA96EB8' AS uniqueidentifier) AS Enr Union
Select cast('2139FB7F-9F0C-4C55-95B9-8562EB7C2962' AS uniqueidentifier) AS BNr,  cast('66F3FEFA-B7CE-4D5B-8BE2-59EECF465321' AS uniqueidentifier) AS Enr Union
Select cast('9705ED19-032F-4F88-9D6F-6B90C22CCE13' AS uniqueidentifier) AS BNr,  cast('1C4C63FE-A90E-458F-9E36-6391E9C48FE1' AS uniqueidentifier) AS Enr Union
Select cast('7849A902-FD61-4CC7-917C-4B6F3A30A02B' AS uniqueidentifier) AS BNr,  cast('3740992E-8F25-421C-A712-840CF2CFB311' AS uniqueidentifier) AS Enr Union
Select cast('B8AE2C7E-0AFD-498B-B2C8-5134A4984E49' AS uniqueidentifier) AS BNr,  cast('CA0990FB-D27E-4F06-9D3B-6ECA76A5C5FD' AS uniqueidentifier) AS Enr Union
Select cast('AAB3C3F1-E84F-40AC-B9E5-447F01E9E95A' AS uniqueidentifier) AS BNr,  cast('4AC08127-65C5-402A-9BB2-1106FB6A2C6F' AS uniqueidentifier) AS Enr Union
Select cast('ADE4898B-3934-4F1F-AC0F-8B1B8B528069' AS uniqueidentifier) AS BNr,  cast('FABCA2CE-DB76-4F70-BDD4-6E45E7B9603C' AS uniqueidentifier) AS Enr Union
Select cast('5DB26BDC-0ECC-4E57-A281-745A9789DC66' AS uniqueidentifier) AS BNr,  cast('FCA894D7-040A-4463-8DD4-CE4B736F2B38' AS uniqueidentifier) AS Enr Union
Select cast('A5CABC0B-C6AF-4906-9B9C-87729060241F' AS uniqueidentifier) AS BNr,  cast('15483E2C-69E6-476A-8AE5-CB0AE2E40B27' AS uniqueidentifier) AS Enr Union
Select cast('0C438D3E-515A-4C5E-9A82-AEC343EC8728' AS uniqueidentifier) AS BNr,  cast('C05FE2B6-791E-4935-886E-1CD0A0218C12' AS uniqueidentifier) AS Enr Union
Select cast('94CE6494-0234-4DFE-862D-BFBB0E698C2E' AS uniqueidentifier) AS BNr,  cast('B3CA67E1-141B-4206-B649-39BD0128C743' AS uniqueidentifier) AS Enr Union
Select cast('F1F6DB57-D595-4E1F-8D48-DE06F1F7B88A' AS uniqueidentifier) AS BNr,  cast('16EBAED9-D74B-4DE2-98A6-6EB06896A8A2' AS uniqueidentifier) AS Enr Union
Select cast('C0ACC378-35B1-4B2E-8B97-745159CB9289' AS uniqueidentifier) AS BNr,  cast('B109603A-2F3B-46D3-8D1E-A1206CA6F6B2' AS uniqueidentifier) AS Enr Union
Select cast('3CDDB732-E774-453A-B2B3-8124B1AD4B5A' AS uniqueidentifier) AS BNr,  cast('258BEB11-8DBB-4818-A637-40C11B2BFE1E' AS uniqueidentifier) AS Enr Union
Select cast('6F123E56-1557-4378-9125-1DF162F24A64' AS uniqueidentifier) AS BNr,  cast('CCBAFF32-5EEB-4355-A4D1-E94ACD8FBF46' AS uniqueidentifier) AS Enr Union
Select cast('80AF89BD-4BE6-4FA7-9913-F7182E1D4A27' AS uniqueidentifier) AS BNr,  cast('FF4A6F14-1B8A-4C28-A5D9-5E2E9F419556' AS uniqueidentifier) AS Enr Union
Select cast('131906ED-D511-4459-8DE5-E73EBA9FE9C0' AS uniqueidentifier) AS BNr,  cast('4C54C140-16D7-4B9E-9658-EB7393BAC252' AS uniqueidentifier) AS Enr Union
Select cast('595E73F9-A934-449B-A5B9-75D50DD1B91E' AS uniqueidentifier) AS BNr,  cast('92B9F6DC-5F31-4837-8FEA-A242376D7A2E' AS uniqueidentifier) AS Enr Union
Select cast('004C5053-B355-4E0F-87CC-BF5AB0E74BBF' AS uniqueidentifier) AS BNr,  cast('D4F1A336-C197-48F1-A3B4-FA0D47C0D45E' AS uniqueidentifier) AS Enr Union
Select cast('39ED83EB-6276-4E49-81B7-1E697C798FFE' AS uniqueidentifier) AS BNr,  cast('8F75D3C0-4B02-451F-81B8-88836EE00D58' AS uniqueidentifier) AS Enr Union
Select cast('EBDFDD6E-5193-4B81-84C3-F6068D1EC195' AS uniqueidentifier) AS BNr,  cast('6864C2C9-9178-47F9-9E86-87342ACF5426' AS uniqueidentifier) AS Enr Union
Select cast('85FAA125-FA1B-4713-9108-2B5B5A5B26C8' AS uniqueidentifier) AS BNr,  cast('64EABC66-0644-4282-8D50-BD6347D91ED5' AS uniqueidentifier) AS Enr Union
Select cast('8696966B-FE83-405A-8E0B-DBAA0A01CD8B' AS uniqueidentifier) AS BNr,  cast('BC5BF306-BB76-4FC1-80D7-9DFF95F5162A' AS uniqueidentifier) AS Enr Union
Select cast('F6DFC7E8-A125-43BA-A97C-0C0907E909BA' AS uniqueidentifier) AS BNr,  cast('4A1627BB-1D20-439F-9535-A0836010BE2C' AS uniqueidentifier) AS Enr Union
Select cast('40178C85-4B46-423C-AB7A-D0F9B3A5A8E1' AS uniqueidentifier) AS BNr,  cast('8BC11140-9AE7-4AAA-86E5-1A9813322186' AS uniqueidentifier) AS Enr Union
Select cast('64FD89D6-4E77-480F-8937-5D9067A4539A' AS uniqueidentifier) AS BNr,  cast('8953DB54-C57E-4C20-A748-7185B71E6E74' AS uniqueidentifier) AS Enr Union
Select cast('F810C6ED-D17D-4369-B147-FA6378DCF8FA' AS uniqueidentifier) AS BNr,  cast('08042C63-BA0F-4C00-801B-E2EDDE94C2AE' AS uniqueidentifier) AS Enr Union
Select cast('FEF3A859-4410-44A7-A34D-3E0504E749B2' AS uniqueidentifier) AS BNr,  cast('FDB9BED4-F16B-46E5-9B6A-A2FAAB1BC19C' AS uniqueidentifier) AS Enr Union
Select cast('8758ED49-BA0C-4277-B8F6-9EADBED8788A' AS uniqueidentifier) AS BNr,  cast('F6F34FF4-7DBA-4FD5-A703-33DD541874A5' AS uniqueidentifier) AS Enr Union
Select cast('6EAE8FF6-B28D-4E4F-B932-3DC5BF3EBF50' AS uniqueidentifier) AS BNr,  cast('ECB4F63F-7443-4F58-A4AD-38F495B8F576' AS uniqueidentifier) AS Enr Union
Select cast('6D3FB8F8-BE63-4B26-9E48-1B793229841F' AS uniqueidentifier) AS BNr,  cast('4D66A1B2-518A-4DEB-BAC9-07C81B48DB68' AS uniqueidentifier) AS Enr Union
Select cast('8B6ADD93-5113-4C6A-88A6-78B3EB534EA3' AS uniqueidentifier) AS BNr,  cast('A58870ED-ADFA-4B59-BDA1-F0925D60C25A' AS uniqueidentifier) AS Enr Union
Select cast('5391FE7B-A014-4CA9-A418-014496F38E20' AS uniqueidentifier) AS BNr,  cast('27FD8C50-6C5F-4590-ADF5-10D762F32C88' AS uniqueidentifier) AS Enr Union
Select cast('B1968AFA-776E-4C90-97E8-78C46958425D' AS uniqueidentifier) AS BNr,  cast('A8D85B31-8E4B-442B-855E-375B46C24138' AS uniqueidentifier) AS Enr Union
Select cast('257C3E62-8314-45E2-832B-C44DF3595464' AS uniqueidentifier) AS BNr,  cast('F85ABCBA-86BD-46FE-AADC-04EADA491163' AS uniqueidentifier) AS Enr Union
Select cast('1DC9BCB1-EAB1-461E-AE1D-6090E2D3024D' AS uniqueidentifier) AS BNr,  cast('95863326-18BC-41BB-9B7F-83FA401F736E' AS uniqueidentifier) AS Enr Union
Select cast('5E58F9A8-CD71-42A0-A8D5-FE6DE4FA116B' AS uniqueidentifier) AS BNr,  cast('9E0B9907-45FF-4498-983A-390CDFB2973B' AS uniqueidentifier) AS Enr Union
Select cast('55458368-EDAB-4933-B554-6FB0AFBBF941' AS uniqueidentifier) AS BNr,  cast('E488839B-6903-490E-8238-E38538C8EB5C' AS uniqueidentifier) AS Enr Union
Select cast('A6419C17-8D5D-434F-B53F-BA5CE6C01433' AS uniqueidentifier) AS BNr,  cast('1E960500-A350-481B-9BED-D30EB25F727C' AS uniqueidentifier) AS Enr Union
Select cast('1A83DAC6-24FA-43B4-B698-F495AF229000' AS uniqueidentifier) AS BNr,  cast('F8C246CF-CD9F-4982-A53F-33B04416D21F' AS uniqueidentifier) AS Enr Union
Select cast('6725BEDE-96FF-44EB-822E-E879B5DBB2AF' AS uniqueidentifier) AS BNr,  cast('378686B4-6E27-4DDC-8642-F41D36E7E12A' AS uniqueidentifier) AS Enr Union
Select cast('80730451-973D-406B-8A3D-9F63DCB3F4FD' AS uniqueidentifier) AS BNr,  cast('93F792A7-8475-4576-82F3-A2C5D57674AA' AS uniqueidentifier) AS Enr Union
Select cast('020AD2AE-B116-46C2-859B-A47D5E383FB6' AS uniqueidentifier) AS BNr,  cast('D45919A4-BB71-4E14-9B72-9100EF873C5A' AS uniqueidentifier) AS Enr Union
Select cast('BB8F5F66-7A78-4823-8FB6-6068A445BF70' AS uniqueidentifier) AS BNr,  cast('AEDA246A-1B1D-40DB-A2BF-0F7AC54CBF95' AS uniqueidentifier) AS Enr Union
Select cast('4A8BF514-EF45-4643-88A9-E2738E0D8363' AS uniqueidentifier) AS BNr,  cast('FE501A14-6E49-44B1-BBC7-7CF6B3297BBF' AS uniqueidentifier) AS Enr Union
Select cast('0BFFAFD4-3DA9-48C7-87AB-3929DC8ECAF0' AS uniqueidentifier) AS BNr,  cast('E07BE204-3DD3-4019-A847-F03B6CE6215B' AS uniqueidentifier) AS Enr Union
Select cast('C3A739F5-B38A-4F5B-A658-0D7DCDBF4515' AS uniqueidentifier) AS BNr,  cast('2EF26FA8-BD76-4751-850B-19FC02956C83' AS uniqueidentifier) AS Enr Union
Select cast('4D29CB41-4941-46F2-8800-F3B4C995FF44' AS uniqueidentifier) AS BNr,  cast('D040ADD0-293F-42AB-BED6-53BB4F4F44D2' AS uniqueidentifier) AS Enr Union
Select cast('45B6C7C4-2F0E-4040-B4B9-86E0FA3D1031' AS uniqueidentifier) AS BNr,  cast('D8650F10-8930-471F-A621-D38B347A187C' AS uniqueidentifier) AS Enr Union
Select cast('34C13542-128D-4A8C-BBAC-3B582BFE2B2D' AS uniqueidentifier) AS BNr,  cast('3AD49502-758E-4B5A-804D-16A993B102E2' AS uniqueidentifier) AS Enr Union
Select cast('678E2BFC-3593-4570-8C95-D1D52D3DEE15' AS uniqueidentifier) AS BNr,  cast('855892C1-F1BC-4AE4-A4E3-175D2A2265B3' AS uniqueidentifier) AS Enr Union
Select cast('D2C6154E-73CE-4B9D-81ED-CB6C2D772F66' AS uniqueidentifier) AS BNr,  cast('19FD11E6-4FF6-45D1-B821-28738478FA65' AS uniqueidentifier) AS Enr Union
Select cast('896BF88A-6D0D-4CDF-BCA1-D6DE88F0BDF5' AS uniqueidentifier) AS BNr,  cast('D4FECA59-A236-4C63-A673-5631C5E59C2C' AS uniqueidentifier) AS Enr Union
Select cast('E96178EB-AD4C-4951-AC1E-3659C4292190' AS uniqueidentifier) AS BNr,  cast('C371FD78-A691-430B-A124-4BA58806A263' AS uniqueidentifier) AS Enr Union
Select cast('B74C1FFB-A010-4481-B3BF-4352906237B4' AS uniqueidentifier) AS BNr,  cast('1B6CC3D4-A584-4A98-B8D7-A03BB5785599' AS uniqueidentifier) AS Enr Union
Select cast('F01EB07B-D12A-452D-9C58-337DA539BD5B' AS uniqueidentifier) AS BNr,  cast('CD483D8B-B961-46FB-B629-EC28DCB9C87D' AS uniqueidentifier) AS Enr Union
Select cast('E48672DD-9898-46B0-ADCC-96A4CCAEBCBF' AS uniqueidentifier) AS BNr,  cast('9FE63364-6657-4C85-8DAF-35865DF93B05' AS uniqueidentifier) AS Enr Union
Select cast('4206006A-8CE2-4E99-97EB-86D76A2CD2A1' AS uniqueidentifier) AS BNr,  cast('31029112-3A19-477A-B965-FEA4007F7721' AS uniqueidentifier) AS Enr Union
Select cast('36C3CAFE-2CE0-4AB7-86E0-2AA96067C94F' AS uniqueidentifier) AS BNr,  cast('23F3F35B-6313-4B14-A261-A6C6EC72C5E4' AS uniqueidentifier) AS Enr Union
Select cast('D7A4F879-2D9E-4283-9F93-17DD3B3F62B1' AS uniqueidentifier) AS BNr,  cast('F7AC3E22-0605-4D85-9FE0-A94B57C42BE0' AS uniqueidentifier) AS Enr Union
Select cast('B97C51AB-AF7D-49FF-9F67-2904D9958406' AS uniqueidentifier) AS BNr,  cast('D1B7D55D-0AFD-4F02-AC23-0DC7EF862B18' AS uniqueidentifier) AS Enr Union
Select cast('79179CFE-7267-4C5D-8A86-CE0EBC9AF1DA' AS uniqueidentifier) AS BNr,  cast('8B95C585-3328-4FB7-ABFB-127AAA135793' AS uniqueidentifier) AS Enr Union
Select cast('EE27CD15-C64B-4EE6-A5C1-94A776B5F42B' AS uniqueidentifier) AS BNr,  cast('0E814913-88A0-4C12-B788-B668D4EF6C8A' AS uniqueidentifier) AS Enr Union
Select cast('5715839F-4591-436A-9465-0452D805B95C' AS uniqueidentifier) AS BNr,  cast('FA72635B-D99C-4185-8292-1F96F0B06102' AS uniqueidentifier) AS Enr Union
Select cast('E8250759-860C-45C5-AA96-EE4D860074D8' AS uniqueidentifier) AS BNr,  cast('9AAAD5FC-30DB-4985-989F-34E34183DF9C' AS uniqueidentifier) AS Enr Union
Select cast('7540B009-AFD8-48EF-B559-C9DC02B39209' AS uniqueidentifier) AS BNr,  cast('FD73BBD3-3F6A-450A-845C-4B811CF653D0' AS uniqueidentifier) AS Enr Union
Select cast('9A7BBF04-2F14-4CCB-BA51-E7EBB38FB4AE' AS uniqueidentifier) AS BNr,  cast('AEF34D6C-3881-4A06-BA5E-848A89128E83' AS uniqueidentifier) AS Enr Union
Select cast('3CE81D30-C679-4C87-8FD9-E67692810983' AS uniqueidentifier) AS BNr,  cast('C58893CE-9821-4EAE-8EDA-ABEFE83839A5' AS uniqueidentifier) AS Enr Union
Select cast('3E5D9417-89E3-4159-84EB-35CDFE256C5B' AS uniqueidentifier) AS BNr,  cast('FA52E8B4-E41A-4620-96FF-82122AEFC682' AS uniqueidentifier) AS Enr Union
Select cast('1F357C65-C816-46F5-8D20-E94519E47D6F' AS uniqueidentifier) AS BNr,  cast('52A57A95-E2E3-435D-8A83-698AE864F334' AS uniqueidentifier) AS Enr Union
Select cast('C68C429B-11B9-4826-8729-B20C65C3408A' AS uniqueidentifier) AS BNr,  cast('C9028FB9-07A0-427A-867B-B975BC59DE8E' AS uniqueidentifier) AS Enr Union
Select cast('FF2AABB2-D2DC-47A1-9795-29C39B05CD05' AS uniqueidentifier) AS BNr,  cast('47416F57-842B-44E0-AAB0-726BD4B3089E' AS uniqueidentifier) AS Enr Union
Select cast('D9625573-54DC-4DCA-81FE-18AF7457C95A' AS uniqueidentifier) AS BNr,  cast('6EEB0E28-16B4-4A18-B2DB-D20A6496B0B7' AS uniqueidentifier) AS Enr Union
Select cast('CA938792-A632-4723-8F91-41666611C5B1' AS uniqueidentifier) AS BNr,  cast('9EA52CCC-10D2-4D25-A89C-D4643017BE44' AS uniqueidentifier) AS Enr Union
Select cast('4F821E51-2BB6-4534-AE6F-FAF5D87248ED' AS uniqueidentifier) AS BNr,  cast('D010E452-F140-404E-9022-0F635E8BBB1B' AS uniqueidentifier) AS Enr Union
Select cast('67B6D43B-C684-4557-BF03-F57FF5354E59' AS uniqueidentifier) AS BNr,  cast('8C0F7D1B-C954-47E4-B583-8C88A4B98E03' AS uniqueidentifier) AS Enr Union
Select cast('F0FE2D42-5477-4559-AF63-ADD95D3BEB3B' AS uniqueidentifier) AS BNr,  cast('4D9A62AF-CE99-4158-8FA7-ACB2983FFD68' AS uniqueidentifier) AS Enr Union
Select cast('A16B432D-7EA8-4D45-B2AA-7865F7E0C716' AS uniqueidentifier) AS BNr,  cast('98D1E83B-BE91-4B27-B1D6-9EE4F6BC6CDC' AS uniqueidentifier) AS Enr Union
Select cast('CCCD97FC-FEDA-4569-A2CF-5BB34471868F' AS uniqueidentifier) AS BNr,  cast('9951DC53-5BF4-420C-8FF5-74AD765990E9' AS uniqueidentifier) AS Enr Union
Select cast('7C9C3CE8-1A71-4FDB-A336-81165E75203B' AS uniqueidentifier) AS BNr,  cast('8C9A2954-95B5-4251-B498-D945F605BE38' AS uniqueidentifier) AS Enr Union
Select cast('D29467D3-A83D-46A1-BFB2-ABAD457ACD9B' AS uniqueidentifier) AS BNr,  cast('C86CAE3A-4631-421F-8D89-6F96B03BD9B1' AS uniqueidentifier) AS Enr Union
Select cast('D82D1C68-901F-4B83-9D35-54B850D86993' AS uniqueidentifier) AS BNr,  cast('FB4C2C68-25FA-4CA3-83AA-3319C707B5C9' AS uniqueidentifier) AS Enr Union
Select cast('95EA03A8-5F11-4202-914E-B7B1A7177508' AS uniqueidentifier) AS BNr,  cast('824DAF0F-7901-4F4A-8CE4-5A3AD381BBD7' AS uniqueidentifier) AS Enr Union
Select cast('C90A17A6-6E85-4694-9B8A-20D0E24B73AC' AS uniqueidentifier) AS BNr,  cast('F550310D-D4B6-403D-A561-46FA693B061B' AS uniqueidentifier) AS Enr Union
Select cast('E8115D33-781E-4EAE-854E-DE2BF7D5A385' AS uniqueidentifier) AS BNr,  cast('E0A70123-E877-4FE2-9C2C-D4D6805140D6' AS uniqueidentifier) AS Enr Union
Select cast('D0F7681D-E905-4B54-8C5D-16C37766900D' AS uniqueidentifier) AS BNr,  cast('895ABD5D-AACD-4D8D-BC21-94FC71A57D00' AS uniqueidentifier) AS Enr Union
Select cast('72F17762-5689-488B-91F3-5A77449AC643' AS uniqueidentifier) AS BNr,  cast('2B2F85EB-41F7-42B2-B485-AB075761FFFE' AS uniqueidentifier) AS Enr Union
Select cast('28A44B29-9963-487F-8B6E-72EB2F07940A' AS uniqueidentifier) AS BNr,  cast('2A313EC4-CAF5-4234-AF4C-F426CF26E0D5' AS uniqueidentifier) AS Enr Union
Select cast('6F8D78A9-2238-4795-AA51-4C9FC09235A1' AS uniqueidentifier) AS BNr,  cast('D8997890-14BA-479B-BDE3-DF09D63C010B' AS uniqueidentifier) AS Enr Union
Select cast('3E363D6B-F89A-486E-B12A-697BCF9DA59E' AS uniqueidentifier) AS BNr,  cast('A0A84C9C-D2E5-41E8-A362-4E1E160ABF5F' AS uniqueidentifier) AS Enr Union
Select cast('35D7E636-4FC6-451C-A173-D35A3DFB8AE2' AS uniqueidentifier) AS BNr,  cast('868EC930-1EEA-4D78-A1CC-55D2E8241AB4' AS uniqueidentifier) AS Enr Union
Select cast('3FFD92A3-7C0A-431C-97AC-230614D20D82' AS uniqueidentifier) AS BNr,  cast('F4B2EDD8-EE8E-4E5B-BBF1-FC55589F5F4D' AS uniqueidentifier) AS Enr Union
Select cast('A759C929-5AFC-440E-B9A1-75441C2848EE' AS uniqueidentifier) AS BNr,  cast('F7FA15ED-D6D6-4B4C-AE32-CE793B43B84D' AS uniqueidentifier) AS Enr Union
Select cast('E0225DDF-D937-4CC5-BCA4-9DB9165DFD18' AS uniqueidentifier) AS BNr,  cast('B292EDE7-71B7-40A8-A6BB-3B2899FAFBDC' AS uniqueidentifier) AS Enr Union
Select cast('15FDB6C8-2CE4-4914-AF6D-2CE43B2E8EB9' AS uniqueidentifier) AS BNr,  cast('DF68BEBF-861D-495C-B48F-478BD8B05876' AS uniqueidentifier) AS Enr Union
Select cast('4624A3AA-C464-4F2E-8D04-7DFD782F8C05' AS uniqueidentifier) AS BNr,  cast('3A0583AB-C4C0-47BE-A0F4-70DE52335E03' AS uniqueidentifier) AS Enr Union
Select cast('BB12F611-F5AE-46A8-8D44-76C861492E8E' AS uniqueidentifier) AS BNr,  cast('B9304E42-9D5A-40D0-AF6B-E30EDEB095BA' AS uniqueidentifier) AS Enr Union
Select cast('EE1D5D0A-9209-49C4-996B-0D6DBDCC3EB7' AS uniqueidentifier) AS BNr,  cast('FBA2395F-CC21-41BC-A534-3D382DB3D418' AS uniqueidentifier) AS Enr Union
Select cast('B95513A6-B1FB-4F15-A887-9A267859ABC2' AS uniqueidentifier) AS BNr,  cast('16AD4460-98A5-4A0A-A50A-D608DF6842A0' AS uniqueidentifier) AS Enr Union
Select cast('BC33E0D1-5BCE-4AC7-B8A6-6E117E3967DB' AS uniqueidentifier) AS BNr,  cast('04577480-92B3-4DCF-B609-B315D2C74B5B' AS uniqueidentifier) AS Enr Union
Select cast('4A09C310-C3C2-445E-9788-A59AEA59A3D6' AS uniqueidentifier) AS BNr,  cast('015BB1B7-FBC8-4B5E-811C-8550290EB25B' AS uniqueidentifier) AS Enr Union
Select cast('18F62038-F1FE-4441-9AD5-38762D6BE63F' AS uniqueidentifier) AS BNr,  cast('38812DD2-A906-4C52-A998-C763533606DD' AS uniqueidentifier) AS Enr Union
Select cast('2FBD9458-28DE-48A7-8B9E-042AC61B0F7B' AS uniqueidentifier) AS BNr,  cast('B918F47F-361F-4302-A3E0-B2353583C87F' AS uniqueidentifier) AS Enr Union
Select cast('489CD4AF-FFB8-41BB-9DF2-3BE9E8D8A4D5' AS uniqueidentifier) AS BNr,  cast('FD9DB327-EE7A-4D71-BE9F-01895881BB70' AS uniqueidentifier) AS Enr Union
Select cast('FD43E0D1-AAA9-4050-983C-BD9904022776' AS uniqueidentifier) AS BNr,  cast('C7A736AC-AD6A-4B77-A23E-ED20D21F102F' AS uniqueidentifier) AS Enr Union
Select cast('898C7E87-E07B-4214-96D7-60E548568C0F' AS uniqueidentifier) AS BNr,  cast('EEEFCE3F-9B51-4491-B8AB-DD182EA29483' AS uniqueidentifier) AS Enr Union
Select cast('EFBAEED2-207A-4AFC-AA5C-7878C7FD59EE' AS uniqueidentifier) AS BNr,  cast('F775358B-C4A3-4C77-8035-41A07266DB9D' AS uniqueidentifier) AS Enr Union
Select cast('EC84D0CD-B20F-4CDB-8A5E-C3B7BB421685' AS uniqueidentifier) AS BNr,  cast('8E1399A7-9BA5-4943-B13F-EBCE3CA9A276' AS uniqueidentifier) AS Enr Union
Select cast('F79DBEB6-86D1-425B-AA63-5B36EAEF7256' AS uniqueidentifier) AS BNr,  cast('F41FBA9F-E288-488F-B458-34BA8E32EA83' AS uniqueidentifier) AS Enr Union
Select cast('1E6CAD26-78B4-4B45-BAEA-51DCE1E38066' AS uniqueidentifier) AS BNr,  cast('249CC075-6DA0-4CD1-A5AE-A9E4EB1AF601' AS uniqueidentifier) AS Enr Union
Select cast('E854F554-34D8-4BC7-B160-B6EE20849A86' AS uniqueidentifier) AS BNr,  cast('AB9ABF55-2485-4C5C-AE46-2A3356C3ED39' AS uniqueidentifier) AS Enr Union
Select cast('B4F31A0E-8EEF-45A9-B6A5-C5B7158CC03C' AS uniqueidentifier) AS BNr,  cast('F1182FD8-1CDD-4584-91B6-39FE19F5CC15' AS uniqueidentifier) AS Enr Union
Select cast('1692CF78-87EC-40C4-8CAC-A3FEDAC65274' AS uniqueidentifier) AS BNr,  cast('5023E222-3AF1-41B2-87DD-525EED04B8C3' AS uniqueidentifier) AS Enr Union
Select cast('01E94D14-9295-4DB9-962B-77AFFEE19D51' AS uniqueidentifier) AS BNr,  cast('A86E536D-B28F-4423-AC50-5D0B370683C1' AS uniqueidentifier) AS Enr Union
Select cast('95105CB5-132C-4601-AAB7-BA2AD2654227' AS uniqueidentifier) AS BNr,  cast('EBED3266-336C-49F2-A8C5-86029AA3DB5F' AS uniqueidentifier) AS Enr Union
Select cast('A3F51983-D605-4C6A-8089-E2EB7BE91881' AS uniqueidentifier) AS BNr,  cast('B1C38818-0546-43F2-A656-4D9979CB51B2' AS uniqueidentifier) AS Enr Union
Select cast('9C0B0A18-2FF1-4F56-93D2-D435B150C9EB' AS uniqueidentifier) AS BNr,  cast('448AE52C-7E81-4A03-8403-4D89EA03C216' AS uniqueidentifier) AS Enr Union
Select cast('F5F08873-1E43-426B-B3F8-3D219EC3627A' AS uniqueidentifier) AS BNr,  cast('FD220A51-6DE0-4ACB-9437-122BEB5643BE' AS uniqueidentifier) AS Enr Union
Select cast('A1806BE2-AA94-4E90-BC6C-12AC221DFB3B' AS uniqueidentifier) AS BNr,  cast('F65CA148-9773-4EFB-A4B7-43A090068AD9' AS uniqueidentifier) AS Enr Union
Select cast('08AE3356-34FF-43E8-92B5-F820D003633D' AS uniqueidentifier) AS BNr,  cast('C67AFEA8-A0D2-45D4-BDB2-DF9942009E35' AS uniqueidentifier) AS Enr Union
Select cast('C5572530-3467-4CB8-92A8-B5FACAC2D114' AS uniqueidentifier) AS BNr,  cast('0DFAC68E-2AC9-45B1-A556-0749BCF1FD79' AS uniqueidentifier) AS Enr Union
Select cast('9CFC790E-D279-46AC-83C6-F1005DAC99F2' AS uniqueidentifier) AS BNr,  cast('FB3B66B7-2EBB-4BDC-9E11-B62C769748F9' AS uniqueidentifier) AS Enr Union
Select cast('C85241A3-E831-49E5-A5E8-E6B1DEBE1837' AS uniqueidentifier) AS BNr,  cast('7AFA736C-F83C-4638-8090-A9CC7194169B' AS uniqueidentifier) AS Enr Union
Select cast('6AF4D427-2CA3-405A-B50C-A19B2501F379' AS uniqueidentifier) AS BNr,  cast('8A57A009-138E-47EA-B199-91526C2829CA' AS uniqueidentifier) AS Enr Union
Select cast('099A68D3-E5D9-4CFF-90C0-AD76B0A8AE4B' AS uniqueidentifier) AS BNr,  cast('CCC86AE5-41BE-4627-BD3A-E797F472F497' AS uniqueidentifier) AS Enr Union
Select cast('7842A597-97EE-4EEC-9C32-58A5A61062F4' AS uniqueidentifier) AS BNr,  cast('AE2C4092-FAED-4898-A426-D9F6B5D8BCD3' AS uniqueidentifier) AS Enr Union
Select cast('FB6B9922-127A-452D-B20E-BE53A6F05675' AS uniqueidentifier) AS BNr,  cast('6543E1D5-3D79-4317-86F3-6BE1787A7FC7' AS uniqueidentifier) AS Enr Union
Select cast('A8BCF2BD-58A6-4362-9EEB-9AD576AB5ACD' AS uniqueidentifier) AS BNr,  cast('C3826E36-6F24-4CBE-8B99-D50C4B734EDA' AS uniqueidentifier) AS Enr Union
Select cast('6B471194-1930-4E8E-8332-40322DFC9E3A' AS uniqueidentifier) AS BNr,  cast('6F0DA7AE-77F5-4FC1-9B86-33D56E1DF027' AS uniqueidentifier) AS Enr Union
Select cast('2B0E6F92-AFBA-40E8-ACC8-8186DD0402E7' AS uniqueidentifier) AS BNr,  cast('1BA3EEA2-6814-4E85-B7E0-1365BB8CB7EF' AS uniqueidentifier) AS Enr Union
Select cast('34E9D882-3E60-42BA-AEAD-E217ED62A67C' AS uniqueidentifier) AS BNr,  cast('315821DB-10C2-4AD2-9C90-578D52F48B52' AS uniqueidentifier) AS Enr Union
Select cast('ACFEC586-A540-406A-977D-A4168DAD6DCE' AS uniqueidentifier) AS BNr,  cast('2EF9BEBD-1723-4600-AC0D-6EE8806633E5' AS uniqueidentifier) AS Enr Union
Select cast('7740F36F-1F68-4B23-BE46-DDB77179767C' AS uniqueidentifier) AS BNr,  cast('2C0775DC-4E8D-47EA-BA6E-CF56B5CD497A' AS uniqueidentifier) AS Enr Union
Select cast('F496D334-26A6-4D9A-98F2-2AAEF30B5ADA' AS uniqueidentifier) AS BNr,  cast('166D5E6A-1643-4183-88F3-EBB8F164076E' AS uniqueidentifier) AS Enr Union
Select cast('3DD7A7A3-3EFC-4A49-A471-770EAA9BBACA' AS uniqueidentifier) AS BNr,  cast('0079D9DA-A9A0-415D-9C54-5458BFE5BA99' AS uniqueidentifier) AS Enr Union
Select cast('1A0B47D0-CB61-442E-8148-15685E191E35' AS uniqueidentifier) AS BNr,  cast('E8C91364-40CA-482B-9EE7-A9B87520A6F7' AS uniqueidentifier) AS Enr Union
Select cast('365CB3B3-31DC-474F-8B0E-E5021214FA6F' AS uniqueidentifier) AS BNr,  cast('CA099298-840C-413D-AD38-71E8B80E2DCB' AS uniqueidentifier) AS Enr Union
Select cast('3395F4F0-281A-4752-ADFC-221304D12904' AS uniqueidentifier) AS BNr,  cast('84E4F610-6954-45BD-B3D8-9229100C9795' AS uniqueidentifier) AS Enr Union
Select cast('0BD832D3-ADFE-4BCE-88A9-5A7F3A62DED6' AS uniqueidentifier) AS BNr,  cast('7724B374-02E8-4542-8296-8F3022E160E4' AS uniqueidentifier) AS Enr Union
Select cast('E5907DF7-38F1-4FC8-9829-19E41561E7D8' AS uniqueidentifier) AS BNr,  cast('49708DB4-5787-42B2-ACFC-5844AC08FF07' AS uniqueidentifier) AS Enr Union
Select cast('49F38881-CBD4-4A9E-B584-6FB3A2D2E530' AS uniqueidentifier) AS BNr,  cast('543326AB-FC8E-44B6-BC5F-DE687430BC01' AS uniqueidentifier) AS Enr Union
Select cast('6A9DFD49-7060-4959-BE4C-FF5F92F5A277' AS uniqueidentifier) AS BNr,  cast('0107CD98-2E06-4207-B8BD-46C97A0DD7E2' AS uniqueidentifier) AS Enr Union
Select cast('87A67117-7EE2-46CD-BE24-765D7DB83477' AS uniqueidentifier) AS BNr,  cast('DA58F02D-D15B-4AB3-BFA0-A837401352A8' AS uniqueidentifier) AS Enr Union
Select cast('154D148C-6057-4DF6-AE2F-FDDBE161A863' AS uniqueidentifier) AS BNr,  cast('47F2F830-8ADB-46EC-B643-520421FFB06F' AS uniqueidentifier) AS Enr Union
Select cast('F90C4AEA-6B6D-4CD8-8E91-6C03799845DC' AS uniqueidentifier) AS BNr,  cast('9FA57AB4-3A76-4F49-BB34-709A81B7C06D' AS uniqueidentifier) AS Enr Union
Select cast('586A941A-EEC3-4658-84B6-0D98334088CA' AS uniqueidentifier) AS BNr,  cast('CF222828-1BD4-4DD0-845D-2A4BADEE914A' AS uniqueidentifier) AS Enr Union
Select cast('2DF8E4CD-9BED-498B-8A91-0E982E7E43C1' AS uniqueidentifier) AS BNr,  cast('808F9D3E-B4C1-4C3D-A26F-E72CEC3B8FE3' AS uniqueidentifier) AS Enr Union
Select cast('CD5F61B2-27AF-4D8A-B74D-1973D65545F0' AS uniqueidentifier) AS BNr,  cast('C82A6FC4-8F9D-407E-BBA2-64729F45CAB2' AS uniqueidentifier) AS Enr Union
Select cast('783FA0BF-50AB-44EB-B3B7-ED71F7D7C20B' AS uniqueidentifier) AS BNr,  cast('DB8BF03D-1534-44DE-9201-7C5E131FADB9' AS uniqueidentifier) AS Enr Union
Select cast('B5E2513B-FDEC-466E-B3C1-9FEC8B798720' AS uniqueidentifier) AS BNr,  cast('5B8F923E-0791-4E95-959C-5F853B96CDF5' AS uniqueidentifier) AS Enr Union
Select cast('1310A13F-C463-44A2-9D3C-2F75C9D96BDE' AS uniqueidentifier) AS BNr,  cast('82673755-D1CA-46F4-86BC-984E2712FBFA' AS uniqueidentifier) AS Enr Union
Select cast('2176530F-FFBE-4305-86FE-60A0E1CF822D' AS uniqueidentifier) AS BNr,  cast('6F457038-BFC5-40CA-AFBE-19127236FAC1' AS uniqueidentifier) AS Enr Union
Select cast('F3DC4BF1-AB45-4BC0-93DE-D0DFE5695E1E' AS uniqueidentifier) AS BNr,  cast('D1907A55-769F-4C85-8FAB-B51D215B71AF' AS uniqueidentifier) AS Enr Union
Select cast('489F6877-CC9B-4038-8C70-48E896611CBD' AS uniqueidentifier) AS BNr,  cast('6610B0E1-29F2-4AC3-A5AC-3DBE8BCD2E87' AS uniqueidentifier) AS Enr Union
Select cast('0ECFDE29-8750-49F6-BF08-BABB72C99C34' AS uniqueidentifier) AS BNr,  cast('555731FC-FC92-4B2E-B5D8-04B283FAB47D' AS uniqueidentifier) AS Enr Union
Select cast('2D4F3D63-7B44-4528-BEBD-44BB60DE9C0D' AS uniqueidentifier) AS BNr,  cast('85F06BF7-741E-4432-9F6C-F1A2E3514CD2' AS uniqueidentifier) AS Enr Union
Select cast('A0CFFF9D-CEE6-4391-9CF8-3F9230FB093F' AS uniqueidentifier) AS BNr,  cast('71F53A74-45AC-4C25-9A51-7D7B88163F05' AS uniqueidentifier) AS Enr Union
Select cast('3AD9D82F-3B7A-45F0-9D44-23BBE39EA356' AS uniqueidentifier) AS BNr,  cast('01CFAB28-186B-4275-A025-85177830D1A6' AS uniqueidentifier) AS Enr Union
Select cast('51D6D513-6F39-4A03-9D70-BC805FBA0238' AS uniqueidentifier) AS BNr,  cast('B420F5B9-8F70-4088-84AC-9204631F40B9' AS uniqueidentifier) AS Enr Union
Select cast('2A970862-CBD7-4F27-972A-35DA438DCD4C' AS uniqueidentifier) AS BNr,  cast('AAD197CA-B838-4045-BA01-92D001D426E4' AS uniqueidentifier) AS Enr Union
Select cast('3765836B-493D-4D5C-866C-E427B531021A' AS uniqueidentifier) AS BNr,  cast('EB042E01-EFBE-4208-B274-146FC6705436' AS uniqueidentifier) AS Enr Union
Select cast('CA2246C0-5768-4FB2-85C9-FB5E8026EBF8' AS uniqueidentifier) AS BNr,  cast('679FF850-1C5F-442D-9E76-951819B68455' AS uniqueidentifier) AS Enr Union
Select cast('13C17C5D-3543-40A4-BD18-1F07089E88F0' AS uniqueidentifier) AS BNr,  cast('119E3940-C9D8-4F23-80B0-F8FA0AF58C84' AS uniqueidentifier) AS Enr Union
Select cast('4BC523BF-CBA7-4F72-BDA0-AB373164282C' AS uniqueidentifier) AS BNr,  cast('C0D919E3-FB53-4E1D-BBFD-25EB2D1E28FA' AS uniqueidentifier) AS Enr Union
Select cast('8D4A5D70-B120-4CD3-8F7A-C7C5C1D06C43' AS uniqueidentifier) AS BNr,  cast('2B1E7ED5-5578-494E-A61F-77385AC34726' AS uniqueidentifier) AS Enr Union
Select cast('163C3908-E1F1-4482-89E1-0D081C15E93D' AS uniqueidentifier) AS BNr,  cast('F6CF0D43-D4CA-484E-9897-CB549E5F411A' AS uniqueidentifier) AS Enr Union
Select cast('4570EE7D-AFBF-4247-AFC2-28D95451650C' AS uniqueidentifier) AS BNr,  cast('5F387181-8370-46BD-BEEF-EB9AE97504D2' AS uniqueidentifier) AS Enr Union
Select cast('1CEEE924-D8B7-4E2E-8264-7C08F413DAB0' AS uniqueidentifier) AS BNr,  cast('51F1777B-D2A0-4464-9E4B-33DF9E6DBD21' AS uniqueidentifier) AS Enr Union
Select cast('AAFE24CC-4FD8-4606-A1DE-45CC58E5231C' AS uniqueidentifier) AS BNr,  cast('ECF6FC5D-97D7-4191-A695-D01D13D3FA6D' AS uniqueidentifier) AS Enr Union
Select cast('B4DC5A43-5B88-4C42-9293-58487981E106' AS uniqueidentifier) AS BNr,  cast('81D5BA64-4EB4-4810-8339-2255964C36E7' AS uniqueidentifier) AS Enr Union
Select cast('865C1CF0-10CE-4DBB-8056-CE2773D02941' AS uniqueidentifier) AS BNr,  cast('CD364C8E-3944-4118-A8B1-CDE48742026D' AS uniqueidentifier) AS Enr Union
Select cast('AAAFB38A-9CF0-4627-9E74-D1CE1ED5AAD7' AS uniqueidentifier) AS BNr,  cast('6D334244-20D6-429D-A55D-209575154E1D' AS uniqueidentifier) AS Enr Union
Select cast('75FBCBE1-AB04-43D7-B489-5C3454D5F853' AS uniqueidentifier) AS BNr,  cast('1306F8B0-BBB1-4C7E-899E-CB8DE0172712' AS uniqueidentifier) AS Enr Union
Select cast('34A2A591-3871-415B-BA59-5D03B2017B2A' AS uniqueidentifier) AS BNr,  cast('652F31D6-DA7B-489B-BE82-BEA552788176' AS uniqueidentifier) AS Enr Union
Select cast('8B33CE9C-9FE7-4AB3-8414-37309BF8AA89' AS uniqueidentifier) AS BNr,  cast('0A07157D-1A09-453E-BE2C-88BF7D2CC105' AS uniqueidentifier) AS Enr Union
Select cast('8EC1B944-8589-4F03-AA9B-FCF8132BA48D' AS uniqueidentifier) AS BNr,  cast('86CDE050-0DD8-425F-992D-23E9C4130181' AS uniqueidentifier) AS Enr Union
Select cast('3D6698FF-4F42-4A9C-BA08-C0AD723CC251' AS uniqueidentifier) AS BNr,  cast('10332C68-A5FC-478C-AC11-7DD34C70C7BF' AS uniqueidentifier) AS Enr Union
Select cast('7A041991-21A8-49E1-B010-008BE8C8AF07' AS uniqueidentifier) AS BNr,  cast('400C19B1-5ABD-4893-AA30-C732B3C827A1' AS uniqueidentifier) AS Enr Union
Select cast('C8649CC8-EAE2-4396-A120-45F6B7F8AD66' AS uniqueidentifier) AS BNr,  cast('925042A3-79ED-4976-82BC-B20C6FFBCCA9' AS uniqueidentifier) AS Enr Union
Select cast('B3BA6A79-8424-4FD2-A1E7-EB46CA8B8FDF' AS uniqueidentifier) AS BNr,  cast('AA231605-5343-4E29-AB92-A06A2B46D1BE' AS uniqueidentifier) AS Enr Union
Select cast('8D3F1BA8-F3B8-4DA6-9E00-8BABBC34F27B' AS uniqueidentifier) AS BNr,  cast('18E4BBB7-C2FB-416A-90C3-115B4EB4F133' AS uniqueidentifier) AS Enr Union
Select cast('2736A64A-CD99-4BB4-910A-819592D6D7BE' AS uniqueidentifier) AS BNr,  cast('3F6E89EC-76C2-4971-B39F-28E85664FEED' AS uniqueidentifier) AS Enr Union
Select cast('0D58A1F9-3CF9-4D19-93AC-7B5C5AE2DC44' AS uniqueidentifier) AS BNr,  cast('3C5DBA28-6DF0-433A-BED1-82F807B6B4BF' AS uniqueidentifier) AS Enr Union
Select cast('08B2D14E-2EB5-451D-9BE6-B27C618A65E6' AS uniqueidentifier) AS BNr,  cast('ABF38A61-B487-4217-939D-F996EEA8D52F' AS uniqueidentifier) AS Enr Union
Select cast('C55CD097-6A36-4EC5-901A-608FE9FD6BAA' AS uniqueidentifier) AS BNr,  cast('54E8126E-2164-404A-8741-B63F5AF97DEA' AS uniqueidentifier) AS Enr Union
Select cast('50E89D94-FCB9-4250-B95B-ADCEC0376CEB' AS uniqueidentifier) AS BNr,  cast('DD9837E2-33C9-4122-9845-B634DE80B84B' AS uniqueidentifier) AS Enr Union
Select cast('2EEE53E7-EB72-4DC5-A2C7-8EFD89677533' AS uniqueidentifier) AS BNr,  cast('14AAB1BF-C797-48B3-A636-2E73364478FF' AS uniqueidentifier) AS Enr Union
Select cast('5A45902B-144D-4BA7-9ECB-EC6B13A3CC76' AS uniqueidentifier) AS BNr,  cast('C6B28290-75AC-4909-868E-A40E7E6837F5' AS uniqueidentifier) AS Enr Union
Select cast('602DA02D-D3C5-4769-B8FB-DF4CC81A819A' AS uniqueidentifier) AS BNr,  cast('A51BBF7C-A062-45BF-8687-30C4F6DB802B' AS uniqueidentifier) AS Enr Union
Select cast('A5D0797B-0C58-4933-985D-EAD20A6ED1F1' AS uniqueidentifier) AS BNr,  cast('6071F831-1F9A-4CF5-8AA0-B9541AED0B39' AS uniqueidentifier) AS Enr Union
Select cast('FCF8C23E-E0C3-4527-907A-442C54C68E59' AS uniqueidentifier) AS BNr,  cast('E02A12BB-1F9B-4337-AF1B-5474C3CC85DE' AS uniqueidentifier) AS Enr Union
Select cast('01F860E4-A390-4D47-8AE2-B1DEC355BDF1' AS uniqueidentifier) AS BNr,  cast('1553F9C9-0F60-41D8-ADCC-A3B2FC0F0FF7' AS uniqueidentifier) AS Enr Union
Select cast('8A6D227D-0AB0-4747-943B-50A833514432' AS uniqueidentifier) AS BNr,  cast('3349FF13-5298-44AA-8C40-747C801731AF' AS uniqueidentifier) AS Enr Union
Select cast('09645896-B7C8-4EC3-B9C2-39CD2A797177' AS uniqueidentifier) AS BNr,  cast('ACC7822F-DB71-4518-89F0-DD0F130E18CB' AS uniqueidentifier) AS Enr Union
Select cast('6F696046-A0FE-4D95-9452-71B8116B6158' AS uniqueidentifier) AS BNr,  cast('5156877F-A330-4B0D-A065-65FF3956AB50' AS uniqueidentifier) AS Enr Union
Select cast('06C8B2A3-4277-4760-9DC6-E1B6F4B1E673' AS uniqueidentifier) AS BNr,  cast('4CBAC42F-D954-434E-96D7-EA47DFF02E8C' AS uniqueidentifier) AS Enr Union
Select cast('F090C1D4-CD1D-47A4-863F-FF4D3A6219BA' AS uniqueidentifier) AS BNr,  cast('EEB80450-8001-4245-936A-7C5590433F39' AS uniqueidentifier) AS Enr Union
Select cast('1F55AF31-55EE-47B5-9025-9EEBAD2FEEAA' AS uniqueidentifier) AS BNr,  cast('27A44EEA-F059-4711-9C66-BF5F9F175559' AS uniqueidentifier) AS Enr Union
Select cast('20686BDE-787E-443A-9C05-06229A240E1D' AS uniqueidentifier) AS BNr,  cast('0881F49C-C079-4B88-A2B5-CF452E37563D' AS uniqueidentifier) AS Enr Union
Select cast('E3265D4D-C54F-46A4-8612-F47B38599AE1' AS uniqueidentifier) AS BNr,  cast('16884E48-6826-4222-A9C9-42406C2F64C3' AS uniqueidentifier) AS Enr Union
Select cast('66F4CE1C-0169-43AA-9892-FD588C7C7D01' AS uniqueidentifier) AS BNr,  cast('5BAD6A96-D7A8-48DB-B280-8BEC710B4328' AS uniqueidentifier) AS Enr Union
Select cast('5D253276-A686-44BB-A615-D109CBC4BB38' AS uniqueidentifier) AS BNr,  cast('E2527BAE-EE16-4582-8D55-2CE4FFFABC70' AS uniqueidentifier) AS Enr Union
Select cast('6C9E2638-994B-4C85-A488-6CEDB87553EF' AS uniqueidentifier) AS BNr,  cast('1DECE867-0CF1-41F2-A8EC-84988EA6CB73' AS uniqueidentifier) AS Enr Union
Select cast('AF914D32-EA1B-4A26-9E18-4C20D3C6CBA4' AS uniqueidentifier) AS BNr,  cast('9AE4EF54-8185-49BF-9947-3DFB743ABD68' AS uniqueidentifier) AS Enr Union
Select cast('082792D2-CD48-48A9-8172-38737BC3B6A4' AS uniqueidentifier) AS BNr,  cast('BEB5EE16-BBE2-4E24-A87C-88602CA372AB' AS uniqueidentifier) AS Enr Union
Select cast('265B0EC5-1874-4EA7-A1BA-D65251F569A0' AS uniqueidentifier) AS BNr,  cast('85165F6A-B609-4413-A719-1F09B6318202' AS uniqueidentifier) AS Enr Union
Select cast('339BD0AD-4752-408A-9E0A-E7E6C6AFEC9E' AS uniqueidentifier) AS BNr,  cast('F17A8D4C-C0C3-47F5-8DE1-9A8AB99C5818' AS uniqueidentifier) AS Enr Union
Select cast('18399D28-8929-4C0A-9115-61B0BF26BC4E' AS uniqueidentifier) AS BNr,  cast('B0BEA7E6-4D4D-4775-A45F-3A72F293E262' AS uniqueidentifier) AS Enr Union
Select cast('B8A047EB-050B-4221-BD70-AF29417C280F' AS uniqueidentifier) AS BNr,  cast('A8D9EB1E-5890-49BE-9FD3-9303FC648BF2' AS uniqueidentifier) AS Enr Union
Select cast('0B712A66-99B0-4893-A539-EEE8598DE571' AS uniqueidentifier) AS BNr,  cast('16012BE9-9130-4D69-A252-BEAD5CE35E73' AS uniqueidentifier) AS Enr Union
Select cast('3C6E0929-00D0-4280-9E9C-8D5C06A44E06' AS uniqueidentifier) AS BNr,  cast('E194A078-9DEB-43A5-8003-E5A570E653EB' AS uniqueidentifier) AS Enr Union
Select cast('F8D8EA5D-7406-454A-BBCC-0BFCC71B0318' AS uniqueidentifier) AS BNr,  cast('04780509-2935-4A85-B03F-552923E0B849' AS uniqueidentifier) AS Enr Union
Select cast('7556D562-A68B-45C0-B3EF-8F18FF89EB79' AS uniqueidentifier) AS BNr,  cast('23796AA1-691F-4EF2-B3DF-FD2B8D5B3D0A' AS uniqueidentifier) AS Enr Union
Select cast('B201FBB8-CCB6-4704-B773-24A9D084E746' AS uniqueidentifier) AS BNr,  cast('86C248F2-3DF2-4454-B0CC-816883849B76' AS uniqueidentifier) AS Enr Union
Select cast('05A97218-B7A9-46E2-A579-8EDC0147E6C3' AS uniqueidentifier) AS BNr,  cast('831778A8-3739-4DFA-8587-0E6A18DC4F79' AS uniqueidentifier) AS Enr Union
Select cast('D2CE91C5-D8E0-4CAD-93A6-2580FC61E84C' AS uniqueidentifier) AS BNr,  cast('CBECA340-297C-4F12-88DF-8F867CEF8878' AS uniqueidentifier) AS Enr Union
Select cast('74BF48C0-5DCE-49B7-8C8F-81FE920865A2' AS uniqueidentifier) AS BNr,  cast('F4918D01-443F-45A7-9EB2-D5152DEDFECF' AS uniqueidentifier) AS Enr Union
Select cast('2035B8EF-84F5-4A3C-84F0-107DA2927D0A' AS uniqueidentifier) AS BNr,  cast('97294E85-3AC6-406E-A1DD-C5A322DBBC5A' AS uniqueidentifier) AS Enr Union
Select cast('8FD8AB32-598F-41EE-B067-3F1C4CD359F0' AS uniqueidentifier) AS BNr,  cast('0BF22308-1C4B-48D2-9163-97362B4B5493' AS uniqueidentifier) AS Enr Union
Select cast('EE892EF2-E7BC-432B-B123-E8B50A8CDA22' AS uniqueidentifier) AS BNr,  cast('9A0EAE29-DE76-41C0-8904-106236F4FFD3' AS uniqueidentifier) AS Enr Union
Select cast('3EBD681D-6082-4DF0-AB71-DEBC6F502FC1' AS uniqueidentifier) AS BNr,  cast('E8A9FBCA-AE7B-48D1-8993-DB20CD0574F8' AS uniqueidentifier) AS Enr Union
Select cast('95CD48A3-FC6E-4E42-BADF-1D940C141D96' AS uniqueidentifier) AS BNr,  cast('C8612132-144B-4D09-9054-435C36CC6C66' AS uniqueidentifier) AS Enr Union
Select cast('3E2AA64B-9FB1-471A-A824-D8E50FF8AE8B' AS uniqueidentifier) AS BNr,  cast('DE03FC0F-B9EC-4734-8B10-8CA200146682' AS uniqueidentifier) AS Enr Union
Select cast('F6311C57-DFEC-4F2D-AE5C-FEBA6A7C351B' AS uniqueidentifier) AS BNr,  cast('2B48C88D-E899-4638-ADE9-1B584D2D875F' AS uniqueidentifier) AS Enr Union
Select cast('96371ABB-6011-4C0E-99C7-8A76FF0BB518' AS uniqueidentifier) AS BNr,  cast('8625575A-2A98-4FC5-9D50-95191421EE70' AS uniqueidentifier) AS Enr Union
Select cast('4D7BBC95-194B-4350-94D4-875D319551CA' AS uniqueidentifier) AS BNr,  cast('96DEA792-DA95-43E7-8DA5-65E4985DD01D' AS uniqueidentifier) AS Enr Union
Select cast('18E2E6F4-8B0E-478F-B4C1-2080D9FF696F' AS uniqueidentifier) AS BNr,  cast('66BACAED-21DF-46B0-91C2-6B9857B0702E' AS uniqueidentifier) AS Enr Union
Select cast('55D52E20-4602-4CC4-B734-B50FAAF79AE9' AS uniqueidentifier) AS BNr,  cast('ACF301B9-3279-490E-BA24-61B0058EAF74' AS uniqueidentifier) AS Enr Union
Select cast('FFC9E9B0-C1EF-4757-940F-DF5096295F89' AS uniqueidentifier) AS BNr,  cast('DBF4F29D-4618-45B3-958B-A8094D5EE9EF' AS uniqueidentifier) AS Enr Union
Select cast('1AF44000-C83E-4092-88DA-9D7168632B74' AS uniqueidentifier) AS BNr,  cast('75A8DCE9-1273-4BCF-A9FC-544B50045665' AS uniqueidentifier) AS Enr Union
Select cast('3FA10C6F-0C57-4261-89DF-0C3D888DC9C5' AS uniqueidentifier) AS BNr,  cast('3DC80B6E-8F55-4E9D-8F7B-B64C34059AFA' AS uniqueidentifier) AS Enr Union
Select cast('06C017F7-D42C-4211-8EFD-2CE925298B72' AS uniqueidentifier) AS BNr,  cast('CB890D56-30C7-46E4-B5AC-526200E4775A' AS uniqueidentifier) AS Enr Union
Select cast('F6B01E57-33A0-4488-8B5A-D70EE2AE3C06' AS uniqueidentifier) AS BNr,  cast('091DFFA2-CDCB-4B8C-9629-AF54C1E36AE9' AS uniqueidentifier) AS Enr Union
Select cast('61FC4354-51D9-4E24-9A30-6CD96D1D163B' AS uniqueidentifier) AS BNr,  cast('F6BA0BE3-1AB1-43FE-8384-FF07D9C493E1' AS uniqueidentifier) AS Enr Union
Select cast('A08F6515-7C7C-401B-97AC-F7C2DBA3E839' AS uniqueidentifier) AS BNr,  cast('D268AA54-450D-4723-B064-2D6720532A5B' AS uniqueidentifier) AS Enr Union
Select cast('9EF60692-7B22-4879-85CC-C047D54D6563' AS uniqueidentifier) AS BNr,  cast('650EE796-B068-4F7B-9176-E733C2C9BAFD' AS uniqueidentifier) AS Enr Union
Select cast('DDDCDC93-9297-4F0C-952A-644BFA62E144' AS uniqueidentifier) AS BNr,  cast('0F91CA4E-50C9-431A-BE90-B6F9A3509288' AS uniqueidentifier) AS Enr Union
Select cast('BDECC1D9-D7AC-418E-A3A3-B8120D18E9E5' AS uniqueidentifier) AS BNr,  cast('72E5AC51-6037-4293-B24B-006BBB87A751' AS uniqueidentifier) AS Enr Union
Select cast('8FF7D830-CE7A-4B73-A876-E678C95A57DA' AS uniqueidentifier) AS BNr,  cast('408625D6-BD6C-493A-BA57-354B5BB5AAB4' AS uniqueidentifier) AS Enr Union
Select cast('1784B9C4-9538-4B1A-BDE3-04C516182263' AS uniqueidentifier) AS BNr,  cast('94A04169-43B0-4014-8A2F-6E642E1384B1' AS uniqueidentifier) AS Enr Union
Select cast('CF639CE5-B830-41C4-95D5-E757DAB464E5' AS uniqueidentifier) AS BNr,  cast('329BCAD8-E486-49E0-B2B6-07216C54BFA4' AS uniqueidentifier) AS Enr Union
Select cast('341CF3BE-3E06-42A9-9DE1-406CF3EED185' AS uniqueidentifier) AS BNr,  cast('8A9C680B-95E9-48CA-A5F6-AAF59830123E' AS uniqueidentifier) AS Enr Union
Select cast('CA30F84F-7B91-4FDE-9F4F-7393E69780D4' AS uniqueidentifier) AS BNr,  cast('92D24187-FFB8-4EE8-B538-9DB9A2074408' AS uniqueidentifier) AS Enr Union
Select cast('BDA74FD3-63CC-4BA8-BD40-0B7FE3653F16' AS uniqueidentifier) AS BNr,  cast('D71036CF-6171-42F2-8678-6D27D8030762' AS uniqueidentifier) AS Enr Union
Select cast('9795BB17-448B-4132-8C3D-3A94D02023AE' AS uniqueidentifier) AS BNr,  cast('A527C986-174C-406F-8999-79A5FBB4E18D' AS uniqueidentifier) AS Enr Union
Select cast('E1894082-81B4-4540-8F05-EB520A3217AB' AS uniqueidentifier) AS BNr,  cast('34CCDA77-7145-4560-99D7-0F6A21A698EB' AS uniqueidentifier) AS Enr Union
Select cast('AA237EA6-6E4D-4887-B256-3D12C7B51D6F' AS uniqueidentifier) AS BNr,  cast('18128C3A-124B-4A68-B1C2-CCF1FEB9297E' AS uniqueidentifier) AS Enr Union
Select cast('52AC8EF8-6DAD-4BAB-AF84-E405F1F10720' AS uniqueidentifier) AS BNr,  cast('54A55BA8-22D9-4187-B787-FCA253BE44B5' AS uniqueidentifier) AS Enr Union
Select cast('7474F9B2-0686-4827-A9CC-E4373AFC48BA' AS uniqueidentifier) AS BNr,  cast('6EE0EDBE-67CD-4572-B68C-9F3F8B9C8AE1' AS uniqueidentifier) AS Enr Union
Select cast('5794459C-FDBA-437E-B467-2EBB63FEF94F' AS uniqueidentifier) AS BNr,  cast('3DEF65B0-AE8A-4972-AEE3-D0EBB57FA3A9' AS uniqueidentifier) AS Enr Union
Select cast('570FB41D-7025-4062-857A-890B043F8744' AS uniqueidentifier) AS BNr,  cast('FF25A25E-CDD1-41D0-BF13-184F53B905C2' AS uniqueidentifier) AS Enr Union
Select cast('1370E13D-33B9-4BDC-B324-8FC8A9776651' AS uniqueidentifier) AS BNr,  cast('DB8AF8AF-64F7-4767-A101-2DBD93F9F060' AS uniqueidentifier) AS Enr Union
Select cast('1122DDF9-D8FE-4877-8EEB-4C039225388F' AS uniqueidentifier) AS BNr,  cast('299F6216-A0C1-4EEF-9822-A83B8BBD1CDF' AS uniqueidentifier) AS Enr Union
Select cast('E569B87C-BCD2-4FF2-A669-CACEF49D7637' AS uniqueidentifier) AS BNr,  cast('29477F89-6D10-4485-A489-144B88776237' AS uniqueidentifier) AS Enr Union
Select cast('C0381505-1C6E-47EB-9F15-E95431DA3E07' AS uniqueidentifier) AS BNr,  cast('BDC42ECA-536D-4CE8-9895-2610B45E4665' AS uniqueidentifier) AS Enr Union
Select cast('889C091E-B44A-40A6-8D88-90AE25E16C11' AS uniqueidentifier) AS BNr,  cast('E90E8ED6-17F0-4DD4-9FF9-1D2336AC11E6' AS uniqueidentifier) AS Enr Union
Select cast('F9B9E281-600B-41D5-9902-26CC7758D311' AS uniqueidentifier) AS BNr,  cast('5F253A7C-FF76-49AC-B900-D34CF3251FDD' AS uniqueidentifier) AS Enr Union
Select cast('26D952D0-7653-4741-BB79-DD154A742426' AS uniqueidentifier) AS BNr,  cast('78C7947C-B5BE-458B-B822-78ED3E34301B' AS uniqueidentifier) AS Enr Union
Select cast('0A396E4A-0ED8-4184-B760-4651B19E7882' AS uniqueidentifier) AS BNr,  cast('BC407159-EE6E-4D89-B3D3-C2D64B69EA51' AS uniqueidentifier) AS Enr Union
Select cast('500B48B6-601E-4F3D-B177-DBC31718ACDF' AS uniqueidentifier) AS BNr,  cast('6147E267-419C-493C-8827-6B4143685C21' AS uniqueidentifier) AS Enr Union
Select cast('9587924D-10E5-4AFE-BC7E-9D602A6B0D47' AS uniqueidentifier) AS BNr,  cast('D20F7121-799F-4C5B-9AC6-67C4109DF754' AS uniqueidentifier) AS Enr Union
Select cast('92B2281E-3F6E-442E-AAFD-8F4CF3D21AA6' AS uniqueidentifier) AS BNr,  cast('FCED014A-7620-41B9-8643-EC8CBE8440CC' AS uniqueidentifier) AS Enr Union
Select cast('CD83AEA7-CA8D-4703-AAC9-D4FA7A73D771' AS uniqueidentifier) AS BNr,  cast('829641CC-76D1-4CA5-B3E9-920D007E8E4A' AS uniqueidentifier) AS Enr Union
Select cast('91162F93-E467-4B48-AD5F-490B5B0F451C' AS uniqueidentifier) AS BNr,  cast('C285B1EE-EFD5-445F-B175-5126D33FC3F8' AS uniqueidentifier) AS Enr Union
Select cast('BFE06CFF-9C52-4A5D-BA22-A0D8E217E946' AS uniqueidentifier) AS BNr,  cast('4335D10A-C5B3-4AC0-9976-9E1D076B491E' AS uniqueidentifier) AS Enr Union
Select cast('825A5E4D-9B18-4982-B45C-5C559BCBA036' AS uniqueidentifier) AS BNr,  cast('C7023FE0-4E76-4924-9A51-62525520584A' AS uniqueidentifier) AS Enr Union
Select cast('F2D803A9-6FCE-4729-A144-79576B547CA7' AS uniqueidentifier) AS BNr,  cast('74FB1DD9-99E0-4F09-94FA-AB2899C9552C' AS uniqueidentifier) AS Enr Union
Select cast('FA5973CF-6FB9-4904-B020-63A9E231997B' AS uniqueidentifier) AS BNr,  cast('4556C47E-AF61-4891-BA2E-1DF1DF51385D' AS uniqueidentifier) AS Enr Union
Select cast('9070F399-B6D5-470A-AEFD-F7F752451019' AS uniqueidentifier) AS BNr,  cast('925C6AB4-0171-47BA-BDEB-36788F92B8B7' AS uniqueidentifier) AS Enr Union
Select cast('7C292CF3-04FE-442A-ACAE-D0BA000E17A4' AS uniqueidentifier) AS BNr,  cast('3299CC54-26ED-4633-9020-223E3CF25A4F' AS uniqueidentifier) AS Enr Union
Select cast('50F7454E-99C9-4B7D-947D-2044DAB8D5B4' AS uniqueidentifier) AS BNr,  cast('01C57245-620B-486A-8832-02BE8E15E3E7' AS uniqueidentifier) AS Enr Union
Select cast('FA9FD794-8A11-47DA-82EF-FCD85E3E4B35' AS uniqueidentifier) AS BNr,  cast('AE6A434C-2BC2-488C-8EA1-F10AF32F9956' AS uniqueidentifier) AS Enr Union
Select cast('1A603281-1C76-4E25-BF6F-3701EFE3FF30' AS uniqueidentifier) AS BNr,  cast('E5F2FB0D-35A5-4727-98EA-D812661271D7' AS uniqueidentifier) AS Enr Union
Select cast('A4696F0D-4A8C-4AB4-8404-6264F16EEE62' AS uniqueidentifier) AS BNr,  cast('5C18B339-1E34-4808-9ABF-4B665FA9E72D' AS uniqueidentifier) AS Enr Union
Select cast('B27F705C-E055-4D5D-A09B-7BD603AC841E' AS uniqueidentifier) AS BNr,  cast('2115C107-4DD0-4505-8505-A949462BE20A' AS uniqueidentifier) AS Enr Union
Select cast('15FB413B-1A1D-4049-96AA-3E7330C64EB6' AS uniqueidentifier) AS BNr,  cast('8877BC09-0754-4BF8-91B1-232EEB45AC75' AS uniqueidentifier) AS Enr Union
Select cast('92C862DC-CC2D-4160-A269-20064DBF41C1' AS uniqueidentifier) AS BNr,  cast('31967088-9BF8-4001-BF47-19B15B757719' AS uniqueidentifier) AS Enr Union
Select cast('1C583C24-5DA7-4346-8566-529F36C360C5' AS uniqueidentifier) AS BNr,  cast('A5A0DFF5-F8FA-458D-9CDD-8610784EA4B8' AS uniqueidentifier) AS Enr Union
Select cast('F9231E53-A50D-45FA-9536-300595194F47' AS uniqueidentifier) AS BNr,  cast('C9712A4A-2DCD-4691-A4FD-F075992F5BB8' AS uniqueidentifier) AS Enr Union
Select cast('BB35178D-ECB6-48BB-8156-14A96F0B3A65' AS uniqueidentifier) AS BNr,  cast('A60F8A18-1FB7-4A3C-8AD0-8D3538000B06' AS uniqueidentifier) AS Enr Union
Select cast('3BD646C5-6B78-4B5D-96AF-4C66E3863327' AS uniqueidentifier) AS BNr,  cast('0183DF7B-B9C9-4442-92D2-A66F9CD5AA43' AS uniqueidentifier) AS Enr Union
Select cast('54E98ACF-4544-436D-9562-E927E9FCE7AB' AS uniqueidentifier) AS BNr,  cast('42BD2827-3EDE-4D39-B79E-CD67D2E55626' AS uniqueidentifier) AS Enr Union
Select cast('9FBFD85F-B0EC-49E0-8840-4A96DB45B780' AS uniqueidentifier) AS BNr,  cast('05FFFBFC-1A82-4084-A7C2-788B23CF4205' AS uniqueidentifier) AS Enr Union
Select cast('818BFC8D-2F96-41C6-8056-E4677700208D' AS uniqueidentifier) AS BNr,  cast('54ACF2DC-1A3F-4092-A312-D08D91885A19' AS uniqueidentifier) AS Enr Union
Select cast('16095A44-14DF-43D2-9592-4845A21D1570' AS uniqueidentifier) AS BNr,  cast('511D2AF2-951F-4A00-A347-7636C1B19304' AS uniqueidentifier) AS Enr Union
Select cast('10FEEB31-6E8B-4CC4-82C9-A2F332B0F728' AS uniqueidentifier) AS BNr,  cast('A8707DFB-9805-41B3-BACD-916A7E051805' AS uniqueidentifier) AS Enr Union
Select cast('4EDF94AF-DE96-457E-B368-66E4FC08A15F' AS uniqueidentifier) AS BNr,  cast('136C9F13-C474-471F-9671-3D81C78C7138' AS uniqueidentifier) AS Enr Union
Select cast('DD2C1604-F925-433F-AA13-C72E55A65DC4' AS uniqueidentifier) AS BNr,  cast('EBDE59B5-E79B-4927-B4EA-E049305B1044' AS uniqueidentifier) AS Enr Union
Select cast('B06E944F-035D-4E72-AD0E-1052BB59F17F' AS uniqueidentifier) AS BNr,  cast('CB288F49-7BB0-4DBA-8EBE-50DAD8422AF5' AS uniqueidentifier) AS Enr Union
Select cast('2B087D5A-E2AB-4785-84D8-667B06D28891' AS uniqueidentifier) AS BNr,  cast('909D74FF-A7FD-402E-9CE2-C8B8B9F25F97' AS uniqueidentifier) AS Enr Union
Select cast('AB60D561-3FD6-4337-8003-AFFF4421EC64' AS uniqueidentifier) AS BNr,  cast('A3B74AF2-B1DE-4F11-A8AB-F288B32B1E57' AS uniqueidentifier) AS Enr Union
Select cast('40AB967D-6C11-4069-BEBC-3731C7E597B6' AS uniqueidentifier) AS BNr,  cast('F23C37F9-97AC-400E-BB1A-467B4B0DEA87' AS uniqueidentifier) AS Enr Union
Select cast('79CC97C4-EDD8-4C29-AFD2-0C2DAFB283F5' AS uniqueidentifier) AS BNr,  cast('9B1BB071-ACC9-43FA-825E-78B5C6C2FC0F' AS uniqueidentifier) AS Enr Union
Select cast('38C34BBB-7811-46DC-A482-C5BA5C4A872A' AS uniqueidentifier) AS BNr,  cast('4CBA283F-183D-4EE1-9528-65BB973A862C' AS uniqueidentifier) AS Enr Union
Select cast('F6543E48-7864-4B2D-8A51-6BC59DB402B3' AS uniqueidentifier) AS BNr,  cast('8BC6FE67-DE7A-4A38-B03E-F655E15EE409' AS uniqueidentifier) AS Enr Union
Select cast('866D6762-26BB-4B36-8508-52F71FB9927A' AS uniqueidentifier) AS BNr,  cast('E9ED10F6-590A-40F9-B347-486E4B6E09DD' AS uniqueidentifier) AS Enr Union
Select cast('F3FB152E-04BC-44C3-834A-8E4756BD2E8C' AS uniqueidentifier) AS BNr,  cast('38F92425-1CC0-4A03-85B5-5C32021368D2' AS uniqueidentifier) AS Enr Union
Select cast('77A3D13C-CE0B-4491-860C-3CF64F130E1B' AS uniqueidentifier) AS BNr,  cast('1F16A9B0-D8B6-4758-A324-FB74C663B69B' AS uniqueidentifier) AS Enr Union
Select cast('3DCFF955-E5E7-43BF-9E65-4885CFA0EAC9' AS uniqueidentifier) AS BNr,  cast('AD4D7822-F995-4D0B-B386-145B817A9417' AS uniqueidentifier) AS Enr Union
Select cast('AFE0E706-3884-486C-944C-16F55FEB2F95' AS uniqueidentifier) AS BNr,  cast('1106FE0E-D986-4F36-AE68-0AD7B3D0E377' AS uniqueidentifier) AS Enr Union
Select cast('E3DE230A-C275-4E70-BB5A-397C895C925A' AS uniqueidentifier) AS BNr,  cast('A845B9FE-E99D-48C3-89ED-755757094AB3' AS uniqueidentifier) AS Enr Union
Select cast('602F0B51-0891-410C-9ED2-98E5748A5F62' AS uniqueidentifier) AS BNr,  cast('0514C5B7-1CCB-4CC6-927D-2A28543170FE' AS uniqueidentifier) AS Enr Union
Select cast('E3F8A6D1-C69A-47D3-BD64-BDA7FF0757B0' AS uniqueidentifier) AS BNr,  cast('B96D54CC-EAD5-43BC-B090-315C490738BB' AS uniqueidentifier) AS Enr Union
Select cast('07AFED75-7C99-4F5C-A1A1-A3A1F36BA24A' AS uniqueidentifier) AS BNr,  cast('4110D8C7-8279-4572-A5BF-2C1F095FC79B' AS uniqueidentifier) AS Enr Union
Select cast('61C610B6-2E00-4D6D-949B-DF16F6C964F4' AS uniqueidentifier) AS BNr,  cast('1CDF8BC9-3704-48CC-BEF7-E546930A18E8' AS uniqueidentifier) AS Enr Union
Select cast('2A2A72B3-B5D4-4A6F-BC88-25C799FF78AD' AS uniqueidentifier) AS BNr,  cast('4616A012-0D5B-4A5F-8444-D0B89759B2E2' AS uniqueidentifier) AS Enr Union
Select cast('FB19EA10-6EBB-4CD4-AE64-53DBC9F5C1C2' AS uniqueidentifier) AS BNr,  cast('DCCA9C17-41ED-4474-BDB6-788B23AF8BB4' AS uniqueidentifier) AS Enr Union
Select cast('8C9C428E-2F31-46A6-8CD5-AB2A4CC7BDD7' AS uniqueidentifier) AS BNr,  cast('EBCA4FFE-CAB9-4669-ADA2-A40C8240DD9C' AS uniqueidentifier) AS Enr Union
Select cast('23FE0103-D4FE-4020-9987-1BD722FCB8EA' AS uniqueidentifier) AS BNr,  cast('76667522-1AED-4902-961B-913214F9773C' AS uniqueidentifier) AS Enr Union
Select cast('C99C6CE9-5A72-4459-844A-A92086B0FCE2' AS uniqueidentifier) AS BNr,  cast('AFD25BAE-8430-43EB-9713-94FE7DECCBF6' AS uniqueidentifier) AS Enr Union
Select cast('71E4E996-28D5-47D8-B17D-7BCA816AFE69' AS uniqueidentifier) AS BNr,  cast('2DAD5CD4-93AC-49F0-8092-CB4A2D027061' AS uniqueidentifier) AS Enr Union
Select cast('7EB7AED7-9CC1-44CD-9755-0C104A41C876' AS uniqueidentifier) AS BNr,  cast('B3A63598-8423-4B53-B622-4F495F8ED9A4' AS uniqueidentifier) AS Enr Union
Select cast('9DA75A4C-DE45-4F78-A057-CC5FE60759A2' AS uniqueidentifier) AS BNr,  cast('0389C9BA-7603-44D3-984F-2A1D11EEFE9B' AS uniqueidentifier) AS Enr Union
Select cast('A63C4A80-38E4-4F3A-AA92-DE57299487EF' AS uniqueidentifier) AS BNr,  cast('B2FEE8EE-C2B8-430B-A861-6B9C093BEF7B' AS uniqueidentifier) AS Enr Union
Select cast('534C3AC1-D886-4F03-AB74-DC2266372965' AS uniqueidentifier) AS BNr,  cast('A4445A93-FC0C-4864-B8F2-ED8B3513095A' AS uniqueidentifier) AS Enr Union
Select cast('5F2900E1-302B-4347-A002-E802A5338727' AS uniqueidentifier) AS BNr,  cast('26C8971C-6688-4042-B172-9FB3774EE829' AS uniqueidentifier) AS Enr Union
Select cast('9D363843-14E7-449C-A150-B9BA56E4C49E' AS uniqueidentifier) AS BNr,  cast('990F12AE-BC67-4622-ACC4-9F6D7E46D12D' AS uniqueidentifier) AS Enr Union
Select cast('0AA53376-B5F5-4229-BCC5-56D3875F1B28' AS uniqueidentifier) AS BNr,  cast('5F459823-7F4B-4516-87D8-82F0F8E95240' AS uniqueidentifier) AS Enr Union
Select cast('15B2DA9C-6C4D-4300-9B92-152BE1A47BCC' AS uniqueidentifier) AS BNr,  cast('D897C1EB-A910-4468-9B58-EB9E438908E3' AS uniqueidentifier) AS Enr Union
Select cast('EF1973FC-8F79-4D05-A01C-1C5D81897F0C' AS uniqueidentifier) AS BNr,  cast('29329B7B-F03D-4DB9-8819-50EB2114FCAB' AS uniqueidentifier) AS Enr Union
Select cast('AAC9D92C-5038-40E4-AC47-3FB4910F6D37' AS uniqueidentifier) AS BNr,  cast('BB5CB6E8-B985-4281-95AC-A9E5DA2B68F6' AS uniqueidentifier) AS Enr Union
Select cast('5393932E-140B-4D23-8CDA-0D2508AC399B' AS uniqueidentifier) AS BNr,  cast('AA8D3AF9-BE2A-491B-AED3-7DEC37622C76' AS uniqueidentifier) AS Enr Union
Select cast('AB388A1A-2FC6-4516-8ECC-D1542AA9D097' AS uniqueidentifier) AS BNr,  cast('FC4701E5-0CD6-4671-8CC8-32979E16E518' AS uniqueidentifier) AS Enr Union
Select cast('CC22F554-9265-4328-A5A2-FB1456E2DE17' AS uniqueidentifier) AS BNr,  cast('E892EAC2-E89B-4E82-8CF2-94BAA2CFF9B4' AS uniqueidentifier) AS Enr Union
Select cast('211871A9-112B-46B2-B1EA-B7FA82E48993' AS uniqueidentifier) AS BNr,  cast('3AEC6A8A-3ACF-48E9-A829-1D22B40B6C49' AS uniqueidentifier) AS Enr Union
Select cast('80E9E9CA-EADF-48DA-B76D-56314661C88A' AS uniqueidentifier) AS BNr,  cast('AC299428-942A-413C-B5AB-E808BE1ED197' AS uniqueidentifier) AS Enr Union
Select cast('01475C24-B45E-494E-A200-ABC6D233FA49' AS uniqueidentifier) AS BNr,  cast('AB0EC9BD-8A67-4801-B9A0-C4031D9DB5DA' AS uniqueidentifier) AS Enr Union
Select cast('F65716E7-BC42-44D8-8979-F727E0E6CD44' AS uniqueidentifier) AS BNr,  cast('8D7AFE97-559C-4186-88F2-BC1E4E58EFC9' AS uniqueidentifier) AS Enr Union
Select cast('992BCF28-3407-4805-85C5-57E3661545C1' AS uniqueidentifier) AS BNr,  cast('80EF07FE-F49E-4AFA-9C02-465CA6AD1A2B' AS uniqueidentifier) AS Enr Union
Select cast('9F4A2CB5-87BC-4CC3-8819-F06C156C0A85' AS uniqueidentifier) AS BNr,  cast('6F130892-9DC3-4846-89B2-82248B3FB286' AS uniqueidentifier) AS Enr Union
Select cast('8BC2C2BE-CBC2-4B11-AF98-CDDEE5201F04' AS uniqueidentifier) AS BNr,  cast('6F066CBB-49A9-447A-9E5F-886EEC96C569' AS uniqueidentifier) AS Enr Union
Select cast('78B52A95-3D6F-4C46-9314-7ECCED107D09' AS uniqueidentifier) AS BNr,  cast('7B0B6007-C8FE-4B61-A872-2C89AA92BE20' AS uniqueidentifier) AS Enr Union
Select cast('6B08F128-6CEA-446B-A772-A2B283D5C796' AS uniqueidentifier) AS BNr,  cast('78418CF0-277F-4E56-A3B2-581125BD6106' AS uniqueidentifier) AS Enr Union
Select cast('C3648025-FB33-4FA4-A1E1-0F65092E4F32' AS uniqueidentifier) AS BNr,  cast('47E160D6-AF3F-4C3C-9610-14F75914E94A' AS uniqueidentifier) AS Enr Union
Select cast('318CE22B-FD7B-47B6-B25F-64CA53BFABB5' AS uniqueidentifier) AS BNr,  cast('56426E7A-A3C7-4F0E-B96C-18583DAA9059' AS uniqueidentifier) AS Enr Union
Select cast('E485F5CC-82FB-4CB8-A634-F1EF2F2132E4' AS uniqueidentifier) AS BNr,  cast('0A1EB32C-C51F-4612-B0E6-C3D90C739BAE' AS uniqueidentifier) AS Enr Union
Select cast('848331BA-C91D-4347-BA08-64D569730C81' AS uniqueidentifier) AS BNr,  cast('2A1C1ECA-9174-44A0-A3BB-C2C4F30226F6' AS uniqueidentifier) AS Enr Union
Select cast('066A3B94-DA3C-457B-8E37-5A5453A39F6C' AS uniqueidentifier) AS BNr,  cast('77CB9ED4-128D-4CEF-A098-1E6DF4195F89' AS uniqueidentifier) AS Enr Union
Select cast('B0F18FD4-8C5F-4598-B1F8-940BE3B89D27' AS uniqueidentifier) AS BNr,  cast('42D5ECEE-CF3C-44AE-B6B4-5C816F927709' AS uniqueidentifier) AS Enr Union
Select cast('F2B2B75E-5F1A-488E-A90A-CC47068EBF23' AS uniqueidentifier) AS BNr,  cast('DCDD842D-F33F-45BF-8160-B9D2CE50BE33' AS uniqueidentifier) AS Enr Union
Select cast('8BB1DBD9-772A-45D5-BBAB-613BE42AF53D' AS uniqueidentifier) AS BNr,  cast('39717F91-2F97-4B5F-860A-E1B9E06514F6' AS uniqueidentifier) AS Enr Union
Select cast('502BAB13-F538-4E37-AA18-31FCD7CF6BE6' AS uniqueidentifier) AS BNr,  cast('6374CA22-8ACF-43D0-8515-9040F0DE58AB' AS uniqueidentifier) AS Enr Union
Select cast('CB8C482B-4BA1-4C6F-B83B-45104D9DB8F0' AS uniqueidentifier) AS BNr,  cast('D792FD85-5E86-4C25-A4F2-A529E716CCEC' AS uniqueidentifier) AS Enr Union
Select cast('53D2DD53-6C94-43D4-B66B-55A299001101' AS uniqueidentifier) AS BNr,  cast('C6538D9E-4839-4582-96B6-2AA99B2572AF' AS uniqueidentifier) AS Enr Union
Select cast('58E8DB73-0F65-4917-B44D-79C703E0ACE6' AS uniqueidentifier) AS BNr,  cast('CF71BA65-5467-4809-BA77-FAC8F250DF2F' AS uniqueidentifier) AS Enr Union
Select cast('37D9D081-07E6-4A46-90E4-B6C4D8789237' AS uniqueidentifier) AS BNr,  cast('C1BB4BA6-8C84-4CFE-B431-F18C7F1E014C' AS uniqueidentifier) AS Enr Union
Select cast('C74ACC59-7263-4A49-AEE1-4D7FE04A3C70' AS uniqueidentifier) AS BNr,  cast('E3DE184C-86D2-415E-86EB-9CAF917211FE' AS uniqueidentifier) AS Enr Union
Select cast('BD31A971-4FAC-4AAD-9A09-1379BCBEA972' AS uniqueidentifier) AS BNr,  cast('1D107BDD-7CA9-46A7-B4D2-0734EAFB446A' AS uniqueidentifier) AS Enr Union
Select cast('C82C5DB2-1674-4D27-AD95-21EE3122229A' AS uniqueidentifier) AS BNr,  cast('6B529F2B-BE40-47A8-8A37-872DC737D4A0' AS uniqueidentifier) AS Enr Union
Select cast('24A23147-DAFD-498C-9952-86FC8C302359' AS uniqueidentifier) AS BNr,  cast('B939A6B5-E401-42CC-9817-1E868EE0F0B9' AS uniqueidentifier) AS Enr Union
Select cast('76C2A86F-803E-46F9-84B5-6E52E2FEF136' AS uniqueidentifier) AS BNr,  cast('59A204BC-CA02-49C5-9419-16D4D6BCBAC3' AS uniqueidentifier) AS Enr Union
Select cast('379646D7-2ED1-404D-8B4D-C93BDFCC8631' AS uniqueidentifier) AS BNr,  cast('F51CBD1C-2B2B-4266-A830-0BF2C318F298' AS uniqueidentifier) AS Enr Union
Select cast('3D7DB294-C870-44A1-A3C4-EF43D8EE0491' AS uniqueidentifier) AS BNr,  cast('AA646B3B-E1AF-4D92-BE8E-FDB519353264' AS uniqueidentifier) AS Enr Union
Select cast('CF4CC962-78A7-4BB1-BD66-60CA90B8214F' AS uniqueidentifier) AS BNr,  cast('19973114-C802-48EC-A7C3-EEE4AB3BD290' AS uniqueidentifier) AS Enr Union
Select cast('B3CE53C3-62DD-4151-AE92-FA852E8F066A' AS uniqueidentifier) AS BNr,  cast('5A1A483F-B440-460D-8613-5562112F23AE' AS uniqueidentifier) AS Enr Union
Select cast('6F2AA62F-72CD-46A6-8E08-15D5A44C6448' AS uniqueidentifier) AS BNr,  cast('73EFC4BB-4A8D-4F6E-BB3E-A5EA984CAFE1' AS uniqueidentifier) AS Enr Union
Select cast('3D8D50ED-AF27-4397-88D8-1DD2C7C17D73' AS uniqueidentifier) AS BNr,  cast('CD85D210-A301-410E-A342-8F82041D4C86' AS uniqueidentifier) AS Enr Union
Select cast('29F3D287-B41B-489C-B3B7-78AE8A9AEE6C' AS uniqueidentifier) AS BNr,  cast('46C4AC74-5219-4262-B11F-07181DF50E5F' AS uniqueidentifier) AS Enr Union
Select cast('32E1ED8F-7300-4E6E-A531-D71F524D7FD0' AS uniqueidentifier) AS BNr,  cast('B95DDFF5-097E-4BBD-887A-A13DF3D74194' AS uniqueidentifier) AS Enr Union
Select cast('33F440FF-D801-473F-B18F-874ECFE21B40' AS uniqueidentifier) AS BNr,  cast('7236CEBF-BD28-425E-B10A-7BB6873E5B92' AS uniqueidentifier) AS Enr Union
Select cast('69406C69-C93A-4A40-9C6C-4119EAA1CF12' AS uniqueidentifier) AS BNr,  cast('381C390C-A036-4C64-8B24-87E169E1CBEE' AS uniqueidentifier) AS Enr Union
Select cast('508E327F-A1BB-4934-95D3-36A7B7CA6B78' AS uniqueidentifier) AS BNr,  cast('8A229162-542F-4263-A6D2-BCBB3CAE2535' AS uniqueidentifier) AS Enr Union
Select cast('4D5AD66A-4E76-4EE7-9CDE-ACCDB49E4B4F' AS uniqueidentifier) AS BNr,  cast('17D94AB0-C0E5-416C-8E2F-4816D80ABE79' AS uniqueidentifier) AS Enr Union
Select cast('1CFB7499-B6CA-4A9F-85BD-78D6FA2F29D4' AS uniqueidentifier) AS BNr,  cast('A5B5DBF2-AA80-4985-97F0-64AEA61FE8A9' AS uniqueidentifier) AS Enr Union
Select cast('38A2ED9B-90AE-4C86-B7AF-8B27AA15C821' AS uniqueidentifier) AS BNr,  cast('2EA43398-EA78-4065-90C3-A16550A875D5' AS uniqueidentifier) AS Enr Union
Select cast('8049CADF-EB3F-4B2E-B5ED-5C795350AB69' AS uniqueidentifier) AS BNr,  cast('1542F1F2-E906-4821-884F-924E1FDC18FE' AS uniqueidentifier) AS Enr Union
Select cast('4B4EE7CD-671A-4286-95FF-DFE548C690E1' AS uniqueidentifier) AS BNr,  cast('997B90ED-D494-4E27-902F-D8EBFD204C8B' AS uniqueidentifier) AS Enr Union
Select cast('0F308CCE-4A31-451E-9DB3-5643843B8BBA' AS uniqueidentifier) AS BNr,  cast('A14F3987-4059-4256-807F-C031BBD7DA26' AS uniqueidentifier) AS Enr Union
Select cast('C905101C-E6AC-4290-816E-10C3C6265814' AS uniqueidentifier) AS BNr,  cast('8444FDFB-FBBF-46A1-A7C0-582B684A7AD2' AS uniqueidentifier) AS Enr Union
Select cast('E7C125F9-FC3E-4B64-A382-A195F1054325' AS uniqueidentifier) AS BNr,  cast('4AFFAD23-9F10-4851-B3C7-043F17EB916E' AS uniqueidentifier) AS Enr Union
Select cast('0C6485B1-C4F7-4BB8-9C0D-B8CA2FC70746' AS uniqueidentifier) AS BNr,  cast('C260AED7-A366-4F45-A2BB-AF2D3B36AA94' AS uniqueidentifier) AS Enr Union
Select cast('D89425D0-99B7-48DB-B15E-0314CA12875E' AS uniqueidentifier) AS BNr,  cast('40686E57-659E-4965-8B89-E03C43F72DCD' AS uniqueidentifier) AS Enr Union
Select cast('B3638A85-AAEE-4083-BBEB-48A1B304E4C9' AS uniqueidentifier) AS BNr,  cast('C67D82B2-FBD4-4839-AF28-714968A53794' AS uniqueidentifier) AS Enr Union
Select cast('8F89D393-87D6-4977-A0B2-CDED2B75F4D1' AS uniqueidentifier) AS BNr,  cast('267CA00F-D130-4211-94D6-C9623BDB28E6' AS uniqueidentifier) AS Enr Union
Select cast('1DF3D042-39D5-4C3A-B0B2-B08189952174' AS uniqueidentifier) AS BNr,  cast('A41ADE56-635B-4254-A9FF-D953D3A24088' AS uniqueidentifier) AS Enr Union
Select cast('C2A8073B-EC55-4905-9EAF-2E3BDECF3C4E' AS uniqueidentifier) AS BNr,  cast('669A878C-2C09-41F1-AD3B-B6B04F9B9E44' AS uniqueidentifier) AS Enr Union
Select cast('8453B49C-C307-449A-94C3-1E9C341FE24C' AS uniqueidentifier) AS BNr,  cast('55B42A51-5E51-4857-B700-A2AB0C6F9E29' AS uniqueidentifier) AS Enr Union
Select cast('5CA33D75-DC7A-4DB9-9791-48300BEA1DB8' AS uniqueidentifier) AS BNr,  cast('27E9A19E-FF00-46BD-BADE-D4B2589D7C66' AS uniqueidentifier) AS Enr Union
Select cast('BAC87E3E-02FD-44F8-B830-34433DA6EAA3' AS uniqueidentifier) AS BNr,  cast('A896E740-E70F-4F6C-870E-ED5DAA9DAB20' AS uniqueidentifier) AS Enr Union
Select cast('EE622E46-D17A-45B1-B853-4CB317FBC625' AS uniqueidentifier) AS BNr,  cast('778BA1C6-30E3-4FB7-8899-A05896BC7524' AS uniqueidentifier) AS Enr Union
Select cast('1EE7DCD4-A539-4D5F-9A6F-9B6DF2C3254C' AS uniqueidentifier) AS BNr,  cast('06ADFB18-15B1-4AAB-A435-BADF50060909' AS uniqueidentifier) AS Enr Union
Select cast('53405B12-421C-4E8C-A21F-23F9A65B6638' AS uniqueidentifier) AS BNr,  cast('CEDD7837-807F-4667-BC6C-D8CC2568D9A2' AS uniqueidentifier) AS Enr Union
Select cast('AA6A2F31-3C29-4B28-A84C-1E5AE2680810' AS uniqueidentifier) AS BNr,  cast('9FB74491-521C-4CDA-A719-786EE8110CFF' AS uniqueidentifier) AS Enr Union
Select cast('21911BDC-264C-415C-93DA-3DB1F8D7C046' AS uniqueidentifier) AS BNr,  cast('87C9E62B-D774-4AF3-B1AD-53BE644AC6F7' AS uniqueidentifier) AS Enr Union
Select cast('421E86D3-A5EE-4162-A5D4-4BC3413DC4AC' AS uniqueidentifier) AS BNr,  cast('7D4E66B8-2FDE-4AB4-B69C-A3787C11394F' AS uniqueidentifier) AS Enr Union
Select cast('E6941909-7BED-4DE1-962E-EA8C9C680CCD' AS uniqueidentifier) AS BNr,  cast('D0A02971-8380-4DE5-BA3D-F78CC1C43CE3' AS uniqueidentifier) AS Enr Union
Select cast('86CDDD71-BDCA-4C22-A188-75107D1A6B1B' AS uniqueidentifier) AS BNr,  cast('7B580192-181F-4E41-824E-57A491288586' AS uniqueidentifier) AS Enr Union
Select cast('AC9B7FD0-327C-4216-9B9E-6145C124C25E' AS uniqueidentifier) AS BNr,  cast('3B4A05D2-511A-442B-8F4E-A7AB3775C1CA' AS uniqueidentifier) AS Enr Union
Select cast('CA929ED2-140D-40B5-843C-F73716E99FEC' AS uniqueidentifier) AS BNr,  cast('6B6828E2-9E39-4C5D-A36A-751FCCA89587' AS uniqueidentifier) AS Enr Union
Select cast('91E80110-7CA2-4277-8CDC-386D459754B4' AS uniqueidentifier) AS BNr,  cast('CB798E55-66F0-4EB1-90F4-FD733CA1FD16' AS uniqueidentifier) AS Enr Union
Select cast('36C753CA-26E0-4EDE-A53B-2E54F6CACF12' AS uniqueidentifier) AS BNr,  cast('19422D87-C95C-4BFF-A3F2-604AD8C60A61' AS uniqueidentifier) AS Enr Union
Select cast('E17BBE88-88AE-4A1A-A75D-5C91340BD50D' AS uniqueidentifier) AS BNr,  cast('E97C0903-D73F-46D6-AFA9-967BEA0FDC2A' AS uniqueidentifier) AS Enr Union
Select cast('24BF55CE-B931-4CD2-9B62-0D1A87F6F13F' AS uniqueidentifier) AS BNr,  cast('77E61CDA-EC25-43E0-ABCE-11436199F302' AS uniqueidentifier) AS Enr Union
Select cast('B1D87F1D-8087-4602-B9D8-7E175F9EE819' AS uniqueidentifier) AS BNr,  cast('0AB38700-014F-4CD8-8425-F8E711BED339' AS uniqueidentifier) AS Enr Union
Select cast('AC8A0C97-E47C-479F-B5C7-1E471B81648F' AS uniqueidentifier) AS BNr,  cast('9A6D8559-C717-4DA8-B8D3-BC1ABED7A137' AS uniqueidentifier) AS Enr Union
Select cast('4E61AAE1-9741-4D86-9B59-F1BB2F2AA121' AS uniqueidentifier) AS BNr,  cast('8E3EF319-C84D-4DBF-A40A-CB1ABC597E2C' AS uniqueidentifier) AS Enr Union
Select cast('5324551C-9A85-4A1A-95E5-9E2BBDD242FA' AS uniqueidentifier) AS BNr,  cast('4A257555-ADA2-4CA0-8834-FD3B81C6F862' AS uniqueidentifier) AS Enr Union
Select cast('B97154BA-82C9-4A32-8DB7-0CBCF4C3DA47' AS uniqueidentifier) AS BNr,  cast('B798B89C-C760-4BE5-88CA-267D29167240' AS uniqueidentifier) AS Enr Union
Select cast('936E1BCB-6520-480A-ABE9-9A0111ED646E' AS uniqueidentifier) AS BNr,  cast('EA2D5838-AEA7-4906-85D6-AF750C87496C' AS uniqueidentifier) AS Enr Union
Select cast('E9697242-124A-434D-8CF7-EE42143B37D0' AS uniqueidentifier) AS BNr,  cast('0360E386-F5DB-49A3-A436-58E974CC481C' AS uniqueidentifier) AS Enr Union
Select cast('144D7E95-2E6F-4DAD-BB8F-E8A949AD7C87' AS uniqueidentifier) AS BNr,  cast('719E6468-4141-4F9D-AA32-CEF7CD96C223' AS uniqueidentifier) AS Enr Union
Select cast('B2FD355A-9653-43AD-A215-D1F5607EFF58' AS uniqueidentifier) AS BNr,  cast('FDD83C0A-08F4-498C-81DD-4FC40C0F18E4' AS uniqueidentifier) AS Enr Union
Select cast('87EC1BD6-65DC-462B-918B-B153FF1D9531' AS uniqueidentifier) AS BNr,  cast('8607D130-59C9-4A99-BB21-C08AC72ED835' AS uniqueidentifier) AS Enr Union
Select cast('6316BF13-6365-4405-AA56-0531BAA5573F' AS uniqueidentifier) AS BNr,  cast('0F1B3DC3-0E61-4DEC-B1F7-1D82D907F223' AS uniqueidentifier) AS Enr Union
Select cast('3002B52D-BBBE-4119-A077-20625877FB49' AS uniqueidentifier) AS BNr,  cast('D120A0B5-A5BB-4B1B-8A3C-67BE9E9A1743' AS uniqueidentifier) AS Enr Union
Select cast('B4B34728-0272-4F10-923F-06F7FACCA2B3' AS uniqueidentifier) AS BNr,  cast('F6F1B2D9-ECC2-411A-B3F8-E0FC8F82208B' AS uniqueidentifier) AS Enr Union
Select cast('29254C21-0D87-4DD0-97A2-2C2906508D28' AS uniqueidentifier) AS BNr,  cast('E362BE3D-95FF-49E4-BE39-D1BCFBB35225' AS uniqueidentifier) AS Enr Union
Select cast('FCE2DEB5-F47D-4186-B025-45A837C3B010' AS uniqueidentifier) AS BNr,  cast('7DD381CC-42CB-4071-97DA-9DCC9A91918C' AS uniqueidentifier) AS Enr Union
Select cast('931773A5-18AB-49B3-ABD4-82C5ED6192B4' AS uniqueidentifier) AS BNr,  cast('FFCFF8A0-3184-42A8-84F8-30C780CBF9F8' AS uniqueidentifier) AS Enr Union
Select cast('8FCC0CDE-CC65-4FEA-8037-D84EF86B8C59' AS uniqueidentifier) AS BNr,  cast('F1D186B9-DEF9-43D0-81BE-6C45089700E5' AS uniqueidentifier) AS Enr Union
Select cast('920539D3-5201-4700-BA8F-DB2AE850FAFA' AS uniqueidentifier) AS BNr,  cast('27C5F5C7-ECD6-4AC4-BB09-2F01C560E990' AS uniqueidentifier) AS Enr Union
Select cast('D0AF9310-0AA6-48AC-AD15-00C07BD479BE' AS uniqueidentifier) AS BNr,  cast('C50DE0D6-9034-4143-8348-8FEECA16BD80' AS uniqueidentifier) AS Enr Union
Select cast('6DBD7A5A-511D-4754-99BE-4D1C4022CF30' AS uniqueidentifier) AS BNr,  cast('D5E89C69-6037-4722-9CEA-DB4B40FDF94F' AS uniqueidentifier) AS Enr Union
Select cast('CBF650A1-5ADF-4A39-9360-5EC56626885D' AS uniqueidentifier) AS BNr,  cast('4552F128-DDB2-4C28-9F9E-45E83818877D' AS uniqueidentifier) AS Enr Union
Select cast('47059F26-3EEC-472D-B0AA-EE16DE36799B' AS uniqueidentifier) AS BNr,  cast('A82F2812-E68F-4408-BCE4-7DFFA05A9722' AS uniqueidentifier) AS Enr Union
Select cast('01BC0C53-1168-4040-91AF-874BBD7DC746' AS uniqueidentifier) AS BNr,  cast('7C25C13F-1A43-4957-96D3-81E1673AEB5F' AS uniqueidentifier) AS Enr Union
Select cast('EC5D4937-A5EB-44E8-9CA3-679F55CA55EB' AS uniqueidentifier) AS BNr,  cast('6EDEB5A5-F2CC-4BE9-891E-9195A652D621' AS uniqueidentifier) AS Enr Union
Select cast('A2186924-1B7F-4DE6-9EE8-423B072208AB' AS uniqueidentifier) AS BNr,  cast('B76499C1-0529-40FE-96FC-438B9F5C3CAB' AS uniqueidentifier) AS Enr Union
Select cast('99F7B6DE-B3A8-41BA-839D-07DA265BF381' AS uniqueidentifier) AS BNr,  cast('F89F2DE6-9F84-48E7-B2CA-0255400ABB4F' AS uniqueidentifier) AS Enr Union
Select cast('7EF2374E-A703-4535-8B8E-2F462367C28D' AS uniqueidentifier) AS BNr,  cast('3877ECB3-3FB5-486E-986E-3FFDED69DB38' AS uniqueidentifier) AS Enr Union
Select cast('67247ED9-8279-47C7-B8D6-6FF4CED1A170' AS uniqueidentifier) AS BNr,  cast('ABFF32C1-ED05-4D88-8F91-CD32898E9EF0' AS uniqueidentifier) AS Enr Union
Select cast('937D1093-E86E-45B5-99EC-BEFE627684A0' AS uniqueidentifier) AS BNr,  cast('34AC5249-53F8-4358-87F3-FD9C22028F0C' AS uniqueidentifier) AS Enr Union
Select cast('2042E2CD-6DEC-4FCD-8238-0619AFBA5926' AS uniqueidentifier) AS BNr,  cast('A873B3DC-4987-47B4-A96F-FB08A828AEFD' AS uniqueidentifier) AS Enr Union
Select cast('2E25E9F5-3F01-40B7-B380-C08D187E881B' AS uniqueidentifier) AS BNr,  cast('285571BE-F529-4663-B11E-26BF56CC6BD3' AS uniqueidentifier) AS Enr Union
Select cast('9E434FEC-7936-412F-9442-D8D01ED69418' AS uniqueidentifier) AS BNr,  cast('CA3C2526-7EE2-4236-BCB0-5125E48B08FA' AS uniqueidentifier) AS Enr Union
Select cast('CFBA082B-B704-4AC1-A472-DCDD9FBB8810' AS uniqueidentifier) AS BNr,  cast('36566A87-7C35-4AF7-BD40-CA5DC52DA8B3' AS uniqueidentifier) AS Enr Union
Select cast('5E1A8DA0-5171-495E-972C-4A47A479A572' AS uniqueidentifier) AS BNr,  cast('33575E10-6DAD-4D10-B0E3-06C22CD2F067' AS uniqueidentifier) AS Enr Union
Select cast('7202BD0B-9F33-428F-B5BC-0EFBE7B9E182' AS uniqueidentifier) AS BNr,  cast('2625C950-E0BF-4DAE-A082-452A987C1FE5' AS uniqueidentifier) AS Enr Union
Select cast('33672442-7337-40FF-8480-9C33D6126085' AS uniqueidentifier) AS BNr,  cast('18ABDFCC-C438-4738-B3BD-03D1C65A3F8E' AS uniqueidentifier) AS Enr Union
Select cast('37D0C232-E0AF-4074-A311-C09EE19A4832' AS uniqueidentifier) AS BNr,  cast('39D4D9DC-1703-4946-88C7-47BE6F532288' AS uniqueidentifier) AS Enr Union
Select cast('61519C83-BC5E-4E24-92DA-5A6048E4E50F' AS uniqueidentifier) AS BNr,  cast('8029E4B3-8C0D-4271-9CF6-3B81876A7A0A' AS uniqueidentifier) AS Enr Union
Select cast('E955E202-A345-494D-A114-4B815DF47DBC' AS uniqueidentifier) AS BNr,  cast('6ECC1FB9-2166-4FCB-8F03-98200F192AA7' AS uniqueidentifier) AS Enr Union
Select cast('66D4684F-79C4-4F7D-BF1A-EB5E55817BED' AS uniqueidentifier) AS BNr,  cast('004270A5-FD82-4783-8E18-F9521A52A6F8' AS uniqueidentifier) AS Enr Union
Select cast('1395392D-BC8B-4A45-8383-B8711C974D7B' AS uniqueidentifier) AS BNr,  cast('9E55F425-EA8C-4F4C-92E0-BBF1BBDB94DE' AS uniqueidentifier) AS Enr Union
Select cast('B177D4E7-DA8B-4B6A-977E-B574A20C9C90' AS uniqueidentifier) AS BNr,  cast('3B353FB0-B633-41FE-A5A8-80098C167A7F' AS uniqueidentifier) AS Enr Union
Select cast('693BE05B-8FD7-40DB-A762-A6788184CFEA' AS uniqueidentifier) AS BNr,  cast('51DFF1FE-0121-4CD7-8DEE-74539BC7B2A9' AS uniqueidentifier) AS Enr Union
Select cast('0388FE07-B184-4E17-B3DF-9B967EF0CCEC' AS uniqueidentifier) AS BNr,  cast('1660F805-455D-4FC7-B52A-9C188412C15E' AS uniqueidentifier) AS Enr Union
Select cast('31107115-87BD-4504-81D8-DC62AA1CFFC8' AS uniqueidentifier) AS BNr,  cast('06D406B0-D92B-43AE-8200-8983CCCB7042' AS uniqueidentifier) AS Enr Union
Select cast('0BBAE7A7-5CC5-404D-9177-098C9DA8BBD7' AS uniqueidentifier) AS BNr,  cast('28F30DD1-E034-4F4E-9674-5707C677868B' AS uniqueidentifier) AS Enr Union
Select cast('6E59D940-348F-4152-AFCE-2166CDAD0438' AS uniqueidentifier) AS BNr,  cast('0CA5D5FF-93FE-45F0-8EEB-2D51FFFB21B0' AS uniqueidentifier) AS Enr Union
Select cast('8D298A9C-155B-4B50-A14C-33C5B1599217' AS uniqueidentifier) AS BNr,  cast('D5B70C04-C9C6-4D83-BF36-86AFEB9399D3' AS uniqueidentifier) AS Enr Union
Select cast('368829EA-DA66-4FC2-8A94-C6BF65568A01' AS uniqueidentifier) AS BNr,  cast('EAEE2695-8C71-476C-AC24-2CFAAE3E0EB3' AS uniqueidentifier) AS Enr Union
Select cast('E71C109C-6D95-41AD-9CB5-EF3ABBB7930C' AS uniqueidentifier) AS BNr,  cast('9B88A637-5A15-4DEA-9692-21B21DCEDD49' AS uniqueidentifier) AS Enr Union
Select cast('D77C1CDC-1CCB-4E99-9CB9-BF63A28166E2' AS uniqueidentifier) AS BNr,  cast('5B14FD9C-FC22-481E-9AC2-697B48D6FD4F' AS uniqueidentifier) AS Enr Union
Select cast('3D0C8438-A642-450E-B9C5-82FBF07A44D3' AS uniqueidentifier) AS BNr,  cast('3ED93BFA-E60F-4DDF-AB09-56DDEA097719' AS uniqueidentifier) AS Enr Union
Select cast('009E56FC-A6A7-417A-B638-3399B3B6147D' AS uniqueidentifier) AS BNr,  cast('4C12B280-3E50-498A-861A-CEB2C2557868' AS uniqueidentifier) AS Enr Union
Select cast('EBDF7DA8-992E-4C18-BB87-68EDFC452C3B' AS uniqueidentifier) AS BNr,  cast('E61B773C-2C2D-40A3-8A87-92BC32E5F453' AS uniqueidentifier) AS Enr Union
Select cast('7C536450-CC8F-464A-BA03-F728CB0CF578' AS uniqueidentifier) AS BNr,  cast('55C5ED98-FCE3-4CC2-8C0A-DC7D800597FC' AS uniqueidentifier) AS Enr Union
Select cast('2A540AED-37FA-4E3E-8374-865F78CB355F' AS uniqueidentifier) AS BNr,  cast('D0C9A15C-9634-47BA-A075-89BB2A5119B4' AS uniqueidentifier) AS Enr Union
Select cast('8BA85808-F024-48F5-8BC6-475EE6458E39' AS uniqueidentifier) AS BNr,  cast('9ABFAA3A-9C04-4C97-B1D1-576CC1453376' AS uniqueidentifier) AS Enr Union
Select cast('18F90264-2F6F-4C36-87D4-2F3A1E3E0D37' AS uniqueidentifier) AS BNr,  cast('A10DF85D-D492-4F69-AB39-F20D1B6B9E9C' AS uniqueidentifier) AS Enr Union
Select cast('D04C5AF6-3E28-4425-82EA-6CCB9CEB3C3F' AS uniqueidentifier) AS BNr,  cast('669AB496-402A-49FB-B468-2C8E830D914C' AS uniqueidentifier) AS Enr Union
Select cast('EFB35134-29DC-45D0-8984-C80D87A65B9A' AS uniqueidentifier) AS BNr,  cast('E3923543-CD08-4B13-BD3A-69B7027921DA' AS uniqueidentifier) AS Enr Union
Select cast('65E4E7F0-6828-43E9-B4B5-DA1DF4BDBBF5' AS uniqueidentifier) AS BNr,  cast('45D1A7D7-73F0-4762-87AE-C10EB887396B' AS uniqueidentifier) AS Enr Union
Select cast('35D906D6-09D8-4422-8CA5-079041B07436' AS uniqueidentifier) AS BNr,  cast('63A4B52B-CB4E-4C39-B0F1-A2C7CD298CD7' AS uniqueidentifier) AS Enr Union
Select cast('F878D0D7-E460-4254-95E1-B98B1134C86A' AS uniqueidentifier) AS BNr,  cast('62856189-F9DC-42F7-8FD3-2755456E9063' AS uniqueidentifier) AS Enr Union
Select cast('6E5A629A-B471-41B1-A493-04851512811C' AS uniqueidentifier) AS BNr,  cast('446ADD6F-7EFB-4E23-B5C3-4D867266DA7F' AS uniqueidentifier) AS Enr Union
Select cast('35FD658D-F645-48E0-B88A-AB2A55D71996' AS uniqueidentifier) AS BNr,  cast('955DFADE-469C-423C-B708-326124B078D3' AS uniqueidentifier) AS Enr Union
Select cast('AEB4A12D-4B87-41A8-B1F8-79D4F8E3215C' AS uniqueidentifier) AS BNr,  cast('54D373D8-173E-4F29-8E25-B11275E32C47' AS uniqueidentifier) AS Enr Union
Select cast('48613750-DE9B-4F53-BE63-C1FDEEA52F1B' AS uniqueidentifier) AS BNr,  cast('8E9D2212-ECDA-444A-A09A-CA311616ACAF' AS uniqueidentifier) AS Enr Union
Select cast('797D5AE7-BBA1-48FA-800F-CB98750AB61C' AS uniqueidentifier) AS BNr,  cast('5D24E60B-39D8-414A-B9B4-770CC97754F2' AS uniqueidentifier) AS Enr Union
Select cast('D6F60547-F64E-47F1-BF38-2F6E043DE39A' AS uniqueidentifier) AS BNr,  cast('9EBC757B-79F5-4375-81A9-04F8E5BEC4AD' AS uniqueidentifier) AS Enr Union
Select cast('58C2FF4E-1E01-4FB3-B7FE-81CCCBCE307F' AS uniqueidentifier) AS BNr,  cast('98391D05-2B8A-478B-BE2A-39FD7140B091' AS uniqueidentifier) AS Enr Union
Select cast('DBF2FE3C-2D41-4805-94E0-916BAAEB93AF' AS uniqueidentifier) AS BNr,  cast('1587C28E-F57C-433D-A39D-D6EC628D6A72' AS uniqueidentifier) AS Enr Union
Select cast('08DDC6DE-700F-4144-AB6D-5F354E265E13' AS uniqueidentifier) AS BNr,  cast('BD03815C-A2C9-436E-B458-220BDBDEE08C' AS uniqueidentifier) AS Enr Union
Select cast('130C258F-7C93-43BF-87C9-DDCCA0627990' AS uniqueidentifier) AS BNr,  cast('91A4DF35-67DE-4256-BA8C-ABD8AA8661B9' AS uniqueidentifier) AS Enr Union
Select cast('EF22B2AD-7BC3-4427-BEA2-085456BCBC98' AS uniqueidentifier) AS BNr,  cast('1338593D-AF96-4A64-86CB-E3E8FE7FB1DF' AS uniqueidentifier) AS Enr Union
Select cast('0D9C68E4-C9EC-4EC7-8DA4-9B703A17C3CA' AS uniqueidentifier) AS BNr,  cast('C9F76716-566E-484F-9A39-33D5659D913F' AS uniqueidentifier) AS Enr Union
Select cast('0E0962A3-23D1-4822-851D-CAE97471ACE4' AS uniqueidentifier) AS BNr,  cast('E150C3B7-6246-48F9-BAF8-728A3EAFD1A0' AS uniqueidentifier) AS Enr Union
Select cast('99533B32-E94F-4DA1-8760-DEE216BF1B33' AS uniqueidentifier) AS BNr,  cast('83E2981F-73E5-4B45-8163-BA762CB6D4C2' AS uniqueidentifier) AS Enr Union
Select cast('65CD4120-EBDD-4A59-AFBA-633BD0828DA6' AS uniqueidentifier) AS BNr,  cast('16F98D84-8BA8-4028-B9E2-E7432A019A4B' AS uniqueidentifier) AS Enr Union
Select cast('17D77ABB-20BB-48D4-9097-1618612F4F61' AS uniqueidentifier) AS BNr,  cast('1558C50C-13A9-4088-A234-6DB64E98CD1E' AS uniqueidentifier) AS Enr Union
Select cast('FEBA9A29-3CC1-473E-8938-2589B36BF68B' AS uniqueidentifier) AS BNr,  cast('9F8FA643-A254-4ADF-8485-83B7362AC61B' AS uniqueidentifier) AS Enr Union
Select cast('DDD8F06A-D37B-480B-A7AE-3464A6C1561D' AS uniqueidentifier) AS BNr,  cast('2A0FA72D-DD5B-4F91-A5EC-E04499C5BC57' AS uniqueidentifier) AS Enr Union
Select cast('C2606AF8-4718-4E87-9A20-307F2ADE633E' AS uniqueidentifier) AS BNr,  cast('346ABE4C-E3E0-4995-8536-98F948239209' AS uniqueidentifier) AS Enr Union
Select cast('E0610B86-24E9-434C-9A57-D2F424FEC83C' AS uniqueidentifier) AS BNr,  cast('169DA480-75ED-4D2C-8824-1BE66056B969' AS uniqueidentifier) AS Enr Union
Select cast('9428B24B-96A6-4790-A169-3FFB7B02FFFD' AS uniqueidentifier) AS BNr,  cast('49F1B56D-52E9-490E-84B2-AE4609538C04' AS uniqueidentifier) AS Enr Union
Select cast('BDBDE276-1210-4DE9-A7D7-44A33A9CE1C3' AS uniqueidentifier) AS BNr,  cast('CAEAAAE0-8122-47AB-853F-E71526A669F6' AS uniqueidentifier) AS Enr Union
Select cast('1F26C124-8D76-48ED-BE37-69E26DE999C4' AS uniqueidentifier) AS BNr,  cast('F30CB7A3-7EFF-43E5-9277-A7CA41448BF5' AS uniqueidentifier) AS Enr Union
Select cast('1E6959ED-2A74-49E4-BE60-E32DB9D7FD34' AS uniqueidentifier) AS BNr,  cast('8BA3C598-4F93-49DF-BEBB-C5EC631D0D47' AS uniqueidentifier) AS Enr Union
Select cast('D9FC9B39-CBD7-4FC3-BDFB-8F08C6715B6D' AS uniqueidentifier) AS BNr,  cast('DA807D88-798B-481E-9D24-55B438288F3C' AS uniqueidentifier) AS Enr Union
Select cast('B65080ED-7EF5-4E3E-BF44-37D9AEBE817A' AS uniqueidentifier) AS BNr,  cast('BB72C044-5F7A-4A9A-A118-A5AD818FEB08' AS uniqueidentifier) AS Enr Union
Select cast('16E4308E-2158-42D7-B969-ED8DAB43ED2A' AS uniqueidentifier) AS BNr,  cast('7E18B9AC-9426-43AB-B163-444C56BFCE72' AS uniqueidentifier) AS Enr Union
Select cast('3509A37D-497A-400B-9B83-7DE022852BE3' AS uniqueidentifier) AS BNr,  cast('1B66447B-7072-4E35-B3AA-63AA7600F8CA' AS uniqueidentifier) AS Enr Union
Select cast('DB62706B-A33E-4687-9BB4-3EE932F87704' AS uniqueidentifier) AS BNr,  cast('8B4EEF3D-5A75-4344-B2C0-420A086CB798' AS uniqueidentifier) AS Enr Union
Select cast('95226D80-3530-49CF-80A0-957F18105015' AS uniqueidentifier) AS BNr,  cast('646AE2E7-89FC-46E3-B23D-BF9FB6107923' AS uniqueidentifier) AS Enr Union
Select cast('6C8D0235-5040-4601-8A31-BB793787FA5F' AS uniqueidentifier) AS BNr,  cast('0905BD01-99F9-491E-95E2-7A609A50DCF9' AS uniqueidentifier) AS Enr Union
Select cast('CE8934FF-0880-486E-8274-1B101AAC6A2A' AS uniqueidentifier) AS BNr,  cast('1488EF9F-A895-41E9-8507-4CB02B372C9B' AS uniqueidentifier) AS Enr Union
Select cast('420EB798-62F3-468C-8FE0-6D0392B9D4FA' AS uniqueidentifier) AS BNr,  cast('B4DC48E3-7043-49DF-BBDF-D405B8BCFD07' AS uniqueidentifier) AS Enr Union
Select cast('AE6836C9-4A47-4E25-8E74-C6EE81B482EA' AS uniqueidentifier) AS BNr,  cast('32A42254-6043-4532-9BA3-99799C963B6A' AS uniqueidentifier) AS Enr Union
Select cast('F42CA658-85BC-466B-AC86-840126061F46' AS uniqueidentifier) AS BNr,  cast('0F150788-D7F9-4F62-84BC-D16A0DFA2A06' AS uniqueidentifier) AS Enr Union
Select cast('7B71109F-66FE-4EE4-9FA3-3292EAA271F0' AS uniqueidentifier) AS BNr,  cast('AFDACBF7-6C10-4733-84D7-3A6AB0D01928' AS uniqueidentifier) AS Enr Union
Select cast('337655FB-C715-4D82-AF0F-67312D570248' AS uniqueidentifier) AS BNr,  cast('B8676230-B729-4138-A07B-6A28D5472BBD' AS uniqueidentifier) AS Enr Union
Select cast('14D54B35-20E6-4642-AD84-1B65DDCE33DC' AS uniqueidentifier) AS BNr,  cast('DC03B9A2-BEF4-4424-BE80-37DFBA08BF9C' AS uniqueidentifier) AS Enr Union
Select cast('56C7DA7D-8D31-47A2-A8C7-963D6E468B0F' AS uniqueidentifier) AS BNr,  cast('1DC835FD-B6CB-4782-A318-25DBC920F684' AS uniqueidentifier) AS Enr Union
Select cast('3E708CDA-FB95-4033-9596-AE83B789FAA8' AS uniqueidentifier) AS BNr,  cast('81116660-D733-43C5-BBCA-3E30F8D4169C' AS uniqueidentifier) AS Enr Union
Select cast('F570BB1E-B471-43C1-9E19-D1906F12F2B4' AS uniqueidentifier) AS BNr,  cast('73F6B9F0-A924-472F-964F-93FE03D91CB0' AS uniqueidentifier) AS Enr Union
Select cast('6A06DF3C-51A1-446F-95CF-803EAEFB95A9' AS uniqueidentifier) AS BNr,  cast('6E9FDFE8-1005-42F1-B509-6D3AC6E59C04' AS uniqueidentifier) AS Enr Union
Select cast('EFDA07C4-7CE8-4011-8C86-7A3FF91750B2' AS uniqueidentifier) AS BNr,  cast('51F10800-9996-424B-9DD8-CF88D4F726DF' AS uniqueidentifier) AS Enr Union
Select cast('B57F19E3-05D4-4E42-92B9-F5CF17954541' AS uniqueidentifier) AS BNr,  cast('B74CE8CE-3E9A-4830-87E4-DEA21109D782' AS uniqueidentifier) AS Enr Union
Select cast('7977D96F-BE75-4044-A24D-6FE095F47AFA' AS uniqueidentifier) AS BNr,  cast('777BDB82-2C14-4E75-BE4D-81FCF52DA235' AS uniqueidentifier) AS Enr Union
Select cast('6F7E6776-AB59-4238-BB57-FBF154A309B4' AS uniqueidentifier) AS BNr,  cast('4A670B5F-8C1D-4E85-878A-79FAFD4B677D' AS uniqueidentifier) AS Enr Union
Select cast('FA923FB1-B791-41D8-86A9-DFA86C676B4B' AS uniqueidentifier) AS BNr,  cast('4DCAAA0C-1F43-464D-851E-3F408ED2011E' AS uniqueidentifier) AS Enr Union
Select cast('C397D426-7177-468B-BCAD-0AC3A4F6D56A' AS uniqueidentifier) AS BNr,  cast('7B6901BD-D9A4-4E11-86DA-3D5A25B6D64C' AS uniqueidentifier) AS Enr Union
Select cast('774575C9-7F18-4998-A9D3-9123ED517B66' AS uniqueidentifier) AS BNr,  cast('B0BFA64C-F0D5-4618-ABA6-0817BFFCB931' AS uniqueidentifier) AS Enr Union
Select cast('E448CD75-94A0-413E-9B40-AA5FD98F0366' AS uniqueidentifier) AS BNr,  cast('AC0B911A-70E0-401E-A8A0-34993556CF44' AS uniqueidentifier) AS Enr Union
Select cast('6AC65C75-435E-4FD0-B756-DA117602FC1A' AS uniqueidentifier) AS BNr,  cast('479422EA-0A72-489A-9C5A-FD718A5FC5E8' AS uniqueidentifier) AS Enr Union
Select cast('57B8A505-A637-4493-A32E-73E34C790069' AS uniqueidentifier) AS BNr,  cast('38FD86D8-6321-4301-9871-89E6BE3F6B26' AS uniqueidentifier) AS Enr Union
Select cast('9FEC6DEB-C77E-49BC-BFAA-CB0320910800' AS uniqueidentifier) AS BNr,  cast('FFB95CF3-0873-43A8-892D-85245D2F5D17' AS uniqueidentifier) AS Enr Union
Select cast('85A7F5EF-163B-419F-883C-0DA4620F46E9' AS uniqueidentifier) AS BNr,  cast('E0DD6311-E415-42CA-98E7-4B4527084771' AS uniqueidentifier) AS Enr Union
Select cast('5F945842-1D9F-45D1-BC3F-3195204F0061' AS uniqueidentifier) AS BNr,  cast('D8712FE6-4EFB-4343-BC65-C94A1CCFB6BD' AS uniqueidentifier) AS Enr Union
Select cast('F3871C86-F851-4618-A12B-F2659CB8B98A' AS uniqueidentifier) AS BNr,  cast('B8BA521A-8041-4725-8FD9-2D2FBBC1C865' AS uniqueidentifier) AS Enr Union
Select cast('04CCC44B-C022-430D-A5A9-473E271DD848' AS uniqueidentifier) AS BNr,  cast('E995A5B9-82AE-4AB2-8A06-CFA79D1C44EE' AS uniqueidentifier) AS Enr Union
Select cast('7FC7E183-CC23-4EFE-9142-494AA61DDAFF' AS uniqueidentifier) AS BNr,  cast('AC3C6C68-7B44-4511-985C-FED925687785' AS uniqueidentifier) AS Enr Union
Select cast('8331E672-4FD2-4CC7-A104-92925D3EC05E' AS uniqueidentifier) AS BNr,  cast('9224342D-6E59-4C9B-B2D9-F95652EBCF37' AS uniqueidentifier) AS Enr Union
Select cast('90E2F459-C65B-47AF-BC23-47303326EB17' AS uniqueidentifier) AS BNr,  cast('BE7093D1-2E66-4321-8593-61565383D77C' AS uniqueidentifier) AS Enr Union
Select cast('568D11E5-55C0-4FC3-A073-1C9529E8271A' AS uniqueidentifier) AS BNr,  cast('9C28C44F-BD1E-4B82-BD40-DEB1A1C96CEB' AS uniqueidentifier) AS Enr Union
Select cast('3DCE5FA0-D3AD-40C2-BAC7-28E3454BE2AF' AS uniqueidentifier) AS BNr,  cast('384F1386-A95A-44DD-A0F3-7F8E1097BE9B' AS uniqueidentifier) AS Enr Union
Select cast('73BD1212-0B65-4DBD-B28F-9503527F9344' AS uniqueidentifier) AS BNr,  cast('A3E656D0-C543-497B-A416-72F56CA5C59E' AS uniqueidentifier) AS Enr Union
Select cast('5F9BF9F9-6690-46B4-9684-E11995BD12E9' AS uniqueidentifier) AS BNr,  cast('91B6DF03-CD9C-4437-9A63-33281A3AABAB' AS uniqueidentifier) AS Enr Union
Select cast('98C23117-BCDC-401C-B7AE-BD551B349091' AS uniqueidentifier) AS BNr,  cast('B76B9E20-D945-4224-A235-31C74285991A' AS uniqueidentifier) AS Enr Union
Select cast('8571C1DC-C106-43DF-A7E1-CDA009CBC8DE' AS uniqueidentifier) AS BNr,  cast('0BFC60C1-19CE-4E4C-ACFA-369CFD50C2C7' AS uniqueidentifier) AS Enr Union
Select cast('15179C54-947D-44D2-B98B-06EB3AFBAD62' AS uniqueidentifier) AS BNr,  cast('93F291DA-2D85-4841-9860-0D10306F18AC' AS uniqueidentifier) AS Enr Union
Select cast('249CAE2B-8690-474E-8636-D0448576FADA' AS uniqueidentifier) AS BNr,  cast('0EF4F4DE-1967-4A32-AF21-8A551F81A341' AS uniqueidentifier) AS Enr Union
Select cast('AAD97BA2-EAED-4D26-A053-182003F38292' AS uniqueidentifier) AS BNr,  cast('8821DF3D-0A8E-4735-81C5-5DBFD3DA62A6' AS uniqueidentifier) AS Enr Union
Select cast('1A2F3321-8D60-4405-831D-F52ECCA5F2B5' AS uniqueidentifier) AS BNr,  cast('61A5F66C-CBE8-4897-8032-228B7448ADD6' AS uniqueidentifier) AS Enr Union
Select cast('CEAFD704-63D9-46A1-8CBA-6A8631E67034' AS uniqueidentifier) AS BNr,  cast('22D0ACE8-5019-4161-9C92-E52440CF764C' AS uniqueidentifier) AS Enr Union
Select cast('788C216F-9FCB-4839-ABDA-1C681685BABB' AS uniqueidentifier) AS BNr,  cast('09DB9D0E-1939-49DC-9AAF-10E88A86BBBF' AS uniqueidentifier) AS Enr Union
Select cast('EC102C94-4CCE-429A-8574-03D053573E70' AS uniqueidentifier) AS BNr,  cast('8410CC4B-D34A-4754-A05B-C74725576B89' AS uniqueidentifier) AS Enr Union
Select cast('A313BD29-907D-47E4-AD84-77EE88608E8A' AS uniqueidentifier) AS BNr,  cast('1B219E63-D9C3-45B9-9BB4-4A5C0EFABA11' AS uniqueidentifier) AS Enr Union
Select cast('6A6343E7-FFF5-4DB7-9B04-B80F00214457' AS uniqueidentifier) AS BNr,  cast('CEA30538-BCB4-47C3-9D05-BC0BC32AE42F' AS uniqueidentifier) AS Enr Union
Select cast('D8CA7C9B-4BAA-4FF9-A3FF-B322894A40A4' AS uniqueidentifier) AS BNr,  cast('E5CFF0D7-3743-4FE4-941F-AD791CA24830' AS uniqueidentifier) AS Enr Union
Select cast('3A7024AC-36CF-4975-89A9-80BBB508A7CC' AS uniqueidentifier) AS BNr,  cast('97ACE1A0-8327-455D-AD15-3AEAC99488FE' AS uniqueidentifier) AS Enr Union
Select cast('85192CB4-7D36-475B-A0E9-843D1451FEE9' AS uniqueidentifier) AS BNr,  cast('42AD3B01-4FE7-44C0-A7AE-2B40A697D4FA' AS uniqueidentifier) AS Enr Union
Select cast('52F11CBB-02FE-4454-9A1D-8DC0C0587BF3' AS uniqueidentifier) AS BNr,  cast('1E37E901-91A2-4398-BC3A-9BF5A0779EC3' AS uniqueidentifier) AS Enr Union
Select cast('B3E34A23-B38A-4F3C-8883-B2EF5F976A41' AS uniqueidentifier) AS BNr,  cast('A94115FF-33FB-4DB5-AD12-A448C98065B5' AS uniqueidentifier) AS Enr Union
Select cast('E8636A00-B1C7-48EB-B27E-D95DC1DB8AA0' AS uniqueidentifier) AS BNr,  cast('2BC5EF2B-26B6-4567-BD20-4DB7D737D888' AS uniqueidentifier) AS Enr Union
Select cast('E4600C9A-8363-4912-8166-710F88C7405F' AS uniqueidentifier) AS BNr,  cast('A0321F3F-C888-494D-B695-EA95835543B3' AS uniqueidentifier) AS Enr Union
Select cast('388A2B56-8EA6-44A4-A0F3-00997CDFF64D' AS uniqueidentifier) AS BNr,  cast('54607DFD-BFAF-4C4A-917D-18315887EBA3' AS uniqueidentifier) AS Enr Union
Select cast('EEFCD6A4-F774-4B5F-9BC2-C74BFC6EA71A' AS uniqueidentifier) AS BNr,  cast('78DB345F-B80D-4811-BA44-3B31AFC4A5FB' AS uniqueidentifier) AS Enr Union
Select cast('599D23DF-28CF-4EA6-A851-B9B78296F1FD' AS uniqueidentifier) AS BNr,  cast('ED56F707-1790-4C4B-AEB2-BD6D081E0C61' AS uniqueidentifier) AS Enr Union
Select cast('78EEC054-D386-4D88-BBFA-B32D6B97B6F3' AS uniqueidentifier) AS BNr,  cast('7EB7B4E8-817B-44C9-A6BE-23AFA76E14F7' AS uniqueidentifier) AS Enr Union
Select cast('62DEC33D-AB1D-42F4-ADA5-580F308318C8' AS uniqueidentifier) AS BNr,  cast('B128DE79-8775-455A-BED9-E837046C746C' AS uniqueidentifier) AS Enr Union
Select cast('06B20E7F-EAB4-4CAD-A993-ACC9912DBF09' AS uniqueidentifier) AS BNr,  cast('C9896D81-76EF-44AA-AB4E-251A61F1F3F6' AS uniqueidentifier) AS Enr Union
Select cast('68EB6785-7CD0-48A1-9D5E-B4A03956106E' AS uniqueidentifier) AS BNr,  cast('F773E2A7-6E6E-4DF2-8745-56751CD4EDD6' AS uniqueidentifier) AS Enr Union
Select cast('40327932-A9B5-41A6-B2B3-0F53B236D1A8' AS uniqueidentifier) AS BNr,  cast('9AA1176C-CC09-4514-8B73-87FA05A85866' AS uniqueidentifier) AS Enr Union
Select cast('BD37F52E-F489-41F0-BF73-E51773A33443' AS uniqueidentifier) AS BNr,  cast('0FBC718E-6D0B-4C80-A0F0-DCC5135850AB' AS uniqueidentifier) AS Enr Union
Select cast('73157458-005F-47C6-A173-F0391869CF33' AS uniqueidentifier) AS BNr,  cast('3BD30B3E-3E83-4D87-B7D6-2F9793733B3B' AS uniqueidentifier) AS Enr Union
Select cast('2A795E89-707A-436F-975F-70C0C3B69970' AS uniqueidentifier) AS BNr,  cast('8E3BC64E-8D3F-487F-925B-3F89A98B7B38' AS uniqueidentifier) AS Enr Union
Select cast('587E96C5-4EBC-49B0-9166-03CB8B7F9DE8' AS uniqueidentifier) AS BNr,  cast('F361AA62-3F85-461A-B264-D5634E03EAC0' AS uniqueidentifier) AS Enr Union
Select cast('10474E98-186D-4846-A32D-67A230F9637E' AS uniqueidentifier) AS BNr,  cast('4769512D-DB88-4A50-810A-18DCACB755DB' AS uniqueidentifier) AS Enr Union
Select cast('F8E06031-8F39-4C7C-91E1-018CB57DD4F9' AS uniqueidentifier) AS BNr,  cast('8F51EEBB-2C11-41A4-8773-D8BD36BD9004' AS uniqueidentifier) AS Enr Union
Select cast('045B3059-53F8-43F0-8DFA-3DE0F3154ACE' AS uniqueidentifier) AS BNr,  cast('CE1FD356-0C23-4B71-BEA5-7F433D6A888F' AS uniqueidentifier) AS Enr Union
Select cast('8EB2B22D-E08B-460A-9313-284D1C695185' AS uniqueidentifier) AS BNr,  cast('01BE1DA4-5AA2-42FA-AEB3-54F9B815CB09' AS uniqueidentifier) AS Enr Union
Select cast('950A809E-956D-4783-BD8C-0B07C120A7DA' AS uniqueidentifier) AS BNr,  cast('E7713AB6-1F58-4E5C-A0D4-1DA3CBA5AEC1' AS uniqueidentifier) AS Enr Union
Select cast('C004B714-B120-4ED7-8629-F43AE371645B' AS uniqueidentifier) AS BNr,  cast('7C511FDD-6EB2-4DE0-9437-D0460346435A' AS uniqueidentifier) AS Enr Union
Select cast('655D4010-C252-4AB2-A3D8-23C832AC71AE' AS uniqueidentifier) AS BNr,  cast('7A18A60B-B2EF-447C-8392-7FD5514A7818' AS uniqueidentifier) AS Enr Union
Select cast('2832DB95-2890-49BA-B0C0-F69BDAAF7CA7' AS uniqueidentifier) AS BNr,  cast('A7898537-941F-4FED-B24A-213B7B0BED3B' AS uniqueidentifier) AS Enr Union
Select cast('EB222FA7-5D0E-4059-A526-DB47E84618A1' AS uniqueidentifier) AS BNr,  cast('41E99A19-1BB7-4B3C-BDBD-4819FC5EA9A5' AS uniqueidentifier) AS Enr Union
Select cast('06FBFDBA-DC0C-4E49-A324-E0BD32DCD01D' AS uniqueidentifier) AS BNr,  cast('451E48D3-0167-4844-A118-32C40AF7F59F' AS uniqueidentifier) AS Enr Union
Select cast('65258123-43D7-4D8D-9275-229B5A97FB33' AS uniqueidentifier) AS BNr,  cast('E8FABEF4-3616-4A79-BB58-FB910EF74E33' AS uniqueidentifier) AS Enr Union
Select cast('3F1C9338-1678-4D30-9CA8-CAB0696046D5' AS uniqueidentifier) AS BNr,  cast('80DE2B49-E1AC-4C90-88C1-3EEBD743D189' AS uniqueidentifier) AS Enr Union
Select cast('6509BD75-F4F4-4120-99AF-A6840293D084' AS uniqueidentifier) AS BNr,  cast('42383C32-9FA2-4EE9-B206-5A07C4C17F7D' AS uniqueidentifier) AS Enr Union
Select cast('835239ED-7D38-4E07-8ED2-299965938FFB' AS uniqueidentifier) AS BNr,  cast('D00F86FC-A369-410E-B3D7-07E93ADED135' AS uniqueidentifier) AS Enr Union
Select cast('BA92B606-2252-433E-93DB-70B9AB469ECE' AS uniqueidentifier) AS BNr,  cast('F1DA6B21-A874-4AA7-85F5-A2C4AD7DBA26' AS uniqueidentifier) AS Enr Union
Select cast('6741A22C-9DA4-4D85-84B4-541EF5A8B909' AS uniqueidentifier) AS BNr,  cast('E4FDFA0A-586E-4161-94B5-C608BABE3973' AS uniqueidentifier) AS Enr Union
Select cast('40DA009D-6E84-4914-9CF9-A5EA956AD8AF' AS uniqueidentifier) AS BNr,  cast('3FD3C6F4-F423-4677-AF44-5CAA0D51F019' AS uniqueidentifier) AS Enr Union
Select cast('451B93B0-2DCE-44DE-B1F4-48DE6FE7DB14' AS uniqueidentifier) AS BNr,  cast('95D97060-3E35-415C-9B78-0F423F93D95B' AS uniqueidentifier) AS Enr Union
Select cast('9F42AE3A-8720-46A0-944B-880FDBFC923D' AS uniqueidentifier) AS BNr,  cast('C0D0C10A-8A1D-4BE0-9F21-BA1E2A1CCD19' AS uniqueidentifier) AS Enr Union
Select cast('AA2302EC-96CE-4904-94FF-15CE28AC9BD0' AS uniqueidentifier) AS BNr,  cast('2E234AE4-D794-43D2-9670-618FC0DF8ED1' AS uniqueidentifier) AS Enr Union
Select cast('E6BF3590-A793-411E-BC63-FE0135888196' AS uniqueidentifier) AS BNr,  cast('7295EDF4-24EE-4C09-88C2-AEFFD43A46B7' AS uniqueidentifier) AS Enr Union
Select cast('928B9FEA-F397-4F49-9A8F-2E1670168D67' AS uniqueidentifier) AS BNr,  cast('CF63C009-4617-4790-AC53-2087EDF13067' AS uniqueidentifier) AS Enr Union
Select cast('EB2A6C46-7E82-48F4-8C27-9ABB00DF204C' AS uniqueidentifier) AS BNr,  cast('60F91CBF-3BC3-40CE-85CA-67B4DCE0ADCF' AS uniqueidentifier) AS Enr Union
Select cast('D669CCFA-C4D9-4AA2-A122-C09AE0A28465' AS uniqueidentifier) AS BNr,  cast('249712D9-7D1C-42EA-B871-1416D484C3E7' AS uniqueidentifier) AS Enr Union
Select cast('CD2F7686-2CD7-4A2B-B2D1-4C69CB70F8DC' AS uniqueidentifier) AS BNr,  cast('4DCD4F73-ADDE-466D-96C3-D4A017BC9AAF' AS uniqueidentifier) AS Enr Union
Select cast('B3BEEDDA-34F4-4B52-860A-CE3AECC2DCCA' AS uniqueidentifier) AS BNr,  cast('0187D9F4-711F-422C-9F31-7EA1DB945CED' AS uniqueidentifier) AS Enr Union
Select cast('4A21E19E-1B71-43F9-A8FC-F5246E0A85DC' AS uniqueidentifier) AS BNr,  cast('751EB7DE-5868-428F-8860-6ABED7522F80' AS uniqueidentifier) AS Enr Union
Select cast('6B3643CA-39C5-496B-92F3-A821FE3400FB' AS uniqueidentifier) AS BNr,  cast('20DF6F37-7D3C-440E-B789-9A39EFEAF481' AS uniqueidentifier) AS Enr Union
Select cast('712AAEF7-4203-4D7F-8CD9-C36FDB61E676' AS uniqueidentifier) AS BNr,  cast('30BDC08E-5F1F-4522-B668-900D0E63D4FC' AS uniqueidentifier) AS Enr Union
Select cast('B446B569-0687-422F-9CE7-DF337F9512C4' AS uniqueidentifier) AS BNr,  cast('37882985-2E94-428C-AFF3-F9E49A6ED8B5' AS uniqueidentifier) AS Enr Union
Select cast('A452883C-B8D0-4070-8D55-F12969770D71' AS uniqueidentifier) AS BNr,  cast('60CDD1B6-8D1D-442C-8C91-96A459DDD0DD' AS uniqueidentifier) AS Enr Union
Select cast('2AFD56B7-6A7C-4784-9092-F641100BFA40' AS uniqueidentifier) AS BNr,  cast('4DC1BE13-8353-4F92-B4EE-4A0D57415360' AS uniqueidentifier) AS Enr Union
Select cast('AFDB66FE-B52E-4F26-917C-D05DCD40A153' AS uniqueidentifier) AS BNr,  cast('A7091069-2C3D-4525-86E7-CC26F00CDB57' AS uniqueidentifier) AS Enr Union
Select cast('90DC0DD2-BFE3-480F-887F-48F63F5256A7' AS uniqueidentifier) AS BNr,  cast('50605F67-E8D9-4BA3-971A-A441A1112DCD' AS uniqueidentifier) AS Enr Union
Select cast('EDB9CDE2-12F1-459C-98B9-DC18708C5575' AS uniqueidentifier) AS BNr,  cast('8E92D03D-9493-407D-BB97-5992325C7CC0' AS uniqueidentifier) AS Enr Union
Select cast('05266F32-0A2A-438A-A4D7-411E3D4F96A4' AS uniqueidentifier) AS BNr,  cast('47E7FE31-D707-42D0-99CD-AF86E3B935D2' AS uniqueidentifier) AS Enr Union
Select cast('4D3A7105-3DE1-484C-8B9D-F0079F8A1CC8' AS uniqueidentifier) AS BNr,  cast('5992F98F-8D1B-4143-983E-7E42B4334BC0' AS uniqueidentifier) AS Enr Union
Select cast('35A2177C-70AD-4713-921D-4FE0B1D6CDB3' AS uniqueidentifier) AS BNr,  cast('489EBE3F-5551-4AE8-8C70-E2F4E6E28243' AS uniqueidentifier) AS Enr Union
Select cast('8D6F8A6F-40A6-4B00-AEC4-70B5FA87748B' AS uniqueidentifier) AS BNr,  cast('2E625C56-C27F-406C-AF2A-2FF1E7B674FB' AS uniqueidentifier) AS Enr Union
Select cast('F9ED953C-89BD-4DAC-8032-E64B2A6DE37C' AS uniqueidentifier) AS BNr,  cast('26A1CDF3-71E4-417A-8A26-85986D834A93' AS uniqueidentifier) AS Enr Union
Select cast('1CDF7F2C-2E06-47F0-96C5-9ACCD9E40BB7' AS uniqueidentifier) AS BNr,  cast('4C51FC9C-1E60-443E-A071-862C7F0D6861' AS uniqueidentifier) AS Enr Union
Select cast('2753BCA0-F045-4029-A6E4-E4D60D1EEA81' AS uniqueidentifier) AS BNr,  cast('71EEB211-67D0-4879-9667-A3F26A19E236' AS uniqueidentifier) AS Enr Union
Select cast('1BC944DB-5CB4-4C84-9BDC-FD8EB663EE62' AS uniqueidentifier) AS BNr,  cast('288F472B-F7FE-49E8-93F9-A563A950131A' AS uniqueidentifier) AS Enr Union
Select cast('09AC12F6-9682-4443-8A01-FD72984B9860' AS uniqueidentifier) AS BNr,  cast('403545CA-6A56-46C1-9CF2-B36CB4B35581' AS uniqueidentifier) AS Enr Union
Select cast('6945F8EE-13A7-4982-B8B2-9B37190D8852' AS uniqueidentifier) AS BNr,  cast('FCFDD774-CFF1-4182-9237-58824AF68471' AS uniqueidentifier) AS Enr Union
Select cast('495610F9-0DFA-40C1-A2B3-732CC648E4DF' AS uniqueidentifier) AS BNr,  cast('291192CA-CBAF-4C8E-B74F-E1430DFBB75D' AS uniqueidentifier) AS Enr Union
Select cast('7CEB87F9-42D3-4EFA-8D69-486372A7B164' AS uniqueidentifier) AS BNr,  cast('B3938C75-D774-4E93-93AB-3450A9E8B2F0' AS uniqueidentifier) AS Enr Union
Select cast('AC6663A7-BE7D-4155-8C38-098D5A1B45A6' AS uniqueidentifier) AS BNr,  cast('378C4FEC-055B-408F-8DEA-5BAFEA930331' AS uniqueidentifier) AS Enr Union
Select cast('6A7EB42D-0305-4C03-8249-D54E24925508' AS uniqueidentifier) AS BNr,  cast('60064113-17D7-4A6A-B6C2-2C8ED6D95643' AS uniqueidentifier) AS Enr Union
Select cast('A9FEF9D5-760B-43C9-83DE-B08361807896' AS uniqueidentifier) AS BNr,  cast('A25B0BEE-997F-4647-A94F-274CEFD2573E' AS uniqueidentifier) AS Enr Union
Select cast('F7103BF0-921A-4424-ABDB-F4B03F158278' AS uniqueidentifier) AS BNr,  cast('5B653141-1118-42B1-BB18-549A789205CA' AS uniqueidentifier) AS Enr Union
Select cast('FEA4FD72-7743-4404-8B85-EAB073E8A770' AS uniqueidentifier) AS BNr,  cast('A2C4BB91-61A4-4773-927E-8F1014D238B2' AS uniqueidentifier) AS Enr Union
Select cast('968143B7-06F2-415B-8E38-AEF590795B99' AS uniqueidentifier) AS BNr,  cast('EF5C451F-C80B-4838-8E47-397132F2BD48' AS uniqueidentifier) AS Enr Union
Select cast('21A060CB-D5D8-4739-9B0F-D745D65B48B5' AS uniqueidentifier) AS BNr,  cast('20B57B64-9AEA-4CC3-BC8F-93A6CE965F5E' AS uniqueidentifier) AS Enr Union
Select cast('55079A2F-B70B-4330-A713-73248A809542' AS uniqueidentifier) AS BNr,  cast('D5247CFA-97E9-472C-AD08-5B017B9EA74E' AS uniqueidentifier) AS Enr Union
Select cast('5429AB7E-6683-4075-99C2-C63F77D7EF64' AS uniqueidentifier) AS BNr,  cast('DE055587-9497-48B2-945D-007E37D8EDA6' AS uniqueidentifier) AS Enr Union
Select cast('2BA767B7-D827-4704-866F-EE6FD3522838' AS uniqueidentifier) AS BNr,  cast('D93E3E98-F082-4EC8-AF81-4244510A2B83' AS uniqueidentifier) AS Enr Union
Select cast('42664C70-F276-4F14-BA98-CC8A09E2AAD7' AS uniqueidentifier) AS BNr,  cast('C3D34D90-E582-4912-A533-FF1F8EEC6E5E' AS uniqueidentifier) AS Enr Union
Select cast('8E767E68-15A6-449F-84D5-2CB07E574BF4' AS uniqueidentifier) AS BNr,  cast('D92DC49B-83FB-46C6-BAE9-A7382ACFBC7E' AS uniqueidentifier) AS Enr Union
Select cast('1A9D436A-4380-45DE-BE8C-A28080F03E14' AS uniqueidentifier) AS BNr,  cast('7FDEE8E5-0A99-4B4D-B999-B296AE13E109' AS uniqueidentifier) AS Enr Union
Select cast('474FC9EA-5A86-4372-9871-C6C97708026E' AS uniqueidentifier) AS BNr,  cast('CE38BE80-5EBB-4C47-B8E2-061604BEF983' AS uniqueidentifier) AS Enr Union
Select cast('8FBC436E-0D07-460D-A3D9-D26224D69235' AS uniqueidentifier) AS BNr,  cast('7F3BA361-D1F9-4AC2-87F7-9EE8DA874B68' AS uniqueidentifier) AS Enr Union
Select cast('E2AF58B8-99C5-4E50-9C6C-BB79277AFE9A' AS uniqueidentifier) AS BNr,  cast('AE8E3812-7F6C-45A9-A884-B4A37632EBA9' AS uniqueidentifier) AS Enr Union
Select cast('22C72CDA-88E0-498F-8B55-C27C8588ED59' AS uniqueidentifier) AS BNr,  cast('98ADE6F6-68B9-438A-B0DE-D29D647EC284' AS uniqueidentifier) AS Enr Union
Select cast('F548D5E1-6920-4BFF-931D-8D6A3E78368B' AS uniqueidentifier) AS BNr,  cast('DB35D963-4EA4-4B00-8A7B-51918DA8C59F' AS uniqueidentifier) AS Enr Union
Select cast('C16A136B-6B5D-40C4-B3B6-74D7AE156794' AS uniqueidentifier) AS BNr,  cast('49827629-4E62-45EB-A070-4B6B53D3D2CF' AS uniqueidentifier) AS Enr Union
Select cast('9889E4E5-E796-4497-8554-BDAA8681DB25' AS uniqueidentifier) AS BNr,  cast('0DEBC751-BCEB-42C5-BC9F-F0343FFB1AAE' AS uniqueidentifier) AS Enr Union
Select cast('D451C944-F200-4491-8269-94EA5C19C28E' AS uniqueidentifier) AS BNr,  cast('D0E058B6-9FB0-4436-BB47-FFD1DBB60EAA' AS uniqueidentifier) AS Enr Union
Select cast('040D1FE7-41A3-4B71-AFA0-AD0733DD08DF' AS uniqueidentifier) AS BNr,  cast('0936895E-566A-47FB-9C22-35B867069D2F' AS uniqueidentifier) AS Enr Union
Select cast('934EB973-8AA6-4E01-94C7-AECFE7EF283A' AS uniqueidentifier) AS BNr,  cast('76A4A16F-2B5A-4C9E-A9A0-58C3ACDE0777' AS uniqueidentifier) AS Enr Union
Select cast('59D5CFA7-9BBB-463E-8277-0BDD6AED5DD1' AS uniqueidentifier) AS BNr,  cast('B212D67E-A157-43A2-87DD-5625B0FDF637' AS uniqueidentifier) AS Enr Union
Select cast('E00841E3-274D-4A13-9F39-931060B8F866' AS uniqueidentifier) AS BNr,  cast('39F1193B-0A67-4DCF-B298-BDC082B5D2DE' AS uniqueidentifier) AS Enr Union
Select cast('8BF49B80-1972-4C50-9CE0-B50A763AA629' AS uniqueidentifier) AS BNr,  cast('BA7E9C09-1E07-44C0-A63D-32C9BBD6669D' AS uniqueidentifier) AS Enr Union
Select cast('628F3977-F799-4C5D-85C4-618C027D80BC' AS uniqueidentifier) AS BNr,  cast('BEC7EABF-8DEB-4A54-B311-D78341B56EA6' AS uniqueidentifier) AS Enr Union
Select cast('554B80F5-EA3E-4853-8B68-79F78AC7AFA2' AS uniqueidentifier) AS BNr,  cast('2EB93519-016A-47FA-A8D1-BC384D4403A5' AS uniqueidentifier) AS Enr Union
Select cast('7C136AF0-8C09-4ADF-B05B-68A7A647795B' AS uniqueidentifier) AS BNr,  cast('6AD2FBCB-E7D3-49A6-A241-48E82AA06306' AS uniqueidentifier) AS Enr Union
Select cast('A114C2DA-1504-4E93-BD42-52B741665DD1' AS uniqueidentifier) AS BNr,  cast('1A2837D1-A21F-458F-9300-C97A6120F20E' AS uniqueidentifier) AS Enr Union
Select cast('8F51DFBA-E42B-47F3-A5F7-8D1CA0486C95' AS uniqueidentifier) AS BNr,  cast('FD6BA1F6-02A8-4018-97D9-766EDF1C574F' AS uniqueidentifier) AS Enr Union
Select cast('9DB75B84-0D21-4DDD-9077-1245309FBA3E' AS uniqueidentifier) AS BNr,  cast('5FF09C6A-C544-4A62-924F-C34439EDAF5D' AS uniqueidentifier) AS Enr Union
Select cast('9CB9BAA2-4ED2-40DD-8A1C-4A02A0952E14' AS uniqueidentifier) AS BNr,  cast('1B19F0CB-02C6-4FFB-9F28-93E6BD41815D' AS uniqueidentifier) AS Enr Union
Select cast('E8E08942-B702-41AC-9D39-0A163544A15A' AS uniqueidentifier) AS BNr,  cast('F2B214F5-D88D-4167-9FFC-4AF5103AD78A' AS uniqueidentifier) AS Enr Union
Select cast('B9416EB9-78E2-465D-A95F-59553C518717' AS uniqueidentifier) AS BNr,  cast('2AD013A9-7909-403A-9CBA-902073BF4D73' AS uniqueidentifier) AS Enr Union
Select cast('456091B1-DC47-4B0B-B0A6-F68CBFCE80C1' AS uniqueidentifier) AS BNr,  cast('1BB834EF-FEA1-4633-B71C-176F8759A889' AS uniqueidentifier) AS Enr Union
Select cast('DC67124D-58CF-43A4-A380-DFF9EFDA278C' AS uniqueidentifier) AS BNr,  cast('1A1F9448-C0F7-4C68-BEF4-8670A6FC0461' AS uniqueidentifier) AS Enr Union
Select cast('BD93464D-2ECB-479C-9A83-4B8C51389909' AS uniqueidentifier) AS BNr,  cast('7BDA7383-C9A7-44B9-8AC2-DAC5AE4CB721' AS uniqueidentifier) AS Enr Union
Select cast('9AD72EBC-F78E-4A23-AA98-1CDC3CB60ADD' AS uniqueidentifier) AS BNr,  cast('D21BCF20-EE03-4DDD-BFA2-0B7B6F96CCC1' AS uniqueidentifier) AS Enr Union
Select cast('75BC00E8-84C0-47D3-A2C8-7E4DDEA39634' AS uniqueidentifier) AS BNr,  cast('C88F7E2D-C7F5-43BB-9C19-E1102D96BCFD' AS uniqueidentifier) AS Enr Union
Select cast('0826DA58-27BF-4982-85E1-1EE979C54F0B' AS uniqueidentifier) AS BNr,  cast('C7E3E703-EF26-4EED-91A2-B0C16D745D2A' AS uniqueidentifier) AS Enr Union
Select cast('915D9B85-488D-46E3-A0F7-723A1A5B0B72' AS uniqueidentifier) AS BNr,  cast('1AFDB794-6254-43D8-8D36-2BDD776B5E7C' AS uniqueidentifier) AS Enr Union
Select cast('54195D97-9C74-4CFC-907D-FB64F4387826' AS uniqueidentifier) AS BNr,  cast('5261046F-9B34-4FB4-A692-0EF4D8D98E7D' AS uniqueidentifier) AS Enr Union
Select cast('79F22B46-F5C5-42B2-A6FE-88A835BECB0A' AS uniqueidentifier) AS BNr,  cast('D8930FA0-F2BA-48DD-9B7E-BB0AB918F9F7' AS uniqueidentifier) AS Enr Union
Select cast('1319D060-F749-483A-A5DD-56AA666024DA' AS uniqueidentifier) AS BNr,  cast('A42B2BEB-0A34-4577-A8D2-C71C146F0C06' AS uniqueidentifier) AS Enr Union
Select cast('E7E06680-0920-4F19-9AD2-052B5C08C47D' AS uniqueidentifier) AS BNr,  cast('9047634E-4C4F-45D8-B51D-0C7B245190CC' AS uniqueidentifier) AS Enr Union
Select cast('28E8825A-6B55-4104-AEC4-203B089E517B' AS uniqueidentifier) AS BNr,  cast('2DDF9911-167E-4B72-BB27-FA788DC4ED45' AS uniqueidentifier) AS Enr Union
Select cast('043D25F6-8F68-4484-A666-D90816A86F15' AS uniqueidentifier) AS BNr,  cast('9A4B3CC0-845A-4C4B-AEE2-578D398B39E9' AS uniqueidentifier) AS Enr Union
Select cast('3985EF9B-2CA7-4886-A051-297176C293D5' AS uniqueidentifier) AS BNr,  cast('C2AA147D-E87F-410E-B06C-5FF767E21A89' AS uniqueidentifier) AS Enr Union
Select cast('39135693-DCF0-4114-9C15-0B844B4C23C0' AS uniqueidentifier) AS BNr,  cast('9EA18B34-44DB-4DED-A191-B367CD4163EB' AS uniqueidentifier) AS Enr Union
Select cast('EE9B7A8A-6D98-4927-B4B3-1C158EA8948E' AS uniqueidentifier) AS BNr,  cast('09285508-8580-4755-B0F1-D6D26AC33BB4' AS uniqueidentifier) AS Enr Union
Select cast('33240574-C1C2-4DE4-AC6B-AD4502532AC2' AS uniqueidentifier) AS BNr,  cast('01261B2D-ACB8-4AD2-804F-E1158EDF3BC7' AS uniqueidentifier) AS Enr Union
Select cast('C4F157DA-E131-4DBC-8169-BB40E75A3834' AS uniqueidentifier) AS BNr,  cast('CEC36F1C-9B4A-4322-B4C3-28520BF6C01F' AS uniqueidentifier) AS Enr Union
Select cast('AF5B35A2-73A8-4D21-BC5D-5BA247E89908' AS uniqueidentifier) AS BNr,  cast('29CCC0A2-3228-4141-8E6A-32DB32910331' AS uniqueidentifier) AS Enr Union
Select cast('A1D1348E-5C9C-4AA5-BB5D-86BD6212C5C0' AS uniqueidentifier) AS BNr,  cast('94FFCD9E-9AAF-4210-B634-AA417EF20141' AS uniqueidentifier) AS Enr Union
Select cast('9C271811-54E1-4D4F-A568-D0A96DEE6C9F' AS uniqueidentifier) AS BNr,  cast('716E1779-16B7-4A93-996B-C1CFEE064E71' AS uniqueidentifier) AS Enr Union
Select cast('FF502340-2844-448B-B334-DA31F582B0A7' AS uniqueidentifier) AS BNr,  cast('B9D70873-1412-4CF7-B8F8-0F6C5763B0DD' AS uniqueidentifier) AS Enr Union
Select cast('0923064E-3D43-46B6-A201-B377EEE7CFCF' AS uniqueidentifier) AS BNr,  cast('2C492A49-97D3-4364-8674-0D107CFF33F4' AS uniqueidentifier) AS Enr Union
Select cast('7FAADEE7-DD95-4F3A-8302-211F3679A9B8' AS uniqueidentifier) AS BNr,  cast('D0E38912-6897-4256-832C-4260FE393C64' AS uniqueidentifier) AS Enr Union
Select cast('7FD07C2E-8271-4F88-846A-CB70A42AD2EF' AS uniqueidentifier) AS BNr,  cast('B07DCE8C-4B34-45ED-B3DD-466CF75295CA' AS uniqueidentifier) AS Enr Union
Select cast('A824CC35-969F-40EC-BB3C-8BB08BF95668' AS uniqueidentifier) AS BNr,  cast('FCC1F474-EA1B-451D-ABC5-EE80C183CA8E' AS uniqueidentifier) AS Enr Union
Select cast('01B836DB-5B43-4A69-85F4-FA3539139EBC' AS uniqueidentifier) AS BNr,  cast('7C23D332-3CF6-4891-9BA6-A4D487A72258' AS uniqueidentifier) AS Enr Union
Select cast('22D81DCE-E28A-4DBC-A217-D6FCD4BF0120' AS uniqueidentifier) AS BNr,  cast('2E27BB34-B0BC-46EE-B588-794D13002A03' AS uniqueidentifier) AS Enr Union
Select cast('5F60612B-1593-46C6-8E56-5F7B4D5B2631' AS uniqueidentifier) AS BNr,  cast('D4014FA8-41E8-438A-9454-1E478DE93462' AS uniqueidentifier) AS Enr Union
Select cast('260CD3EC-7D9C-4062-A1DF-0F0B602E8C66' AS uniqueidentifier) AS BNr,  cast('B90A458A-7210-48F0-9FB7-F8DC9B668EA1' AS uniqueidentifier) AS Enr Union
Select cast('B1E642EA-E583-43A3-BF50-A1C3EF7A899F' AS uniqueidentifier) AS BNr,  cast('7FD6C076-E184-4957-A3E9-7140D6F97445' AS uniqueidentifier) AS Enr Union
Select cast('C8FF9BF1-609F-43F4-8100-9F5411DE336B' AS uniqueidentifier) AS BNr,  cast('A05893D9-156F-4701-873D-E770C31E26A0' AS uniqueidentifier) AS Enr Union
Select cast('BA211E46-8B11-46F8-905D-58FCF299E8B8' AS uniqueidentifier) AS BNr,  cast('7C3ACC9C-5A54-48DA-9BA0-664CD16D5CB6' AS uniqueidentifier) AS Enr Union
Select cast('DC17DAFC-A261-4BA3-BF59-650DBD3743D1' AS uniqueidentifier) AS BNr,  cast('2689DE74-E546-484F-AC55-12EF78C8E609' AS uniqueidentifier) AS Enr Union
Select cast('90BCE397-8343-4B38-A8F4-7759B94DD182' AS uniqueidentifier) AS BNr,  cast('A94AB088-9DF3-43E5-BF0E-F802677F51DC' AS uniqueidentifier) AS Enr Union
Select cast('EDE17A1D-62D8-4A27-A4BE-7236EA10EA89' AS uniqueidentifier) AS BNr,  cast('0FDC77B1-24CF-41F8-A050-90BC23BADE02' AS uniqueidentifier) AS Enr Union
Select cast('024CC04E-D48F-44DC-B625-A35097BCAACB' AS uniqueidentifier) AS BNr,  cast('FDD87E80-1F8A-4B07-AEE1-9EC09E867510' AS uniqueidentifier) AS Enr Union
Select cast('605BECD1-9F9B-4FF6-BEEC-522FE65A47CB' AS uniqueidentifier) AS BNr,  cast('2CBF8F73-7A20-47D2-AD0C-624C1E180E60' AS uniqueidentifier) AS Enr Union
Select cast('75928848-CE4F-4870-951B-C1D84DA9612F' AS uniqueidentifier) AS BNr,  cast('01AE4867-3E4E-4A44-8712-8A8DDF21CB4F' AS uniqueidentifier) AS Enr Union
Select cast('F28E464A-02E5-4E46-9A6D-3069D1AE35D1' AS uniqueidentifier) AS BNr,  cast('427A015C-2555-48CD-A9D2-8B0D185B7B91' AS uniqueidentifier) AS Enr Union
Select cast('7D243E50-3FF5-4AAE-A1F0-9A0AAFCD08D5' AS uniqueidentifier) AS BNr,  cast('C178A512-E9A0-4E98-8A33-A1C13FF4E5ED' AS uniqueidentifier) AS Enr Union
Select cast('198CF52B-9667-42EB-A02D-6A8D42A8CE7C' AS uniqueidentifier) AS BNr,  cast('B0942387-7043-4175-8912-D838B962FEF3' AS uniqueidentifier) AS Enr Union
Select cast('D7919147-6991-41CD-8371-97453EC9DF85' AS uniqueidentifier) AS BNr,  cast('3AD32552-7419-4EBF-9555-4A4BBFAD84D2' AS uniqueidentifier) AS Enr Union
Select cast('34A886DE-8ECF-4A0A-B813-E58D67A9B6C8' AS uniqueidentifier) AS BNr,  cast('E8B5CB77-0B1D-4C4D-85C8-C76D3635D7E2' AS uniqueidentifier) AS Enr Union
Select cast('3FB26E99-BD97-462A-BB9C-3B22E32B2495' AS uniqueidentifier) AS BNr,  cast('73648415-62AA-4E23-9CF9-10AA5B2107B0' AS uniqueidentifier) AS Enr Union
Select cast('A10ECCAA-4E62-457B-AC27-D507A570B49F' AS uniqueidentifier) AS BNr,  cast('D3DC3554-AF69-4DA5-B71C-5E2B744A82CE' AS uniqueidentifier) AS Enr Union
Select cast('4CB1BAD4-2354-4EB5-9691-9E4889FB14F3' AS uniqueidentifier) AS BNr,  cast('EA62138D-A15E-4196-BCEE-7C7AC66C495D' AS uniqueidentifier) AS Enr Union
Select cast('7394FF16-6ABB-492D-8D72-206B855ADE67' AS uniqueidentifier) AS BNr,  cast('CABBC9EC-0398-4C6A-A254-D2C127F9E31B' AS uniqueidentifier) AS Enr Union
Select cast('2A5AFE77-DE51-4B97-AD72-F6B9E7B730E6' AS uniqueidentifier) AS BNr,  cast('3D56B475-9450-458E-B55E-AFD54A5AB023' AS uniqueidentifier) AS Enr Union
Select cast('FCA01F37-594E-4173-A3EA-D05E3F42B4C7' AS uniqueidentifier) AS BNr,  cast('1DA85579-2137-4608-9A60-F36216D01128' AS uniqueidentifier) AS Enr Union
Select cast('E843E103-B7E8-4CFE-B944-34D334A93534' AS uniqueidentifier) AS BNr,  cast('9C071B61-680A-4B98-9E35-C42785CC7D6F' AS uniqueidentifier) AS Enr Union
Select cast('C6FFE833-272B-4CA9-8584-1FCF6471592A' AS uniqueidentifier) AS BNr,  cast('4AF0A7DC-E210-4CA8-8E6E-1BD9F47AA942' AS uniqueidentifier) AS Enr Union
Select cast('72B47F1C-73BD-46B7-881A-18E01FB7DEF4' AS uniqueidentifier) AS BNr,  cast('A94779E7-12BF-4126-8617-D127F91BFAB0' AS uniqueidentifier) AS Enr Union
Select cast('9B342DBC-71D1-4B93-8553-646D49180770' AS uniqueidentifier) AS BNr,  cast('A46D1288-567F-41B4-ADDD-AEB8D31B0DDE' AS uniqueidentifier) AS Enr Union
Select cast('A9680553-C600-4AD5-A77D-9C4A257DA33E' AS uniqueidentifier) AS BNr,  cast('03BDCEF3-0724-44F4-BC1D-5425AD4526A6' AS uniqueidentifier) AS Enr Union
Select cast('E524FF4A-86ED-499C-90C4-9678047D8AFF' AS uniqueidentifier) AS BNr,  cast('C50A5806-BF6D-4EA7-8B81-2D4213047EE0' AS uniqueidentifier) AS Enr Union
Select cast('3946068F-CA19-44C7-9066-6C5B72CCC67F' AS uniqueidentifier) AS BNr,  cast('7BE6D84F-161F-4E7B-A642-1B2A4508B9F9' AS uniqueidentifier) AS Enr Union
Select cast('A70B0116-33AE-4287-867B-F012E882F4A4' AS uniqueidentifier) AS BNr,  cast('4CB8EC69-486A-4465-A75B-7EEA4F8D6132' AS uniqueidentifier) AS Enr Union
Select cast('D29E64D8-E8C0-42FE-9B80-2E81A61FAE05' AS uniqueidentifier) AS BNr,  cast('CB78178D-709A-4B22-95E8-45A436754657' AS uniqueidentifier) AS Enr Union
Select cast('A1394927-68EF-4F99-B253-E2F1B1866DE3' AS uniqueidentifier) AS BNr,  cast('4C017ACD-A238-49F8-8C3C-919C2AF5E72B' AS uniqueidentifier) AS Enr Union
Select cast('3BB1F5B2-D0E4-419E-9F6F-B87B181ECAA6' AS uniqueidentifier) AS BNr,  cast('23BC4FFB-C413-4B25-93D2-8C984F7E76B9' AS uniqueidentifier) AS Enr Union
Select cast('294FC168-80F0-467E-8D3B-4150D5B2C8F3' AS uniqueidentifier) AS BNr,  cast('E658C35F-127D-432A-8CBD-562B9B6F3ADA' AS uniqueidentifier) AS Enr Union
Select cast('FD9ED4B8-1F19-4CA7-9ACF-609D73C3C003' AS uniqueidentifier) AS BNr,  cast('1AD94A16-63DE-40F1-9458-8CCD86757918' AS uniqueidentifier) AS Enr Union
Select cast('5157E2F5-97A7-4941-917B-4195C2A22C17' AS uniqueidentifier) AS BNr,  cast('24A5B464-F943-4052-AA3C-77D9FFEDEC11' AS uniqueidentifier) AS Enr Union
Select cast('B4A5912C-1E01-4F11-83F9-CC7A8E0FB2F0' AS uniqueidentifier) AS BNr,  cast('F40A48E4-A51F-480D-AB6B-EF0066674EEC' AS uniqueidentifier) AS Enr Union
Select cast('BB78F536-4B62-4096-AA02-F76095A23E19' AS uniqueidentifier) AS BNr,  cast('30B04F87-037E-45CC-B9EE-93DA750F6CB6' AS uniqueidentifier) AS Enr Union
Select cast('9896E2D5-A724-4D7D-BF47-EDB78E9C3390' AS uniqueidentifier) AS BNr,  cast('8B2EA805-0DD9-4132-8EDB-CD9A5C1EC417' AS uniqueidentifier) AS Enr Union
Select cast('F67D0B00-B105-4490-869E-E5B07573274E' AS uniqueidentifier) AS BNr,  cast('DC3721C8-3382-48BD-95A0-CFDD28A506DB' AS uniqueidentifier) AS Enr Union
Select cast('41DDB00C-9A7B-4C1D-BBE6-D5F818FF0A70' AS uniqueidentifier) AS BNr,  cast('ADD8DF7C-94F4-40C5-ACA1-A86751AEFEBC' AS uniqueidentifier) AS Enr Union
Select cast('0147E8B2-CF79-424F-827C-D800C33DAB80' AS uniqueidentifier) AS BNr,  cast('0F7E5A13-5D53-4055-856D-5F56F542D2E2' AS uniqueidentifier) AS Enr Union
Select cast('D7F1B070-7362-4680-B88C-CECCDF8F6DEE' AS uniqueidentifier) AS BNr,  cast('90999992-1E12-425F-9D86-32653538E58C' AS uniqueidentifier) AS Enr Union
Select cast('640A746E-5A1B-4718-AA9A-3C814ECF9C2B' AS uniqueidentifier) AS BNr,  cast('036C9213-F356-4AEC-8F5E-E8C534407039' AS uniqueidentifier) AS Enr Union
Select cast('5D8333C3-4E8E-4343-8F0C-9A3C59955893' AS uniqueidentifier) AS BNr,  cast('D2584AFE-B8D5-4337-A060-168F4F45E01B' AS uniqueidentifier) AS Enr Union
Select cast('60FBD29F-593A-4ED6-BF5B-F6013629A647' AS uniqueidentifier) AS BNr,  cast('8779C264-3A66-402C-B0FE-74DD3C61C580' AS uniqueidentifier) AS Enr Union
Select cast('22098290-5AF4-48C5-B18F-421C7574FE07' AS uniqueidentifier) AS BNr,  cast('FC3EEF0D-1327-43DC-93B2-4747DAE99E83' AS uniqueidentifier) AS Enr Union
Select cast('544B43EB-0D27-4DD5-8D09-C2D62B07415A' AS uniqueidentifier) AS BNr,  cast('8811F60A-A015-4B4D-97EB-6ACEDB6A3A3C' AS uniqueidentifier) AS Enr Union
Select cast('81345F1B-5F04-407F-890D-EEF929144951' AS uniqueidentifier) AS BNr,  cast('16182DE4-0414-43FD-852B-56190D05EFBD' AS uniqueidentifier) AS Enr Union
Select cast('9A6B1C6C-724E-4EB6-A9DE-C5F06384A7B5' AS uniqueidentifier) AS BNr,  cast('043F99D3-8EDE-49F7-9CB3-20608A83A297' AS uniqueidentifier) AS Enr Union
Select cast('D47AFA24-871A-4285-9923-3466A8C5B13F' AS uniqueidentifier) AS BNr,  cast('DD53CD09-DA52-4EB6-8856-0AA68E356E7E' AS uniqueidentifier) AS Enr Union
Select cast('D2558237-8FBC-4FD9-A871-72E92E97541F' AS uniqueidentifier) AS BNr,  cast('699741C1-D962-4DD9-9516-13D8D34FB5F4' AS uniqueidentifier) AS Enr Union
Select cast('1F51A543-6814-4ECB-BD33-FC913E3E6BD1' AS uniqueidentifier) AS BNr,  cast('24AA6DEC-B2CD-4379-97C6-0046E5C99597' AS uniqueidentifier) AS Enr Union
Select cast('27F35C6B-ACA2-40CD-92CA-D94103A24428' AS uniqueidentifier) AS BNr,  cast('BCA2CBF8-2498-4503-BC98-D4CEBA306E47' AS uniqueidentifier) AS Enr Union
Select cast('A6D67C52-ED78-4957-BC02-1BF0CBE4AB4D' AS uniqueidentifier) AS BNr,  cast('E1C45A05-7566-4556-99C5-9278C4C2089C' AS uniqueidentifier) AS Enr Union
Select cast('9D843EA1-0187-4CF9-B563-FDB72695143C' AS uniqueidentifier) AS BNr,  cast('A0969BF9-E0D7-4DDF-A8C2-C2556484DC57' AS uniqueidentifier) AS Enr Union
Select cast('00BF3C69-FCA9-460E-8AE7-ABC983330ED7' AS uniqueidentifier) AS BNr,  cast('AE16258B-63C7-4AE6-9594-E1E45F5E21B2' AS uniqueidentifier) AS Enr Union
Select cast('83B3BA86-5E2D-4834-9D9A-242625C042FB' AS uniqueidentifier) AS BNr,  cast('1B4C655A-E134-489B-ACAE-46A40A3E86D0' AS uniqueidentifier) AS Enr Union
Select cast('2435CE87-6E45-45F3-A4B2-EC784522B558' AS uniqueidentifier) AS BNr,  cast('DC21AD6C-B9BD-451F-8D68-82949149AB21' AS uniqueidentifier) AS Enr Union
Select cast('511C2497-49C9-4F2C-9677-C179C4ACE0D5' AS uniqueidentifier) AS BNr,  cast('A74257A7-C354-427E-B2C5-9E43C1F029A6' AS uniqueidentifier) AS Enr Union
Select cast('D4CCFFAF-C337-45F9-8B2C-6CC37CAD25EE' AS uniqueidentifier) AS BNr,  cast('E5EA152F-7C66-4FE5-BC5F-B98F36D9E615' AS uniqueidentifier) AS Enr Union
Select cast('4B775A0A-E60F-49A5-AA05-EBC6E819399A' AS uniqueidentifier) AS BNr,  cast('D432A6DC-1B77-4709-9C2B-729189BAB074' AS uniqueidentifier) AS Enr Union
Select cast('F7EB57CF-C195-4878-B077-EC3F0BB78461' AS uniqueidentifier) AS BNr,  cast('C25BDF59-1CF8-46F9-91A6-4F68EC04870D' AS uniqueidentifier) AS Enr Union
Select cast('B8629505-08B8-4EEB-ACEF-FFB8BFC3D758' AS uniqueidentifier) AS BNr,  cast('0A028DAC-C2F7-4F0C-A193-A214E60BD218' AS uniqueidentifier) AS Enr Union
Select cast('F001B34A-3B33-4ECB-8098-9E1025D80F67' AS uniqueidentifier) AS BNr,  cast('C4BCB07D-06E7-437D-BB27-C279BB7C9239' AS uniqueidentifier) AS Enr Union
Select cast('A8E0E766-3742-4FE4-9878-4EE189759A20' AS uniqueidentifier) AS BNr,  cast('B6FCD2CD-D2D2-4147-867B-165F6CF942DD' AS uniqueidentifier) AS Enr Union
Select cast('A12BE83C-9A07-4623-AE9C-BE2A817DEDA0' AS uniqueidentifier) AS BNr,  cast('95C8EA62-DEEA-4281-BAAE-9D39309A662A' AS uniqueidentifier) AS Enr Union
Select cast('103F4F6D-DE59-4A39-AD39-8C951217082D' AS uniqueidentifier) AS BNr,  cast('9C463744-CEC8-4822-9CE9-ED2766B2E5BA' AS uniqueidentifier) AS Enr Union
Select cast('9E9A5674-3DE4-4879-991D-116BBCE9D675' AS uniqueidentifier) AS BNr,  cast('95764D2E-9EB1-4B0B-B841-ED5D4DE0419F' AS uniqueidentifier) AS Enr Union
Select cast('3BBA7AB6-F187-4E1B-B92B-8CB11A0CCCB3' AS uniqueidentifier) AS BNr,  cast('B2414E0A-AC13-479A-9EC2-4BCD434BF3A3' AS uniqueidentifier) AS Enr Union
Select cast('B74208F2-603F-47EA-83B4-FDD6260E2327' AS uniqueidentifier) AS BNr,  cast('842DEBD8-D35E-449B-953F-D098E1686DC5' AS uniqueidentifier) AS Enr Union
Select cast('9E91D477-2D4B-4B00-82B2-3FEDB5BEDD53' AS uniqueidentifier) AS BNr,  cast('FC66F777-E5D3-42E7-B22D-A824CB3ED3CA' AS uniqueidentifier) AS Enr Union
Select cast('EFDE4CBC-85F2-4813-9DFA-87193A11F74E' AS uniqueidentifier) AS BNr,  cast('387C6017-ED07-4F21-A7F4-A34E0DAB2818' AS uniqueidentifier) AS Enr Union
Select cast('5AD5F2C4-6B21-494C-B57A-577815B9E7C0' AS uniqueidentifier) AS BNr,  cast('6426D20D-23CD-498E-8425-2B3F32258009' AS uniqueidentifier) AS Enr Union
Select cast('A070B4B1-09F6-4952-B5E7-74ADDFE3951C' AS uniqueidentifier) AS BNr,  cast('3578BD88-D197-4213-B3AB-C188A6CA978A' AS uniqueidentifier) AS Enr Union
Select cast('87B72958-0F37-453B-AC06-A712F938C822' AS uniqueidentifier) AS BNr,  cast('924FCAC3-1E1E-4844-B1F3-93A84BCE6FA6' AS uniqueidentifier) AS Enr Union
Select cast('4E4030CA-EB38-4822-A5F2-BA4F773F4B5E' AS uniqueidentifier) AS BNr,  cast('3184BE76-EA31-4E4E-9C33-84B7051DF73E' AS uniqueidentifier) AS Enr Union
Select cast('0B23D4E9-5783-4DF2-A42B-ACA5A25B90E4' AS uniqueidentifier) AS BNr,  cast('764C7CF6-4959-41FD-B317-928130A68C40' AS uniqueidentifier) AS Enr Union
Select cast('0B6D96A0-7854-450B-BEBF-F040E2C65929' AS uniqueidentifier) AS BNr,  cast('49B78BFF-A2C5-455C-9E7C-F5262843FD58' AS uniqueidentifier) AS Enr Union
Select cast('C23DCFF5-9BBF-4A04-8847-8B7D089B1998' AS uniqueidentifier) AS BNr,  cast('9CB496D4-9818-45FC-869E-62CDCCAA99BB' AS uniqueidentifier) AS Enr Union
Select cast('2559031A-576C-4A0D-9FDF-B1BD9D06D29D' AS uniqueidentifier) AS BNr,  cast('904C13A5-A1F7-4BFB-893A-44E687010C47' AS uniqueidentifier) AS Enr Union
Select cast('761398B9-0B3E-40F5-BF5A-BF3B6AFE0AE9' AS uniqueidentifier) AS BNr,  cast('C89169DF-5895-4405-8D08-104DE1F3673B' AS uniqueidentifier) AS Enr Union
Select cast('C2563BB5-4608-49E6-8E26-46C2CC62083F' AS uniqueidentifier) AS BNr,  cast('BA278C88-F380-4969-A764-41E8A759CB56' AS uniqueidentifier) AS Enr Union
Select cast('FE868A1D-A439-4F6D-BA28-0D9C30EE6C07' AS uniqueidentifier) AS BNr,  cast('67AAF632-2CDE-419B-91DC-9B4E2771437B' AS uniqueidentifier) AS Enr Union
Select cast('E3E53AA9-6BFF-42CD-86A0-A6C13E459035' AS uniqueidentifier) AS BNr,  cast('6B96B95E-DD8E-4CD8-8C32-F941CCC3AB86' AS uniqueidentifier) AS Enr Union
Select cast('45C23284-E088-4A72-A50A-D8BE6A1FC3F3' AS uniqueidentifier) AS BNr,  cast('61A5F871-4CBB-4012-B42F-90625C9DE6AC' AS uniqueidentifier) AS Enr Union
Select cast('776B5EF3-AF75-4C12-90B6-9DEEB4F2D99F' AS uniqueidentifier) AS BNr,  cast('EBA5F89D-3750-47E2-A535-C1AFB3F8EF81' AS uniqueidentifier) AS Enr Union
Select cast('4116437D-FBEC-47C9-A921-6B3C533E6622' AS uniqueidentifier) AS BNr,  cast('5B79FB68-74FA-4AC0-A452-55064D80AD93' AS uniqueidentifier) AS Enr Union
Select cast('CCE6B052-F0A7-4DB9-90A5-D9711A6658BE' AS uniqueidentifier) AS BNr,  cast('53ED54C9-2BC7-4BE2-BB0A-28D819F4A522' AS uniqueidentifier) AS Enr Union
Select cast('5A3A332B-C034-42DF-A7FC-63735F9111B8' AS uniqueidentifier) AS BNr,  cast('4EFB4363-8C2E-4A2C-9CD5-C4ABD19FB2F0' AS uniqueidentifier) AS Enr Union
Select cast('22F24887-8F2F-4EF2-B7A9-B1CC67F4AD78' AS uniqueidentifier) AS BNr,  cast('EE2438AB-25D3-4799-974C-48D64B709754' AS uniqueidentifier) AS Enr Union
Select cast('AA43BF1F-631E-4073-B283-7E48B07A7A7B' AS uniqueidentifier) AS BNr,  cast('05044ED6-E5B1-438F-99B9-603F32CE3BC6' AS uniqueidentifier) AS Enr Union
Select cast('2AD3F15F-8D65-4F2A-BD28-93A832848A3C' AS uniqueidentifier) AS BNr,  cast('4F7E489E-109E-4771-95C7-E40F876110D9' AS uniqueidentifier) AS Enr Union
Select cast('D60AEDA5-BA97-4353-8F1A-D00617BA3D25' AS uniqueidentifier) AS BNr,  cast('9B637A92-45EB-43FF-ACD9-D50B884FD8CB' AS uniqueidentifier) AS Enr Union
Select cast('7B51F1D8-A9ED-4D80-AAFE-FA4D835C3BFA' AS uniqueidentifier) AS BNr,  cast('5576F519-B10D-41E0-945C-5D7A1C01EEC9' AS uniqueidentifier) AS Enr Union
Select cast('40DFCA7A-B274-4F7E-AB94-5C32695560B0' AS uniqueidentifier) AS BNr,  cast('6C44ADC4-7655-459B-A126-5AD614892AE4' AS uniqueidentifier) AS Enr Union
Select cast('6CDE2085-30EA-4659-96F2-BBF818785296' AS uniqueidentifier) AS BNr,  cast('F39780DD-B5F3-426F-BF12-C5C155F6629A' AS uniqueidentifier) AS Enr Union
Select cast('205A0A7D-FACD-45FE-8D02-B9AF391CDB2D' AS uniqueidentifier) AS BNr,  cast('2CF84731-3C09-4A46-BB6F-BDF4E3D52D1A' AS uniqueidentifier) AS Enr Union
Select cast('807CDA73-1841-45A6-9E22-BA6714082EC7' AS uniqueidentifier) AS BNr,  cast('A5C0761D-D1AD-4ADF-B7E9-76D1138B2B9B' AS uniqueidentifier) AS Enr Union
Select cast('395DE331-0F84-4DA8-988D-EEFD043295A5' AS uniqueidentifier) AS BNr,  cast('456E247F-34D9-48D4-A6BA-29F0A9DF0B6F' AS uniqueidentifier) AS Enr Union
Select cast('C23610B9-2F2E-48EE-92AF-3C6E40D2571F' AS uniqueidentifier) AS BNr,  cast('7B55EB48-D142-43B9-8975-B95DCAF14F6D' AS uniqueidentifier) AS Enr Union
Select cast('B5301A13-B245-4198-AE34-D4EFFBC5C629' AS uniqueidentifier) AS BNr,  cast('3933A3A5-1227-443A-B16E-200891859CD2' AS uniqueidentifier) AS Enr Union
Select cast('FCE52E83-2682-42D1-BE9A-24A083F20CBE' AS uniqueidentifier) AS BNr,  cast('56ECE289-1D3A-47BC-A257-BE9DE0CA3FEE' AS uniqueidentifier) AS Enr Union
Select cast('0366C68A-F12D-4858-B6FF-F2BAA5A32B12' AS uniqueidentifier) AS BNr,  cast('C3E1AC33-DD43-45DD-B2B1-7E65C6DFE175' AS uniqueidentifier) AS Enr Union
Select cast('15C78563-206F-4272-923C-77E2934988F7' AS uniqueidentifier) AS BNr,  cast('04152319-0C65-4A07-B335-77FA1355FFCF' AS uniqueidentifier) AS Enr Union
Select cast('26012754-7A09-4F71-8E21-429A5BB85E47' AS uniqueidentifier) AS BNr,  cast('16504562-E4A1-474A-8204-B4A323514D41' AS uniqueidentifier) AS Enr Union
Select cast('4A18C134-5CC8-4B26-8EA2-43CCB6F3DB9C' AS uniqueidentifier) AS BNr,  cast('F4452ACE-838F-42D8-9959-67727B0122A1' AS uniqueidentifier) AS Enr Union
Select cast('862A1E94-DDA8-4CF2-9451-0D3F566B375E' AS uniqueidentifier) AS BNr,  cast('42637C97-07AF-4C44-B627-473232EAA95A' AS uniqueidentifier) AS Enr Union
Select cast('DB820303-FAA7-4D4A-A7DA-5FE7A1B7ED49' AS uniqueidentifier) AS BNr,  cast('00190B3C-0997-4E4D-94DD-07E9EE8710D7' AS uniqueidentifier) AS Enr Union
Select cast('330D75B5-141A-4FE3-9884-89CF9DF59D5E' AS uniqueidentifier) AS BNr,  cast('B9D742E1-FDF0-4B3D-B238-D3B881CCD677' AS uniqueidentifier) AS Enr Union
Select cast('0C0F2FE4-0AAD-423E-AC01-D0BE6B2D75E0' AS uniqueidentifier) AS BNr,  cast('A45F0E09-8D9D-4DC3-A475-1E1E8C0ABE87' AS uniqueidentifier) AS Enr Union
Select cast('D319FC2A-3EC9-45F1-ABBD-51D8D48F6DE5' AS uniqueidentifier) AS BNr,  cast('C6B0034C-DD8B-4541-9C6D-D39C21A89E6B' AS uniqueidentifier) AS Enr Union
Select cast('F5722515-542D-4686-AB71-410B493DA129' AS uniqueidentifier) AS BNr,  cast('60FF24D8-1AB0-4A7D-A8CE-65CF9D977558' AS uniqueidentifier) AS Enr Union
Select cast('3A18C027-6A40-4122-9D93-81F8DA95870C' AS uniqueidentifier) AS BNr,  cast('119B4626-AA3E-4B98-84B1-5C0622F9A8B8' AS uniqueidentifier) AS Enr Union
Select cast('787DB78A-FF5F-429A-87ED-AD42888A53BE' AS uniqueidentifier) AS BNr,  cast('95F168B1-B0E3-4BB5-8ED5-7A8244082A52' AS uniqueidentifier) AS Enr Union
Select cast('D37CED33-03B7-4417-B449-68F9812AE803' AS uniqueidentifier) AS BNr,  cast('73E49EB8-06EA-4C45-BE73-8C836C94198D' AS uniqueidentifier) AS Enr Union
Select cast('5BC9A60E-7C99-4B2B-A462-BC56C30B8E1A' AS uniqueidentifier) AS BNr,  cast('1BA3D9F4-2DE4-4EE6-B860-45CE0EF9B0E4' AS uniqueidentifier) AS Enr Union
Select cast('BF8A0EA1-5A10-4387-AD17-C524BB04AFE0' AS uniqueidentifier) AS BNr,  cast('55099424-623B-41D8-AD77-7AFCF467D726' AS uniqueidentifier) AS Enr Union
Select cast('334C8744-151F-4567-99C9-94AFD69E7FAD' AS uniqueidentifier) AS BNr,  cast('1092EE3E-D6C9-4A61-898B-E1B8AB55B888' AS uniqueidentifier) AS Enr Union
Select cast('E4D76BB4-2A26-4B5C-BF6B-7553FDC21850' AS uniqueidentifier) AS BNr,  cast('3255925C-190D-4773-B65D-B3DB687DD0CB' AS uniqueidentifier) AS Enr Union
Select cast('A8C1A9B1-2092-4B5A-97BE-0E64DA3B446B' AS uniqueidentifier) AS BNr,  cast('E07DB6C4-F59B-4077-B796-D64D45EB7A4F' AS uniqueidentifier) AS Enr Union
Select cast('0438536F-C135-4451-87B7-0CAD71D37A76' AS uniqueidentifier) AS BNr,  cast('F723B998-78E6-44A5-A91F-6396EF031CDA' AS uniqueidentifier) AS Enr Union
Select cast('10C7C50F-4FAF-495B-BF80-DA607DD9D20A' AS uniqueidentifier) AS BNr,  cast('FE58D146-57FB-46DE-BCFB-64609F58FE65' AS uniqueidentifier) AS Enr Union
Select cast('1B15809D-77AC-4114-956D-C7B0C8069616' AS uniqueidentifier) AS BNr,  cast('B51FFB7F-2FA3-425B-AE98-DF39FAC80258' AS uniqueidentifier) AS Enr Union
Select cast('7586238C-E618-4103-84F2-8B76FBA115E2' AS uniqueidentifier) AS BNr,  cast('1079825C-94F0-499E-A31B-4E46C1F6D3E7' AS uniqueidentifier) AS Enr Union
Select cast('27BFBC75-2229-49D0-BC73-7CEE7D59285E' AS uniqueidentifier) AS BNr,  cast('4BDBF99F-0E7D-4802-97AB-E56B552016A3' AS uniqueidentifier) AS Enr Union
Select cast('3FFB9270-75D7-49FC-84EC-A28A48488265' AS uniqueidentifier) AS BNr,  cast('915DC8E3-71D2-4DD0-AF27-E2E248C3E7F9' AS uniqueidentifier) AS Enr Union
Select cast('035413AC-52E5-44AD-AAEF-B12414A94FA3' AS uniqueidentifier) AS BNr,  cast('001D6AF3-1758-476C-80A2-846E12A09DBA' AS uniqueidentifier) AS Enr Union
Select cast('5D5770A0-CF14-4FC3-BF55-E1F0B5C8E177' AS uniqueidentifier) AS BNr,  cast('85FE9F39-2BDC-4836-AB99-977CEDB2509A' AS uniqueidentifier) AS Enr Union
Select cast('ADE870F2-C9E4-48D7-9B1E-840E669770F5' AS uniqueidentifier) AS BNr,  cast('C346A2AE-6FB1-4466-A71C-7F2731A0E375' AS uniqueidentifier) AS Enr Union
Select cast('EC04C486-53B7-4FCD-B41F-E677893ED52E' AS uniqueidentifier) AS BNr,  cast('A303181F-0859-4BC0-B3C4-A04BA0BD3E38' AS uniqueidentifier) AS Enr Union
Select cast('2BBFCD12-FC74-4060-92B9-8C3D09559920' AS uniqueidentifier) AS BNr,  cast('709E8EDF-C494-4E06-AC8B-3474BE658725' AS uniqueidentifier) AS Enr Union
Select cast('756636A4-C1C5-4431-8F01-FF5FA4426197' AS uniqueidentifier) AS BNr,  cast('ABEF6928-0B82-48B6-BC44-2E60E4E17767' AS uniqueidentifier) AS Enr Union
Select cast('872A401E-A541-4AAE-9701-F5B17DAEA6A3' AS uniqueidentifier) AS BNr,  cast('9C860875-7573-4EB2-8F13-298F87B0895F' AS uniqueidentifier) AS Enr Union
Select cast('89A4EDC0-FF5F-49F2-A4BA-217B4B4E3039' AS uniqueidentifier) AS BNr,  cast('A156EBDF-D832-4828-8ECA-A062C202599B' AS uniqueidentifier) AS Enr Union
Select cast('85054B8D-5DFB-4557-A8EC-4C7C6F822697' AS uniqueidentifier) AS BNr,  cast('504106D5-A545-4011-A6F9-E452E8C7546A' AS uniqueidentifier) AS Enr Union
Select cast('6B83BC2E-D02D-4EA0-BA66-E7E61E4CCFCE' AS uniqueidentifier) AS BNr,  cast('2934357D-77DC-47B4-8A33-856B905E5037' AS uniqueidentifier) AS Enr Union
Select cast('9A2C4C13-B048-4A53-81BF-5542CAF29BE6' AS uniqueidentifier) AS BNr,  cast('0158130A-13C9-4C3C-9EEC-351A3EE52B5F' AS uniqueidentifier) AS Enr Union
Select cast('246305BF-7ACF-4B89-9898-E70264C69163' AS uniqueidentifier) AS BNr,  cast('1FFB9F23-74CB-4FF5-9AB1-EDF7FFF8D8C3' AS uniqueidentifier) AS Enr Union
Select cast('100726BD-C3DA-492A-A436-7C327BFFB331' AS uniqueidentifier) AS BNr,  cast('89B1581E-E6D1-4773-B354-5832ED892A39' AS uniqueidentifier) AS Enr Union
Select cast('7A3E6655-3E9A-4C13-8BD2-0226B7B66B73' AS uniqueidentifier) AS BNr,  cast('F6D63EE6-46D8-4BF3-B5CA-F4A1F7F1F2F6' AS uniqueidentifier) AS Enr Union
Select cast('C966D83C-1D1B-4CBC-9085-E836BD1CBA1C' AS uniqueidentifier) AS BNr,  cast('ABA9D428-5FCF-4300-816B-0627E73D7A50' AS uniqueidentifier) AS Enr Union
Select cast('DC427ED2-E1AE-4FC4-9317-01B46D5C8F03' AS uniqueidentifier) AS BNr,  cast('05BDD996-16BF-4BF1-B28A-EB534384C0FB' AS uniqueidentifier) AS Enr Union
Select cast('A1768094-0E67-4168-B6F1-8CD89B6FECF4' AS uniqueidentifier) AS BNr,  cast('8EDF2C03-AC50-42E7-83D9-5CA9C70306D4' AS uniqueidentifier) AS Enr 
GO
/****** Object:  Index [IX BerichtBuffer]    Script Date: 20-1-2020 09:57:12 ******/
CREATE NONCLUSTERED INDEX [IX BerichtBuffer] ON [dbo].[Bericht Buffer]
(
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX Control Params]    Script Date: 20-1-2020 09:57:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX Control Params] ON [dbo].[Control Params]
(
	[Param] ASC,
	[Step] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX ProcessDetails]    Script Date: 20-1-2020 09:57:12 ******/
CREATE NONCLUSTERED INDEX [IX ProcessDetails] ON [dbo].[ProcessDetails]
(
	[Step] ASC,
	[Batch] ASC,
	[Doc/Klant] ASC
)
INCLUDE ( 	[Moment]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX Sonar FileName]    Script Date: 20-1-2020 09:57:12 ******/
CREATE NONCLUSTERED INDEX [IX Sonar FileName] ON [dbo].[Sonar]
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Sonar]    Script Date: 20-1-2020 09:57:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Sonar] ON [dbo].[Sonar]
(
	[SonarSrc] ASC,
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SonarFiles]    Script Date: 20-1-2020 09:57:12 ******/
CREATE NONCLUSTERED INDEX [IX_SonarFiles] ON [dbo].[Sonar Files]
(
	[Source] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_SonarFiles]    Script Date: 20-1-2020 09:57:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_SonarFiles] ON [dbo].[Sonar Files]
(
	[Path] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DirTest] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[Doc DropOut] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[Doc per Klant] ADD  CONSTRAINT [DF__Doc per K__Beric__2A8B4280]  DEFAULT (newid()) FOR [BerichtNr]
GO
ALTER TABLE [dbo].[Doc per Klant] ADD  CONSTRAINT [DF__Doc per K__ProcS__2B7F66B9]  DEFAULT ((1)) FOR [ProcStatus]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [InDB]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [InXls]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [generic]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF__Documents__Inserted]  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[ErrorCodes] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[ErrorCodes] ADD  DEFAULT ((4)) FOR [Status]
GO
ALTER TABLE [dbo].[FileTypes] ADD  DEFAULT ((0)) FOR [Kan]
GO
ALTER TABLE [dbo].[FileTypes] ADD  DEFAULT ((1)) FOR [Moet]
GO
ALTER TABLE [dbo].[FileTypes] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[FileTypes] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[FS Update] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[FS Update] ADD  DEFAULT (getdate()) FOR [Finished]
GO
ALTER TABLE [dbo].[Klanten] ADD  DEFAULT ((0)) FOR [EigenPers]
GO
ALTER TABLE [dbo].[MetadataStatus] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[MetadataStatus] ADD  DEFAULT ((0)) FOR [DoConvert]
GO
ALTER TABLE [dbo].[MetadataStatus] ADD  DEFAULT ((0)) FOR [Final]
GO
ALTER TABLE [dbo].[MetadataStatus] ADD  DEFAULT ((0)) FOR [DropOut Agreed]
GO
ALTER TABLE [dbo].[Module Types] ADD  DEFAULT ((0)) FOR [Manual]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MS test] ADD  CONSTRAINT [df_ConstraintNAme]  DEFAULT (getdate()) FOR [Before]
GO
ALTER TABLE [dbo].[Params] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[ProcessSteps] ADD  DEFAULT ((0)) FOR [IsMainStep]
GO
ALTER TABLE [dbo].[SoftwareVersion] ADD  DEFAULT (getdate()) FOR [Vanaf]
GO
ALTER TABLE [dbo].[SoftwareVersion] ADD  DEFAULT ((1)) FOR [Major]
GO
ALTER TABLE [dbo].[SoftwareVersion] ADD  DEFAULT ((0)) FOR [Minor]
GO
ALTER TABLE [dbo].[SoftwareVersion] ADD  DEFAULT ((0)) FOR [Build]
GO
ALTER TABLE [dbo].[Sonar] ADD  CONSTRAINT [DF__Sonar__Inserted__79E80B25]  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[Sonar Files] ADD  DEFAULT ((1)) FOR [Actief]
GO
ALTER TABLE [dbo].[Sonar Paths] ADD  DEFAULT ((0)) FOR [CurrentYear]
GO
ALTER TABLE [dbo].[Sonar Paths] ADD  DEFAULT ('') FOR [SiebelFS]
GO
ALTER TABLE [dbo].[Sonar Paths] ADD  DEFAULT ((0)) FOR [Refresh]
GO
ALTER TABLE [dbo].[SonarSrc] ADD  DEFAULT ((0)) FOR [Relevant]
GO
ALTER TABLE [dbo].[Standen] ADD  DEFAULT (getdate()) FOR [Moment]
GO
ALTER TABLE [dbo].[Standen Report] ADD  DEFAULT ((0)) FOR [Sonar]
GO
ALTER TABLE [dbo].[Templates] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT ((0)) FOR [InDB]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT ((0)) FOR [InFS]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[AOS_Codes]  WITH CHECK ADD FOREIGN KEY([Classificatie])
REFERENCES [dbo].[Classificaties] ([ID])
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Batch Status] ([ID])
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_Batch Run] FOREIGN KEY([Run])
REFERENCES [dbo].[Runs] ([ID])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_Batch Run]
GO
ALTER TABLE [dbo].[Control Params]  WITH CHECK ADD FOREIGN KEY([Param])
REFERENCES [dbo].[Params] ([ID])
GO
ALTER TABLE [dbo].[Control Params]  WITH CHECK ADD FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Doc DropOut]  WITH CHECK ADD  CONSTRAINT [FK_DocDropOut MD Status] FOREIGN KEY([Doc Status])
REFERENCES [dbo].[MetadataStatus] ([ID])
GO
ALTER TABLE [dbo].[Doc DropOut] CHECK CONSTRAINT [FK_DocDropOut MD Status]
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD  CONSTRAINT [FK__Doc per K__ProcS__2C738AF2] FOREIGN KEY([ProcStatus])
REFERENCES [dbo].[ProcessStatus] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant] CHECK CONSTRAINT [FK__Doc per K__ProcS__2C738AF2]
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD  CONSTRAINT [FK_DpK ErrorCodes] FOREIGN KEY([BSN Status])
REFERENCES [dbo].[ErrorCodes] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant] CHECK CONSTRAINT [FK_DpK ErrorCodes]
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD  CONSTRAINT [FK_DpK Klanten] FOREIGN KEY([Klant])
REFERENCES [dbo].[Klanten] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant] CHECK CONSTRAINT [FK_DpK Klanten]
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD  CONSTRAINT [FK_DpK SonarSource] FOREIGN KEY([Source])
REFERENCES [dbo].[SonarSrc] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant] CHECK CONSTRAINT [FK_DpK SonarSource]
GO
ALTER TABLE [dbo].[Document Types]  WITH CHECK ADD FOREIGN KEY([Template])
REFERENCES [dbo].[Templates] ([ID])
GO
ALTER TABLE [dbo].[Document Types]  WITH CHECK ADD FOREIGN KEY([AOS])
REFERENCES [dbo].[AOS_Codes] ([ID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents FileType] FOREIGN KEY([FileType])
REFERENCES [dbo].[FileTypes] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents FileType]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents Metadata] FOREIGN KEY([DocStatus])
REFERENCES [dbo].[MetadataStatus] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents Metadata]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents ProcessStatus] FOREIGN KEY([ProcStatus])
REFERENCES [dbo].[ProcessStatus] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents ProcessStatus]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents SAF] FOREIGN KEY([SAF])
REFERENCES [dbo].[Sonar Files] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents SAF]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents Sonar] FOREIGN KEY([Sonar])
REFERENCES [dbo].[Sonar] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents Sonar]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents Source] FOREIGN KEY([Source])
REFERENCES [dbo].[SonarSrc] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents Source]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents Step] FOREIGN KEY([CurrentStep])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents Step]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents TemplateAlias] FOREIGN KEY([DocType])
REFERENCES [dbo].[Document Types] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents TemplateAlias]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents TemplateVersion] FOREIGN KEY([xFdF Template])
REFERENCES [dbo].[xFdF Templates] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents TemplateVersion]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents User] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents User]
GO
ALTER TABLE [dbo].[ErrorCodes]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[ProcessStatus] ([ID])
GO
ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD FOREIGN KEY([Main])
REFERENCES [dbo].[FileTypes] ([ID])
GO
ALTER TABLE [dbo].[FS Update]  WITH CHECK ADD  CONSTRAINT [FK_FS Update-Sonar Paths] FOREIGN KEY([Path])
REFERENCES [dbo].[Sonar Paths] ([ID])
GO
ALTER TABLE [dbo].[FS Update] CHECK CONSTRAINT [FK_FS Update-Sonar Paths]
GO
ALTER TABLE [dbo].[Module Versions]  WITH CHECK ADD  CONSTRAINT [FK_Module Versions] FOREIGN KEY([Module])
REFERENCES [dbo].[Modules] ([ID])
GO
ALTER TABLE [dbo].[Module Versions] CHECK CONSTRAINT [FK_Module Versions]
GO
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_ModuleType] FOREIGN KEY([Type])
REFERENCES [dbo].[Module Types] ([ID])
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_ModuleType]
GO
ALTER TABLE [dbo].[Modules per MainStep]  WITH CHECK ADD  CONSTRAINT [FK_Module Steps] FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Modules per MainStep] CHECK CONSTRAINT [FK_Module Steps]
GO
ALTER TABLE [dbo].[Modules per MainStep]  WITH CHECK ADD  CONSTRAINT [FK_Modules] FOREIGN KEY([Module])
REFERENCES [dbo].[Modules] ([ID])
GO
ALTER TABLE [dbo].[Modules per MainStep] CHECK CONSTRAINT [FK_Modules]
GO
ALTER TABLE [dbo].[Params]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[ParamType] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails]  WITH CHECK ADD  CONSTRAINT [FK__ProcessDe__Doc/K__2D67AF2B] FOREIGN KEY([Doc/Klant])
REFERENCES [dbo].[Doc per Klant] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails] CHECK CONSTRAINT [FK__ProcessDe__Doc/K__2D67AF2B]
GO
ALTER TABLE [dbo].[ProcessDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProcessDetails Batch] FOREIGN KEY([Batch])
REFERENCES [dbo].[Batches] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails] CHECK CONSTRAINT [FK_ProcessDetails Batch]
GO
ALTER TABLE [dbo].[ProcessDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProcessDetails Documents] FOREIGN KEY([Doc])
REFERENCES [dbo].[Documents] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails] CHECK CONSTRAINT [FK_ProcessDetails Documents]
GO
ALTER TABLE [dbo].[ProcessDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProcessDetails ErrorCodes] FOREIGN KEY([Status])
REFERENCES [dbo].[ErrorCodes] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails] CHECK CONSTRAINT [FK_ProcessDetails ErrorCodes]
GO
ALTER TABLE [dbo].[ProcessDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProcessDetails Step] FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[ProcessDetails] CHECK CONSTRAINT [FK_ProcessDetails Step]
GO
ALTER TABLE [dbo].[ProcessErrors]  WITH CHECK ADD  CONSTRAINT [FK_ProcessErrors Batch] FOREIGN KEY([Batch])
REFERENCES [dbo].[Batches] ([ID])
GO
ALTER TABLE [dbo].[ProcessErrors] CHECK CONSTRAINT [FK_ProcessErrors Batch]
GO
ALTER TABLE [dbo].[ProcessErrors]  WITH CHECK ADD  CONSTRAINT [FK_ProcessErrors Documents] FOREIGN KEY([Doc])
REFERENCES [dbo].[Documents] ([ID])
GO
ALTER TABLE [dbo].[ProcessErrors] CHECK CONSTRAINT [FK_ProcessErrors Documents]
GO
ALTER TABLE [dbo].[ProcessErrors]  WITH CHECK ADD  CONSTRAINT [FK_ProcessErrors Step] FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[ProcessErrors] CHECK CONSTRAINT [FK_ProcessErrors Step]
GO
ALTER TABLE [dbo].[ProcessSteps]  WITH CHECK ADD FOREIGN KEY([Main])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Release Details]  WITH CHECK ADD  CONSTRAINT [FK_Release Software] FOREIGN KEY([Release])
REFERENCES [dbo].[SoftwareVersion] ([ID])
GO
ALTER TABLE [dbo].[Release Details] CHECK CONSTRAINT [FK_Release Software]
GO
ALTER TABLE [dbo].[Release Details]  WITH CHECK ADD  CONSTRAINT [FK_Release Version] FOREIGN KEY([Version])
REFERENCES [dbo].[Module Versions] ([ID])
GO
ALTER TABLE [dbo].[Release Details] CHECK CONSTRAINT [FK_Release Version]
GO
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD  CONSTRAINT [FK_Runs Software] FOREIGN KEY([Software])
REFERENCES [dbo].[SoftwareVersion] ([ID])
GO
ALTER TABLE [dbo].[Runs] CHECK CONSTRAINT [FK_Runs Software]
GO
ALTER TABLE [dbo].[SoftwareVersion]  WITH CHECK ADD FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Sonar]  WITH CHECK ADD  CONSTRAINT [FK_Sonar Src] FOREIGN KEY([SonarSrc])
REFERENCES [dbo].[SonarSrc] ([ID])
GO
ALTER TABLE [dbo].[Sonar] CHECK CONSTRAINT [FK_Sonar Src]
GO
ALTER TABLE [dbo].[Sonar Files]  WITH NOCHECK ADD  CONSTRAINT [FK_SonarFiles Path] FOREIGN KEY([Path])
REFERENCES [dbo].[Sonar Paths] ([ID])
GO
ALTER TABLE [dbo].[Sonar Files] CHECK CONSTRAINT [FK_SonarFiles Path]
GO
ALTER TABLE [dbo].[Sonar Files]  WITH NOCHECK ADD  CONSTRAINT [FK_SonarFiles Source] FOREIGN KEY([Source])
REFERENCES [dbo].[SonarSrc] ([ID])
GO
ALTER TABLE [dbo].[Sonar Files] CHECK CONSTRAINT [FK_SonarFiles Source]
GO
ALTER TABLE [dbo].[Standen]  WITH CHECK ADD  CONSTRAINT [FK_Standen Type] FOREIGN KEY([Type])
REFERENCES [dbo].[StandTypen] ([ID])
GO
ALTER TABLE [dbo].[Standen] CHECK CONSTRAINT [FK_Standen Type]
GO
ALTER TABLE [dbo].[Standen Metadata]  WITH CHECK ADD  CONSTRAINT [FK_MDStanden Stand] FOREIGN KEY([Stand])
REFERENCES [dbo].[Standen] ([ID])
GO
ALTER TABLE [dbo].[Standen Metadata] CHECK CONSTRAINT [FK_MDStanden Stand]
GO
ALTER TABLE [dbo].[Standen Metadata]  WITH CHECK ADD  CONSTRAINT [FK_MDStanden Status] FOREIGN KEY([Status])
REFERENCES [dbo].[MetadataStatus] ([ID])
GO
ALTER TABLE [dbo].[Standen Metadata] CHECK CONSTRAINT [FK_MDStanden Status]
GO
ALTER TABLE [dbo].[Standen Proces]  WITH CHECK ADD  CONSTRAINT [FK_PrStanden Stand] FOREIGN KEY([Stand])
REFERENCES [dbo].[Standen] ([ID])
GO
ALTER TABLE [dbo].[Standen Proces] CHECK CONSTRAINT [FK_PrStanden Stand]
GO
ALTER TABLE [dbo].[Standen Proces]  WITH CHECK ADD  CONSTRAINT [FK_PrStanden Step] FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
GO
ALTER TABLE [dbo].[Standen Proces] CHECK CONSTRAINT [FK_PrStanden Step]
GO
ALTER TABLE [dbo].[Standen Report]  WITH CHECK ADD  CONSTRAINT [FK_RepStanden Stand] FOREIGN KEY([Stand])
REFERENCES [dbo].[Standen] ([ID])
GO
ALTER TABLE [dbo].[Standen Report] CHECK CONSTRAINT [FK_RepStanden Stand]
GO
ALTER TABLE [dbo].[Template Versions per Alias]  WITH CHECK ADD FOREIGN KEY([Template Version])
REFERENCES [dbo].[xFdF Templates] ([ID])
GO
ALTER TABLE [dbo].[Template Versions per Alias]  WITH CHECK ADD FOREIGN KEY([Template Alias])
REFERENCES [dbo].[Document Types] ([ID])
GO
ALTER TABLE [dbo].[xFdF Templates]  WITH CHECK ADD FOREIGN KEY([FileType])
REFERENCES [dbo].[FileTypes] ([ID])
GO
ALTER TABLE [dbo].[xFdF Templates]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[xFdF Status] ([ID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProcessSteps"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 165
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Main ProcessSteps'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Main ProcessSteps'
GO
USE [master]
GO
ALTER DATABASE [ConvCtrl] SET  READ_WRITE 
GO
