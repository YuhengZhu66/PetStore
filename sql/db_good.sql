USE [master]
GO
/****** Object:  Database [db_good]    Script Date: 2022/4/19 20:17:26 ******/
CREATE DATABASE [db_good]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_good', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_good.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_good_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_good_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_good] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_good].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_good] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_good] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_good] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_good] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_good] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_good] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_good] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_good] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_good] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_good] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_good] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_good] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_good] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_good] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_good] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_good] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_good] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_good] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_good] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_good] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_good] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_good] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_good] SET RECOVERY FULL 
GO
ALTER DATABASE [db_good] SET  MULTI_USER 
GO
ALTER DATABASE [db_good] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_good] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_good] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_good] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_good] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_good] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_good', N'ON'
GO
ALTER DATABASE [db_good] SET QUERY_STORE = OFF
GO
USE [db_good]
GO
/****** Object:  Table [dbo].[tb_subType]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_subType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[superType] [int] NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_subType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_superType]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_superType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_superType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Type]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Type] AS SELECT dbo.tb_superType.ID, dbo.tb_superType.TypeName AS superType, 
      dbo.tb_subType.TypeName AS subType, dbo.tb_subType.ID AS subID
FROM dbo.tb_superType INNER JOIN
      dbo.tb_subType ON dbo.tb_superType.ID = dbo.tb_subType.superType

GO
/****** Object:  Table [dbo].[dtproperties]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dtproperties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[objectid] [int] NULL,
	[property] [varchar](64) NOT NULL,
	[value] [varchar](255) NULL,
	[uvalue] [nvarchar](255) NULL,
	[lvalue] [image] NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [pk_dtproperties] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[property] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_good]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_good](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[goodName] [varchar](200) NOT NULL,
	[introduce] [text] NULL,
	[price] [money] NOT NULL,
	[nowPrice] [money] NULL,
	[picture] [varchar](100) NULL,
	[INTime] [datetime] NULL,
	[newGood] [int] NOT NULL,
	[sale] [int] NULL,
	[hit] [int] NULL,
 CONSTRAINT [PK_tb_goodinfo] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_manager]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[manager] [varchar](30) NOT NULL,
	[PWD] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tb_manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_member]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_member](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](20) NULL,
	[trueName] [varchar](20) NULL,
	[passWord] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[postcode] [varchar](6) NULL,
	[cardNO] [varchar](24) NULL,
	[cardType] [varchar](20) NULL,
	[grade] [int] NULL,
	[Amount] [money] NULL,
	[tel] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[freeze] [int] NULL,
 CONSTRAINT [PK_DB_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_order]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[gnumber] [smallint] NULL,
	[username] [varchar](15) NULL,
	[recevieName] [varchar](15) NULL,
	[address] [varchar](100) NULL,
	[tel] [varchar](20) NULL,
	[OrderDate] [smalldatetime] NULL,
	[bz] [varchar](200) NULL,
 CONSTRAINT [PK_tb_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[orderID] [bigint] NOT NULL,
	[goodID] [bigint] NOT NULL,
	[price] [money] NOT NULL,
	[number] [int] NOT NULL,
 CONSTRAINT [PK_tb_order_detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_good] ON 

INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (2, 29, N'Dog bed', N'Dog kennel for all seasons summer cool den removable and washable mat summer large dog bed pet Corgi supplies', 109.0000, 109.0000, N'60.jpg
', CAST(N'2016-07-20T09:58:52.940' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (3, 29, N'智能喂食器', N'智能喂食器，自动定时投喂机。食品级别的不锈钢材质，可拆卸电池。设计简洁，轻松拆卸。
', 399.0000, 399.0000, N'59.jpg
', CAST(N'2016-07-20T10:10:38.473' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (4, 29, N'按键宠物梳', N'去浮毛，清理长毛专用
', 12.5000, 12.5000, N'58.jpg
', CAST(N'2016-07-20T10:12:00.410' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (5, 33, N'素力高金装12磅无谷鸡肉猫粮', N'加拿大进口SolidGold 素力高金装无谷鸡肉猫粮。42%高蛋白满足营养需求。94%高蛋白吸收率，满足猫咪的生存需求的同时吃出健康体态。
', 425.0000, 425.0000, N'57.jpg
', CAST(N'2016-07-20T10:13:06.443' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (6, 33, N'猫生全价肌肉全猫粮（1.25kg）', N'良心国产，高达95%的肉蛋白占比、44%超高粗蛋白含量，适用1-12月龄幼年期猫及12月龄以上成年期猫
', 79.0000, 79.0000, N'56.jpg
', CAST(N'2016-07-20T10:14:24.060' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (7, 29, N'皇家狗粮贵宾泰迪专用粮', N'为贵宾与泰迪量身打造的精准营养狗粮，适宜的蛋白含量帮助维持肌肉含量，含钙螯合剂帮助减少牙结石的形成，小立方体的颗粒方便摄取，较大尺寸设计，促进咀嚼，减缓进食速度，并起到磨牙洁牙的效果
', 483.0000, 483.0000, N'55.jpg
', CAST(N'2016-07-20T10:18:19.390' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (8, 29, N'小型犬通用型全价犬粮', N'57%肉含量，特别添加10%鲜肉，美味适口性好，甄选鸡肉，低温烘焙，香而不腻，增强爱宠食欲，三角形颗粒，帮助狗狗洁齿磨牙，配比科学。双重检测，更放心。
', 39.9000, 39.9000, N'54.jpg
', CAST(N'2016-07-20T10:20:09.920' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (9, 29, N'鸭肉缠红薯条100g', N'由新鲜红薯及鸭肉制成，高蛋白，低脂肪，易吸收。磨牙洁齿，清洁口腔，加强巩固狗狗的牙齿，预防牙结石。全犬种通用，三月以上月龄使用。产品原料：鸭肉、红薯、食用甘油、微量食盐
', 14.9000, 14.9000, N'53.jpg
', CAST(N'2016-07-20T10:24:50.580' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (10, 29, N'全犬种通用消臭饼干', N'优选小麦粉，烘烤后软硬适中，口感酥脆。添加的牛乳粉，让狗狗爱不释口。茶多酚的添加，帮助狗狗降低口腔及排泄物异味。可爱的骨头造型，产品质地均匀且适口性好，颗粒饱满，香气四溢，每天来几粒，清新口气。小型犬4-6块。中型犬7-10块。大型犬11-16块。
', 24.8000, 24.8000, N'52.jpg
', CAST(N'2016-07-20T10:26:06.447' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (11, 31, N'鹌鹑冻干猫零食', N'鹌鹑冻干，动物界人参，高蛋白低脂肪。一份冻干等于五倍鲜肉，采用新鲜鹌鹑真空速冻，锁住原始口感0添加更营养，完整的骨肉保留，香酥口感，越嚼越带劲。磨牙洁齿还原猫咪天性
', 24.9000, 24.9000, N'51.jpg
', CAST(N'2016-07-20T10:27:22.057' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (12, 31, N'风干牛肋骨磨牙小零食', N'100%纯内蒙牛骨，低温风干，低脂高蛋白。＋根牛肋骨，大口啃咬快感，清脆益嚼，去除肩部，不伤口腔，大口啃咬超满足
', 24.9000, 24.9000, N'50.jpg
', CAST(N'2016-07-20T10:29:44.027' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (13, 29, N'山羊奶布丁', N'羊奶中的蛋白质、脂肪、矿物质等鹰扬成分含量相比其它动物奶更高，帮助补充营养，增强免疫力。Q弹的奶冻口感，适口性更佳，一天一颗保持身体机能的健康状态
', 57.0000, 57.0000, N'49.jpg
', CAST(N'2016-07-20T10:31:56.427' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (14, 29, N'L型猫抓板', N'大型L猫抓板，可“抓”可躺，轻松解决养宠烦恼，极简设计，随处摆放，细密蜂窝瓦楞纸制作，耐抓不掉屑
', 39.9000, 39.9000, N'48.jpg
', CAST(N'2016-07-20T10:34:32.230' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (15, 29, N'狗狗沐浴露', N'宠物专用沐浴露，温和亲肤、滋养毛发、驱螨洁净。全新升级的温和配方。具有保湿、保润的甘油，以及霍霍巴籽油的良好渗透滋养毛发的添加，更加深层的清洁，去除污垢。
', 49.9000, 49.9000, N'47.jpg
', CAST(N'2016-07-20T10:39:47.623' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (16, 29, N'豪华猫抓柱', N'纯实木猫抓住玩具，赶走猫咪的寂寞，实木材质底盘超稳，磨爪剑麻柱，耐抓不掉絮。实心木球加猫薄荷，猫咪爱不释手。
', 72.0000, 72.0000, N'46.jpg
', CAST(N'2016-07-20T10:40:43.303' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (17, 33, N'狗狗除臭尿垫', N'防漏除臭、加厚锁水、瞬间吸收的宠物狗狗训导尿垫。由原生木浆和强吸收分子构成的高效吸水层，让吸水的效率加倍提高。
', 39.9000, 39.9000, N'45.jpg
', CAST(N'2016-07-20T10:43:27.060' AS DateTime), 0, 0, 200)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (18, 33, N'日本佳乐滋除臭猫砂', N'采用日本优质膨润土作为原料加工而成，颗粒大小均匀、低扬尘，不刺激猫咪呼吸道，在尿液沉底之前迅速结团，不弄脏盆低，节省清扫时间，尤妮佳成熟的Matching计术，锁住液体、中和尿液中的气味，挑战密闭空间无异味。
', 48.0000, 48.0000, N'44.jpg
', CAST(N'2016-07-20T10:45:55.480' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (19, 31, N'宠物狗狗厕所', N'宠物狗狗厕所，自动边尿尿盆，大型小型犬防踩屎专用
', 25.9000, 25.9000, N'43.jpg
', CAST(N'2016-07-20T10:46:55.267' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (20, 31, N'狗狗牵引绳', N'轻松一套，解放双手，环形设计、一键制动、远程照明、充电设计。套手、手持两种遛狗方式，在自由与安全之间的安全保障
', 99.0000, 99.0000, N'42.jpg
', CAST(N'2016-07-20T10:47:48.310' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (21, 31, N'狗狗铃铛', N'柔软铃铛项圈，手工制作，颜色鲜艳，不伤毛发、柔软舒适适合活泼可爱的宠物，展现青春活力，散发宠物魅力
', 9.9000, 9.9000, N'41.jpg
', CAST(N'2016-07-20T10:49:29.557' AS DateTime), 0, 1, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (22, 31, N'猫咪自嗨神器', N'猫咪不倒翁，可玩可陋食，拒绝光吃不嗨小肥猫
', 21.8000, 21.8000, N'40.jpg
', CAST(N'2016-07-20T10:50:35.087' AS DateTime), 0, 1, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (23, 29, N'猫咪专用沐浴露', N'猫主子的专属呵护，含有椰子油以及季铵盐保湿剂，让猫咪毛发重现丰盈亮泽、柔顺润滑、富有弹性
', 49.9000, 49.9000, N'39.jpg
', CAST(N'2016-07-20T10:51:56.700' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (24, 29, N'猫猫们的窝', N'蛋挞窝，深度睡眠窝，蛋挞形状，整体舒服，85%填棉量更加贴合身体，蓬松透气，柔软回弹
', 29.9000, 29.9000, N'38.jpg
', CAST(N'2016-07-20T10:52:58.083' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (25, 31, N'猫咪薄荷球', N'勾起猫咪兴趣，欢享快乐时光，瞬间让猫咪兴奋的味道
', 10.0000, 10.0000, N'37.jpg
', CAST(N'2016-07-20T10:54:57.600' AS DateTime), 0, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (26, 31, N'ins风宠物窝', N'一窝多用，让猫咪更有安全感，双面内垫，单独清洗
', 69.9000, 69.9000, N'36.jpg
', CAST(N'2016-07-20T10:56:20.500' AS DateTime), 0, 1, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (27, 31, N'宠物强力吸水毛巾', N'柔软亲肤，快速吸干宠物毛发中的水分，半湿润状态的毛巾，柔软舒适的触感，轻轻按摩，不伤毛发。
', 19.8000, 19.8000, N'35.jpg
', CAST(N'2016-07-20T10:57:38.913' AS DateTime), 1, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (28, 31, N'毛线球', N'猫咪自嗨玩具，解闷逗猫神器毛线球！
', 13.4600, 13.4600, N'34.jpg
', CAST(N'2016-07-20T10:58:35.623' AS DateTime), 0, 1, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (29, 31, N'打地鼠猫玩具', N'开启宠物智能玩具时代，模拟猫咪热门游戏打地鼠，热感持续激活，羽毛多孔随机冒出，智能陪伴，随机变换，解放双手
', 99.0000, 99.0000, N'33.jpg
', CAST(N'2016-07-20T11:00:27.297' AS DateTime), 1, 0, 0)
INSERT [dbo].[tb_good] ([ID], [typeID], [goodName], [introduce], [price], [nowPrice], [picture], [INTime], [newGood], [sale], [hit]) VALUES (30, 31, N'zeal新西兰进口罐头', N'低敏高肉捕食者模型，符合爱宠生理天性，深海营养提供必需的天然营养，螯合矿物质，提高消化吸收率，新西兰天然水，平衡身体酸碱度', 29.0000, 29.0000, N'32.jpg', CAST(N'2016-07-20T11:01:39.343' AS DateTime), 0, 1, 0)
SET IDENTITY_INSERT [dbo].[tb_good] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_manager] ON 

INSERT [dbo].[tb_manager] ([ID], [manager], [PWD]) VALUES (1, N'mr', N'mrsoft')
INSERT [dbo].[tb_manager] ([ID], [manager], [PWD]) VALUES (2, N'admin', N'111')
SET IDENTITY_INSERT [dbo].[tb_manager] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_member] ON 

INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (2, N'blueStar', N'BLUE星梦', N'111111', N'长春市', N'长春市二道区', N'130031', N'2205666866XXXX', N'身份证', 0, 0.0000, N'136144XXXXX', N'bluestar@XXXXX.com', 1)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (3, N'wind', N'XX风', N'111111', N'长春市', N'长春市二道区', N'130031', N'22066698XXXXXX', N'身份证', 0, 0.0000, N'4972XXXXX', N'fqy777@XXXXX.com', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (36, N'lx', N'小欣', N'111', N'长春市', N'长春市二道区', N'130000', N'123123123123123', N'身份证', 3, 8880.0000, N'21311', N'lx@mrbccd.com', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (47, N'mrtest01', N'mr', N'mrdfdsdfsd', N'', N'', N'', N'', N'', 0, 0.0000, N'', N'', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (55, N'test', N'test', N'111', N'', N'', N'', N'', N'', 0, 0.0000, N'sdfs', N'', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (57, N'mr', N'', N'mrsoft', N'', N'', N'', N'', N'', 0, 0.0000, N'84978981', N'', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (58, N'xejaruzig', N'losyfub', N'Pa$$w0rd!', N'', N'', N'', N'', N'', 0, 0.0000, N'17726157979', N'dixugok@mailinator.com', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (59, N'zicilytu', N'hovoby', N'Pa$$w0rd!', N'', N'', N'', N'', N'', 0, 0.0000, N'15543243234', N'mohitugita@mailinator.com', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (60, N'gikiwa', N'zyvuwe', N'Pa$$w0rd!', N'', N'', N'', N'', N'', 0, 0.0000, N'17231231231', N'lurez@mailinator.com', 0)
INSERT [dbo].[tb_member] ([ID], [userName], [trueName], [passWord], [city], [address], [postcode], [cardNO], [cardType], [grade], [Amount], [tel], [email], [freeze]) VALUES (61, N'kk', N'1', N'111', N'', N'', N'', N'', N'', 0, 0.0000, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[tb_member] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_order] ON 

INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (40, 1, N'wgh', N'test', N'sdfs', N'123456', CAST(N'2016-07-19T16:22:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (41, 1, N'wgh', N'啊白', N'吉林长春', N'15143036781', CAST(N'2016-07-20T08:41:00' AS SmallDateTime), N'周六日无法收货')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (42, 1, N'111', N'dgd', N'dfg', N'dfgd', CAST(N'2016-07-20T09:21:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (45, 1, N'wgh', N'vxc', N'xc', N'135623', CAST(N'2016-07-25T09:33:00' AS SmallDateTime), N'xcv')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (46, 1, N'wind', N'明日', N'长春市', N'1322', CAST(N'2016-09-29T12:54:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (47, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-08T16:00:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (48, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-10T15:42:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (49, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-10T15:43:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (50, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-10T15:43:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (51, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-10T15:43:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (52, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-10T15:44:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (53, 1, N'mr', N'明日', N'长春市南关区', N'84978981', CAST(N'2016-10-11T08:59:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (54, 1, N'mr', N'明日', N'长春市', N'84978981', CAST(N'2016-10-11T12:53:00' AS SmallDateTime), N'')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (55, 1, N'mr', N'kevin', N'1', N'1', CAST(N'2022-04-16T14:57:00' AS SmallDateTime), N'111')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (56, 1, N'mr', N'kaiwen guan', N'1', N'1', CAST(N'2022-04-16T23:05:00' AS SmallDateTime), N'111')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (57, 1, N'mr', N'kaiwen guan', N'1', N'1', CAST(N'2022-04-16T23:11:00' AS SmallDateTime), N'111')
INSERT [dbo].[tb_order] ([OrderID], [gnumber], [username], [recevieName], [address], [tel], [OrderDate], [bz]) VALUES (58, 4, N'mr', N'1', N'1', N'1', CAST(N'2022-04-16T23:13:00' AS SmallDateTime), N'1')
SET IDENTITY_INSERT [dbo].[tb_order] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_order_detail] ON 

INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (63, 49, 17, 69.8000, 2)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (65, 51, 26, 128.0000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (66, 52, 27, 128.0000, 2)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (69, 55, 29, 99.0000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (70, 56, 27, 19.8000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (71, 57, 29, 99.0000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (72, 58, 27, 19.8000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (73, 58, 29, 99.0000, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (74, 58, 28, 13.4600, 1)
INSERT [dbo].[tb_order_detail] ([ID], [orderID], [goodID], [price], [number]) VALUES (75, 58, 30, 29.0000, 1)
SET IDENTITY_INSERT [dbo].[tb_order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_subType] ON 

INSERT [dbo].[tb_subType] ([ID], [superType], [TypeName]) VALUES (29, 14, N'洗护')
INSERT [dbo].[tb_subType] ([ID], [superType], [TypeName]) VALUES (31, 15, N'玩具')
INSERT [dbo].[tb_subType] ([ID], [superType], [TypeName]) VALUES (33, 16, N'护理')
SET IDENTITY_INSERT [dbo].[tb_subType] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_superType] ON 

INSERT [dbo].[tb_superType] ([ID], [TypeName]) VALUES (14, N'CAT类')
INSERT [dbo].[tb_superType] ([ID], [TypeName]) VALUES (15, N'玩具类')
INSERT [dbo].[tb_superType] ([ID], [TypeName]) VALUES (16, N'通用乳制品类')
INSERT [dbo].[tb_superType] ([ID], [TypeName]) VALUES (17, N'Dog类')
SET IDENTITY_INSERT [dbo].[tb_superType] OFF
GO
ALTER TABLE [dbo].[dtproperties] ADD  DEFAULT ((0)) FOR [version]
GO
ALTER TABLE [dbo].[tb_good] ADD  DEFAULT (getdate()) FOR [INTime]
GO
ALTER TABLE [dbo].[tb_good] ADD  DEFAULT ((0)) FOR [newGood]
GO
ALTER TABLE [dbo].[tb_good] ADD  DEFAULT ((0)) FOR [sale]
GO
ALTER TABLE [dbo].[tb_good] ADD  DEFAULT ((0)) FOR [hit]
GO
ALTER TABLE [dbo].[tb_member] ADD  DEFAULT ((0)) FOR [grade]
GO
ALTER TABLE [dbo].[tb_member] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[tb_member] ADD  DEFAULT ((0)) FOR [freeze]
GO
ALTER TABLE [dbo].[tb_order] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_goods] FOREIGN KEY([goodID])
REFERENCES [dbo].[tb_good] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_goods]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tb_order] ([OrderID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_Order]
GO
ALTER TABLE [dbo].[tb_subType]  WITH CHECK ADD  CONSTRAINT [FK_tb_subType_tb_superType] FOREIGN KEY([superType])
REFERENCES [dbo].[tb_superType] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tb_subType] CHECK CONSTRAINT [FK_tb_subType_tb_superType]
GO
/****** Object:  StoredProcedure [dbo].[dt_addtosourcecontrol]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol]
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId = 0

declare @iStreamObjectId int
select @iStreamObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()

declare @iReturnValue int
select @iReturnValue = 0

declare @iPropertyObjectId int
declare @vchParentId varchar(255)

declare @iObjectCount int
select @iObjectCount = 0

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError


    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment


    if @iReturn <> 0 GOTO E_OAError

    /* Set Database Properties */

    begin tran SetProperties

    /* add high level object */

    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'

    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)

    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL

    if @@error <> 0 GOTO E_General_Error

    commit tran SetProperties
    
    select @iObjectCount = 0;

CleanUp:
    select @vchProjectName
    select @iObjectCount
    return

E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_addtosourcecontrol_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol_u]
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword

GO
/****** Object:  StoredProcedure [dbo].[dt_adduserobject]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_adduserobject]
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity

GO
/****** Object:  StoredProcedure [dbo].[dt_adduserobject_vcs]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_adduserobject_vcs]
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn

GO
/****** Object:  StoredProcedure [dbo].[dt_checkinobject]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_checkinobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_checkinobject_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_checkinobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3

GO
/****** Object:  StoredProcedure [dbo].[dt_checkoutobject]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_checkoutobject_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag

GO
/****** Object:  StoredProcedure [dbo].[dt_displayoaerror]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror]
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return

GO
/****** Object:  StoredProcedure [dbo].[dt_displayoaerror_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror_u]
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult

GO
/****** Object:  StoredProcedure [dbo].[dt_droppropertiesbyid]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_droppropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property

GO
/****** Object:  StoredProcedure [dbo].[dt_dropuserobjectbyid]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_dropuserobjectbyid]
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id

GO
/****** Object:  StoredProcedure [dbo].[dt_generateansiname]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_generateansiname](@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave

GO
/****** Object:  StoredProcedure [dbo].[dt_getobjwithprop]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop]
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value

GO
/****** Object:  StoredProcedure [dbo].[dt_getobjwithprop_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop_u]
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue

GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property

GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_u]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property

GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs]
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )

GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs_u]
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output

GO
/****** Object:  StoredProcedure [dbo].[dt_isundersourcecontrol]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol]
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_isundersourcecontrol_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol_u]
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo

GO
/****** Object:  StoredProcedure [dbo].[dt_removefromsourcecontrol]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_removefromsourcecontrol]

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0

GO
/****** Object:  StoredProcedure [dbo].[dt_setpropertybyid]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid]
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end

GO
/****** Object:  StoredProcedure [dbo].[dt_setpropertybyid_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid_u]
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end

GO
/****** Object:  StoredProcedure [dbo].[dt_validateloginparams]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams]
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_validateloginparams_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams_u]
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword

GO
/****** Object:  StoredProcedure [dbo].[dt_vcsenabled]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_vcsenabled]

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */

GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp006]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_verstamp006]
as
	select 7000

GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp007]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_verstamp007]
as
	select 7005

GO
/****** Object:  StoredProcedure [dbo].[dt_whocheckedout]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout]
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp

GO
/****** Object:  StoredProcedure [dbo].[dt_whocheckedout_u]    Script Date: 2022/4/19 20:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout_u]
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'typeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'goodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'introduce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'nowPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'picture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'INTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否新品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'newGood'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否特价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'sale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_good', @level2type=N'COLUMN',@level2name=N'hit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品种数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_order', @level2type=N'COLUMN',@level2name=N'gnumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'与tb_Order表的OrderID字段关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_order_detail', @level2type=N'COLUMN',@level2name=N'orderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_subType', @level2type=N'COLUMN',@level2name=N'superType'
GO
USE [master]
GO
ALTER DATABASE [db_good] SET  READ_WRITE 
GO
