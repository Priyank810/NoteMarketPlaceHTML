USE [master]
GO
/****** Object:  Database [notesmarketplace]    Script Date: 12-04-2021 11:58:31 ******/
CREATE DATABASE [notesmarketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'notesmarketplace', FILENAME = N'D:\Python\MSSQL14.MSSQLSERVER01\MSSQL\DATA\notesmarketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'notesmarketplace_log', FILENAME = N'D:\Python\MSSQL14.MSSQLSERVER01\MSSQL\DATA\notesmarketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [notesmarketplace] SET COMPATIBILITY_LEVEL = 140
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
EXEC sys.sp_db_vardecimal_storage_format N'notesmarketplace', N'ON'
GO
ALTER DATABASE [notesmarketplace] SET QUERY_STORE = OFF
GO
USE [notesmarketplace]
GO
/****** Object:  Table [dbo].[admindetails]    Script Date: 12-04-2021 11:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admindetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adminid] [int] NOT NULL,
	[secondaryemail] [varchar](200) NULL,
	[profilepicture] [varchar](max) NULL,
	[countrycodeid] [int] NULL,
	[mobilenumber] [varchar](100) NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__admindet__3213E83F3D778562] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 12-04-2021 11:58:31 ******/
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
 CONSTRAINT [PK__country__3213E83F3E9E8B91] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[download]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gender]    Script Date: 12-04-2021 11:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender1] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteattachment]    Script Date: 12-04-2021 11:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteattachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noteid] [int] NULL,
	[filename] [varchar](max) NOT NULL,
	[filepath] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__noteatta__3213E83F0873158A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notedetails]    Script Date: 12-04-2021 11:58:31 ******/
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
	[totalspam] [int] NULL,
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
 CONSTRAINT [PK__notedeta__3213E83FA4A1F511] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notetype]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spam]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statustype]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[systemconfig]    Script Date: 12-04-2021 11:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemconfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supportemail] [varchar](200) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[otheremail] [varchar](200) NOT NULL,
	[supportphonenumber] [varchar](200) NOT NULL,
	[facebookurl] [varchar](max) NULL,
	[twitterurl] [varchar](max) NULL,
	[linedinurl] [varchar](max) NULL,
	[defaultnotepicture] [varchar](max) NOT NULL,
	[defaultprofilepicture] [varchar](max) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK__systemco__3213E83F8A373B45] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 12-04-2021 11:58:31 ******/
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
	[university] [varchar](200) NULL,
	[college] [varchar](200) NULL,
	[countrycodeid] [int] NULL,
	[mobilenumber] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[createdby] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedby] [int] NULL,
	[isActive] [bit] NULL,
	[genderid] [int] NULL,
 CONSTRAINT [PK__userdeta__3213E83FF86290FE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userroles]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12-04-2021 11:58:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admindetails] ON 

INSERT [dbo].[admindetails] ([id], [adminid], [secondaryemail], [profilepicture], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (10, 13, NULL, NULL, 0, N'9106841954', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[admindetails] ([id], [adminid], [secondaryemail], [profilepicture], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (17, 11, NULL, N'~/Members/11/DP_10-04-2021 18-13-15.jpg', 0, N'9106841954', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[admindetails] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'Maths', N'Maths', CAST(N'2021-04-10T14:16:41.937' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Physics', N'Physics', CAST(N'2021-04-10T14:16:54.303' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Biology', N'Biology', CAST(N'2021-04-10T14:36:50.820' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'Computer', N'Computer', CAST(N'2021-04-10T14:37:20.357' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (7, N'Information And Network Security', N'Information And Network Security', CAST(N'2021-04-10T14:37:45.007' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, N'Computer Networks', N'Computer Networks', CAST(N'2021-04-10T14:38:04.550' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (9, N'Chemistry', N'Chemistry', CAST(N'2021-04-10T14:39:06.827' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (10, N'English', N'English', CAST(N'2021-04-10T14:39:23.400' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (11, N'Science And Technology', N'Science And Technology', CAST(N'2021-04-10T14:39:44.247' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[category] ([id], [categoryname], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (12, N'Social Science', N'Social Science', CAST(N'2021-04-10T14:40:06.293' AS DateTime), 13, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (1, N'Kinjal Doshi', N'kinjaldoshi1398@gmail.com', N'fghnbm', CAST(N'2021-04-06T20:55:55.120' AS DateTime), N'cience')
INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (2, N'Kinjal Doshi', N'kinjaldoshi1398@gmail.com', N'fghnbm', CAST(N'2021-04-06T20:55:52.863' AS DateTime), N'cience')
INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (3, N'Kinjal Doshi', N'kinjaldoshi1398@gmail.com', N'cdvf', CAST(N'2021-04-06T21:01:24.500' AS DateTime), N'cience')
INSERT [dbo].[contact] ([id], [fullname], [email], [comment], [createddate], [subject]) VALUES (4, N'Kinjal', N'kinjaldoshi1398@gmail.com', N'check', CAST(N'2021-04-07T22:00:38.640' AS DateTime), N'abc')
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (0, N'India', N'+91', CAST(N'2021-04-10T13:40:48.910' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'America', N'+92', CAST(N'2021-04-10T14:45:30.087' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'Russia', N'+93', CAST(N'2021-04-10T14:45:43.237' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'China', N'+94', CAST(N'2021-04-10T14:45:59.523' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[country] ([id], [countryname], [countrycode], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Japan', N'+95', CAST(N'2021-04-10T14:46:08.663' AS DateTime), 13, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[download] ON 

INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, 37, 14, 12, CAST(N'2021-04-10T15:32:25.090' AS DateTime), 1, 1, CAST(N'2021-04-10T15:32:25.090' AS DateTime), 1, NULL, N'Social Science', N'Social Science', 100, CAST(N'2021-04-10T15:32:25.090' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (10, 24, 12, 14, CAST(N'2021-04-10T15:40:15.600' AS DateTime), 1, 1, CAST(N'2021-04-10T15:40:15.600' AS DateTime), 1, CAST(N'2021-04-10T15:40:15.600' AS DateTime), N'NCERT Physics', N'Physics', 100, CAST(N'2021-04-10T15:40:15.600' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (11, 33, 12, 14, CAST(N'2021-04-10T15:41:27.130' AS DateTime), 1, 1, CAST(N'2021-04-10T15:41:54.677' AS DateTime), 1, CAST(N'2021-04-10T15:41:54.677' AS DateTime), N'Ansi C', N'Computer', 100, CAST(N'2021-04-10T15:41:27.130' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (12, 33, 12, 15, CAST(N'2021-04-10T16:23:10.957' AS DateTime), 1, 1, CAST(N'2021-04-10T16:24:15.540' AS DateTime), 1, CAST(N'2021-04-10T16:24:15.540' AS DateTime), N'Ansi C', N'Computer', 100, CAST(N'2021-04-10T16:23:10.957' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (13, 50, 16, 14, CAST(N'2021-04-10T17:34:05.657' AS DateTime), 1, 1, CAST(N'2021-04-10T17:34:05.657' AS DateTime), 1, CAST(N'2021-04-10T17:34:05.657' AS DateTime), N'Europe History', N'Social Science', 100, CAST(N'2021-04-10T17:34:05.657' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (14, 42, 15, 14, CAST(N'2021-04-10T17:34:15.653' AS DateTime), 1, 1, CAST(N'2021-04-10T17:35:22.747' AS DateTime), 1, CAST(N'2021-04-10T17:35:22.747' AS DateTime), N'DS and Algo', N'Computer', 100, CAST(N'2021-04-10T17:34:15.653' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (15, 47, 16, 14, CAST(N'2021-04-10T17:34:32.607' AS DateTime), 1, 1, CAST(N'2021-04-10T17:34:56.957' AS DateTime), 1, CAST(N'2021-04-10T17:34:56.957' AS DateTime), N'Physical Chemistry', N'Chemistry', 100, CAST(N'2021-04-10T17:34:32.607' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[download] OFF
GO
SET IDENTITY_INSERT [dbo].[gender] ON 

INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'male', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'female', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'other', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[gender] OFF
GO
SET IDENTITY_INSERT [dbo].[noteattachment] ON 

INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (18, 23, N'1Attachment23_10-04-2021 14-18-34.pdf;', N'~/Members/Attachments/12/23/', CAST(N'2021-04-10T14:18:34.860' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (19, 24, N'1Attachment24_10-04-2021 14-21-12.pdf;', N'~/Members/Attachments/12/24/', CAST(N'2021-04-10T14:21:12.820' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (20, 25, N'1Attachment25_10-04-2021 14-47-50.pdf;', N'~/Members/Attachments/12/25/', CAST(N'2021-04-10T14:47:50.753' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (23, 33, N'1Attachment33_10-04-2021 15-10-22.pdf;2Attachment33_10-04-2021 15-10-22.pdf;3Attachment33_10-04-2021 15-10-22.pdf;4Attachment33_10-04-2021 15-10-22.pdf;', N'~/Members/Attachments/12/33/', CAST(N'2021-04-10T15:10:22.717' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (24, 34, N'1Attachment34_10-04-2021 15-12-08.pdf;2Attachment34_10-04-2021 15-12-08.pdf;', N'~/Members/Attachments/12/34/', CAST(N'2021-04-10T15:12:08.133' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (25, 35, N'1Attachment35_10-04-2021 15-18-21.pdf;', N'~/Members/Attachments/14/35/', CAST(N'2021-04-10T15:18:21.663' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (26, 36, N'1Attachment36_10-04-2021 15-20-25.pdf;', N'~/Members/Attachments/14/36/', CAST(N'2021-04-10T15:20:25.997' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (27, 37, N'1Attachment37_10-04-2021 15-23-31.pdf;2Attachment37_10-04-2021 15-23-31.pdf;3Attachment37_10-04-2021 15-23-31.pdf;4Attachment37_10-04-2021 15-23-31.pdf;', N'~/Members/Attachments/14/37/', CAST(N'2021-04-10T15:23:31.470' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (28, 38, N'1Attachment38_10-04-2021 15-26-11.pdf;2Attachment38_10-04-2021 15-26-11.pdf;3Attachment38_10-04-2021 15-26-11.pdf;4Attachment38_10-04-2021 15-26-11.pdf;', N'~/Members/Attachments/14/38/', CAST(N'2021-04-10T15:26:11.967' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (29, 39, N'1Attachment39_10-04-2021 15-28-19.pdf;', N'~/Members/Attachments/14/39/', CAST(N'2021-04-10T15:28:19.830' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (30, 40, N'1Attachment40_10-04-2021 15-31-52.pdf;', N'~/Members/Attachments/12/40/', CAST(N'2021-04-10T15:31:52.700' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (31, 41, N'1Attachment41_10-04-2021 16-50-22.pdf;2Attachment41_10-04-2021 16-50-22.pdf;', N'~/Members/Attachments/15/41/', CAST(N'2021-04-10T16:50:22.743' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (32, 42, N'1Attachment42_10-04-2021 16-52-14.pdf;', N'~/Members/Attachments/15/42/', CAST(N'2021-04-10T16:52:14.123' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (33, 43, N'1Attachment43_10-04-2021 16-53-45.pdf;', N'~/Members/Attachments/15/43/', CAST(N'2021-04-10T16:53:45.193' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (34, 44, N'1Attachment44_10-04-2021 16-55-50.pdf;2Attachment44_10-04-2021 16-55-50.pdf;', N'~/Members/Attachments/15/44/', CAST(N'2021-04-10T16:55:50.420' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (35, 45, N'1Attachment45_10-04-2021 16-58-44.pdf;', N'~/Members/Attachments/15/45/', CAST(N'2021-04-10T16:58:44.510' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (36, 46, N'1Attachment46_10-04-2021 17-05-35.pdf;', N'~/Members/Attachments/16/46/', CAST(N'2021-04-10T17:05:35.603' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (37, 47, N'1Attachment47_10-04-2021 17-08-08.pdf;', N'~/Members/Attachments/16/47/', CAST(N'2021-04-10T17:08:08.027' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (38, 48, N'1Attachment48_10-04-2021 17-16-19.pdf;', N'~/Members/Attachments/16/48/', CAST(N'2021-04-10T17:16:19.283' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (39, 49, N'1Attachment49_10-04-2021 17-18-04.pdf;', N'~/Members/Attachments/16/49/', CAST(N'2021-04-10T17:18:04.200' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (40, 50, N'1Attachment50_10-04-2021 17-19-27.pdf;', N'~/Members/Attachments/16/50/', CAST(N'2021-04-10T17:19:27.327' AS DateTime), 16, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[noteattachment] OFF
GO
SET IDENTITY_INSERT [dbo].[notedetails] ON 

INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (23, 12, 2, 13, N'Not proper', CAST(N'2021-04-10T14:36:15.233' AS DateTime), N'NCERT Maths', NULL, 3, NULL, 4, 200, N'12th Maths', 0, N'CBSE', N'Maths', N'001', N'Prof M', 1, 300, N'~/Members/12/23/Preview_10-04-2021 14-18-34.pdf', CAST(N'2021-04-10T14:18:34.860' AS DateTime), 12, NULL, NULL, 0)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (24, 12, 2, 13, NULL, CAST(N'2021-04-10T14:36:17.630' AS DateTime), N'NCERT Physics', 0, 4, N'~/Members/12/24/DP_10-04-2021 14-21-12.jpg', 4, 200, N'12th Physics', 0, N'CBSE', N'Physics', N'002', N'Prof P', 0, 0, NULL, CAST(N'2021-04-10T14:21:12.820' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (25, 12, 1, NULL, NULL, NULL, N'NCERT Biology', NULL, 5, N'~/Members/12/25/DP_10-04-2021 14-47-50.jpg', 4, 200, N'12th Biology', 0, N'CBSE', N'Bilogoy', N'003', N'Prof B', 1, 200, N'~/Members/12/25/Preview_10-04-2021 14-47-50.pdf', CAST(N'2021-04-10T14:47:50.753' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (33, 12, 2, 11, NULL, CAST(N'2021-04-10T15:28:53.290' AS DateTime), N'Ansi C', NULL, 6, N'~/Members/12/33/DP_10-04-2021 15-10-22.jpg', 7, 200, N'C Language', 1, N'GTU', N'C Language', N'004', N'Prof C', 1, 200, N'~/Members/12/33/Preview_10-04-2021 15-10-22.pdf', CAST(N'2021-04-10T15:10:22.717' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (34, 12, 4, 11, N'Not Proper', NULL, N'INS', NULL, 7, N'~/Members/12/34/DP_10-04-2021 15-12-08.jpg', 5, 200, N'Information And Network Security Notes', 0, N'GTU', N'INS', N'005', N'Prof I', 0, 0, N'~/Members/12/34/Preview_10-04-2021 15-12-08.pdf', CAST(N'2021-04-10T15:12:08.133' AS DateTime), 12, CAST(N'2021-04-10T15:29:25.883' AS DateTime), NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (35, 14, 2, 11, NULL, CAST(N'2021-04-10T15:29:31.707' AS DateTime), N'Computer Network', NULL, 8, N'~/Members/14/35/DP_10-04-2021 15-18-21.jpg', 5, 200, N'Computer Network Assignment', 0, N'GTU', N'Computer Network', N'006', N'Prof CN', 1, 100, N'~/Members/14/35/Preview_10-04-2021 15-18-21.pdf', CAST(N'2021-04-10T15:18:21.663' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (36, 14, 2, 11, NULL, CAST(N'2021-04-10T15:29:42.337' AS DateTime), N'English', NULL, 10, N'~/Members/14/36/DP_10-04-2021 15-20-25.jpg', 4, 200, N'English', 1, N'Harvard', N'English Literarture', N'007', N'Prof E', 0, 0, N'~/Members/14/36/Preview_10-04-2021 15-20-25.pdf', CAST(N'2021-04-10T15:20:25.997' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (37, 14, 2, 11, NULL, CAST(N'2021-04-10T15:29:38.000' AS DateTime), N'Social Science', 0, 12, N'~/Members/14/37/DP_10-04-2021 15-23-31.jpg', 4, 200, N'Book on Culture and Heritage of India', 0, N'GU', N'Social Studies', N'007', N'Prof SS', 0, 0, N'~/Members/14/37/Preview_10-04-2021 15-23-31.pdf', CAST(N'2021-04-10T15:23:31.470' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (38, 14, 2, 11, NULL, CAST(N'2021-04-10T15:40:41.350' AS DateTime), N'Organic Chemistry', NULL, 9, N'~/Members/14/38/DP_10-04-2021 15-26-11.jpg', 8, 500, N'Notes of Organic chemistry', 3, N'Wuhan University', N'Organic Chemistry', N'008', N'Prof OC', 1, 100, N'~/Members/14/38/Preview_10-04-2021 15-26-11.pdf', CAST(N'2021-04-10T15:26:11.967' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (39, 14, 2, 11, NULL, CAST(N'2021-04-10T15:40:43.610' AS DateTime), N'Science', NULL, 11, N'~/Members/14/39/DP_10-04-2021 15-28-19.jpg', 4, 250, N'Basic Science', 0, N'GTU', N'Science And Technology', N'010', N'Prof S', 1, 50, N'~/Members/14/39/Preview_10-04-2021 15-28-19.pdf', CAST(N'2021-04-10T15:28:19.830' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (40, 12, 2, 11, NULL, CAST(N'2021-04-10T15:40:46.010' AS DateTime), N'INS', NULL, 7, NULL, 5, 200, N'Information And Network Security Notes', 0, N'GTU', N'INS', N'005', N'Prof I', 0, 0, NULL, CAST(N'2021-04-10T15:31:52.700' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (41, 15, 2, 11, NULL, CAST(N'2021-04-10T17:20:01.140' AS DateTime), N'C++', NULL, 6, NULL, 4, 200, N'C++ note', 0, N'GTU', N'C++', N'011', N'Prof C', 1, 100, N'~/Members/15/41/Preview_10-04-2021 16-50-22.pdf', CAST(N'2021-04-10T16:50:22.743' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (42, 15, 2, 11, NULL, CAST(N'2021-04-10T17:20:03.577' AS DateTime), N'DS and Algo', NULL, 6, N'~/Members/15/42/DP_10-04-2021 16-52-14.jpg', 4, 200, N'DS and algo', 0, N'GTU', N'DS And Algorithm', N'012', N'Prof A', 1, 200, N'~/Members/15/42/Preview_10-04-2021 16-52-14.pdf', CAST(N'2021-04-10T16:52:14.123' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (43, 15, 5, 11, NULL, CAST(N'2021-04-10T17:20:12.123' AS DateTime), N'Compiler Design', NULL, 6, NULL, 7, 150, N'Compiler Design', 0, N'GTU', N'CD', N'013', N'Prof CD', 1, 300, N'~/Members/15/43/Preview_10-04-2021 16-53-45.pdf', CAST(N'2021-04-10T16:53:45.193' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (44, 15, 6, NULL, NULL, NULL, N'Quantum Computing', NULL, 6, N'~/Members/15/44/DP_10-04-2021 16-55-50.jpg', 7, 1000, N'Book on quantum computing', 4, N'MIT', N'Quantum computing', N'014', N'Prof Q', 1, 300, N'~/Members/15/44/Preview_10-04-2021 16-55-50.pdf', CAST(N'2021-04-10T16:55:50.420' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (45, 15, 6, NULL, NULL, NULL, N'Parallel Universe', NULL, 4, N'~/Members/15/45/DP_10-04-2021 16-58-44.jpg', 7, 1000, N'Book on paralle universe', 1, N'Harvard', N'Parallel Universe', N'015', N'Prof PU', 1, 500, N'~/Members/15/45/Preview_10-04-2021 16-58-44.pdf', CAST(N'2021-04-10T16:58:44.510' AS DateTime), 15, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (46, 16, 2, 11, NULL, CAST(N'2021-04-10T17:20:06.520' AS DateTime), N'Maths 3', NULL, 3, N'~/Members/16/46/DP_10-04-2021 17-05-35.jpg', 4, 400, N'Book on maths 3', 0, N'GTU', N'Maths 3', N'016', N'Prof M', 1, 200, N'~/Members/16/46/Preview_10-04-2021 17-05-35.pdf', CAST(N'2021-04-10T17:05:35.603' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (47, 16, 2, 11, NULL, CAST(N'2021-04-10T17:20:09.450' AS DateTime), N'Physical Chemistry', NULL, 9, N'~/Members/16/47/DP_10-04-2021 17-08-08.jpg', 4, 200, N'Book on Physical Chemistry', 0, N'GTU', N'Chemistry', N'017', N'Prof C', 1, 200, N'~/Members/16/47/Preview_10-04-2021 17-08-08.pdf', CAST(N'2021-04-10T17:08:08.027' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (48, 16, 6, NULL, NULL, NULL, N'Quantumn Mechanics', NULL, 4, NULL, 4, 200, N'Book on quantumn mechanics', 0, N'GTU', N'Quantumn Mechanics', N'018', N'Prof QM', 1, 250, N'~/Members/16/48/Preview_10-04-2021 17-16-19.pdf', CAST(N'2021-04-10T17:16:19.283' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (49, 16, 6, NULL, NULL, NULL, N'American History', NULL, 12, N'~/Members/16/49/DP_10-04-2021 17-18-04.jpg', 4, 200, N'Book on American History', 1, N'Harvard', N'History', N'019', N'Prof AH', 0, 0, NULL, CAST(N'2021-04-10T17:18:04.200' AS DateTime), 16, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (50, 16, 2, 11, NULL, CAST(N'2021-04-10T17:20:15.193' AS DateTime), N'Europe History', 1, 12, N'~/Members/16/50/DP_10-04-2021 17-19-27.jpg', 4, 200, N'Book on European History', 0, N'Harvard', N'History', N'020', N'Prof EH', 0, 0, NULL, CAST(N'2021-04-10T17:19:27.327' AS DateTime), 16, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[notedetails] OFF
GO
SET IDENTITY_INSERT [dbo].[notetype] ON 

INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'Text Book', N'Text Book', CAST(N'2021-04-10T13:47:37.027' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'Assignments', N'Assignments', CAST(N'2021-04-10T13:48:06.350' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'Novel', N'Novel', CAST(N'2021-04-10T13:51:33.127' AS DateTime), 11, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (7, N'Reference Book', N'Reference Book', CAST(N'2021-04-10T14:40:28.097' AS DateTime), 13, NULL, NULL, 1)
INSERT [dbo].[notetype] ([id], [typename], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, N'Hand Written Notes', N'Hand Written Notes', CAST(N'2021-04-10T14:41:07.060' AS DateTime), 13, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[notetype] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, 33, 14, 11, 4, N'good', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, 33, 15, 12, 2, N'Ok ok', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, 42, 14, 14, 5, N'good', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (7, 24, 14, 10, 5, N'good', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, 50, 14, 13, 3, N'good', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (9, 47, 14, 15, 4, N'good', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[spam] ON 

INSERT [dbo].[spam] ([id], [noteid], [buyerid], [downloadid], [isspam], [remarks], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, 50, 14, 13, 1, N'not proper', CAST(N'2021-04-10T17:37:10.093' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[spam] OFF
GO
SET IDENTITY_INSERT [dbo].[statustype] ON 

INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'draft', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'published', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'removed', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, N'rejected', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, N'inreview', N'abc', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[statustype] ([id], [status], [description], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, N'submittedforreview', N'abc', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[statustype] OFF
GO
SET IDENTITY_INSERT [dbo].[systemconfig] ON 

INSERT [dbo].[systemconfig] ([id], [supportemail], [password], [otheremail], [supportphonenumber], [facebookurl], [twitterurl], [linedinurl], [defaultnotepicture], [defaultprofilepicture], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'priyanksd123@gmail.com', N'Patrick_98100', N'priyankd8181@gmail.com', N'9106841954', N'https://www.facebook.com/TatvaSoft/', N'https://twitter.com/tatvasoft?lang=en', N'https://in.linkedin.com/company/tatvasoft', N'~/Members/Default/DN_12-04-2021 11-44-53.jpg', N'~/Members/Default/DP_12-04-2021 11-44-53.jpg', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[systemconfig] OFF
GO
SET IDENTITY_INSERT [dbo].[userdetails] ON 

INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (3, 12, CAST(N'2021-04-09' AS Date), N'~/Members/12/DP_10-04-2021 13-43-56.jpg', N'Flat', N'Area', N'Bhavnagar', N'Gujarat', 0, N'364001', NULL, NULL, 0, N'9106841954', CAST(N'2021-04-10T13:43:56.590' AS DateTime), 12, NULL, NULL, 1, 1)
INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (4, 14, CAST(N'2021-04-11' AS Date), N'~/Members/14/DP_10-04-2021 15-16-28.jpg', N'Flat', N'Area', N'Bhavnagar', N'Gujarat', 0, N'364001', N'GTU', N'GEC', 0, N'9999999999', CAST(N'2021-04-10T15:16:28.287' AS DateTime), 14, NULL, NULL, 1, 1)
INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (5, 15, CAST(N'2021-04-16' AS Date), N'~/Members/15/DP_10-04-2021 16-22-49.jpg', N'34th Park Avenue', N'Wall Street', N'New York', N'New York', 1, N'1021020', N'NY University', N'NY College', 1, N'1234567890', CAST(N'2021-04-10T16:22:49.523' AS DateTime), 15, NULL, NULL, 1, 2)
INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (6, 16, CAST(N'0001-01-01' AS Date), N'~/Members/16/DP_10-04-2021 17-02-51.jpg', N'Safdarjung', N'New Delhi', N'New Delhi', N'New Delhi', 0, N'3030301', N'DU', N'DU College', 0, N'9988776655', CAST(N'2021-04-10T17:02:51.400' AS DateTime), 16, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[userdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[userroles] ON 

INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'superadmin', N'abc', CAST(N'2021-02-27T16:55:07.327' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'admin', N'abc', CAST(N'2021-02-27T16:55:41.360' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[userroles] ([id], [rolename], [roledescription], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'member', N'abc', CAST(N'2021-02-27T16:56:00.480' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[userroles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (11, N'Super', N'Admin', N'priyanksd123@gmail.com', N'kQptzd1g3QanoryoTcLPsOxV3T3sVcGcWOsshr2GqSs=', CAST(N'2021-04-10T13:22:00.710' AS DateTime), NULL, CAST(N'2021-04-10T18:13:15.747' AS DateTime), NULL, 1, 1, N'f4ea067c-6986-4f95-8798-ae56f612009d', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (12, N'Harvey', N'Specter', N'harveyspecter9898@gmail.com', N'NLz36fN6i6PGXSoe+fygt154PL/VYx4s/YkNKWbZ0M8=', CAST(N'2021-04-10T13:41:49.810' AS DateTime), NULL, NULL, NULL, 3, 1, N'2ce745f1-607a-426a-a950-259f9428ebb0', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (13, N'Admin', N'01', N'priyankd8181@gmail.com', N'6G94qKPK8LYNjnTllCqm2G3BUM08AzOK7yW30tfjrMc=', CAST(N'2021-04-10T14:26:25.390' AS DateTime), 11, NULL, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (14, N'Mike', N'Ross', N'priyankdoshi99@gmail.com', N'e6o5/JSNolR+cbhGHFADsYb4Rcp/Eg9DcI9igk4mbS0=', CAST(N'2021-04-10T15:13:31.840' AS DateTime), NULL, NULL, NULL, 3, 1, N'e4375f82-4dff-48e0-9625-78d2804aa873', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (15, N'Katrina', N'Bennet', N'patricknotes5@gmail.com', N'dj3TWJOXxJUjzYPyLyvyDySxkGXpOLimRPZpq6yhF+I=', CAST(N'2021-04-10T16:20:03.387' AS DateTime), NULL, NULL, NULL, 3, 1, N'c1ef7af5-531e-48a6-8e67-3d36be2463a7', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (16, N'Robert', N'Zane', N'patricknotes6@gmail.com', N'KnABuDMEXv1hDRR0FTygOnHqy39hSfsomt5OpRAJmow=', CAST(N'2021-04-10T17:00:44.420' AS DateTime), NULL, NULL, NULL, 3, 1, N'fde850ad-7e83-4d51-957a-f15a6f20780b', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__1A0D12CEBB97500E]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__50F7D42E8985C263]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [UQ__country__50F7D42E8985C263] UNIQUE NONCLUSTERED 
(
	[countryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__C704728345967900]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [UQ__country__C704728345967900] UNIQUE NONCLUSTERED 
(
	[countrycode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__notetype__A64470BDBCBB2021]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[notetype] ADD UNIQUE NONCLUSTERED 
(
	[typename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__statusty__A858923C42297FE2]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[statustype] ADD UNIQUE NONCLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userrole__4685A062B7518B58]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[userroles] ADD UNIQUE NONCLUSTERED 
(
	[rolename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164CDAAA1B4]    Script Date: 12-04-2021 11:58:31 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admindetails] ADD  CONSTRAINT [DF__admindeta__isAct__5BE2A6F2]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [DF__country__isActiv__5DCAEF64]  DEFAULT ((1)) FOR [isActive]
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
ALTER TABLE [dbo].[noteattachment] ADD  CONSTRAINT [DF__noteattac__isAct__6383C8BA]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notedetails] ADD  CONSTRAINT [DF__notedetai__isAct__534D60F1]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[notetype] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[spam] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[statustype] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[systemconfig] ADD  CONSTRAINT [DF__systemcon__isAct__693CA210]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[userdetails] ADD  CONSTRAINT [DF__userdetai__isAct__07C12930]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[userroles] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [isEmailVerified]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD  CONSTRAINT [FK__admindeta__admin__6E01572D] FOREIGN KEY([adminid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[admindetails] CHECK CONSTRAINT [FK__admindeta__admin__6E01572D]
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD  CONSTRAINT [FK__admindeta__count__6EF57B66] FOREIGN KEY([countrycodeid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[admindetails] CHECK CONSTRAINT [FK__admindeta__count__6EF57B66]
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD  CONSTRAINT [FK__admindeta__creat__6FE99F9F] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[admindetails] CHECK CONSTRAINT [FK__admindeta__creat__6FE99F9F]
GO
ALTER TABLE [dbo].[admindetails]  WITH CHECK ADD  CONSTRAINT [FK__admindeta__modif__70DDC3D8] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[admindetails] CHECK CONSTRAINT [FK__admindeta__modif__70DDC3D8]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[country]  WITH CHECK ADD  CONSTRAINT [FK__country__created__73BA3083] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[country] CHECK CONSTRAINT [FK__country__created__73BA3083]
GO
ALTER TABLE [dbo].[country]  WITH CHECK ADD  CONSTRAINT [FK__country__modifie__74AE54BC] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[country] CHECK CONSTRAINT [FK__country__modifie__74AE54BC]
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
ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [FK__download__noteid__71D1E811] FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[download] CHECK CONSTRAINT [FK__download__noteid__71D1E811]
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
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD  CONSTRAINT [FK__noteattac__creat__7C4F7684] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteattachment] CHECK CONSTRAINT [FK__noteattac__creat__7C4F7684]
GO
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD  CONSTRAINT [FK__noteattac__modif__7D439ABD] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteattachment] CHECK CONSTRAINT [FK__noteattac__modif__7D439ABD]
GO
ALTER TABLE [dbo].[noteattachment]  WITH CHECK ADD  CONSTRAINT [FK__noteattac__notei__5629CD9C] FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[noteattachment] CHECK CONSTRAINT [FK__noteattac__notei__5629CD9C]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__actio__4D94879B] FOREIGN KEY([actionby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__actio__4D94879B]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__categ__4E88ABD4] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__categ__4E88ABD4]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__count__5070F446] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__count__5070F446]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__creat__5165187F] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__creat__5165187F]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__modif__52593CB8] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__modif__52593CB8]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__statu__4CA06362] FOREIGN KEY([statusid])
REFERENCES [dbo].[statustype] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__statu__4CA06362]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__typei__4F7CD00D] FOREIGN KEY([typeid])
REFERENCES [dbo].[notetype] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__typei__4F7CD00D]
GO
ALTER TABLE [dbo].[notedetails]  WITH CHECK ADD  CONSTRAINT [FK__notedetai__useri__4BAC3F29] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notedetails] CHECK CONSTRAINT [FK__notedetai__useri__4BAC3F29]
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
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK__reviews__noteid__17F790F9] FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK__reviews__noteid__17F790F9]
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
ALTER TABLE [dbo].[spam]  WITH CHECK ADD  CONSTRAINT [FK__spam__noteid__1F98B2C1] FOREIGN KEY([noteid])
REFERENCES [dbo].[notedetails] ([id])
GO
ALTER TABLE [dbo].[spam] CHECK CONSTRAINT [FK__spam__noteid__1F98B2C1]
GO
ALTER TABLE [dbo].[statustype]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[statustype]  WITH CHECK ADD FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[systemconfig]  WITH CHECK ADD  CONSTRAINT [FK__systemcon__creat__14270015] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[systemconfig] CHECK CONSTRAINT [FK__systemcon__creat__14270015]
GO
ALTER TABLE [dbo].[systemconfig]  WITH CHECK ADD  CONSTRAINT [FK__systemcon__modif__151B244E] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[systemconfig] CHECK CONSTRAINT [FK__systemcon__modif__151B244E]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__count__03F0984C] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__count__03F0984C]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__count__04E4BC85] FOREIGN KEY([countrycodeid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__count__04E4BC85]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__creat__05D8E0BE] FOREIGN KEY([createdby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__creat__05D8E0BE]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__gende__0D7A0286] FOREIGN KEY([genderid])
REFERENCES [dbo].[gender] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__gende__0D7A0286]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__modif__06CD04F7] FOREIGN KEY([modifiedby])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__modif__06CD04F7]
GO
ALTER TABLE [dbo].[userdetails]  WITH CHECK ADD  CONSTRAINT [FK__userdetai__usser__02FC7413] FOREIGN KEY([usserid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userdetails] CHECK CONSTRAINT [FK__userdetai__usser__02FC7413]
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
