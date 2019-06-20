USE [master]
GO
/****** Object:  Database [ConvCtrl]    Script Date: 20-6-2019 21:31:29 ******/
CREATE DATABASE [ConvCtrl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sonar', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sonar.mdf' , SIZE = 35952256KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sonar_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sonar_log.ldf' , SIZE = 18685952KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConvCtrl] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [ConvCtrl] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConvCtrl', N'ON'
GO
ALTER DATABASE [ConvCtrl] SET QUERY_STORE = OFF
GO
USE [ConvCtrl]
GO
/****** Object:  User [TEST\SMU042]    Script Date: 20-6-2019 21:31:29 ******/
CREATE USER [TEST\SMU042] FOR LOGIN [TEST\SMU042] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TEST\SMU042]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TEST\SMU042]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TEST\SMU042]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 20-6-2019 21:31:29 ******/
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
	[SAF] [int] NOT NULL,
	[Source] [tinyint] NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[DossierDate] [datetime] NOT NULL,
	[DocName] [varchar](255) NOT NULL,
	[Inserted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc DropOut]    Script Date: 20-6-2019 21:31:29 ******/
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
/****** Object:  Table [dbo].[MetadataStatus]    Script Date: 20-6-2019 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetadataStatus](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sort] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DropOutReport]    Script Date: 20-6-2019 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DropOutReport] as
Select top 100  Sort, Name, [1] AS Cont, [2] AS Cas, [3] AS Act
from (
SELECT        C.Name, D.SonarSrc, COUNT(1) AS Aantal, C.Sort
FROM    (
select [Doc Status], SonarSrc from        [Doc DropOut] 
union all
select DocStatus, Source from        [Documents] where DocStatus > 1
)
AS D innER JOIN
                         MetadataStatus AS C ON D.[Doc Status] = C.ID
GROUP BY C.Name, C.Sort, D.SonarSrc
) AS S
Pivot ( sum(Aantal) for SonarSrc in ([1], [2], [3])
) AS P
ORDER BY Sort
GO
/****** Object:  Table [dbo].[ProcessSteps]    Script Date: 20-6-2019 21:31:29 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Main ProcessSteps]    Script Date: 20-6-2019 21:31:29 ******/
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
/****** Object:  View [dbo].[TableExtents]    Script Date: 20-6-2019 21:31:29 ******/
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
/****** Object:  Table [dbo].[Activity No File]    Script Date: 20-6-2019 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity No File](
	[row_id] [varchar](15) NULL,
	[file_name] [varchar](200) NULL,
	[file_ext] [varchar](10) NULL,
	[file_src_type] [varchar](30) NULL,
	[file_rev_num] [varchar](15) NULL,
	[file_size] [int] NULL,
	[par_row_id] [varchar](15) NULL,
	[created] [datetime] NULL,
	[created_by] [varchar](15) NULL,
	[last_upd] [datetime] NULL,
	[last_upd_by] [varchar](15) NULL,
	[modification_num] [int] NULL,
	[conflict_id] [varchar](15) NULL,
	[file_auto_upd_flg] [varchar](1) NULL,
	[file_defer_flg] [varchar](1) NULL,
	[file_dock_req_flg] [varchar](1) NULL,
	[file_dock_stat_flg] [varchar](1) NULL,
	[file_date] [datetime] NULL,
	[comments] [varchar](250) NULL,
	[file_src_path] [varchar](255) NULL,
	[db_last_upd] [datetime] NULL,
	[db_last_upd_src] [varchar](50) NULL,
	[x_categorie] [varchar](30) NULL,
	[mail_att_type_cd] [varchar](30) NULL,
	[x_bron] [varchar](30) NULL,
	[x_integration_id] [varchar](30) NULL,
	[x_opmerkingen] [varchar](1500) NULL,
	[Sonar Source Name] [varchar](20) NULL,
	[SAF] [varchar](255) NULL,
	[File Name] [varchar](255) NULL,
	[Sonar Source ID] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity Par not found]    Script Date: 20-6-2019 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity Par not found](
	[row_id] [varchar](15) NULL,
	[par_row_id] [varchar](20) NULL,
	[Type] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AOS_Codes]    Script Date: 20-6-2019 21:31:30 ******/
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
/****** Object:  Table [dbo].[Batch Status]    Script Date: 20-6-2019 21:31:30 ******/
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
/****** Object:  Table [dbo].[Batches]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcStart] [datetime] NULL,
	[ProcEnd] [datetime] NULL,
	[Run] [smallint] NOT NULL,
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
/****** Object:  Table [dbo].[BijlageTemplates]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BijlageTemplates](
	[x_template] [varchar](200) NULL,
	[Aandachtsgebied] [varchar](3) NULL,
	[Onderwerp] [varchar](100) NULL,
	[Subonderwerp] [varchar](100) NULL,
	[aantal] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case No File]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case No File](
	[row_id] [varchar](15) NULL,
	[x_template] [varchar](200) NULL,
	[x_template_id] [varchar](15) NULL,
	[x_template_path] [varchar](255) NULL,
	[file_name] [varchar](200) NULL,
	[file_ext] [varchar](10) NULL,
	[file_src_type] [varchar](30) NULL,
	[file_rev_num] [varchar](15) NULL,
	[file_size] [int] NULL,
	[par_row_id] [varchar](15) NULL,
	[created] [datetime] NULL,
	[created_by] [varchar](15) NULL,
	[last_upd] [datetime] NULL,
	[last_upd_by] [varchar](15) NULL,
	[modification_num] [int] NULL,
	[conflict_id] [varchar](15) NULL,
	[file_auto_upd_flg] [varchar](1) NULL,
	[file_defer_flg] [varchar](1) NULL,
	[file_dock_req_flg] [varchar](1) NULL,
	[file_dock_stat_flg] [varchar](1) NULL,
	[file_date] [datetime] NULL,
	[comments] [varchar](250) NULL,
	[file_src_path] [varchar](255) NULL,
	[x_activiteit_id] [varchar](15) NULL,
	[x_last_printed] [datetime] NULL,
	[x_last_printed_by] [varchar](15) NULL,
	[x_printed_flg] [varchar](1) NULL,
	[x_srv_req_id] [varchar](15) NULL,
	[x_cwi_briefpapier_flg] [varchar](1) NULL,
	[x_email_flg] [varchar](1) NULL,
	[db_last_upd] [datetime] NULL,
	[db_last_upd_src] [varchar](50) NULL,
	[x_categorie] [varchar](30) NULL,
	[x_cwi_publiek_flg] [varchar](1) NULL,
	[att_created_by] [varchar](15) NULL,
	[serial_num] [varchar](100) NULL,
	[web_access_flg] [varchar](1) NULL,
	[Sonar Source Name] [varchar](20) NULL,
	[SAF] [varchar](255) NULL,
	[File Name] [varchar](255) NULL,
	[Template Version] [nvarchar](255) NULL,
	[Template Alias] [nvarchar](200) NULL,
	[Sonar Source ID] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case Par not found]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case Par not found](
	[row_id] [varchar](15) NULL,
	[Type] [nvarchar](20) NULL,
	[par_row_id] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classificaties]    Script Date: 20-6-2019 21:31:30 ******/
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
/****** Object:  Table [dbo].[Con No File]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con No File](
	[row_id] [varchar](15) NULL,
	[x_template] [varchar](200) NULL,
	[x_template_id] [varchar](15) NULL,
	[x_template_path] [varchar](255) NULL,
	[x_owner_id] [varchar](15) NULL,
	[file_name] [varchar](200) NULL,
	[file_ext] [varchar](10) NULL,
	[file_src_type] [varchar](30) NULL,
	[file_rev_num] [varchar](15) NULL,
	[file_size] [int] NULL,
	[par_row_id] [varchar](15) NULL,
	[created] [datetime] NULL,
	[ID] [int] NULL,
	[created_by] [varchar](15) NULL,
	[last_upd] [datetime] NULL,
	[last_upd_by] [varchar](15) NULL,
	[modification_num] [int] NULL,
	[conflict_id] [varchar](15) NULL,
	[file_auto_upd_flg] [varchar](1) NULL,
	[file_defer_flg] [varchar](1) NULL,
	[file_dock_req_flg] [varchar](1) NULL,
	[file_dock_stat_flg] [varchar](1) NULL,
	[file_date] [datetime] NULL,
	[comments] [varchar](250) NULL,
	[file_src_path] [varchar](255) NULL,
	[keyword] [varchar](255) NULL,
	[x_activiteit_id] [varchar](15) NULL,
	[x_archive_cd] [varchar](30) NULL,
	[x_bu_id] [varchar](15) NULL,
	[x_dienst_id] [varchar](15) NULL,
	[x_dvp_id] [varchar](15) NULL,
	[x_last_printed] [datetime] NULL,
	[x_last_printed_by] [varchar](15) NULL,
	[x_printed_flg] [varchar](1) NULL,
	[x_seq_nr] [varchar](15) NULL,
	[x_srv_req_id] [varchar](15) NULL,
	[x_stap_id] [varchar](15) NULL,
	[x_versie] [varchar](30) NULL,
	[x_cwi_groep_doc_id] [varchar](15) NULL,
	[x_converted_flg] [varchar](1) NULL,
	[x_cwi_briefpapier_flg] [varchar](1) NULL,
	[type_cd] [varchar](30) NULL,
	[x_aangemaakt] [datetime] NULL,
	[x_bron] [varchar](30) NULL,
	[x_integration_id] [varchar](30) NULL,
	[x_opmerkingen] [varchar](2000) NULL,
	[x_publiek_flg] [varchar](1) NULL,
	[x_email_flg] [varchar](1) NULL,
	[db_last_upd] [datetime] NULL,
	[db_last_upd_src] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Con Par not found]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con Par not found](
	[row_id] [varchar](15) NULL,
	[par_row_id] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control Params]    Script Date: 20-6-2019 21:31:30 ******/
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
/****** Object:  Table [dbo].[Doc per Klant]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc per Klant](
	[Sonar] [varchar](20) NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Contact] [varchar](20) NOT NULL,
	[BSN Status] [tinyint] NULL,
	[Klant] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sonar] ASC,
	[Source] ASC,
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document Types]    Script Date: 20-6-2019 21:31:30 ******/
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
	[InFS] [bit] NOT NULL,
	[InXls] [bit] NOT NULL,
	[AOS] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorCodes]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorCodes](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Inserted] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 20-6-2019 21:31:30 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klantdocs]    Script Date: 20-6-2019 21:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klantdocs](
	[Sonar] [varchar](20) NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Contact] [varchar](20) NOT NULL,
	[BSN Status] [tinyint] NULL,
	[Klant] [int] NULL,
	[bsn_rank] [int] NULL,
	[Template Version] [nvarchar](255) NULL,
	[ext] [varchar](255) NOT NULL,
	[Template Alias] [nvarchar](255) NULL,
	[FileDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klanten]    Script Date: 20-6-2019 21:31:30 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Params]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[ParamType]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[ProcessDetails]    Script Date: 20-6-2019 21:31:31 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessErrors]    Script Date: 20-6-2019 21:31:31 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessStatus]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[Runs]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runs](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[# Batches] [int] NULL,
	[# Extend] [int] NULL,
	[Created] [datetime] NULL,
	[ScriptRoot] [varchar](255) NULL,
	[Software] [tinyint] NOT NULL,
	[OutDir] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoftwareVersion]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoftwareVersion](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Vanaf] [datetime] NOT NULL,
	[Step] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonar]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [varchar](11) NOT NULL,
	[SonarSrc] [tinyint] NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[DocName] [varchar](255) NOT NULL,
	[FileRev] [varchar](11) NOT NULL,
	[Ext] [varchar](20) NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[FileSize] [int] NOT NULL,
	[Owner] [varchar](255) NOT NULL,
	[Template Version] [nvarchar](255) NULL,
	[Template Alias] [nvarchar](255) NULL,
	[Template ID] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonar Files]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[Sonar Files2]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar Files2](
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
/****** Object:  Table [dbo].[Sonar Paths]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonar Paths](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](50) NOT NULL,
	[CurrentYear] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SonarSrc]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[Template Versions per Alias]    Script Date: 20-6-2019 21:31:31 ******/
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
/****** Object:  Table [dbo].[Templates]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Templates](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Doc Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeSchonenKlanten]    Script Date: 20-6-2019 21:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeSchonenKlanten](
	[contact] [varchar](20) NOT NULL,
	[bsn_rank] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UniekeVerkorteFilenamesActivityAtt]    Script Date: 20-6-2019 21:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UniekeVerkorteFilenamesActivityAtt](
	[VerkorteFilename] [varchar](8000) NULL,
	[xfdf] [int] NOT NULL,
	[minimum] [int] NULL,
	[maximum] [int] NULL,
	[Aantal] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerkorteFilenamenActivityAtt]    Script Date: 20-6-2019 21:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerkorteFilenamenActivityAtt](
	[row_id] [varchar](15) NOT NULL,
	[file_name] [varchar](200) NOT NULL,
	[par_row_id] [varchar](15) NOT NULL,
	[xfdf] [int] NOT NULL,
	[VerkorteFilename] [varchar](8000) NULL,
	[verschil] [varchar](8000) NULL,
	[AantalPersonen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFdF Templates]    Script Date: 20-6-2019 21:31:32 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DocKlantKlant]    Script Date: 20-6-2019 21:31:32 ******/
CREATE NONCLUSTERED INDEX [IX_DocKlantKlant] ON [dbo].[Doc per Klant]
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DocKlantStatus]    Script Date: 20-6-2019 21:31:32 ******/
CREATE NONCLUSTERED INDEX [IX_DocKlantStatus] ON [dbo].[Doc per Klant]
(
	[BSN Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Sonar]    Script Date: 20-6-2019 21:31:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Sonar] ON [dbo].[Sonar]
(
	[SonarSrc] ASC,
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SonarFiles]    Script Date: 20-6-2019 21:31:32 ******/
CREATE NONCLUSTERED INDEX [IX_SonarFiles] ON [dbo].[Sonar Files]
(
	[Source] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_SonarFiles]    Script Date: 20-6-2019 21:31:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_SonarFiles] ON [dbo].[Sonar Files]
(
	[Path] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doc DropOut] ADD  DEFAULT (getdate()) FOR [Inserted]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [InDB]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [InFS]
GO
ALTER TABLE [dbo].[Document Types] ADD  DEFAULT ((0)) FOR [InXls]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (getdate()) FOR [Inserted]
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
ALTER TABLE [dbo].[MetadataStatus] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Params] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[ProcessSteps] ADD  DEFAULT ((0)) FOR [IsMainStep]
GO
ALTER TABLE [dbo].[SoftwareVersion] ADD  DEFAULT (getdate()) FOR [Vanaf]
GO
ALTER TABLE [dbo].[Sonar Files] ADD  DEFAULT ((1)) FOR [Actief]
GO
ALTER TABLE [dbo].[Sonar Files2] ADD  DEFAULT ((1)) FOR [Actief]
GO
ALTER TABLE [dbo].[Sonar Paths] ADD  DEFAULT ((0)) FOR [CurrentYear]
GO
ALTER TABLE [dbo].[SonarSrc] ADD  DEFAULT ((0)) FOR [Relevant]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT ((0)) FOR [InDB]
GO
ALTER TABLE [dbo].[xFdF Templates] ADD  DEFAULT ((0)) FOR [InFS]
GO
ALTER TABLE [dbo].[AOS_Codes]  WITH CHECK ADD FOREIGN KEY([Classificatie])
REFERENCES [dbo].[Classificaties] ([ID])
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD FOREIGN KEY([Run])
REFERENCES [dbo].[Runs] ([ID])
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Batch Status] ([ID])
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
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD FOREIGN KEY([BSN Status])
REFERENCES [dbo].[ErrorCodes] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD FOREIGN KEY([Klant])
REFERENCES [dbo].[Klanten] ([ID])
GO
ALTER TABLE [dbo].[Doc per Klant]  WITH CHECK ADD FOREIGN KEY([Source])
REFERENCES [dbo].[SonarSrc] ([ID])
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
ALTER TABLE [dbo].[ErrorCodes]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[ProcessStatus] ([ID])
GO
ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD FOREIGN KEY([Main])
REFERENCES [dbo].[FileTypes] ([ID])
GO
ALTER TABLE [dbo].[Params]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[ParamType] ([ID])
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
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD FOREIGN KEY([Software])
REFERENCES [dbo].[SoftwareVersion] ([ID])
GO
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD FOREIGN KEY([Step])
REFERENCES [dbo].[ProcessSteps] ([ID])
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
ALTER TABLE [dbo].[Sonar Files2]  WITH NOCHECK ADD  CONSTRAINT [FK_SonarFiles2 Path] FOREIGN KEY([Path])
REFERENCES [dbo].[Sonar Paths] ([ID])
GO
ALTER TABLE [dbo].[Sonar Files2] CHECK CONSTRAINT [FK_SonarFiles2 Path]
GO
ALTER TABLE [dbo].[Sonar Files2]  WITH NOCHECK ADD  CONSTRAINT [FK_SonarFiles2 Source] FOREIGN KEY([Source])
REFERENCES [dbo].[SonarSrc] ([ID])
GO
ALTER TABLE [dbo].[Sonar Files2] CHECK CONSTRAINT [FK_SonarFiles2 Source]
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
