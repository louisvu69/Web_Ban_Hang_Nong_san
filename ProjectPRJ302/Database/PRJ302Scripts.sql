USE [master]
GO
/****** Object:  Database [QLNS]    Script Date: 3/24/2023 3:02:42 PM ******/
CREATE DATABASE [QLNS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\QLNS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\QLNS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNS] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNS] SET  MULTI_USER 
GO
ALTER DATABASE [QLNS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNS', N'ON'
GO
ALTER DATABASE [QLNS] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLNS]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[boardnew]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boardnew](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
	[isadmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catalog]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordered]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [nvarchar](20) NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[discount] [int] NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[created] [date] NULL,
	[idadmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_session] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail] [nvarchar](50) NOT NULL,
	[user_phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[message] [nvarchar](4000) NOT NULL,
	[amount] [nvarchar](20) NOT NULL,
	[payment] [nvarchar](30) NOT NULL,
	[status] [nvarchar](30) NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/24/2023 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (2, N'admin', N'123456', N'Linh23')
INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (3, N'admin2', N'123456', N'Linh1')
INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (4, N'admin3', N'123456789', N'123456789')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[boardnew] ON 

INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created], [isadmin]) VALUES (1, N'Thực phẩm sạch tăng mạnh sau dịch Covid-19', N'Trong giai đoạn dịch Covid-19 bùng phát, ý thức về việc nâng cao sức khỏe của người dân ngày càng cao, thực phẩm sạch, an toàn đã được kiểm chứng đang là lựa chọn hàng đầu được nhiều gia đình hướng đến. Trước tình trạng thực phẩm kém chất lượng, hàng giả tràn lan trên thị trường, người tiêu dùng đang dần khắt khe hơn trong sự lựa chọn của mình. Trong vài năm trở lại đây, xu hướng thực phẩm an toàn, có nguồn gốc tự nhiên, thân thiện với môi trường trở nên phổ biến và trở thành một xu hướng mới trong ngành thực phẩm tại Việt Nam. Các cơ sở kinh doanh, chuỗi cửa hàng thực phẩm an toàn ngày càng nhiều với đủ mọi mặt hàng để phục vụ nhu cầu của người tiêu dùng.Báo cáo xu hướng tiêu dùng thực phẩm hữu cơ của AC Nielsen cho thấy có đến 86% người tiêu dùng Việt Nam ưu tiên lựa chọn sản phẩm organic cho những bữa ăn hàng ngày bởi tính an toàn, giàu dinh dưỡng và hương vị thơm ngon. Các chuyên gia cũng cho rằng, khi thu nhập của người dân tăng lên, nhu cầu về đời sống cao hơn, tỷ lệ dân số trẻ cao và tầng lớp trung lưu phát triển, người tiêu dùng sẽ dần trở thành những người tiêu dùng thông minh và hướng đến một lối sống xanh và lành mạnh thông qua việc sử dụng các thực phẩm có nguồn gốc hữu cơ và nguyên liệu sạch. Kinh doanh thực phẩm sạch đã 3 năm nay, cơ sở rau Khánh Thành cho biết nhiều khi “cung không đủ cầu”, bởi nhu cầu của khách hàng rất cao mà nguồn thực phẩm chất lượng lại có hạn. Thực phẩm ở cửa hàng của của chị đều có xuất xứ rõ ràng, từ các vùng trên khắp cả nước và có cả thực phẩm nhập khẩu, chủ yếu là các mặt hàng như thịt, rau củ quả, hải sản… Theo co sở, tuy giá của các loại thực phẩm hữu cơ, có nguồn gốc tự nhiên có giá thành cao hơn những thực phẩm thông thường nhưng khách hàng vẫn sẵn sàng chi trả để đảm bảo sức khỏe cho gia đình.Để khách hàng tin tưởng, cơ sở rau Khánh Thành đều công khai nguồn gốc xuất xứ, đồng thời dán tem QR code để có thể truy xuất nguồn gốc thực phẩm cùng những thông tin cơ bản. Mỗi ngày cửa hàng của chị nhận được hàng chục đơn hàng, lúc cao điểm có thể lên tới hàng trăm đơn. Tất cả các thực phẩm được sản xuất tại công ty luôn đảm bảo tiêu chuẩn VietGAP dựa trên 4 tiêu chí (Tiêu chuẩn về kỹ thuật sản xuất, An toàn thực phẩm, Môi trường làm việc, Truy tìm nguồn gốc sản phẩm) để tới tay người tiêu dùng. Dọc quanh các con phố, không khó để bắt gặp hình ảnh các cửa hàng thực phẩm hữu cơ, hoa quả sạch. Không chỉ đẩy mạnh việc bán hàng trực tiếp, các cửa hàng này còn phát triển các kênh bán hàng online, quảng bá về sản phẩm.', N'blog_1.jpg', N'Tuan', CAST(N'2023-03-05' AS Date), NULL)
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created], [isadmin]) VALUES (2, N'Phát hiện loại rau củ chứa chất chữa được bệnh nan y', N'Rau củ "siêu giàu" vitamin A đã giúp các nhà khoa học tạo ra thuốc chữa. <br><br>Điều đáng ngạc nhiên là chất cơ bản để họ tạo nên "thần dược" này lại là axit retinoic, một chất rất dễ tìm kiếm trong tự nhiên. Axit retinoic là hóa chất được tạo ra trong quá trình cơ thể chúng ta phân hủy vitamin A "siêu nạp" – được tìm thấy trong các loại rau củ được biết đến rất giàu vitamin A như cà rốt hay các loại rau mầm như cải brussel.<br><br>Theo các tác giả, axit retinoic là một hóa chất cực kỳ tốt cho hệ thần kinh. Khi được ứng dụng vào thuốc, nó có thể đem lại tác động mạnh mẽ hơn nhiều so với cách ăn trực tiếp và sẽ có tác dụng chữa bệnh. <br><br>Giáo sư Peter McCaffery, đến từ Đại học Aberdeen, thành viên nhóm nghiên cứu mô tả thuốc như một phiên bản khuyếch đại những gì mà quá trình phân hủy vitamin A đã tạo ra cho cơ thể. <br><br>Với cách ăn trực tiếp, các loại rau củ giàu vitamin A chỉ dừng lại ở mức tăng cường sức khỏe mắt, hệ thần kinh, ngăn ngừa các nguy cơ bệnh tật, hỗ trợ điều trị… chưa thể tác động mạnh mẽ như một loại thuốc thực sự. <br><br>Axit retinoic kích thích khả năng tái tạo các dây thần kinh và tế bào não, vì vậy ngoài Alzheimer, họ còn định ứng dụng hóa chất kỳ diệu này làm thuốc chữa bệnh Parkinson và một số bệnh thần kinh vận động khác.<br><br>Dự án có giá trị lên đến 250.000 bảng Anh và đã được thực hiện suốt 2 năm qua. Nhóm nghiên cứu cho biết hóa chất họ tạo nên đang trong giai đoạn kiểm tra lần cuối. Sẽ cần thêm một số thủ tục để nó được ứng dụng ra thị trường. Chi tiết nghiên cứu sẽ được công bố trên tạp chí khoa học trong năm tới.', N'blog_2.jpg', N'Linh', CAST(N'2023-03-05' AS Date), NULL)
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created], [isadmin]) VALUES (3, N'Phù phép rau chợ đầu mối thành rau sạch tuồn vào trường học', N'Rau mua ngoài chợ, sau đó được sơ chế và phù phép thành các loại rau an toàn, rồi chuyển đến các trường tiểu học và mầm non trên địa bàn quận Tây Hồ (Hà Nội) <br><br>Thông tin từ Phòng cảnh sát phòng chống tội phạm về môi trường (PC49 - Công an Hà Nội), 2h30 sáng 14/1, tại chợ đầu mối rau Vân Nội (Đông Anh, Hà Nội), các nhân viên của Cty Rau củ quả Trung Thành (địa chỉ: Xóm Đầm, Vân Nội, huyện Đông Anh) đi thu mua rau tại chợ. Chỉ trong vòng 30 phút, họ đã thu gom được hàng trăm kg rau, củ quả. <br><br>3h30 sáng, ngay tại sân của Cty này, số hàng trên đã được sơ chế và phù phép thành các loại rau an toàn, sau đó được chất lên những chiếc xe máy chuyển đến các trường tiểu học và mầm non trên địa bàn quận Tây Hồ.<br><br>Sau quá trình trinh sát và thu thập chứng cứ, 6h30 cùng ngày, tổ công tác gồm Đội 4, PC49 và Thanh tra Sở NN-PTNT Hà Nội kiểm tra, phát hiện nhân viên của Cty CP Rau củ quả Trung Thành là Trần Văn Đỗ đang vận chuyển gần 2 tạ rau, củ, quả cho 2 trường mầm non trên địa bàn quận Tây Hồ là trường Mầm non Nhật Tân và trường mầm non Tứ Liên.<br><br>Tại thời điểm kiểm tra, chủ hàng không xuất trình được bất kỳ giấy tờ nào chứng minh nguồn gốc của sản phẩm. Điều đáng nói là hợp đồng ký kết giữa Cty Trung Thành và nhà trường cam kết với hàng ngàn phụ huynh học sinh của trường này cung cấp rau và thực phẩm an toàn có nguồn gốc xuất xứ.<br><br>Tuy nhiên, theo khẳng định của PC49, số thực phẩm này không thể đảm bảo để nhà trường chế biến thành các suất ăn. Đáng chú ý, nguồn cung cấp rau của Cty Trung Thành trước đây là HTX rau Đạo Đức, đã bị cơ quan công an phát hiện hành vi trà trộn rau bẩn vào rau an toàn hồi tháng 6 vừa qua.', N'blog_3.jpg', N'Vu', CAST(N'2023-03-04' AS Date), NULL)
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created], [isadmin]) VALUES (4, N'Việt Nam đứng thứ 6 thế giới về xuất khẩu mật ong', N'Theo Cục Chăn nuôi, các nhà nuôi ong và đàn ong nằm rải rác khắp cả nước, nhưng tập trung chủ yếu ở miền núi và trung du (trên 442.000 đàn), Tây Nguyên (trên 361.000 đàn), đây là những vùng sinh thái được đánh giá có tiềm năng để trở thành vùng SX mật ong tập trung. Thấp nhất là ĐBSCL (trên 35.000 đàn).<br><br>So với năm 2017 thì số lượng đàn ong năm 2018 tăng 6,7%; khu vực tăng cao nhất là vùng ĐBSH (14,34%), tăng thấp nhất là Tây Nguyên (2,95%), đặc biệt là vùng ĐBSCL số lượng đàn ong giảm 18,53%.<br><br>Nghề nuôi ong mật không những mang lại hiệu quả kinh tế cao, mà còn là nghề góp phần bảo vệ môi trường sinh thái, đem lại lợi ích cho cây trồng. Việc phát triển cây trồng cũng là tăng cường nguồn thức ăn tự nhiên cho đàn ong mật. Nghề nuôi ong đã chuyển dần từ hình thức chăn nuôi tự phát, nhỏ lẻ sang hình thức đầu tư nuôi ong tập trung với số lượng lớn. Hình thành các mô hình câu lạc bộ, HTX hoạt động có hiệu quả và nhanh chóng nhân rộng.<br><br>Một số tỉnh như Hà Giang, Sơn La đã xây dựng được thương hiệu, được Cục Sở hữu trí tuệ (Bộ Khoa học và Công nghệ) cấp giấy chứng nhận đăng ký chỉ dẫn địa lý cho sản phẩm mật ong bạc hà Mèo Vạc, cấp giấy chứng nhận đăng ký nhãn hiệu tập thể mật ong Sơn La…<br><br>Chất lượng sản phẩm tạo ra từ nuôi ong mật như mật ong, sữa ong chúa, sáp ong, keo ong, phấn hoa… được nâng lên, được người tiêu dùng trong và ngoài nước quan tâm, ưa chuộng.<br><br>Tại Hòa Bình, hiện có khoảng 60.000 đàn ong, với sản lượng mật đạt 600 tấn/năm. Chăn nuôi ong hiện nay trên địa bàn tỉnh đã thực sự là 1 nghề khai thác tốt tiềm năng, lợi thế góp phần xóa đói giảm nghèo.<br><br>Ong được nuôi để lấy mật trên địa bàn tỉnh chủ yếu là 2 loại giống: Ong ngoại và ong nội. Trong đó, ong nội chiếm chủ yếu. Năng suất ong nội đạt bình quân 12kg mật/đàn/năm, ong ngoại đạt trên 25kg mật/đàn/năm.<br><br>', N'blog_4.png', N'Linh', CAST(N'2023-03-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[boardnew] OFF
GO
SET IDENTITY_INSERT [dbo].[catalog] ON 

INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (1, N'Rau củ quả', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (2, N'Các Loại Hạt', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (3, N'Trái Cây', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (4, N'Mật Ong & Tinh Dầu', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (5, N'Sản Phẩm Mới', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (7, N'Sản Phẩm Giảm Giá', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (9, N'Giá giảm', 1)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (10, N'Giá Tăng', 1)
SET IDENTITY_INSERT [dbo].[catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[ordered] ON 

INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (6, 8, 4, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (7, 41, 6, 3)
SET IDENTITY_INSERT [dbo].[ordered] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (1, 1, N'Rau Cải', N'15.000', 1, N'Đây là rau sạch', N'Rau cải là loại rau không mấy xa lạ với người Việt ta. Bởi nó được dùng để chế biến thành các món ăn rất ngon và hợp khẩu vị. Nhưng nó ít được biết đến là vị thuốc chữa được rất nhiều loại bệnh. Ngoài cái tên cải bó xôi, nó còn có nhiều tên khác như: rau chân vịt, rau bắp xôi, rau nhà chùa, cải bina… Đây là loài cây thuộc họ nhà Dền và có xuất xứ từ miền Trung và Tây Nam Á.', 0, N'rau_cai.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (2, 1, N'Rau Muống', N'14.000', 1, N'Đây là rau sạch', N'Rau muống là loại rau có giá rất rẻ so với các loại rau khác nhưng lại đem lại lượng khoáng chất và vitamin dồi dào như protein, sắt, canxin, chất xơ, vitamin A... Những chất này là những dưỡng chất cần thiết cho cơ thể.', 10, N'rau_muong.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (3, 7, N'Đậu Nhật', N'50.000', 1, N'Đậu Nhật', N'Ðậu nành Nhật hay còn gọi là Đậu nành rau hay Đậu nành lông có nguồn gốc từ Nhật Bản, rất ngon và có giá trị dinh dưỡng cao, là loại thực phẩm rất tốt cho sức khỏe và bổ dưỡng vì hàm lượng của nó giàu chất khoáng, vitamin, protein, chất béo, chất xơ, rất tốt cho đường ruột, làm mịn da mặt và còn có tác dụng ngăn ngừa một số bệnh về ung thư', 0, N'dau_nhat.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (4, 1, N'Hành baro', N'45.000', 1, N'Hành Baro', N'Hành Baro có tên gọi khác là tỏi tây. Đây là một trong những nguyên liệu không thể thiếu trong rất nhiều món ăn, tạo mùi vị hấp dẫn, khó quên. Không những thế, tỏi tây còn là nguồn dinh dưỡng dồi dào đối với cơ thể. Để có thêm nhiều kiến thức về Hành Baro đừng bỏ lỡ bài viết này nhé.', 10, N'hanh_baro.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (5, 1, N'Rau Cần Tây', N'55.000', 1, N'Rau Cần Tây', N'Rau cần tây là một trong những loại rau được đánh giá là “ siêu thực phẩm” chứa hàm lượng dinh dưỡng cao, và ăn cực kỳ ngon nhất là khi kết hợp mùi thơm đặc biệt của cần tây xào với thịt bò…Ngoài sử dụng ở dạng tươi sống khi chế biến món ăn thì bạn cũng có thể làm nước ép cần tây tác dụng giảm cân, thanh nhiệt giải độc cơ thể rất tốt.', 10, N'rau_can_tay.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (6, 1, N'Rau mùi - Ngò', N'120.000', 1, N'Rau mùi - Ngò', N'Rau mùi hay còn được gọi bằng các tên gọi khác như: rau ngò, ngò rí, mùi ta, ngổ, mùi tui, nguyên tuy, hồ tuy, hương tuy, ngổ thơm,....Rau mùi là một loại cây thân thảo, loại rau này có nguồn gốc từ các nước Tây Nam Á và Châu Phi. ', 10, N'rau_mui.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (7, 1, N'Xà lách Mỹ - Cuộn Xanh', N'80.000', 1, N'Xà lách', N'Xà lách Mỹ có nguồn gốc từ vùng nhiệt đới và đến ngày nay nó đã  trở thành cây của toàn thế giới. Ở nước ta, Rau xà lách ưa khí hậu mát, đặc biệt là khí hậu ở Đà Lạt ', 10, N'xa_lach.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (8, 1, N'Súp Lơ Tím', N'100.000', 1, N'Súp Lơ', N'Súp lơ tím có tên gọi khác là bông cải tím. Đây là một trong những loại rau trồng được các bà nội trợ ưa chuộng với giá trị dinh dưỡng cao. Đó cũng là lý do giá súp lơ tím cao hơn so với các loại rau thông thường.', 10, N'sup_lo.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (9, 2, N'Hạt Sen', N'75.000', 1, N'Hạt Sen', N'Hạt sen sấy là một loại hạt dinh dưỡng, mang lại rất nhiều lợi ích đối với sức khỏe người sử dụng. Từ xưa, cây sen đã là một loài cây trồng quen thuộc và là biểu tượng của người dân Việt Nam. Hạt sen sấy là sản phẩm của hạt sen tươi khi đã chín được người nông dân thu về và chế biến, bảo quản. Hạt sen sấy giòn (hạt sen sấy khô) sẽ bảo quản được thời gian lâu hơn so với hạt sen tươi. Hạt sen sấy có rất nhiều công dụng khác nhau. Ngoài sử dụng như một vị thuốc không thể thiếu trong Đông Y, sen sấy khô còn là nguyên liệu để chế biến rất nhiều món ăn thơm ngon, bổ dưỡng chẳng hạn như: chè hạt sen long nhãn, chè hạt sen nấm tuyết, cháo hạt sen, hạt sen sấy giòn…', 5, N'hat_sen.jpg', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (10, 2, N'Hạt Ươi', N'45.000', 1, N'Hạt Ươi', N'Hạt Ươi (Sterculia lychonophora Hnce) còn có tên gọi khác là hạt ươi bay, hạt đười ươi, an nam tứ, đại đồng quả, pang da hai,...Đây là một trong những loại hạt được pha làm nước uống bổ dưỡng vào mùa hè, xua tan đi cái nóng và mệt mỏi. Vòng tuần hoàn ra quả của cây ươi đó là 4 năm một lần. Cây ươi sinh trường, phát triển ở trong rừng thường có mặt ở các nước thuộc khu vực Đông Nam Á như: Thái Lan, Việt Nam, Lào hay Malaysia. Tại Việt Nam, cây ươi mọc ở Tây Nguyên và vùng Trung Trung Bộ. Hạt ươi rừng sau khi thu hoạch sẽ được sàng lọc thêm một lần nữa để chọn ra những hạt chất lượng nhất. Sau đó sơ chế để bán lẻ và xuất khẩu đi một số nước. ', 0, N'hat_uoi.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (11, 2, N'Hạt Phỉ', N'250.000', 1, N'Hạt Phỉ', N'Hạt phỉ còn có tên gọi khác là Hazelnut, tên thực vật của nó là Corylus avellana. Hạt phỉ được trồng nhiều ở nhiều quốc gia như: Hy Lạp, Georgia, Thổ Nhĩ Kì, Italia, Anh, phía nam Tây Ban Nha và 2 bang Oregon  và Washington  của Mỹ. Thổ Nhĩ Kì là nơi cung cấp nguồn hạt phỉ lớn nhất trên thế giới, chiếm tới 75% sản lượng toàn thế giới. Hạt phỉ ngon, nhiều chất dinh dưỡng rất tốt cho sức khỏe. Không chỉ thế, mùi vị của hạt phỉ thơm ngon, bùi béo nên nó thường được dùng để nấu ăn, trong các món bánh.', 20, N'hat_phi.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (12, 2, N'Quả Hạch', N'300.000', 1, N'Quả Hạch', N'Quả hạch khô còn có tên gọi khác là hạt bào ngư, hạt móng ngựa, hình dáng của quả hạch bên ngoài xù xì, có lớp vỏ cứng màu nâu sẫm. Quả hạch có phần nhân bên trong màu trắng, nhận được bao bọc 1 lớp màn mỏng nâu. Phần nhân béo gùi, ăn rất thơm. Quả hạch được chọn to đèu, không bị dập nát, bị thối, sau đó mang đi sấy khô với công nghệ hiện đại. Quả hạch sẽ được tách lớp vỏ cứng bên ngoài rồi  mới đóng gói trong các bao bì an toàn, hợp vệ sinh. Hạt quả hạch đóng gói tiện lợi, dễ sử dụng, bạn chỉ cần bảo quản ở nơi thoáng mát, khô ráo và dùng mỗi ngày, không nhất thiết phải để trong tủ lạnh.', 0, N'hach_kho.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (13, 2, N'Ô Mai Khô ', N'200.000', 1, N'Ô Mai', N'Ô Mai còn có tên gọi khác là mơ đen, từ xưa ô mai là tên một vị thuốc làm từ quả mơ phơi khô cho đên khi đen và quắt lại. Trong y học cổ truyền, ô mai là vị thuộc rất phổ biến ở các nước châu á như Việt Nam, Trung Quốc. Ngày nay thì ô mai thường được dùng như một loại đồ ăn vặt được làm từ các loại quả khác nhau như: mận, me, sấu mơ, sử dụng ăn vặt nhiều hơn là làm thuốc. Những loại quả để làm mở cần phải được chọn lựa kỹ càng và chế biến với nhiều hương liệu, nguyên liệu khác nhau thì mới làm ra được món ô mai ngon nhất.', 20, N'o_mai.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (14, 2, N'Sa Nhân', N'450.000', 1, N'Sa Nhân', N'Sa Nhân còn có tên gọi khác trong tiếng Tày là mác nẻng, trong tiếng là co nénh, sa nhân là loại cây mọc hoang rất nhiều ở các vùng rừng núi, dưới tán cây sa nhân râm mát. Bọ phận thường dùng làm thuốc của sa nhân là hạt quả. Quả thường được hát vào mùa hè, bóc vỏ rồi lấy hạt ở phía trong, sây khô sử dụng dần.', 20, N'sa_nhan.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (15, 2, N'Thảo Quả', N'125.000', 1, N'Thảo Quả', N'Tên tiếng Việt khác: Thảo quả đỏ / Thảo quả đen Tên danh pháp hai phần: Amomum tsao-ko Thuộc họ: Gừng(Zingiberaceae) Hoa thảo quả thường nở vào mùa hè ( khoảng từ tháng 5 đến tháng 7) và ra quả vào mùa đông Ở Việt Nam, thảo quả mọc chủ yếu ở vùng Tây Bắc và dãy núi Hoàng Liên Sơn, nó mọc nhiều nhất ở các tỉnh Lào Cai, Yên Bái, Hà Giang, Lai Châu Thảo quả là một loại cây thảo mộc có vị cay nóng, mùi thơm đặc trưng, chúng thường được sử dụng trong ẩm thực và làm thuốc chữa bệnh. Nó còn được mệnh danh là “nữ hoàng gia vị” trong chế biến các món ăn ngon và nổi tiếng của Việt Nam.', 0, N'thao_qua.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (16, 2, N'Hạt Điều', N'150.000', 1, N'Hạt Điều', N'Điều hay còn gọi là đào lộn hột, là một cây công nghiệp thuộc họ xoài. Nó được trồng ở khí hậu nhiệt đới để lấy nhân hạt chế biến làm thực phẩm.Hạt điều ăn rất giòn và có hương thơm đặc trưng. Thường mọi người hay tìm mua hạt điều rang muối. Đây là đặc sản của Việt Nam nên thị trường hạt điều xuất khẩu luôn dẫn đầu cao.', 10, N'hat_dieu.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (17, 3, N'Xoài Tượng Bình Định', N'35.000', 1, N'Xoài Tượng Bình Định ', N'Ở Bình Định nổi tiếng với nhiều loại xoài như: Xoài tượng, xoài thanh ca, xoài mật, xoài tro, xoài xẻ...vv. Mỗi loại xoài đều có những hương vị độc đáo riêng. Trong đó ngon nhất và ấn tượng nhất thì phải kể đến xoài tượng. Ngoài vị thơm, ngọt thì xoài tượng có cho giá trị kinh tế cao nhất và được thị trường rất ưa chuộng. Xoài Tượng được trồng ở rất nhiều nơi nhưng nhắc đến xoài tượng là người ta nghĩ ngay đến Đại An (Bình Định) vì nơi đây trồng xoài tượng nhiều nhất và ngon nhất hiện nay.', 10, N'xoai_tuong.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (18, 3, N'Vú Sữa Lò Rèn', N'50.000', 1, N'Vũ Sữa Lò Rèn', N'Vú sữa Lò rèn Vĩnh Kim là một loại trái cây ngon mọi người dân Nam Bộ và quốc gia đều biết đến và hiện nay được trồng ở quy mô công nghiệp, nhưng giống vú sữa Lò rèn Vĩnh Kim gắn với vùng đất đặc biệt này vẫn được người dân gìn giữ, đặc biệt cây vú sữa Lò rèn Vĩnh Kim được trồng từ hạt của cây vú sữa đầu tiên. Thịt quả có màu trắng đục, mềm, nước dạng sữa, dày thịt, tỷ lệ thịt quả cao, ít hạt, có mùi vị rất ngọt, béo, mùi thơm dịu đặc trưng. ngon. Vú sữa lò rèn vĩnh kim có vị ngọt, được ăn tươi hoặc làm lạnh. Đây là loại quả được người Việt Nam ưa chuộng và sử dụng từ hàng trăm năm trước.', 0, N'vu_sua.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (19, 3, N'Hồng Xiêm', N'25.000', 1, N'Hồng Xiêm', N'Quả Hồng Xiêm là tên gọi ở miền Bắc, bà con miền Nam gọi là trái sapoche, đây là loại quả quí, lành tính dùng được cho người khỏe mạnh và cả người ốm. Để chất lượng quả thơm, ngọt lúc chín như ý cần lấy được quả già và biết cách dấm vừa độ chín.', 10, N'hong_xiem.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (20, 3, N'Nhãn Lồng Hưng Yên ', N'40.000', 1, N'Nhãn Lồng Hưng Yên', N'Nhãn có tên khoa học là Dimocarpus longan, tiếng hán việt gọi là “long nhãn”. Đây là một loại trái cây điển hình của vùng nhiệt đới thuộc thân gỗ, sống lâu năm. Theo tổng hợp từ các địa phương, hiện nay Hưng Yên là nơi có diện tích trồng lớn nhất và cho chất lượng nhãn ngon nhất, hiện nay Hưng Yên có gần 4 nghìn ha nhãn, trong đó, diện tích cho thu hoạch khoảng 3 nghìn ha.', 15, N'nhan_long.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (21, 3, N'Quả Thanh Mai', N'90.000', 1, N'Quả Thanh Mai', N'Quả thanh mai có cân bằng axit - đường tốt và là nguồn cung cấp thiamine, riboflavin, carotene, khoáng chất, chất xơ và hàm lượng vitamin rất cao. Chúng cũng là một nguồn tốt cung cấp chất chống oxy hóa tương tự (ví dụ anthocyanin) có màu đỏ rượu vang lợi ích sức khỏe. Ngoài anthocyanin, bayberry còn chứa flavonol, ellagitannin và các hợp chất phenolic như axit gallic, quercetin hexoside,...', 0, N'thanh_mai.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (22, 3, N'Cam Sành', N'25.000', 1, N'Cam Sành', N'Cam sành là một giống cây ăn quả thuộc chi Cam chanh phân bố rộng khắp Việt Nam từ Tuyên Quang, Hà Giang, Yên Bái tới Vĩnh Long, Tiền Giang, Cần Thơ. Nhưng nhìn chung cam sành thích hợp với vùng đất phù sa cổ màu mỡ,khí hậu mát ẩm. Cam sành vietgap đang là tiêu chuẩn trồng và chăm sóc chính của bà con nơi đây', 5, N'cam_sanh.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (23, 3, N'Na Lạng Sơn ', N'30.000', 1, N'Na Lạng Sơn', N'Na, hay còn gọi là mãng cầu ta, mãng cầu dai/giai, sa lê, phan lệ chi, là một loài thuộc chi Na (Annona) có nguồn gốc ở vùng châu Mỹ nhiệt đới. Quả na là một trong những trái cây nhiệt đới ngon nhất có nguồn gốc từ các thung lũng Andean của Peru và Ecuador. Ngày nay, loại quả vừa ngon vừa tốt cho sức khỏe này đã được trồng phổ biến ở khắp thể giới.', 5, N'na.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (24, 3, N'Thanh Long', N'35.000', 1, N'Thanh Long', N'Thanh long ruột trắng thuộc chi Hylocereus tên khoa học là Hylocereus undatus. Vỏ quả có màu hồng hoặc đỏ. Người ta gọi là thanh long ruột trắng vì ở Phan Thiết- Bình Thuận có còn một loại thanh long nữa là thanh long ruột đỏ', 5, N'thanh_long.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (25, 4, N'Tinh Dầu Nghệ', N'50.000', 1, N'Tinh Dầu Nghệ', N'Là một sản phẩm được chiết xuất từ củ nghệ, sản xuất bằng phương pháp chưng cất hơi nước, tinh dầu nghệ có dạng nước, màu vàng và mùi nghệ, hăng cay đặc trưng. Trong tinh dầu nghệ có chứa hơn 300 hợp chất phenol, trong đó nổi bật là hoạt chất Curcumin bao gồm các phân tử có khả năng tăng cường lượng oxy cung cấp cho não. Ngoài ra, tinh dầu nghệ cũng chứa các chất kháng khuẩn, chống nấm, kháng virut, chống giun, chống dị ứng và chống ký sinh trùng đem đến những công dụng tuyệt vời cho người dùng không chỉ về sức khỏe mà còn trong việc làm đẹp của chị em phụ nữ.', 10, N'tinh_dau_nghe.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (26, 4, N'Tinh Dầu Hoa Hồng', N'50.000', 1, N'Tinh Dầu Hoa Hồng', N'Tinh dầu hoa hồng là sản phẩm được chiết xuất từ cánh hoa hồng bằng phương pháp trưng cất hơi nước. Với mùi hương quyến rũ cùng nhiều dưỡng chất đặc biệt, tinh dầu hoa hồng được coi là nguồn cảm hứng bất tận của các nhà nghiên cứu và luôn có một chỗ đứng vững chắc trong nền công nghiệp mỹ phẩm. Không chỉ vậy, trong tinh dầu hoa hồng còn chứa rất nhiều những dưỡng chất có lợi cho sức khỏe như:  Ethanol, Stearpoten, Citronellyl Acetate, Eugenol, Nonanol, Nonanal, Citronellol, Citral, Carvone, Nerol, Phenyl Acetaldehyd, Farnesol, Phenylmenthyl Acetate, Methyl Eugenol…', 5, N'tinh_dau_hoa_hong.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (27, 4, N'Tinh Dầu Dừa', N'50.000', 1, N'Tinh Dầu Dừa', N'Đây là thành phẩm được làm, chiết xuất từ lượng dưỡng chất có trong quả dừa già. Không giống như những sản phẩm dầu dừa ép nóng bằng phương pháp thủ công thông thường, dầu dừa ép lạnh được sản xuất trên dây truyền sản xuất hiện đại nhờ công nghệ sấy lạnh, tách thành nhiều khâu khác nhau, đòi hỏi sự tỉ mỉ và kiên nhẫn. Dầu dừa ép lạnh luôn đảm bảo giữ được những thành phần dưỡng chất tốt, quan trọng, cần thiết nhất, đem lại hiệu quả cao cho người sử dụng. Bên cạnh đó, dầu dừa ép lạnh 100% tinh chất, không chứa nước hay bất kỳ tạp chất giúp bạn có thể bảo quản và sử dụng trong thời gian dài hơn so với các sản phẩm được làm từ phương pháp truyền thống.', 5, N'tinh_dau_dua.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (28, 4, N'Tinh Dầu Gừng', N'50.000', 1, N'Tinh Dầu Gừng', N'Tinh dầu gừng là thành phẩm được làm từ củ gừng, do vậy nó chứa các thành phần dưỡng chất có trong củ gừng và các đặc tính có lợi chẳng hạn như: nhuận tràng, khử trùng, cung cấp các loại vitamin,...Tinh dầu gừng được sử dụng trong việc bảo vệ duy trì tốt sức khỏe như: trị viêm họng, buồn nôn, đạu bụng, điều trị một số bệnh ảnh hưởng đến đường hô hấp, rong kinh, rối loạn kinh nguyệt,...Không những thế, tinh dầu gừng được sử dụng như một loại nước hoa để tạo mùi thơm, khiến chúng ta tự tin hơn.', 5, N'tinh_dau_gung.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (29, 4, N'Mật Ong Rừng', N'100.000', 1, N'Mật ong rừng', N'Mật ong rừng ở Hà Giang không hề có sự tác động của con người và hoàn toàn tự nhiên, mật ong rừng thường được thu hoạch duy nhất trong 1 mùa tầmk hoảng từ tháng 3 tới tháng 6 mỗi năm, mật ong rừng mang đậm vị đặc trưng của các bông hoa rừng, có vị ngọt và thanh. Mật ong rừng nguyên chất có màu rất đa dạng, từ nâu sẫm tới vàng sẫm, độ kết dính tương đối cao.', 0, N'mat_ong.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (30, 4, N'Mật Ong Bạc Hà', N'100.000', 1, N'Mật ong bạc hà', N'Mật ong hoa bạc hà có nguồn gốc từ khu vực Đồng Văn - Hà Giang, là một loài hoa mọc dại. Hoa bạc hà nở nhiều nhất vào tầm tháng 10 tới tháng 1. Dó đó mà mật ong bạc hà trên thị trường tương đối khan hiếm bởi tác dụng đặc biệt cho sức khỏe con người.', 10, N'mat_ong_bac_ha.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (31, 5, N'Kiwi xanh', N'10.000', 1, N'Kiwi xanh', N'Kiwi xanh chứa nhiều vitaminC, kali, acid folic và chất xơ. Giúp bồi dưỡng sức khỏe cho trẻ em và phụ nữ sau khi sinh. VitaminC trong kiwi xanh nhiều gấp đôi so với trái cam (cam sành, cam canh, cam cao phong, ... ). Chúng giúp cải thiện chức năng của hệ miễn dịch, phòng ngừa những tác động của chứng viêm gan và sự tấn công của virus và vi khuẩn, nâng cao sự miễn dịch, chống lại bệnh liệt dương. Ăn Kiwi xanh sẽ ngăn chặn việc tạo thành chất gelatin (chất keo) hoặc đông cục khi tiêu thụ các loại thực phẩm được chế biến từ sữa nhờ vào thành phần actindin.', 0, N'kiwi.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (32, 5, N'Hạnh nhân', N'200.000', 1, N'Hạnh nhân', N'Hạt hạnh nhân thuộc phân chi Amygdalus, tên gọi khác của nó là hạnh đào. Lớp vỏ của hạnh nhân rất cứng (vỏ phía trong), nếp nhăn quả hạnh nhân lượn sóng, bao quanh hạt giống. Hạnh nhân không phải là loại quả kiên, đây là 1 loại quả hạch. Bạn có thể rang hoặc ăn sống, hạnh nhân được dùng trong khá nhiều món ăn và cũng là loại hạt nằm trong bộ hạt dinh dưỡng đối với bà bầu.Có 2 loại hạnh nhân hiện nay đó là: hạnh nhân ngọt và hạnh nhân đắng. Hạnh nhân đắng có vị đắng, tính ấm, hơi độc.', 10, N'hanh_nhan.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (33, 5, N'Súp lơ xanh', N'90.000', 1, N'Súp lơ xanh', N'Súp lơ xanh còn gọi là bông cải xanh, nó thuộc loài cải bắp dại, có hoa lớn ở đầu và được sử dụng làm rau. Nó rất tốt cho sức khỏe, chúng chứa nhiều vitamin A, C, và E hơn các rau củ xanh khác, giúp bổ sung dinh dưỡng và tăng cường đề kháng cho cơ thể.Các nhà nghiên cứu khoa học đã chỉ ra rằng, súp lơ xanh giúp làm giảm nguy cơ mắc bệnh ung thư và nhiều loại bệnh tật khác.', 0, N'sup_lo_xanh.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (34, 5, N'Bí Ngô', N'50.000', 1, N'Bí Ngô', N'Bí Ngô (Cucurbita pepo) còn có tên gọi khác là bí rợ, bí đỏ thuộc họ nhà bầu bí. Đây là một thực phẩm rất tốt, có công dụng cực kỳ hữu ích. Hầu hết tất cả các bộ phận của cây bí đỏ đều có thể sử dụng được từ hoa bí đỏ, ngọn bí đỏ cho tới quả bí đỏ và hạt bí đỏ.', 10, N'bi_do.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (35, 5, N'Hạt Điều Rang Muối', N'150.000', 1, N'Hạt Điều Rang Muối', N'Điều hay còn gọi là đào lộn hột, là một cây công nghiệp thuộc họ xoài. Nó được trồng ở khí hậu nhiệt đới để lấy nhân hạt chế biến làm thực phẩm.Hạt điều ăn rất giòn và có hương thơm đặc trưng. Thường mọi người hay tìm mua hạt điều rang muối. Đây là đặc sản của Việt Nam nên thị trường hạt điều xuất khẩu luôn dẫn đầu cao.', 10, N'hatdieu.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (41, 7, N'Măng tây', N'150.000', 1, N'Măng tây', N'Măng tây không còn xa lạ gì với người Việt Nam, hành tía là loại thực phẩm không thể thiếu trong bữa cơm gia đình Việt. Hành tía giúp cho hương vị của món ăn trở nên hấp dẫn hơn nhiều. Không chỉ là một loại thực phẩm làm cho món ăn trở nên hấp dẫn hơn, hành tía còn mang đến cho chúng ta nhiều chất dinh dưỡng tốt cho sức khỏe.', 0, N'mangtay.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (42, 7, N'Dưa lưới', N'80.000', 1, N'Dưa lưới', N'Dưa lưới là một loại hoa quả sạch có hình tròn, khá to, có các đường gân trắng khá độc đáo. Ngoài ra, hương vị của nó cũng rất đặc biệt, ăn giòn và vị ngọt mát. Đây là loại trái cây giúp bổ sung nhiều dinh dưỡng cho cơ thể và thường được sử dụng để giải nhiệt . Nó gồm có 2 loại là dưa lưới vàng và dưa lưới xanh. ', 5, N'dua_luoi.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (43, 7, N'Dưa leo', N'50.000', 1, N'Dưa leo', N'Dưa leo (dưa chuột) là thực phẩm rất quen thuộc hàng ngày, đặc biệt là những công dụng của dưa chuột đối với sức khỏe. Dưa chuột chứa hàm lượng nước cao (trong quả dưa chuột chứa tới 95% lượng nước), giàu vitamin C và chất xơ giúp làn da trắng sáng, khỏe khoắn. Hơn nữa, dưa chuột còn có tác dụng làm giảm nhiệt và kháng viêm. Dưa chuột là món ăn nhẹ rất tốt trong mùa hè. ', 15, N'dua_chuot.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (44, 7, N'Hạt mắc ca', N'350.000', 1, N'Hạt mắc ca', N'Hạt mắc ca khi so với nhiều loại hạt dinh dưỡng khác như hạnh nhân, óc chó, hạt thông.. thì trong mắc ca chứa nhiều chất béo nhưng ít hàm lượng protein. Lượng chất béo không bão hòa đơn trong hạt mắc ca là cao nhất so với các loại hạt dinh dưỡng khác. Axit béo omega 7 có khoảng 22% trong hạt mắc ca hoạt động sinh học giống như 1 chất béo chưa bão hòa đơn. Ngoài ra, trong hạt mắc ca có chứa 2% sơ dinh dưỡng, 9% cacbohydrat, 9% protein cũng như các chất selen, photpho, natri, kali, riboflavin, thiamin, sắt và niacin.', 20, N'hat_mac_ca.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (45, 7, N'Táo xanh Pháp', N'85.000', 1, N'Táo xanh Pháp', N'Từ lâu, táo xanh được công nhận là loại trái cây lành mạnh, đem lại nhiều lợi ích cho sức khỏe.Với thương hiệu Pháp, Táo xanh Pháp được nhiều người dân Việt ưa chuộng và lựa chọn tin cậy. Mùa vụ táo xanh chỉ khoảng 1 đợt trong năm, nhưng giá thành lại không cao.Chất xơ phức tạp của táo giúp no lâu hơn mà không bị tiêu thụ nhiều calo (một quả táo bình thường chỉ chứa khoảng 95 calo). Một loại axit có trong vỏ táo là Axit Ursolic làm giảm nguy cơ béo phì, Axit Ursolic thúc đẩy cơ thể đốt cháy calo, tăng việc hình thành cơ và giảm chất béo lâu năm trong cơ thể.', 0, N'tao_xanh.jpg', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (1047, 1, N'Rau ngò', N'100000', 1, N'Rau khá ngon', N'Rau khá ngon', 0, N'', CAST(N'2023-03-20' AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (4, 1, N'asd', N'louisvu08@gmail.com', N'asasd', CAST(N'2023-03-11' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (5, 2, N'', N'', N'', CAST(N'2023-03-12' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (6, 2, N'asd', N'ada@asda.com', N'ada', CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (8, 8, N'Linh', N'louisvu@gmail.com', N'Good!', CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1008, 1, N'a', N'asdljkasdlk@gmail.com', N'dasads', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1009, 2, N'asd', N'louisvu08@gmail.com', N'<h1>asdas</h1>
', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1010, 2, N'', N'', N'<p><img alt="David" src="https://i1-giaitri.vnecdn.net/2021/04/14/David-Beckham-5550-1618365663.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=5g5eKxpc0DfYDEjGqYsjag" style="height:112px; width:187px" /></p>
', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1011, 1, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/f83ab7ac-981c-4e9c-9256-9e6b8556412a" width="750" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1012, 1, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/5cb14237-1002-4606-9927-b02301792473" width="750" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1013, 1, N'Linh', N'aDLKaDKL@gmail.com', N'<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><strong>ẠDKJ&Aacute;HJK&Aacute;DKJH&Aacute;Dkj&Aacute;DJhk</strong></div>

<p>&nbsp;</p>
', CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1014, 7, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/56aba860-57f5-473f-84fd-2d163333b89e" width="750" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1015, 7, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/b3873233-7103-46b3-bf98-8b295ccc774d" width="1024" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1016, 1, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/be788628-757d-4318-9e36-71b3fd8f9f59" width="1024" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1017, 1, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/d29832b9-fa21-47ae-b610-e2aceb588de7" width="1024" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1018, 6, N'linh', N'linh@gmail.com', N'<p><ins><em><strong>AaSdasdasd</strong></em></ins></p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1019, 6, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/bc55cd1b-2054-4980-b675-451f1dbc0bcc" width="1024" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created], [idadmin]) VALUES (1020, 6, N'', N'', N'<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost:999/4dcb2cb7-054a-4bb3-b521-f78f429668a2" width="750" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', CAST(N'2023-03-21' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (4, N'vutuanlinhtest', N'Linh Vũ', N'ASdas@gmail.com', N'39902314', N'crfvygubhnijmokl', N'', N'90.000', N'0', N'Đã thanh toán', CAST(N'2023-03-09' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (5, N'vutuanlinhtest', N'Linh Vũ', N'ASdas@gmail.com', N'39902314', N'crfvygubhnijmokl', N'asd', N'', N'0', N'Đã thanh toán', CAST(N'2023-03-09' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (6, N'vutuanlinhtest', N'asd', N'ASdas@gmail.com', N'123123', N'asdasd', N'asd', N'450.000', N'1', NULL, CAST(N'2023-03-14' AS Date))
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (1, N'1231', N'asdljkasdlk@gmail.com', N'0399920314', N'asdasdasd', N'asdasd123', CAST(N'2023-02-28' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (2, N'12312312312312312312', N'ASDadsasd@gmail.com', N'12312312312312', N'123123dasasdas123123', N'12312312312', CAST(N'2023-02-28' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (3, N'TungNgu', N'tungngu@gmail.com', N'1234567890', N'tungdeptrai', N'123456', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (4, N'Nguyen Viet Huy', N'huyngu@gmail.com', N'12312312312', N'huyngu', N'123123', CAST(N'2023-03-06' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (7, N'asdasd', N'asdsddadad@gmail.com', N'12312312312312', N'123123123123', N'123123123213', CAST(N'2023-03-07' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (12, N'vutuanlinhtest', N'vutuanlinhtest@gmail.com', N'123123', N'vutuanlinhtest', N'vutuanlinhtest', CAST(N'2023-03-16' AS Date))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC5727DA14477]    Script Date: 3/24/2023 3:02:42 PM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61645B22D2D6]    Script Date: 3/24/2023 3:02:42 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC57251F8643D]    Script Date: 3/24/2023 3:02:42 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transactions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([catalog_id])
REFERENCES [dbo].[catalog] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([idadmin])
REFERENCES [dbo].[admin] ([id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [QLNS] SET  READ_WRITE 
GO
