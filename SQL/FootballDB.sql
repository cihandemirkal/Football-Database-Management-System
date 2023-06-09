USE [master]
GO
/****** Object:  Database [FootballDb]    Script Date: 24.05.2023 17:04:12 ******/
CREATE DATABASE [FootballDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootballDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FootballDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootballDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FootballDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FootballDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FootballDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FootballDb] SET  MULTI_USER 
GO
ALTER DATABASE [FootballDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootballDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FootballDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FootballDb] SET QUERY_STORE = OFF
GO
USE [FootballDb]
GO
/****** Object:  Table [dbo].[Awards]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Awards](
	[Award_Id] [int] NOT NULL,
	[AwardName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Awards] PRIMARY KEY CLUSTERED 
(
	[Award_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FootballPlayerCareer]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballPlayerCareer](
	[FootballPlayer_Id] [int] NOT NULL,
	[Goal] [tinyint] NOT NULL,
	[Assist] [tinyint] NOT NULL,
	[Yellow_Card] [tinyint] NOT NULL,
	[Red_Card] [tinyint] NOT NULL,
	[Season_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FootballPlayers]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballPlayers](
	[FootballPlayer_Id] [int] NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Nationality] [nvarchar](20) NOT NULL,
	[Position] [nchar](20) NOT NULL,
	[Length] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Team_Id] [int] NULL,
	[The_Foot_Used] [nvarchar](20) NOT NULL,
	[Manager_Id] [int] NOT NULL,
 CONSTRAINT [PK_FootballPlayers] PRIMARY KEY CLUSTERED 
(
	[FootballPlayer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FP_Awards]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FP_Awards](
	[Award_Id] [int] NOT NULL,
	[FootballPlayer_Id] [int] NOT NULL,
	[Season_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FP_HealthStatus]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FP_HealthStatus](
	[Injury_Id] [int] NOT NULL,
	[FootballPlayer_Id] [int] NOT NULL,
	[History_of_Injury] [date] NOT NULL,
	[Duration_of_Injury] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Injuries]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Injuries](
	[Injury_Id] [int] NOT NULL,
	[Type_of_Injury] [nchar](20) NOT NULL,
 CONSTRAINT [PK_HealthStatus] PRIMARY KEY CLUSTERED 
(
	[Injury_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leagues]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leagues](
	[League_Id] [int] NOT NULL,
	[LeagueName] [nvarchar](50) NOT NULL,
	[Country] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CountryLeagues] PRIMARY KEY CLUSTERED 
(
	[League_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Manager_Id] [int] NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](10) NOT NULL,
	[TelephoneNumber] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[Manager_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Match_Id] [int] NOT NULL,
	[HomeTeam_Id] [int] NOT NULL,
	[AwayTeam_Id] [int] NOT NULL,
	[MatchDate] [date] NOT NULL,
	[Referee_Id] [int] NOT NULL,
	[HomeScore] [int] NOT NULL,
	[AwayScore] [int] NOT NULL,
	[Season_Id] [int] NOT NULL,
	[League_Id] [int] NOT NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Match_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referees]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referees](
	[Referee_Id] [int] NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Nationality] [nvarchar](20) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Referees] PRIMARY KEY CLUSTERED 
(
	[Referee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonLeagues]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonLeagues](
	[Season_Id] [int] NOT NULL,
	[League_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[Season_Id] [int] NOT NULL,
	[SeasonName] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[Season_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadiums]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[Stadium_Id] [int] NOT NULL,
	[StadiumName] [nchar](50) NOT NULL,
	[StadiumCapacity] [int] NOT NULL,
	[City] [nchar](20) NOT NULL,
	[Team_Id] [int] NOT NULL,
 CONSTRAINT [PK_Stadiums] PRIMARY KEY CLUSTERED 
(
	[Stadium_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamAwards]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamAwards](
	[Award_Id] [int] NOT NULL,
	[Team_Id] [int] NOT NULL,
	[Season_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Team_Id] [int] NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
	[Year_of_Establishment] [date] NOT NULL,
	[Country] [nchar](10) NOT NULL,
	[TeamLogo] [nchar](10) NOT NULL,
	[League_Id] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalDirectors]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalDirectors](
	[TechnicalDirector_Id] [int] NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Nationality] [nvarchar](20) NOT NULL,
	[Team_Id] [int] NULL,
 CONSTRAINT [PK_TechnicalDirectors] PRIMARY KEY CLUSTERED 
(
	[TechnicalDirector_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 24.05.2023 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[Transfer_Id] [int] NOT NULL,
	[FootbalPlayer_Id] [int] NOT NULL,
	[OldTeam_Id] [int] NOT NULL,
	[NewTeam_Id] [int] NOT NULL,
	[TransferDate] [date] NOT NULL,
	[TransferFee] [int] NOT NULL,
 CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED 
(
	[Transfer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (1, N'Super League Championship                         ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (2, N'Serie A Championship                              ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (3, N'La Liga Championship                              ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (4, N'Premier League Championship                       ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (5, N'Bundesliga Championship                           ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (6, N'League 1 Championship                             ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (7, N'The Best Team of The Season                       ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (8, N'Ballon D''or                                       ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (9, N'Best Young Footballer                             ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (10, N'Best Goalkeeper Award                             ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (11, N'Best Defender Award                               ')
INSERT [dbo].[Awards] ([Award_Id], [AwardName]) VALUES (12, N'Gerd Müller Trophy                                ')
GO
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (1, 12, 7, 5, 2, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (8, 10, 6, 2, 1, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (25, 8, 3, 6, 0, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (3, 38, 11, 4, 1, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (12, 5, 2, 5, 2, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (17, 5, 3, 4, 2, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (16, 17, 4, 2, 1, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (11, 5, 4, 6, 2, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (4, 21, 3, 5, 2, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (9, 14, 5, 3, 1, 1)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (13, 6, 2, 4, 1, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (17, 2, 1, 1, 0, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (24, 19, 5, 1, 0, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (1, 34, 20, 4, 1, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (5, 14, 12, 5, 1, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (18, 25, 7, 6, 2, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (22, 7, 2, 3, 1, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (30, 8, 2, 4, 2, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (31, 29, 7, 5, 1, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (32, 0, 1, 4, 3, 2)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (19, 15, 4, 4, 1, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (1, 25, 4, 3, 1, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (23, 17, 15, 4, 2, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (10, 29, 12, 4, 1, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (14, 22, 6, 4, 2, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (3, 24, 12, 4, 2, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (17, 31, 12, 5, 1, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (27, 8, 2, 7, 2, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (29, 17, 4, 8, 4, 3)
INSERT [dbo].[FootballPlayerCareer] ([FootballPlayer_Id], [Goal], [Assist], [Yellow_Card], [Red_Card], [Season_Id]) VALUES (7, 13, 8, 5, 1, 3)
GO
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (1, N'Lionel              ', N'Messi               ', CAST(N'1987-06-24T00:00:00.000' AS DateTime), N'Argentina', N'Forward             ', 169, 58, 6, N'Left', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (2, N'Luka                ', N'Modric              ', CAST(N'1985-09-09T00:00:00.000' AS DateTime), N'Croatia', N'Midfield            ', 172, 66, 2, N'Both of them', 5)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (3, N'Erling              ', N'Haaland             ', CAST(N'2000-07-21T00:00:00.000' AS DateTime), N'Norway', N'Forward             ', 194, 88, 13, N'Left', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (4, N'Kylian              ', N'Mbappe              ', CAST(N'1998-12-20T00:00:00.000' AS DateTime), N'France', N'Forward             ', 178, 70, 6, N'Right', 2)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (5, N'Arda                ', N'Güler               ', CAST(N'2005-02-25T00:00:00.000' AS DateTime), N'Turkey', N'Midfield            ', 176, 68, 1, N'Left', 6)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (6, N'Vinicius            ', N'Junior              ', CAST(N'2000-07-12T00:00:00.000' AS DateTime), N'Brasil', N'Forward             ', 176, 73, 2, N'Right', 5)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (7, N'Ferdi               ', N'Kadıoğlu            ', CAST(N'1999-10-07T00:00:00.000' AS DateTime), N'Turkey', N'Midfield            ', 174, 68, 1, N'Right', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (8, N'İlkay               ', N'Gündoğan            ', CAST(N'1985-12-09T00:00:00.000' AS DateTime), N'Germany', N'Midfield            ', 180, 70, 13, N'Right', 2)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (9, N'Antoine             ', N'Griezmann           ', CAST(N'1990-12-21T00:00:00.000' AS DateTime), N'France', N'Forward             ', 178, 60, 14, N'Left', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (10, N'Robert              ', N'Lewandowski         ', CAST(N'2002-06-07T00:00:00.000' AS DateTime), N'Poland', N'Forward             ', 188, 78, 3, N'Right', 6)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (11, N'Leroy               ', N'Sane                ', CAST(N'1998-12-07T00:00:00.000' AS DateTime), N'Germany', N'Forward             ', 175, 62, 4, N'Right', 2)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (12, N'Kim Min             ', N'Jae                 ', CAST(N'1996-07-07T00:00:00.000' AS DateTime), N'South Korea', N'Defender            ', 185, 75, 8, N'Left', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (13, N'Bruno               ', N'Fernandes           ', CAST(N'1995-12-12T00:00:00.000' AS DateTime), N'Portugal', N'Midfield            ', 178, 60, 12, N'Both of them', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (14, N'Marco               ', N'Reus                ', CAST(N'1991-06-20T00:00:00.000' AS DateTime), N'Germany', N'Forward             ', 180, 68, 5, N'Right', 5)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (15, N'Cengiz              ', N'Ünder               ', CAST(N'1998-12-05T00:00:00.000' AS DateTime), N'Turkey', N'Forward             ', 178, 65, 7, N'Left', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (16, N'Brahim              ', N'Diaz                ', CAST(N'1999-07-08T00:00:00.000' AS DateTime), N'Spain', N'Midfield            ', 168, 55, 9, N'Left', 2)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (17, N'Mohammed            ', N'Salah               ', CAST(N'1990-05-03T00:00:00.000' AS DateTime), N'Egypt', N'Forward             ', 178, 67, 10, N'Left', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (18, N'Mauro               ', N'İcardi              ', CAST(N'1991-04-19T00:00:00.000' AS DateTime), N'Argentina', N'Forward             ', 182, 70, 11, N'Right', 2)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (19, N'Dusan               ', N'Vlahovic            ', CAST(N'2000-11-15T00:00:00.000' AS DateTime), N'Serbia', N'Forward             ', 190, 80, 15, N'Right', 5)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (20, N'Vincent             ', N'Aboubakar           ', CAST(N'1992-12-01T00:00:00.000' AS DateTime), N'Cameroon', N'Forward             ', 185, 78, 16, N'Right', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (21, N'Takumi              ', N'Minamino            ', CAST(N'1995-03-04T00:00:00.000' AS DateTime), N'Japan', N'Midfield            ', 172, 58, 17, N'Left', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (22, N'Maya                ', N'Yoshida             ', CAST(N'1990-12-01T00:00:00.000' AS DateTime), N'Japan', N'Defender            ', 180, 70, 18, N'Right', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (23, N'Kevin               ', N'De Bruyne           ', CAST(N'1992-05-04T00:00:00.000' AS DateTime), N'Belgium', N'Midfield            ', 180, 70, 13, N'Both of them', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (24, N'Neymar              ', N'Junior              ', CAST(N'1992-04-17T00:00:00.000' AS DateTime), N'Brasil', N'Forward             ', 178, 70, 6, N'Right', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (25, N'Victor              ', N'Osimhen             ', CAST(N'1998-11-07T00:00:00.000' AS DateTime), N'Nigeria', N'Forward             ', 180, 70, 8, N'Right', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (26, N'Zlatan              ', N'İbrahimoviç         ', CAST(N'1980-04-17T00:00:00.000' AS DateTime), N'Sweden', N'Forward             ', 190, 85, 9, N'Right', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (27, N'Eder                ', N'Militao             ', CAST(N'1999-08-12T00:00:00.000' AS DateTime), N'Brasil', N'Defender            ', 185, 70, 2, N'Right', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (28, N'Cody                ', N'Gakpo               ', CAST(N'2001-10-07T00:00:00.000' AS DateTime), N'Holland', N'Midfield            ', 185, 72, 10, N'Right', 4)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (29, N'Sergio              ', N'Ramos               ', CAST(N'1990-04-07T00:00:00.000' AS DateTime), N'Spain', N'Defender            ', 185, 75, 6, N'Right', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (30, N'Pedri               ', N'Gonzalez            ', CAST(N'2000-03-25T00:00:00.000' AS DateTime), N'Spain', N'Midfield            ', 178, 65, 3, N'Right', 6)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (31, N'Cristiano           ', N'Ronaldo             ', CAST(N'1985-02-05T00:00:00.000' AS DateTime), N'Portugal', N'Forward             ', 185, 75, NULL, N'Right', 1)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (32, N'Thibaut             ', N'Courtois            ', CAST(N'1993-11-08T00:00:00.000' AS DateTime), N'Belgium', N'Goalkeeper          ', 195, 90, 2, N'Left', 3)
INSERT [dbo].[FootballPlayers] ([FootballPlayer_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Position], [Length], [Weight], [Team_Id], [The_Foot_Used], [Manager_Id]) VALUES (33, N'Manuel              ', N'Neuer               ', CAST(N'1990-03-06T00:00:00.000' AS DateTime), N'Germany', N'Goalkeeper          ', 192, 88, 4, N'Right', 1)
GO
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (8, 1, 1)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (9, 6, 1)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (10, 32, 1)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (11, 12, 1)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (12, 10, 1)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (8, 5, 2)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (9, 4, 2)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (10, 32, 2)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (11, 27, 2)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (12, 3, 2)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (8, 4, 3)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (9, 25, 3)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (10, 33, 3)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (11, 29, 3)
INSERT [dbo].[FP_Awards] ([Award_Id], [FootballPlayer_Id], [Season_Id]) VALUES (12, 9, 3)
GO
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (7, 2, CAST(N'2022-04-04' AS Date), N'2 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (1, 8, CAST(N'2021-12-08' AS Date), N'1 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (1, 9, CAST(N'2022-02-03' AS Date), N'1 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (2, 16, CAST(N'2023-03-05' AS Date), N'3 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (9, 5, CAST(N'2021-11-07' AS Date), N'2 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (10, 17, CAST(N'2021-10-05' AS Date), N'1 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (5, 6, CAST(N'2022-04-08' AS Date), N'1 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (3, 18, CAST(N'2022-02-02' AS Date), N'2 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (6, 21, CAST(N'2023-01-09' AS Date), N'3 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (4, 4, CAST(N'2022-04-04' AS Date), N'2 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (8, 11, CAST(N'2021-10-02' AS Date), N'1 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (2, 25, CAST(N'2021-09-30' AS Date), N'2 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (7, 14, CAST(N'2021-12-08' AS Date), N'1 Weeks   ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (4, 8, CAST(N'2023-01-09' AS Date), N'2 Months  ')
INSERT [dbo].[FP_HealthStatus] ([Injury_Id], [FootballPlayer_Id], [History_of_Injury], [Duration_of_Injury]) VALUES (9, 7, CAST(N'2022-01-08' AS Date), N'6 Weeks   ')
GO
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (6, N'Bond Rupture        ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (8, N'Breakages           ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (1, N'Cramp               ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (3, N'Groin Pain          ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (5, N'Headache            ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (9, N'Hematoma            ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (7, N'Knee Pain           ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (2, N'Meniscus Tear       ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (10, N'Other vs            ')
INSERT [dbo].[Injuries] ([Injury_Id], [Type_of_Injury]) VALUES (4, N'Tendon Injury       ')
GO
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (1, N'Super League', N'Turkey    ')
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (2, N'Serie A', N'Italy     ')
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (3, N'La Liga', N'Spain     ')
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (4, N'Premier League', N'England   ')
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (5, N'Bundesliga', N'Germany   ')
INSERT [dbo].[Leagues] ([League_Id], [LeagueName], [Country]) VALUES (6, N'League 1', N'France    ')
GO
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (1, N'Cihan               ', N'Demirkal  ', N'5468521234', N'cihandemir@gmail.com')
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (2, N'Eren                ', N'Arslan    ', N'5896542153', N'erenarslan@hotmail.com')
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (3, N'Özgür               ', N'Aydın     ', N'5745332253', N'ozguraydin@hotmail.com')
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (4, N'Baran               ', N'Tilki     ', N'5432266223', N'barantilki@gmail.com')
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (5, N'Ahmet               ', N'Onur      ', N'5235563585', N'onur.urgot@gmail.com')
INSERT [dbo].[Managers] ([Manager_Id], [FirstName], [LastName], [TelephoneNumber], [Email]) VALUES (6, N'Eren                ', N'Korkmaz   ', N'5433578546', N'erenkrkmz@gmail.com')
GO
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (100, 1, 11, CAST(N'2021-01-02' AS Date), 5, 3, 0, 1, 1)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (101, 2, 3, CAST(N'2022-03-04' AS Date), 2, 4, 2, 2, 3)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (102, 10, 12, CAST(N'2023-02-02' AS Date), 4, 7, 0, 3, 4)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (103, 8, 9, CAST(N'2023-05-05' AS Date), 1, 0, 4, 3, 2)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (104, 14, 2, CAST(N'2022-01-01' AS Date), 3, 2, 2, 2, 3)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (105, 4, 5, CAST(N'2022-05-04' AS Date), 8, 5, 3, 2, 5)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (106, 7, 6, CAST(N'2021-04-02' AS Date), 10, 1, 5, 1, 6)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (107, 15, 9, CAST(N'2021-02-02' AS Date), 7, 3, 1, 1, 2)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (108, 5, 18, CAST(N'2022-04-01' AS Date), 6, 4, 2, 2, 5)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (109, 13, 12, CAST(N'2023-03-16' AS Date), 5, 3, 2, 3, 4)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (110, 16, 1, CAST(N'2023-01-02' AS Date), 1, 0, 0, 3, 1)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (111, 3, 14, CAST(N'2022-04-08' AS Date), 8, 3, 4, 2, 3)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (112, 6, 17, CAST(N'2023-02-09' AS Date), 5, 8, 2, 3, 6)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (113, 10, 13, CAST(N'2022-03-01' AS Date), 5, 4, 2, 2, 4)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (114, 1, 11, CAST(N'2023-05-04' AS Date), 3, 4, 1, 3, 1)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (115, 13, 10, CAST(N'2023-02-04' AS Date), 2, 1, 1, 3, 4)
INSERT [dbo].[Matches] ([Match_Id], [HomeTeam_Id], [AwayTeam_Id], [MatchDate], [Referee_Id], [HomeScore], [AwayScore], [Season_Id], [League_Id]) VALUES (116, 1, 16, CAST(N'2021-04-02' AS Date), 1, 4, 0, 1, 1)
GO
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (1, N'Fırat               ', N'Aydınus             ', CAST(N'1980-05-12' AS Date), N'Turkey', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (2, N'Felix               ', N'Brych               ', CAST(N'1982-01-17' AS Date), N'Germany', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (3, N'Nicola              ', N'Rizzoli             ', CAST(N'1974-03-14' AS Date), N'Italy', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (4, N'Cüneyt              ', N'Çakır               ', CAST(N'1970-05-18' AS Date), N'Turkey', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (5, N'Michael             ', N'Oliver              ', CAST(N'1975-11-13' AS Date), N'England', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (6, N'Anthony             ', N'Taylor              ', CAST(N'1972-10-03' AS Date), N'England', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (7, N'Mike                ', N'Dean                ', CAST(N'1970-09-12' AS Date), N'England', N'Male      ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (8, N'Lucy                ', N'Oliver              ', CAST(N'1980-10-02' AS Date), N'England', N'Female    ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (9, N'Ekaterina           ', N'Kostyunina          ', CAST(N'1978-11-03' AS Date), N'Russia', N'Female    ')
INSERT [dbo].[Referees] ([Referee_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Gender]) VALUES (10, N'Katalin             ', N'Kulcsar             ', CAST(N'1978-02-04' AS Date), N'Hungary', N'Female    ')
GO
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 1)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 2)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 3)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 4)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 5)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (1, 6)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 1)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 2)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 3)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 4)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 5)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (2, 6)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 1)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 2)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 3)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 4)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 5)
INSERT [dbo].[SeasonLeagues] ([Season_Id], [League_Id]) VALUES (3, 6)
GO
INSERT [dbo].[Seasons] ([Season_Id], [SeasonName], [StartDate], [EndDate]) VALUES (1, N'2020 - 2021', CAST(N'2020-09-15' AS Date), CAST(N'2021-05-28' AS Date))
INSERT [dbo].[Seasons] ([Season_Id], [SeasonName], [StartDate], [EndDate]) VALUES (2, N'2021 - 2022', CAST(N'2021-09-08' AS Date), CAST(N'2022-06-03' AS Date))
INSERT [dbo].[Seasons] ([Season_Id], [SeasonName], [StartDate], [EndDate]) VALUES (3, N'2022 - 2023', CAST(N'2022-09-25' AS Date), CAST(N'2023-05-26' AS Date))
GO
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (1, N'Şükrü Saraçoğlu                                   ', 45000, N'Istanbul            ', 1)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (2, N'Türk Telekom Arena                                ', 50000, N'Istanbul            ', 11)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (3, N'Santiago Bernabeu                                 ', 70000, N'Madrid              ', 2)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (4, N'Camp Nou                                          ', 90000, N'Barcelona           ', 3)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (5, N'Vodafone Arena                                    ', 50000, N'Istanbul            ', 16)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (6, N'Allianz Arena                                     ', 70000, N'München             ', 4)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (7, N'Signal Iduna Park                                 ', 81365, N'Dortmund            ', 5)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (8, N'Juventus Arena                                    ', 50000, N'Torino              ', 15)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (9, N'Wanda Metropolitano                               ', 60000, N'Madrid              ', 14)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (10, N'Stadio Diego Armando Maradona                     ', 70000, N'Napoli              ', 8)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (11, N'Giuseppe Meazza                                   ', 60000, N'Milano              ', 9)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (12, N'Old Trafford                                      ', 75000, N'Manchester          ', 12)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (13, N'II. Louis Stadium                                 ', 18500, N'Monaco              ', 17)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (14, N'Princes Park                                      ', 43500, N'Paris               ', 6)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (15, N'Stade Velodrome                                   ', 60000, N'Marseille           ', 7)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (16, N'Veltins Arena                                     ', 62000, N'Gelsenkirchen       ', 18)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (17, N'Etihad Stadium                                    ', 50000, N'Manchester          ', 13)
INSERT [dbo].[Stadiums] ([Stadium_Id], [StadiumName], [StadiumCapacity], [City], [Team_Id]) VALUES (18, N'Anfield                                           ', 54000, N' Liverpool          ', 10)
GO
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (1, 1, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (2, 9, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (3, 2, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (4, 10, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (5, 4, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (6, 7, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (7, 2, 1)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (1, 11, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (2, 8, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (3, 3, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (4, 13, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (5, 4, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (6, 6, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (7, 7, 2)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (1, 1, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (2, 15, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (3, 14, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (4, 12, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (5, 5, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (6, 17, 3)
INSERT [dbo].[TeamAwards] ([Award_Id], [Team_Id], [Season_Id]) VALUES (7, 1, 3)
GO
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (1, N'Fenerbahçe', CAST(N'1907-05-03' AS Date), N'Turkey    ', N'Fb.jpg    ', 1)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (2, N'Real Madrid', CAST(N'1902-03-06' AS Date), N'Spain     ', N'Real.jpg  ', 3)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (3, N'Barcelona', CAST(N'1899-11-29' AS Date), N'Spain     ', N'Barca.jpg ', 3)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (4, N'Bayern Munchen', CAST(N'1900-02-27' AS Date), N'Germany   ', N'Fcb.jpg   ', 5)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (5, N'Borussia Dortmund', CAST(N'1909-12-19' AS Date), N'Germany   ', N'Bd.jpg    ', 5)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (6, N'Paris Saint-Germain', CAST(N'1970-08-12' AS Date), N'France    ', N'Psg.jpg   ', 6)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (7, N'Olympique Marsilya', CAST(N'1899-08-31' AS Date), N'France    ', N'Mar.jpg   ', 6)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (8, N'Napoli', CAST(N'1926-08-01' AS Date), N'Italy     ', N'Nap.jpg   ', 2)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (9, N'Milan', CAST(N'1899-12-16' AS Date), N'Italy     ', N'Milan.jpg ', 2)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (10, N'Liverpool', CAST(N'1892-06-03' AS Date), N'England   ', N'Live.jpg  ', 4)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (11, N'Galatasaray', CAST(N'1905-10-01' AS Date), N'Turkey    ', N'Gs.jpg    ', 1)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (12, N'Manchester United', CAST(N'1878-03-05' AS Date), N'England   ', N'Manu.jpg  ', 4)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (13, N'Manchester City', CAST(N'1880-01-01' AS Date), N'England   ', N'Mcity.jpg ', 4)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (14, N'Atletico Madrid', CAST(N'1903-04-26' AS Date), N'Spain     ', N'Atm.jpg   ', 3)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (15, N'Juventus', CAST(N'1897-11-01' AS Date), N'Italy     ', N'Juve.jpg  ', 2)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (16, N'Beşiktaş', CAST(N'1903-03-01' AS Date), N'Turkey    ', N'Bjk.jpg   ', 1)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (17, N'Monaco', CAST(N'1933-01-01' AS Date), N'France    ', N'Mon.jpg   ', 6)
INSERT [dbo].[Teams] ([Team_Id], [TeamName], [Year_of_Establishment], [Country], [TeamLogo], [League_Id]) VALUES (18, N'FC Schalke 04', CAST(N'1904-05-04' AS Date), N'Germany   ', N'Sc.jpg    ', 5)
GO
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (1, N'Jorge               ', N'Jesus               ', CAST(N'1960-12-04' AS Date), N'Portugal', 1)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (2, N'Pep                 ', N'Guardiola           ', CAST(N'1962-05-04' AS Date), N'Spain', 13)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (3, N'Carlo               ', N'Ancelotti           ', CAST(N'1962-04-03' AS Date), N'Italy', 2)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (4, N'Xavi                ', N'Hernandez           ', CAST(N'1980-05-07' AS Date), N'Spain', 3)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (5, N'Okan                ', N'Buruk               ', CAST(N'1980-01-09' AS Date), N'Turkey', 11)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (6, N'Jose                ', N'Mourinho            ', CAST(N'1965-01-18' AS Date), N'Portugal', NULL)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (7, N'Luciano             ', N'Spaletti            ', CAST(N'1960-12-05' AS Date), N'Italy', 8)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (8, N'Stefano             ', N'Pioli               ', CAST(N'1965-12-01' AS Date), N'Italy', 9)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (9, N'Şenol               ', N'Güneş               ', CAST(N'1958-01-05' AS Date), N'Turkey', 16)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (10, N'Thomas              ', N'Reis                ', CAST(N'1968-05-09' AS Date), N'Germany', 18)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (11, N'Eric                ', N'Ten Hag             ', CAST(N'1970-05-05' AS Date), N'Holland', 12)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (12, N'Christophe          ', N'Galtier             ', CAST(N'1966-05-23' AS Date), N'France', 6)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (13, N'Philippe            ', N'Clement             ', CAST(N'1974-01-01' AS Date), N'Belgium', 17)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (14, N'Jürgen              ', N'Klopp               ', CAST(N'1970-04-21' AS Date), N'Germany', 10)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (15, N'Diego               ', N'Simeone             ', CAST(N'1968-02-16' AS Date), N'Argentina', 14)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (16, N'Thomas              ', N'Tuchel              ', CAST(N'1973-08-04' AS Date), N'Germany', 4)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (17, N'Edin                ', N'Terzic              ', CAST(N'1982-07-07' AS Date), N'Germany', 5)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (18, N'Massimiliano        ', N'Allegri             ', CAST(N'1967-08-24' AS Date), N'Italy', 15)
INSERT [dbo].[TechnicalDirectors] ([TechnicalDirector_Id], [FirstName], [LastName], [BirthDate], [Nationality], [Team_Id]) VALUES (19, N'Igor                ', N'Tudor               ', CAST(N'1978-04-16' AS Date), N'Croatia', 7)
GO
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (1, 1, 3, 6, CAST(N'2020-06-02' AS Date), 50000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (2, 12, 1, 8, CAST(N'2022-01-05' AS Date), 18000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (3, 8, 5, 13, CAST(N'2018-08-07' AS Date), 25000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (4, 11, 13, 4, CAST(N'2021-06-06' AS Date), 30000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (5, 29, 2, 6, CAST(N'2022-06-04' AS Date), 10000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (6, 5, 1, 2, CAST(N'2023-04-04' AS Date), 45000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (7, 23, 13, 1, CAST(N'2023-01-01' AS Date), 40000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (8, 4, 6, 2, CAST(N'2023-06-06' AS Date), 200000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (9, 25, 8, 10, CAST(N'2023-06-21' AS Date), 75000)
INSERT [dbo].[Transfers] ([Transfer_Id], [FootbalPlayer_Id], [OldTeam_Id], [NewTeam_Id], [TransferDate], [TransferFee]) VALUES (10, 17, 10, 15, CAST(N'2023-05-08' AS Date), 60000)
GO
/****** Object:  Index [UK_FootballPlayerCareer_FootballPlayer_Id_Season_Id]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[FootballPlayerCareer] ADD  CONSTRAINT [UK_FootballPlayerCareer_FootballPlayer_Id_Season_Id] UNIQUE NONCLUSTERED 
(
	[FootballPlayer_Id] ASC,
	[Season_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Uk_FP_Awards_Award_Season]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[FP_Awards] ADD  CONSTRAINT [Uk_FP_Awards_Award_Season] UNIQUE NONCLUSTERED 
(
	[Award_Id] ASC,
	[Season_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Injuries_Type_of_Injury]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Injuries] ADD  CONSTRAINT [UK_Injuries_Type_of_Injury] UNIQUE NONCLUSTERED 
(
	[Type_of_Injury] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CountryLeagues_Country]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [IX_CountryLeagues_Country] UNIQUE NONCLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_CountryLeagues_LeagueName]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [UK_CountryLeagues_LeagueName] UNIQUE NONCLUSTERED 
(
	[LeagueName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Managers_TelephoneNumber_Email]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Managers] ADD  CONSTRAINT [UK_Managers_TelephoneNumber_Email] UNIQUE NONCLUSTERED 
(
	[TelephoneNumber] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Matches_Home_Away_Season]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Matches] ADD  CONSTRAINT [UK_Matches_Home_Away_Season] UNIQUE NONCLUSTERED 
(
	[HomeTeam_Id] ASC,
	[AwayTeam_Id] ASC,
	[Season_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_SeasonLeagues_Season_Id_League_Id]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[SeasonLeagues] ADD  CONSTRAINT [UK_SeasonLeagues_Season_Id_League_Id] UNIQUE NONCLUSTERED 
(
	[Season_Id] ASC,
	[League_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Seasons_SeasonName]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Seasons] ADD  CONSTRAINT [UK_Seasons_SeasonName] UNIQUE NONCLUSTERED 
(
	[SeasonName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Stadiums_StadiumName]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Stadiums] ADD  CONSTRAINT [UK_Stadiums_StadiumName] UNIQUE NONCLUSTERED 
(
	[StadiumName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Stadiums_Team_Id]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Stadiums] ADD  CONSTRAINT [UK_Stadiums_Team_Id] UNIQUE NONCLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_TeamAwards_Award_Season]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[TeamAwards] ADD  CONSTRAINT [UK_TeamAwards_Award_Season] UNIQUE NONCLUSTERED 
(
	[Award_Id] ASC,
	[Season_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Teams_League_Id]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [UK_Teams_League_Id] UNIQUE NONCLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_TechnicalDirectors_Team_Id]    Script Date: 24.05.2023 17:04:12 ******/
ALTER TABLE [dbo].[TechnicalDirectors] ADD  CONSTRAINT [UK_TechnicalDirectors_Team_Id] UNIQUE NONCLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TechnicalDirectors]    Script Date: 24.05.2023 17:04:12 ******/
CREATE NONCLUSTERED INDEX [IX_TechnicalDirectors] ON [dbo].[TechnicalDirectors]
(
	[TechnicalDirector_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FootballPlayerCareer]  WITH CHECK ADD  CONSTRAINT [FK_FootballPlayerCareer_FootballPlayers] FOREIGN KEY([FootballPlayer_Id])
REFERENCES [dbo].[FootballPlayers] ([FootballPlayer_Id])
GO
ALTER TABLE [dbo].[FootballPlayerCareer] CHECK CONSTRAINT [FK_FootballPlayerCareer_FootballPlayers]
GO
ALTER TABLE [dbo].[FootballPlayerCareer]  WITH CHECK ADD  CONSTRAINT [FK_FootballPlayerCareer_Seasons] FOREIGN KEY([Season_Id])
REFERENCES [dbo].[Seasons] ([Season_Id])
GO
ALTER TABLE [dbo].[FootballPlayerCareer] CHECK CONSTRAINT [FK_FootballPlayerCareer_Seasons]
GO
ALTER TABLE [dbo].[FootballPlayers]  WITH CHECK ADD  CONSTRAINT [FK_FootballPlayers_Managers] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Managers] ([Manager_Id])
GO
ALTER TABLE [dbo].[FootballPlayers] CHECK CONSTRAINT [FK_FootballPlayers_Managers]
GO
ALTER TABLE [dbo].[FootballPlayers]  WITH CHECK ADD  CONSTRAINT [FK_FootballPlayers_Managers1] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Managers] ([Manager_Id])
GO
ALTER TABLE [dbo].[FootballPlayers] CHECK CONSTRAINT [FK_FootballPlayers_Managers1]
GO
ALTER TABLE [dbo].[FootballPlayers]  WITH CHECK ADD  CONSTRAINT [FK_FootballPlayers_Teams] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[FootballPlayers] CHECK CONSTRAINT [FK_FootballPlayers_Teams]
GO
ALTER TABLE [dbo].[FP_Awards]  WITH CHECK ADD  CONSTRAINT [FK_FP_Awards_Awards] FOREIGN KEY([Award_Id])
REFERENCES [dbo].[Awards] ([Award_Id])
GO
ALTER TABLE [dbo].[FP_Awards] CHECK CONSTRAINT [FK_FP_Awards_Awards]
GO
ALTER TABLE [dbo].[FP_Awards]  WITH CHECK ADD  CONSTRAINT [FK_FP_Awards_FootballPlayers] FOREIGN KEY([FootballPlayer_Id])
REFERENCES [dbo].[FootballPlayers] ([FootballPlayer_Id])
GO
ALTER TABLE [dbo].[FP_Awards] CHECK CONSTRAINT [FK_FP_Awards_FootballPlayers]
GO
ALTER TABLE [dbo].[FP_Awards]  WITH CHECK ADD  CONSTRAINT [FK_FP_Awards_Seasons] FOREIGN KEY([Season_Id])
REFERENCES [dbo].[Seasons] ([Season_Id])
GO
ALTER TABLE [dbo].[FP_Awards] CHECK CONSTRAINT [FK_FP_Awards_Seasons]
GO
ALTER TABLE [dbo].[FP_HealthStatus]  WITH CHECK ADD  CONSTRAINT [FK_FP_HealthStatus_FootballPlayers] FOREIGN KEY([FootballPlayer_Id])
REFERENCES [dbo].[FootballPlayers] ([FootballPlayer_Id])
GO
ALTER TABLE [dbo].[FP_HealthStatus] CHECK CONSTRAINT [FK_FP_HealthStatus_FootballPlayers]
GO
ALTER TABLE [dbo].[FP_HealthStatus]  WITH CHECK ADD  CONSTRAINT [FK_FP_HealthStatus_Injuries] FOREIGN KEY([Injury_Id])
REFERENCES [dbo].[Injuries] ([Injury_Id])
GO
ALTER TABLE [dbo].[FP_HealthStatus] CHECK CONSTRAINT [FK_FP_HealthStatus_Injuries]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Leagues] FOREIGN KEY([League_Id])
REFERENCES [dbo].[Leagues] ([League_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Leagues]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Referees] FOREIGN KEY([Referee_Id])
REFERENCES [dbo].[Referees] ([Referee_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Referees]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Teams] FOREIGN KEY([HomeTeam_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Teams]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Teams1] FOREIGN KEY([AwayTeam_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Teams1]
GO
ALTER TABLE [dbo].[SeasonLeagues]  WITH CHECK ADD  CONSTRAINT [FK_SeasonLeagues_Leagues] FOREIGN KEY([Season_Id])
REFERENCES [dbo].[Leagues] ([League_Id])
GO
ALTER TABLE [dbo].[SeasonLeagues] CHECK CONSTRAINT [FK_SeasonLeagues_Leagues]
GO
ALTER TABLE [dbo].[SeasonLeagues]  WITH CHECK ADD  CONSTRAINT [FK_SeasonLeagues_Seasons] FOREIGN KEY([Season_Id])
REFERENCES [dbo].[Seasons] ([Season_Id])
GO
ALTER TABLE [dbo].[SeasonLeagues] CHECK CONSTRAINT [FK_SeasonLeagues_Seasons]
GO
ALTER TABLE [dbo].[Stadiums]  WITH CHECK ADD  CONSTRAINT [FK_Stadiums_Teams] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[Stadiums] CHECK CONSTRAINT [FK_Stadiums_Teams]
GO
ALTER TABLE [dbo].[TeamAwards]  WITH CHECK ADD  CONSTRAINT [FK_TeamAwards_Awards] FOREIGN KEY([Award_Id])
REFERENCES [dbo].[Awards] ([Award_Id])
GO
ALTER TABLE [dbo].[TeamAwards] CHECK CONSTRAINT [FK_TeamAwards_Awards]
GO
ALTER TABLE [dbo].[TeamAwards]  WITH CHECK ADD  CONSTRAINT [FK_TeamAwards_Seasons] FOREIGN KEY([Season_Id])
REFERENCES [dbo].[Seasons] ([Season_Id])
GO
ALTER TABLE [dbo].[TeamAwards] CHECK CONSTRAINT [FK_TeamAwards_Seasons]
GO
ALTER TABLE [dbo].[TeamAwards]  WITH CHECK ADD  CONSTRAINT [FK_TeamAwards_Teams] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[TeamAwards] CHECK CONSTRAINT [FK_TeamAwards_Teams]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_CountryLeagues] FOREIGN KEY([League_Id])
REFERENCES [dbo].[Leagues] ([League_Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_CountryLeagues]
GO
ALTER TABLE [dbo].[TechnicalDirectors]  WITH CHECK ADD  CONSTRAINT [FK_TechnicalDirectors_Teams] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[TechnicalDirectors] CHECK CONSTRAINT [FK_TechnicalDirectors_Teams]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_FootballPlayers] FOREIGN KEY([FootbalPlayer_Id])
REFERENCES [dbo].[FootballPlayers] ([FootballPlayer_Id])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_FootballPlayers]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_Teams] FOREIGN KEY([OldTeam_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_Teams]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfers_Teams1] FOREIGN KEY([NewTeam_Id])
REFERENCES [dbo].[Teams] ([Team_Id])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfers_Teams1]
GO
USE [master]
GO
ALTER DATABASE [FootballDb] SET  READ_WRITE 
GO
