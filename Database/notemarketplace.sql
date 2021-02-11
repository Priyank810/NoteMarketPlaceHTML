USE [master]
GO
/****** Object:  Database [notemarketplace]    Script Date: 11-02-2021 17:28:45 ******/
CREATE DATABASE [notemarketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'notemarketplace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\notemarketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'notemarketplace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\notemarketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [notemarketplace] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [notemarketplace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [notemarketplace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [notemarketplace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [notemarketplace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [notemarketplace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [notemarketplace] SET ARITHABORT OFF 
GO
ALTER DATABASE [notemarketplace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [notemarketplace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [notemarketplace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [notemarketplace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [notemarketplace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [notemarketplace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [notemarketplace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [notemarketplace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [notemarketplace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [notemarketplace] SET  ENABLE_BROKER 
GO
ALTER DATABASE [notemarketplace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [notemarketplace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [notemarketplace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [notemarketplace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [notemarketplace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [notemarketplace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [notemarketplace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [notemarketplace] SET RECOVERY FULL 
GO
ALTER DATABASE [notemarketplace] SET  MULTI_USER 
GO
ALTER DATABASE [notemarketplace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [notemarketplace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [notemarketplace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [notemarketplace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [notemarketplace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [notemarketplace] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'notemarketplace', N'ON'
GO
ALTER DATABASE [notemarketplace] SET QUERY_STORE = OFF
GO
USE [notemarketplace]
GO
/****** Object:  Table [dbo].[admindetails]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admindetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secondaryemail] [varchar](100) NULL,
	[profilepicture] [varchar](500) NULL,
	[countrycodeid] [int] NOT NULL,
	[mobilenumber] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactus]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[comments] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryname] [varchar](100) NOT NULL,
	[countrycode] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[download]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[download](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NOT NULL,
	[sellerid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[isdownloadable] [bit] NULL,
	[requesteddate] [datetime] NULL,
	[approveddate] [datetime] NULL,
	[isdownloaded] [bit] NULL,
	[downloaddate] [datetime] NULL,
	[ispaid] [bit] NULL,
	[title] [varchar](100) NOT NULL,
	[categoryname] [varchar](100) NOT NULL,
	[purchasedprice] [decimal](18, 0) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gender]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gendertype] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteattachment]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteattachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NULL,
	[filename] [varchar](100) NOT NULL,
	[filepath] [nvarchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notedetails]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notedetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[statusid] [int] NOT NULL,
	[actionby] [int] NULL,
	[remarks] [varchar](max) NULL,
	[approveddate] [datetime] NULL,
	[title] [varchar](100) NOT NULL,
	[categoryid] [int] NULL,
	[displaypicture] [varchar](500) NULL,
	[typeid] [int] NULL,
	[numberofpages] [int] NULL,
	[description] [varchar](max) NOT NULL,
	[countryid] [int] NULL,
	[universityname] [varchar](200) NULL,
	[coursename] [varchar](100) NULL,
	[coursecode] [varchar](100) NULL,
	[professor] [varchar](100) NULL,
	[ispaid] [bit] NULL,
	[sellprice] [decimal](18, 0) NULL,
	[notepreviewfile] [nvarchar](max) NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notetype]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notetype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typename] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[downloadid] [int] NULL,
	[ratingstar] [decimal](18, 0) NOT NULL,
	[comments] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spam]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[downloadid] [int] NULL,
	[isspam] [bit] NULL,
	[reason] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statustype]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statustype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusname] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[systemconfig]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemconfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valuetype] [varchar](100) NOT NULL,
	[value] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[dob] [date] NULL,
	[genderid] [int] NULL,
	[profilepicture] [varchar](500) NULL,
	[addressline1] [varchar](100) NOT NULL,
	[addressline2] [varchar](100) NULL,
	[city] [varchar](50) NOT NULL,
	[statename] [varchar](50) NOT NULL,
	[countryid] [int] NOT NULL,
	[zipcode] [varchar](50) NOT NULL,
	[university] [varchar](100) NULL,
	[college] [varchar](100) NULL,
	[countrycodeid] [int] NOT NULL,
	[mobilenumber] [varchar](20) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userroles]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11-02-2021 17:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleid] [int] NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isEmailVerified] [bit] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admindetails] ON 

INSERT [dbo].[admindetails] ([id], [secondaryemail], [profilepicture], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'p1s@gmail.com', N'p1.png', 1, N'1234567892', CAST(N'2021-02-10T20:17:51.537' AS DateTime), 2, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[admindetails] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'Computer Science', N'abcabcabcabcabc', CAST(N'2021-02-10T19:53:30.080' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'Mathematics', N'abcabcabcabcabc', CAST(N'2021-02-10T19:53:30.080' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Physics', N'abcabcabcabcabc', CAST(N'2021-02-10T19:53:30.080' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Data Analysis', N'abcabcabcabcabc', CAST(N'2021-02-10T19:53:30.080' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Quantum Science', N'abcabcabcabcabc', CAST(N'2021-02-10T19:53:30.080' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'India', N'+91', CAST(N'2021-02-10T19:48:29.823' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'USA', N'+12', CAST(N'2021-02-10T19:48:29.863' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Canada', N'+92', CAST(N'2021-02-10T19:48:29.867' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Australia', N'+93', CAST(N'2021-02-10T19:48:29.867' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Russia', N'+94', CAST(N'2021-02-10T19:48:29.867' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[download] ON 

INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [isdownloadable], [requesteddate], [approveddate], [isdownloaded], [downloaddate], [ispaid], [title], [categoryname], [purchasedprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, 1, 3, 4, 1, CAST(N'2021-02-10T20:40:58.180' AS DateTime), CAST(N'2021-02-10T20:40:58.180' AS DateTime), 1, CAST(N'2021-02-10T20:40:58.180' AS DateTime), 1, N'ds', N'Data Analysis', CAST(333 AS Decimal(18, 0)), CAST(N'2021-02-10T20:40:58.180' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[download] OFF
GO
SET IDENTITY_INSERT [dbo].[gender] ON 

INSERT [dbo].[gender] ([id], [gendertype], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'male', CAST(N'2021-02-10T19:45:38.257' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gendertype], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'female', CAST(N'2021-02-10T19:45:38.290' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gendertype], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'other', CAST(N'2021-02-10T19:45:38.293' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[gender] OFF
GO
SET IDENTITY_INSERT [dbo].[noteattachment] ON 

INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, 1, N'ds.pdf', N'a/ds.pdf', CAST(N'2021-02-10T20:32:26.033' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, 2, N'ma.pdf', N'a/ma.pdf', CAST(N'2021-02-10T20:32:26.037' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[noteattachment] OFF
GO
SET IDENTITY_INSERT [dbo].[notedetails] ON 

INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, 3, 2, 2, NULL, CAST(N'2021-02-10T20:25:59.630' AS DateTime), N'ds', 4, N'ds.png', 5, 1000, N'abcabcabcabcabcabcabcabcabcabc', 1, N'GTU', N'CS', N'123', N'abcd', 1, CAST(333 AS Decimal(18, 0)), N'ds.pdf', CAST(N'2021-02-10T20:25:59.630' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, 3, 2, 2, NULL, CAST(N'2021-02-10T20:29:28.257' AS DateTime), N'ds', 1, N'ma.png', 2, 1000, N'abcabcabcabcabcabcabcabcabcabc', 1, N'GTU', N'ma', N'124', N'abce', 1, CAST(778 AS Decimal(18, 0)), N'ma.pdf', CAST(N'2021-02-10T20:29:28.257' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[notedetails] OFF
GO
SET IDENTITY_INSERT [dbo].[notetype] ON 

INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'textbook', N'abcabcabcabcabc', CAST(N'2021-02-10T19:57:57.383' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'handwritten', N'abcabcabcabcabc', CAST(N'2021-02-10T19:57:57.437' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'novel', N'abcabcabcabcabc', CAST(N'2021-02-10T19:57:57.437' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'storybook', N'abcabcabcabcabc', CAST(N'2021-02-10T19:57:57.440' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'referencebook', N'abcabcabcabcabc', CAST(N'2021-02-10T19:57:57.440' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[notetype] OFF
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, 1, 4, 1, CAST(5 AS Decimal(18, 0)), N'abc', CAST(N'2021-02-10T20:44:17.117' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[statustype] ON 

INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'draft', N'abcabcabcabcabc', CAST(N'2021-02-10T20:01:31.320' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'approved', N'abcabcabcabcabc', CAST(N'2021-02-10T20:03:24.020' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'removed', N'abcabcabcabcabc', CAST(N'2021-02-10T20:03:24.020' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'reject', N'abcabcabcabcabc', CAST(N'2021-02-10T20:03:24.023' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'inreview', N'abcabcabcabcabc', CAST(N'2021-02-10T20:03:24.023' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [statusname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'submittedforreview', N'abcabcabcabcabc', CAST(N'2021-02-10T20:03:24.023' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[statustype] OFF
GO
SET IDENTITY_INSERT [dbo].[userdetails] ON 

INSERT [dbo].[userdetails] ([id], [userid], [dob], [genderid], [profilepicture], [addressline1], [addressline2], [city], [statename], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, 3, CAST(N'2021-02-10' AS Date), 1, N'a.png', N'abcabcabcabcabc', N'abcabcabcabcabc', N'bhavnagar', N'Gujarat', 1, N'364001', N'GTU', N'GEC Bhavnagar', 1, N'1234567890', CAST(N'2021-02-10T20:12:30.417' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userdetails] ([id], [userid], [dob], [genderid], [profilepicture], [addressline1], [addressline2], [city], [statename], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, 4, CAST(N'2021-02-10' AS Date), 2, N'b.png', N'abcabcabcabcabc', N'abcabcabcabcabc', N'bhavnagar', N'Gujarat', 1, N'364001', N'GTU', N'GEC Bhavnagar', 1, N'1234567891', CAST(N'2021-02-10T20:13:52.043' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[userdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[userroles] ON 

INSERT [dbo].[userroles] ([id], [rolename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'superadmin', NULL, CAST(N'2021-02-10T19:40:24.177' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'admin', NULL, CAST(N'2021-02-10T19:41:26.620' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'member', NULL, CAST(N'2021-02-10T19:41:26.620' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[userroles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [roleid], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [isEmailVerified], [isActive]) VALUES (1, 1, N'priyank', N'doshi', N'p@gmail.com', N'Abc@123', CAST(N'2021-02-10T19:40:55.837' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([id], [roleid], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [isEmailVerified], [isActive]) VALUES (2, 2, N'p1', N'd1', N'p1@gmail.com', N'Abc@123', CAST(N'2021-02-10T19:42:50.810' AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([id], [roleid], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [isEmailVerified], [isActive]) VALUES (3, 3, N'p2', N'd2', N'p2@gmail.com', N'Abc@123', CAST(N'2021-02-10T19:44:08.647' AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([id], [roleid], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [isEmailVerified], [isActive]) VALUES (4, 3, N'p3', N'd3', N'p3@gmail.com', N'Abc@123', CAST(N'2021-02-10T19:44:08.917' AS DateTime), NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__1A0D12CEC88DD739]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__50F7D42EBC2412B7]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[country] ADD UNIQUE NONCLUSTERED 
(
	[countryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__C7047283096A25A0]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[country] ADD UNIQUE NONCLUSTERED 
(
	[countrycode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__gender__8D768380FDC42909]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[gender] ADD UNIQUE NONCLUSTERED 
(
	[gendertype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__noteatta__ACFCEFEE1A60C012]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[noteattachment] ADD UNIQUE NONCLUSTERED 
(
	[filename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__notetype__A64470BD21F19554]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[notetype] ADD UNIQUE NONCLUSTERED 
(
	[typename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__statusty__5C53D648BDC39A05]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[statustype] ADD UNIQUE NONCLUSTERED 
(
	[statusname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userrole__4685A0626C3A39F0]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[userroles] ADD UNIQUE NONCLUSTERED 
(
	[rolename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164FF26CA44]    Script Date: 11-02-2021 17:28:46 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admindetails] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[country] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((0)) FOR [isdownloadable]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((0)) FOR [isdownloaded]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[gender] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[noteattachment] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notedetails] ADD  DEFAULT ((0)) FOR [ispaid]
GO
ALTER TABLE [dbo].[notedetails] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notetype] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[review] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[spam] ADD  DEFAULT ((0)) FOR [isspam]
GO
ALTER TABLE [dbo].[spam] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[statustype] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[systemconfig] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[userdetails] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[userroles] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [isEmailVerified]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD FOREIGN KEY([countrycodeid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[country]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[country]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD FOREIGN KEY([buyerid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD FOREIGN KEY([sellerid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[gender]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[gender]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([actionby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[statustype] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([typeid])
REFERENCES [dbo].[notetype] ([id])
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notetype]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notetype]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([buyerid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([downloadid])
REFERENCES [dbo].[download] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[spam]  WITH CHECK ADD FOREIGN KEY([buyerid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[spam]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[spam]  WITH CHECK ADD FOREIGN KEY([downloadid])
REFERENCES [dbo].[download] ([id])
GO
ALTER TABLE [dbo].[spam]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[spam]  WITH CHECK ADD FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[statustype]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[statustype]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[systemconfig]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[systemconfig]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([countrycodeid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([genderid])
REFERENCES [dbo].[gender] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userroles]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userroles]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[userroles] ([id])
GO
USE [master]
GO
ALTER DATABASE [notemarketplace] SET  READ_WRITE 
GO
