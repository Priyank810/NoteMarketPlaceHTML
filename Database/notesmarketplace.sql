USE [master]
GO
/****** Object:  Database [notesmarketplace]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[admindetails]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[category]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[contact]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[country]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[download]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[gender]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[noteattachment]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[notedetails]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[notetype]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[reviews]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[spam]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[statustype]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[systemconfig]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[userdetails]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[userroles]    Script Date: 14-04-2021 13:08:14 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 14-04-2021 13:08:14 ******/
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
INSERT [dbo].[admindetails] ([id], [adminid], [secondaryemail], [profilepicture], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (17, 11, NULL, N'~/Members/11/DP_13-04-2021 16-24-31.jpg', 0, N'9106841954', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[admindetails] ([id], [adminid], [secondaryemail], [profilepicture], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (18, 17, NULL, NULL, 0, N'9999999999', NULL, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, 5, 12, 14, CAST(N'2021-04-14T12:54:48.947' AS DateTime), 1, 1, CAST(N'2021-04-14T12:54:48.947' AS DateTime), 1, CAST(N'2021-04-14T12:54:48.947' AS DateTime), N'ansi c', N'Computer', 0, CAST(N'2021-04-14T12:54:48.950' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, 4, 12, 14, CAST(N'2021-04-14T12:54:54.477' AS DateTime), 1, 1, CAST(N'2021-04-14T12:55:41.883' AS DateTime), 1, CAST(N'2021-04-14T12:55:41.883' AS DateTime), N'.net', N'Computer', 200, CAST(N'2021-04-14T12:54:54.477' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[download] ([id], [noteid], [sellerid], [buyerid], [requesteddate], [ispaid], [isapproved], [approveddate], [isdownloaded], [downloadedate], [title], [category], [purchaseprice], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, 7, 12, 14, CAST(N'2021-04-14T12:55:15.500' AS DateTime), 1, 1, CAST(N'2021-04-14T12:55:47.500' AS DateTime), 1, CAST(N'2021-04-14T12:55:47.500' AS DateTime), N'c#', N'Computer', 100, CAST(N'2021-04-14T12:55:15.500' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[download] OFF
GO
SET IDENTITY_INSERT [dbo].[gender] ON 

INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'male', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, N'female', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[gender] ([id], [gender1], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, N'other', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[gender] OFF
GO
SET IDENTITY_INSERT [dbo].[noteattachment] ON 

INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, 4, N'1Attachment4_14-04-2021 12-14-52.pdf;2Attachment4_14-04-2021 12-14-52.pdf;', N'~/Members/Attachments/12/4/', CAST(N'2021-04-14T12:13:53.110' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, 5, N'1Attachment5_14-04-2021 12-36-38.pdf;2Attachment5_14-04-2021 12-36-38.pdf;', N'~/Members/Attachments/12/5/', CAST(N'2021-04-14T12:36:38.417' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, 6, N'1Attachment6_14-04-2021 12-41-04.pdf;2Attachment6_14-04-2021 12-41-04.pdf;', N'~/Members/Attachments/12/6/', CAST(N'2021-04-14T12:41:04.920' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, 7, N'1Attachment7_14-04-2021 12-42-53.pdf;2Attachment7_14-04-2021 12-42-53.pdf;', N'~/Members/Attachments/12/7/', CAST(N'2021-04-14T12:42:53.003' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (7, 8, N'1Attachment8_14-04-2021 12-44-32.pdf;2Attachment8_14-04-2021 12-44-32.pdf;', N'~/Members/Attachments/14/8/', CAST(N'2021-04-14T12:44:32.023' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, 9, N'1Attachment9_14-04-2021 12-45-55.pdf;2Attachment9_14-04-2021 12-45-55.pdf;', N'~/Members/Attachments/14/9/', CAST(N'2021-04-14T12:45:55.870' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (9, 10, N'1Attachment10_14-04-2021 12-47-49.pdf;2Attachment10_14-04-2021 12-47-49.pdf;', N'~/Members/Attachments/14/10/', CAST(N'2021-04-14T12:47:49.753' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (10, 11, N'1Attachment11_14-04-2021 12-49-31.pdf;2Attachment11_14-04-2021 12-49-31.pdf;', N'~/Members/Attachments/14/11/', CAST(N'2021-04-14T12:49:31.270' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[noteattachment] ([id], [noteid], [filename], [filepath], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (11, 12, N'1Attachment12_14-04-2021 12-53-25.pdf;2Attachment12_14-04-2021 12-53-25.pdf;', N'~/Members/Attachments/12/12/', CAST(N'2021-04-14T12:53:25.327' AS DateTime), 12, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[noteattachment] OFF
GO
SET IDENTITY_INSERT [dbo].[notedetails] ON 

INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (4, 12, 2, 11, NULL, CAST(N'2021-04-14T12:50:41.817' AS DateTime), N'.net', NULL, 6, N'~/Members/12/4/DP_14-04-2021 12-13-53.jpg', 7, 200, N'.net concepts', 0, N'GEC', N'.net', N'001', N'Prof A', 1, 200, N'~/Members/12/4/Preview_14-04-2021 12-41-30.pdf', CAST(N'2021-04-14T12:13:53.110' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (5, 12, 2, 11, NULL, CAST(N'2021-04-14T12:50:44.437' AS DateTime), N'ansi c', NULL, 6, N'~/Members/12/5/DP_14-04-2021 12-36-38.jpg', 4, 300, N'basics of c language', 0, N'GEC', N'c language', N'002', N'Prof B', 0, 0, NULL, CAST(N'2021-04-14T12:36:38.417' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (6, 12, 4, 11, N'Add Proper Notes', CAST(N'2021-04-14T12:50:47.733' AS DateTime), N'Java', NULL, 6, NULL, 7, 500, N'Java Concepts', 0, N'GEC', N'Java', N'003', N'Prof J', 0, 0, N'~/Members/12/6/Preview_14-04-2021 12-41-04.pdf', CAST(N'2021-04-14T12:41:04.920' AS DateTime), 12, CAST(N'2021-04-14T12:51:12.780' AS DateTime), NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (7, 12, 2, 11, NULL, CAST(N'2021-04-14T12:50:50.837' AS DateTime), N'c#', NULL, 6, N'~/Members/12/7/DP_14-04-2021 12-42-53.jpg', 4, 200, N'c# concepts', 0, N'GEC', N'C#', N'004', N'Prof C', 1, 100, N'~/Members/12/7/Preview_14-04-2021 12-42-53.pdf', CAST(N'2021-04-14T12:42:53.003' AS DateTime), 12, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (8, 14, 2, 11, NULL, CAST(N'2021-04-14T12:51:48.870' AS DateTime), N'Maths 3', NULL, 3, NULL, 4, 500, N'Maths 3', 0, N'GEC', N'Maths 3', N'005', N'Prof M', 0, 0, NULL, CAST(N'2021-04-14T12:44:32.023' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (9, 14, 2, 11, NULL, CAST(N'2021-04-14T12:50:53.967' AS DateTime), N'Maths 2', NULL, 3, N'~/Members/14/9/DP_14-04-2021 12-45-55.jpg', 4, 800, N'Maths 2', 0, N'GEC', N'Maths 2', N'006', N'Prof M2', 1, 250, N'~/Members/14/9/Preview_14-04-2021 12-45-55.pdf', CAST(N'2021-04-14T12:45:55.870' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (10, 14, 2, 11, NULL, CAST(N'2021-04-14T12:51:34.467' AS DateTime), N'Quantumn Computing', NULL, 6, N'~/Members/14/10/DP_14-04-2021 12-47-49.jpg', 7, 1000, N'Concepts of Quantumn Computing', 0, N'GEC', N'Quantumn Computing', N'007', N'Prof Q', 1, 500, N'~/Members/14/10/Preview_14-04-2021 12-47-49.pdf', CAST(N'2021-04-14T12:47:49.753' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (11, 14, 2, 11, NULL, CAST(N'2021-04-14T12:49:57.147' AS DateTime), N'Quantumn Physics', NULL, 4, N'~/Members/14/11/DP_14-04-2021 12-49-31.jpg', 7, 500, N'Book on Quantumn Physics', 0, N'GEC', N'Quantumn Physics', N'008', N'Prof QP', 0, 0, NULL, CAST(N'2021-04-14T12:49:31.270' AS DateTime), 14, NULL, NULL, 1)
INSERT [dbo].[notedetails] ([id], [userid], [statusid], [actionby], [remarks], [approveddate], [title], [totalspam], [categoryid], [displaypicture], [typeid], [numberofpages], [description], [countryid], [universityname], [coursename], [coursecode], [professor], [ispaid], [sellprice], [notepreviewfile], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (12, 12, 2, 11, NULL, CAST(N'2021-04-14T12:53:50.027' AS DateTime), N'Physics', NULL, 4, N'~/Members/12/12/DP_14-04-2021 12-53-25.jpg', 4, 200, N'Book on Physics', 0, N'GEC', N'Physics', N'009', N'Prof P', 0, 0, NULL, CAST(N'2021-04-14T12:53:25.327' AS DateTime), 12, NULL, NULL, 1)
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

INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (2, 5, 14, 2, 4, N'good', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [noteid], [buyerid], [downloadid], [ratingstar], [comments], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (3, 7, 14, 4, 4, N'good', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[reviews] OFF
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

INSERT [dbo].[systemconfig] ([id], [supportemail], [password], [otheremail], [supportphonenumber], [facebookurl], [twitterurl], [linedinurl], [defaultnotepicture], [defaultprofilepicture], [createddate], [createdby], [modifieddate], [modifiedby], [isActive]) VALUES (1, N'priyanksd123@gmail.com', N'Priyank_9999', N'priyankd8181@gmail.com', N'9106841954', N'https://www.facebook.com/TatvaSoft/', N'https://twitter.com/tatvasoft?lang=en', N'https://in.linkedin.com/company/tatvasoft', N'~/Members/Default/DN_14-04-2021 12-39-05.jpg', N'~/Members/Default/DP_14-04-2021 12-39-05.jpg', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[systemconfig] OFF
GO
SET IDENTITY_INSERT [dbo].[userdetails] ON 

INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (3, 12, CAST(N'2021-04-09' AS Date), N'~/Members/12/DP_10-04-2021 13-43-56.jpg', N'Flat', N'Area', N'Bhavnagar', N'Gujarat', 0, N'364001', NULL, NULL, 0, N'9106841954', CAST(N'2021-04-10T13:43:56.590' AS DateTime), 12, NULL, NULL, 1, 1)
INSERT [dbo].[userdetails] ([id], [usserid], [dob], [profilepicture], [addressline1], [addressline2], [city], [state], [countryid], [zipcode], [university], [college], [countrycodeid], [mobilenumber], [createddate], [createdby], [modifieddate], [modifiedby], [isActive], [genderid]) VALUES (4, 14, CAST(N'2021-04-11' AS Date), NULL, N'Flat', N'Area', N'Bhavnagar', N'Gujarat', 1, N'364001', N'GTU', N'GEC', 0, N'9999999999', CAST(N'2021-04-13T16:47:07.533' AS DateTime), 14, NULL, NULL, 1, 1)
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

INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (11, N'Super', N'Admin', N'priyanksd123@gmail.com', N'kQptzd1g3QanoryoTcLPsOxV3T3sVcGcWOsshr2GqSs=', CAST(N'2021-04-10T13:22:00.710' AS DateTime), NULL, CAST(N'2021-04-13T16:24:31.383' AS DateTime), NULL, 1, 1, N'f4ea067c-6986-4f95-8798-ae56f612009d', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (12, N'Harvey', N'Specter', N'harveyspecter9898@gmail.com', N'NLz36fN6i6PGXSoe+fygt154PL/VYx4s/YkNKWbZ0M8=', CAST(N'2021-04-10T13:41:49.810' AS DateTime), NULL, NULL, NULL, 3, 1, N'2ce745f1-607a-426a-a950-259f9428ebb0', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (13, N'Admin', N'01', N'priyankd8181@gmail.com', N'6G94qKPK8LYNjnTllCqm2G3BUM08AzOK7yW30tfjrMc=', CAST(N'2021-04-10T14:26:25.390' AS DateTime), 11, NULL, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (14, N'Mike', N'Ross', N'priyankdoshi99@gmail.com', N'e6o5/JSNolR+cbhGHFADsYb4Rcp/Eg9DcI9igk4mbS0=', CAST(N'2021-04-10T15:13:31.840' AS DateTime), NULL, NULL, NULL, 3, 1, N'e4375f82-4dff-48e0-9625-78d2804aa873', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (15, N'Katrina', N'Bennet', N'patricknotes5@gmail.com', N'dj3TWJOXxJUjzYPyLyvyDySxkGXpOLimRPZpq6yhF+I=', CAST(N'2021-04-10T16:20:03.387' AS DateTime), NULL, NULL, NULL, 3, 1, N'c1ef7af5-531e-48a6-8e67-3d36be2463a7', 0)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (16, N'Robert', N'Zane', N'patricknotes6@gmail.com', N'KnABuDMEXv1hDRR0FTygOnHqy39hSfsomt5OpRAJmow=', CAST(N'2021-04-10T17:00:44.420' AS DateTime), NULL, NULL, NULL, 3, 1, N'fde850ad-7e83-4d51-957a-f15a6f20780b', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [password], [createddate], [createdby], [modifieddate], [modifiedby], [roleid], [isEmailVerified], [activationcode], [isActive]) VALUES (17, N'admin2', N'admin', N'doshipriyanks@gmail.com', N'A3Kr2qcOjT/T7hTi4qEotwdW0nBZS71sp3oDEIB+kx4=', CAST(N'2021-04-13T16:16:27.007' AS DateTime), 11, NULL, NULL, 2, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__1A0D12CEBB97500E]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__50F7D42E8985C263]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [UQ__country__50F7D42E8985C263] UNIQUE NONCLUSTERED 
(
	[countryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__C704728345967900]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [UQ__country__C704728345967900] UNIQUE NONCLUSTERED 
(
	[countrycode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__notetype__A64470BDBCBB2021]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[notetype] ADD UNIQUE NONCLUSTERED 
(
	[typename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__statusty__A858923C42297FE2]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[statustype] ADD UNIQUE NONCLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userrole__4685A062B7518B58]    Script Date: 14-04-2021 13:08:14 ******/
ALTER TABLE [dbo].[userroles] ADD UNIQUE NONCLUSTERED 
(
	[rolename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164CDAAA1B4]    Script Date: 14-04-2021 13:08:14 ******/
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
