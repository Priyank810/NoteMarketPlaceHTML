USE [master]
GO
/****** Object:  Database [notesmarketplace]    Script Date: 08-03-2021 15:03:18 ******/
CREATE DATABASE [notesmarketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'notesmarketplace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\notesmarketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'notesmarketplace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\notesmarketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [notesmarketplace] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [notesmarketplace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [notesmarketplace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [notesmarketplace] SET ARITHABORT OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [notesmarketplace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [notesmarketplace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [notesmarketplace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [notesmarketplace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [notesmarketplace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [notesmarketplace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [notesmarketplace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [notesmarketplace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [notesmarketplace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [notesmarketplace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [notesmarketplace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [notesmarketplace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [notesmarketplace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [notesmarketplace] SET RECOVERY FULL 
GO
ALTER DATABASE [notesmarketplace] SET  MULTI_USER 
GO
ALTER DATABASE [notesmarketplace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [notesmarketplace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [notesmarketplace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [notesmarketplace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [notesmarketplace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [notesmarketplace] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'notesmarketplace', N'ON'
GO
ALTER DATABASE [notesmarketplace] SET QUERY_STORE = OFF
GO
USE [notesmarketplace]
GO
/****** Object:  Table [dbo].[admindetails]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admindetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adminid] [int] NOT NULL,
	[secondaryemail] [varchar](200) NOT NULL,
	[profilepicture] [varchar](max) NULL,
	[countrycodeid] [int] NULL,
	[mobilenumber] [varchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[category]    Script Date: 08-03-2021 15:03:19 ******/
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
/****** Object:  Table [dbo].[contact]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[comment] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[subject] [varchar](200) NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryname] [varchar](100) NOT NULL,
	[countrycode] [varchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[download]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[download](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NULL,
	[sellerid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[requesteddate] [datetime] NOT NULL,
	[ispaid] [bit] NULL,
	[isapproved] [bit] NULL,
	[approveddate] [datetime] NULL,
	[isdownloaded] [bit] NULL,
	[downloadedate] [datetime] NULL,
	[title] [varchar](100) NOT NULL,
	[category] [varchar](100) NOT NULL,
	[purchaseprice] [int] NOT NULL,
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
/****** Object:  Table [dbo].[gender]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [varchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[noteattachment]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteattachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NULL,
	[filename] [varchar](100) NOT NULL,
	[filepath] [varchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[notedetails]    Script Date: 08-03-2021 15:03:19 ******/
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
	[description] [varchar](max) NULL,
	[countryid] [int] NULL,
	[universityname] [varchar](200) NULL,
	[coursename] [varchar](100) NULL,
	[coursecode] [varchar](100) NULL,
	[professor] [varchar](100) NULL,
	[ispaid] [bit] NOT NULL,
	[sellprice] [int] NULL,
	[notepreviewfile] [varchar](500) NULL,
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
/****** Object:  Table [dbo].[notetype]    Script Date: 08-03-2021 15:03:19 ******/
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
/****** Object:  Table [dbo].[reviews]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[downloadid] [int] NULL,
	[ratingstar] [int] NOT NULL,
	[comments] [varchar](max) NULL,
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
/****** Object:  Table [dbo].[spam]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NOT NULL,
	[buyerid] [int] NOT NULL,
	[downloadid] [int] NULL,
	[isspam] [bit] NOT NULL,
	[remarks] [varchar](max) NULL,
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
/****** Object:  Table [dbo].[statustype]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statustype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[systemconfig]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemconfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valuetype] [varchar](200) NOT NULL,
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
/****** Object:  Table [dbo].[userdetails]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usserid] [int] NOT NULL,
	[dob] [date] NOT NULL,
	[profilepicture] [varchar](max) NULL,
	[addressline1] [varchar](max) NOT NULL,
	[addressline2] [varchar](max) NULL,
	[city] [varchar](100) NOT NULL,
	[state] [varchar](100) NOT NULL,
	[countryid] [int] NULL,
	[zipcode] [varchar](100) NOT NULL,
	[university] [varchar](200) NOT NULL,
	[college] [varchar](200) NOT NULL,
	[countrycodeid] [int] NULL,
	[mobilenumber] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
	[genderid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userroles]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](50) NOT NULL,
	[roledescription] [varchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[users]    Script Date: 08-03-2021 15:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[roleid] [int] NOT NULL,
	[isEmailVerified] [bit] NULL,
	[activationcode] [uniqueidentifier] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'Computer', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'Physics', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Chemistry', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Mathematics', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Economics', N'abc', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (3, N'priyank', N'priyankdoshi99@gmail.com', N'abc', CAST(N'2021-03-01T15:00:40.833' AS DateTime), N'hello')
INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (1002, N'Priyank', N'priyankd8181@gmail.com', N'abc', CAST(N'2021-03-07T21:01:04.053' AS DateTime), N'Hello')
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'India', N'+91', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'USA', N'+92', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Canada', N'+93', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Japan', N'+94', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Russia', N'+95', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[noteattachment] ON 

INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1010, 1010, N'2Attachment1010_07-03-2021 00-29-21.pdf', N'~/Members/Attachments/1008/1010/2Attachment1010_07-03-2021 00-29-21.pdf', CAST(N'2021-03-07T00:29:21.230' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1011, 1011, N'2Attachment1011_07-03-2021 00-30-35.pdf', N'~/Members/Attachments/1008/1011/2Attachment1011_07-03-2021 00-30-35.pdf', CAST(N'2021-03-07T00:30:35.277' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1012, 1012, N'1Attachment1012_07-03-2021 20-16-09.pdf;', N'~/Members/Attachments/1008/1012/', CAST(N'2021-03-07T00:31:54.197' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1013, 1013, N'2Attachment1013_07-03-2021 00-33-33.pdf', N'~/Members/Attachments/1008/1013/2Attachment1013_07-03-2021 00-33-33.pdf', CAST(N'2021-03-07T00:33:33.123' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1014, 1014, N'2Attachment1014_07-03-2021 00-35-01.pdf', N'~/Members/Attachments/1008/1014/2Attachment1014_07-03-2021 00-35-01.pdf', CAST(N'2021-03-07T00:35:01.230' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1015, 1015, N'2Attachment1015_07-03-2021 00-36-25.pdf', N'~/Members/Attachments/1008/1015/2Attachment1015_07-03-2021 00-36-25.pdf', CAST(N'2021-03-07T00:36:25.670' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1016, 1016, N'2Attachment1016_07-03-2021 00-40-34.pdf', N'~/Members/Attachments/1009/1016/2Attachment1016_07-03-2021 00-40-34.pdf', CAST(N'2021-03-07T00:40:34.583' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1017, 1017, N'2Attachment1017_07-03-2021 00-41-54.pdf', N'~/Members/Attachments/1009/1017/2Attachment1017_07-03-2021 00-41-54.pdf', CAST(N'2021-03-07T00:41:54.567' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1018, 1018, N'2Attachment1018_07-03-2021 00-43-02.pdf', N'~/Members/Attachments/1009/1018/2Attachment1018_07-03-2021 00-43-02.pdf', CAST(N'2021-03-07T00:43:02.993' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1019, 1019, N'2Attachment1019_07-03-2021 00-44-02.pdf', N'~/Members/Attachments/1009/1019/2Attachment1019_07-03-2021 00-44-02.pdf', CAST(N'2021-03-07T00:44:02.520' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1020, 1020, N'2Attachment1020_07-03-2021 00-46-33.pdf', N'~/Members/Attachments/1009/1020/2Attachment1020_07-03-2021 00-46-33.pdf', CAST(N'2021-03-07T00:46:33.560' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1021, 1021, N'2Attachment1021_07-03-2021 00-48-18.pdf', N'~/Members/Attachments/1009/1021/2Attachment1021_07-03-2021 00-48-18.pdf', CAST(N'2021-03-07T00:48:18.523' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1022, 1022, N'2Attachment1022_07-03-2021 01-20-40.pdf', N'~/Members/Attachments/1008/1022/2Attachment1022_07-03-2021 01-20-40.pdf', CAST(N'2021-03-07T01:20:40.013' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1023, 1029, N'1Attachment1029_07-03-2021 19-28-29.pdf;2Attachment1029_07-03-2021 19-28-29.pdf;', N'~/Members/Attachments/1008/1029/', CAST(N'2021-03-07T19:28:29.680' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1024, 1030, N'1Attachment1030_07-03-2021 20-19-23.pdf;2Attachment1030_07-03-2021 20-19-23.pdf;', N'~/Members/Attachments/1008/1030/', CAST(N'2021-03-07T20:19:23.107' AS DateTime), 1008, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[noteattachment] OFF
GO
SET IDENTITY_INSERT [dbo].[notedetails] ON 

INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1010, 1008, 6, NULL, NULL, NULL, N'C+++', 1, N'~/Members/1008/1010/DP_07-03-2021 00-29-21.jpg', 2, 500, N'Book on C++ Concepts', 1, N'GTU', N'Programming', N'001', N'Prof A', 1, 100, N'~/Members/1008/1010/Preview_07-03-2021 20-15-57.pdf', CAST(N'2021-03-07T00:29:21.230' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1011, 1008, 6, NULL, NULL, NULL, N'C', 1, N'~/Members/1008/1011/DP_07-03-2021 00-30-35.jpg', 1, 300, N'Book on C Concepts', 1, N'GTU', N'Basic C', N'002', N'Prof B', 0, 0, N'~/Members/1008/1011/Preview_07-03-2021 00-30-35.pdf', CAST(N'2021-03-07T00:30:35.277' AS DateTime), 1008, NULL, NULL, 0)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1012, 1008, 1, NULL, NULL, NULL, N'Maths3', 4, N'~/Members/1008/1012/DP_07-03-2021 00-31-54.jpg', 2, 300, N'Book on Maths 3', 1, N'GTU', N'Mathematics 3', N'003', N'Prof C', 1, 300, N'~/Members/1008/1012/Preview_07-03-2021 20-17-00.pdf', CAST(N'2021-03-07T00:31:54.197' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1013, 1008, 6, NULL, NULL, NULL, N'RF Physics', 2, N'~/Members/1008/1013/DP_07-03-2021 00-33-33.jpg', 4, 300, N'Novel on Quantum Physics', 1, N'GTU', N'Qauntum Physics', N'004', N'Prof D', 1, 500, N'~/Members/1008/1013/Preview_07-03-2021 20-16-22.pdf', CAST(N'2021-03-07T00:33:33.123' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1014, 1008, 1, NULL, NULL, NULL, N'Economics By A', 5, N'~/Members/1008/1014/DP_07-03-2021 00-35-01.jpg', 1, 300, N'Text Book on Economics', 1, N'GTU', N'Qauntum Physics', N'005', N'Prof E', 0, 0, N'~/Members/1008/1014/Preview_07-03-2021 00-35-01.pdf', CAST(N'2021-03-07T00:35:01.230' AS DateTime), 1008, NULL, NULL, 0)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1015, 1008, 6, NULL, NULL, NULL, N'Organic Chemistry', 3, N'~/Members/1008/1015/DP_07-03-2021 00-36-25.jpg', 1, 300, N'Text Book on organic Chemistry', 1, N'GTU', N'Chemistry', N'006', N'Prof F', 0, 0, N'~/Members/1008/1015/Preview_07-03-2021 20-17-27.pdf', CAST(N'2021-03-07T00:36:25.670' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1016, 1009, 1, NULL, NULL, NULL, N'Java', 1, N'~/Members/1009/1016/DP_07-03-2021 00-40-34.jpg', 2, 700, N'Adavance Java Concepts', 1, N'GTU', N'Java', N'007', N'Prof G', 1, 300, N'~/Members/1009/1016/Preview_07-03-2021 00-40-34.pdf', CAST(N'2021-03-07T00:40:34.583' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1017, 1009, 1, NULL, NULL, NULL, N'INS', 1, N'~/Members/1009/1017/DP_07-03-2021 00-41-54.jpg', 1, 500, N'Information and network security', 1, N'GTU', N'INS', N'008', N'Prof H', 1, 300, N'~/Members/1009/1017/Preview_07-03-2021 00-41-54.pdf', CAST(N'2021-03-07T00:41:54.567' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1018, 1009, 1, NULL, NULL, NULL, N'Indian Economics', 5, N'~/Members/1009/1018/DP_07-03-2021 00-43-02.jpg', 1, 700, N'Book on Indian Economy', 1, N'GTU', N'Economics', N'009', N'Prof I', 0, 0, N'~/Members/1009/1018/Preview_07-03-2021 00-43-02.pdf', CAST(N'2021-03-07T00:43:02.993' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1019, 1009, 1, NULL, NULL, NULL, N'Maths 2', 4, N'~/Members/1009/1019/DP_07-03-2021 00-44-02.jpg', 3, 300, N'Notes of Maths 2', 1, N'GTU', N'Mathematics 2', N'010', N'Prof J', 1, 100, N'~/Members/1009/1019/Preview_07-03-2021 00-44-02.pdf', CAST(N'2021-03-07T00:44:02.520' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1020, 1009, 1, NULL, NULL, NULL, N'Inorganic Chemistry', 3, N'~/Members/1009/1020/DP_07-03-2021 00-46-33.jpg', 1, 300, N'Book of inorganic chemistry', 1, N'GTU', N'Chemistry', N'011', N'Prof K', 1, 300, N'~/Members/1009/1020/Preview_07-03-2021 00-46-33.pdf', CAST(N'2021-03-07T00:46:33.560' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1021, 1009, 1, NULL, NULL, NULL, N'Scattering Effect', 2, N'~/Members/1009/1021/DP_07-03-2021 00-48-18.jpg', 3, 100, N'Notes of scattering effect', 1, N'GTU', N'Physics', N'012', N'Prof L', 0, 0, N'~/Members/1009/1021/Preview_07-03-2021 00-48-18.pdf', CAST(N'2021-03-07T00:48:18.523' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1022, 1008, 6, NULL, NULL, NULL, N'DS', 1, N'~/Members/1008/1022/DP_07-03-2021 01-20-40.jpg', 2, 500, N'Book on Data Structures', 1, N'GTU', N'Data Structures', N'020', N'Prof X', 1, 500, N'~/Members/1008/1022/Preview_07-03-2021 20-16-36.pdf', CAST(N'2021-03-07T01:20:40.013' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1029, 1008, 1, NULL, NULL, NULL, N'AnsiC', 1, N'~/Members/1008/1029/DP_07-03-2021 19-28-29.jpg', 1, 300, N'C Programming', 1, N'GTU', N'C Programming', N'090', N'Prof Z', 1, 500, N'~/Members/1008/1029/Preview_07-03-2021 20-17-14.pdf', CAST(N'2021-03-07T19:28:29.680' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1030, 1008, 6, NULL, NULL, NULL, N'Advance Maths', 4, N'~/Members/1008/1030/DP_07-03-2021 20-19-23.jpg', 1, 500, N'Advance Mathematics Concepts', 1, N'GTU', N'Mathematics', N'099', N'Prof P', 1, 300, N'~/Members/1008/1030/Preview_07-03-2021 20-19-37.pdf', CAST(N'2021-03-07T20:19:23.107' AS DateTime), 1008, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[notedetails] OFF
GO
SET IDENTITY_INSERT [dbo].[notetype] ON 

INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'Textbook', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'Reference Book', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Handwritten Notes', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Novel', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Storybook', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'Text', N'abc', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[notetype] OFF
GO
SET IDENTITY_INSERT [dbo].[statustype] ON 

INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'draft', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'approved', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'removed', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'rejected', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'inreview', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'submittedforreview', N'abc', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[statustype] OFF
GO
SET IDENTITY_INSERT [dbo].[userroles] ON 

INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'superadmin', N'abc', CAST(N'2021-02-27T16:55:07.327' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'admin', N'abc', CAST(N'2021-02-27T16:55:41.360' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'member', N'abc', CAST(N'2021-02-27T16:56:00.480' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[userroles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (1008, N'Priyank', N'Doshi', N'priyankdoshi99@gmail.com', N'JeNZ0HHege6XwsBwr5bKylcDsUclcCi88CfINRBszRk=', CAST(N'2021-03-07T00:19:03.913' AS DateTime), NULL, NULL, NULL, 3, 1, N'0f6d2aca-9dda-473e-9794-c248302fef84', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (1009, N'Harvey', N'Specter', N'priyankd8181@gmail.com', N'e6o5/JSNolR+cbhGHFADsYb4Rcp/Eg9DcI9igk4mbS0=', CAST(N'2021-03-07T00:37:30.370' AS DateTime), NULL, NULL, NULL, 3, 1, N'739419be-498a-42d5-a76b-518d6d4105f4', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (1010, N'Mike', N'Ross', N'priyanksd123@gmail.com', N'NLz36fN6i6PGXSoe+fygt154PL/VYx4s/YkNKWbZ0M8=', CAST(N'2021-03-07T18:01:24.857' AS DateTime), NULL, NULL, NULL, 3, 1, N'd4057c49-3b16-4336-acb3-3d9fd2ee8791', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admindet__374542EF4755F195]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[admindetails] ADD UNIQUE NONCLUSTERED 
(
	[secondaryemail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__1A0D12CEC516D9A2]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__50F7D42E2C186232]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[country] ADD UNIQUE NONCLUSTERED 
(
	[countryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__C7047283C0D458DE]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[country] ADD UNIQUE NONCLUSTERED 
(
	[countrycode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__notetype__A64470BD966FAEAF]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[notetype] ADD UNIQUE NONCLUSTERED 
(
	[typename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__statusty__A858923C4CC580E5]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[statustype] ADD UNIQUE NONCLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userrole__4685A06244FAFC3D]    Script Date: 08-03-2021 15:03:19 ******/
ALTER TABLE [dbo].[userroles] ADD UNIQUE NONCLUSTERED 
(
	[rolename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164D9A780D7]    Script Date: 08-03-2021 15:03:19 ******/
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
ALTER TABLE [dbo].[download] ADD  DEFAULT ((0)) FOR [ispaid]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((0)) FOR [isapproved]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((0)) FOR [isdownloaded]
GO
ALTER TABLE [dbo].[download] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[gender] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[noteattachment] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notedetails] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notetype] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT ((1)) FOR [isActive]
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
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD FOREIGN KEY([adminid])
REFERENCES [dbo].[users] ([id])
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
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([buyerid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([downloadid])
REFERENCES [dbo].[download] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([noteid])
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
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD FOREIGN KEY([usserid])
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
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_usrerole] FOREIGN KEY([roleid])
REFERENCES [dbo].[userroles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_usrerole]
GO
USE [master]
GO
ALTER DATABASE [notesmarketplace] SET  READ_WRITE 
GO
