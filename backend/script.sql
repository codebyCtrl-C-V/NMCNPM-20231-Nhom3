USE [beverage]
GO
/****** Object:  User [project]    Script Date: 1/15/2024 8:59:14 PM ******/
CREATE USER [project] FOR LOGIN [project] WITH DEFAULT_SCHEMA=[project]
GO
ALTER ROLE [db_owner] ADD MEMBER [project]
GO
/****** Object:  Schema [project]    Script Date: 1/15/2024 8:59:15 PM ******/
CREATE SCHEMA [project]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[created] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartProduct]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartProduct](
	[cartProductID] [int] IDENTITY(1,1) NOT NULL,
	[cartID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[oderProductID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL,
	[priceProduct] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[status] [bit] NULL,
	[sum] [int] NULL,
	[orderDate] [datetime] NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[price] [int] NULL,
	[stock] [int] NULL,
	[category] [varchar](20) NULL,
	[imageUrl] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/15/2024 8:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [userID], [created]) VALUES (1, 2, 1)
INSERT [dbo].[Cart] ([cartID], [userID], [created]) VALUES (2, 3, 1)
INSERT [dbo].[Cart] ([cartID], [userID], [created]) VALUES (3, 4, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartProduct] ON 

INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (2, NULL, 4, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (3, NULL, 7, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (4, NULL, 7, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (5, NULL, 7, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (6, NULL, 17, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (7, NULL, 17, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (18, 2, 7, 3)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (19, 2, 12, 1)
INSERT [dbo].[CartProduct] ([cartProductID], [cartID], [productID], [quantity]) VALUES (20, 2, 4, 2)
SET IDENTITY_INSERT [dbo].[CartProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (1, 8, 4, 3, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (2, 9, 4, 3, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (3, 10, 4, 3, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (4, 11, 9, 2, 20)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (5, 11, 12, 2, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (6, 11, 4, 5, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (7, 12, 9, 2, 20)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (8, 12, 12, 2, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (9, 12, 4, 5, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (10, 13, 4, 2, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (11, 13, 7, 3, 15)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (12, 13, 12, 1, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (13, 14, 4, 5, 25)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (14, 14, 9, 1, 20)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (15, 14, 12, 2, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (16, 15, 7, 2, 15)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (17, 16, 7, 2, 15)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (18, 16, 12, 6, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (19, 17, 5, 3, 30)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (20, 18, 5, 4, 30)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (21, 18, 7, 2, 15)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (22, 19, 17, 1, 18)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (23, 20, 20, 3, 56)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (24, 22, 19, 2, 50)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (25, 23, 12, 1, 13)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (26, 24, 11, 2, 10)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (27, 25, 11, 1, 10)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (28, 25, 11, 15, 10)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (29, 26, 11, 7, 10)
INSERT [dbo].[OrderProduct] ([oderProductID], [orderID], [productID], [quantity], [priceProduct]) VALUES (30, 27, 4, 3, 25)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (1, 2, 0, 100, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (2, 2, 0, 100, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (3, 2, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (4, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (5, 2, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (6, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (7, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (8, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (9, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (10, 2, 0, 75, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (11, 2, 0, 191, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (12, 2, 0, 191, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (13, 3, 0, 108, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (14, 2, 0, 171, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (15, 2, 0, 30, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (16, 2, 0, 108, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (17, 2, 0, 90, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (18, 2, 0, 150, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (19, 2, 0, 18, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (20, 2, 0, 168, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (21, 2, 0, 168, NULL, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (22, 2, 0, 100, CAST(N'2024-01-15T13:25:29.970' AS DateTime), NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (23, 2, 0, 13, CAST(N'2024-01-15T14:20:06.250' AS DateTime), NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (24, 4, 0, 20, CAST(N'2024-01-15T14:49:55.910' AS DateTime), N'ngõ gốc đề hehe')
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (25, 2, 0, 160, CAST(N'2024-01-15T16:10:14.827' AS DateTime), N'')
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (26, 2, 0, 70, CAST(N'2024-01-15T16:25:47.570' AS DateTime), N'')
INSERT [dbo].[Orders] ([orderID], [userID], [status], [sum], [orderDate], [address]) VALUES (27, 2, 0, 75, CAST(N'2024-01-15T17:27:58.407' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (3, N'trà sữa chân trâu hoàng gia', 40, 10, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079061/pmn5fnqe9zm4gqwzxtoh.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (4, N'trà sữa chân trâu đường đen', 25, 10, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079092/hiurgm943bcekmrpsyhc.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (5, N'trà sữa chân trâu sợi', 30, 10, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079177/e1ikv6afdfzpdgaalshm.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (6, N'đường đen sữa đá', 20, 7, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079212/gsswkuwdroxr2xtn5e4u.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (7, N'cà phê đen nóng', 15, 3, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079239/b7rsh2ggnuevvrs4jc6b.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (9, N'bạc xỉu', 20, 2, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079305/sndxmk5cnul8sf545fr4.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (10, N'Nước cam Minute Maid Teppy', 23, 24, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079373/lq8llndbsgy5irzlrahb.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (11, N'Nước sting đỏ', 10, 40, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079398/oilpumbkksunzj8pszdi.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (12, N'Nước tăng lực samurai', 13, 15, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079423/njwl3wcm2aqaziblwtrn.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (13, N'Nước uống Mauntain dew', 15, 20, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079459/iendher5spqno9vu0soj.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (14, N'Trà ô long', 10, 6, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079487/lxcdpyhqzsva2ftd5bq5.png')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (15, N'Trà thảo mộc dr thanh', 10, 10, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079523/unuq9uzmjrexfmcdgtqg.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (16, N'Trà sữa ba anh em', 40, 3, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705079549/fl3j5ugin7u1mumoookq.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (17, N'cà phê đen đá', 18, 1, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705083087/j2egqvfyyauwxaiyfhnz.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (19, N'trà sữa hoàng kim', 50, 1, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705116428/vedr37cwonpfyfvgw3eb.png')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (20, N'trà sữa pudding đậu ', 56, 4, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705116517/u0zubqvcnxkjepj1jhgu.png')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (21, N'Nước ngọt coca cola zero', 10, 30, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705310919/sv9afhxkvg2uvpgbpo1l.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (22, N'Nước ngọt pepsi cola', 10, 29, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705310989/qewcwwh9pgfw2wwztvdh.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (23, N'nước ngọt pepsi không calo', 10, 55, N'nuoc-giai-khat', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705311044/vdafut7rn1dbtn9rbkja.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (24, N'sữa nhài khổng lồ', 35, 2, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705313591/kcxh1ypulderipuaebe2.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (25, N'trà sữa matcha phúc long', 45, 3, N'tra-sua', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705313722/ofmts8r7phth0yiqykqm.png')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (26, N'caramel macchiato', 69, 1, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705313821/xt0knvxv9wgfinvoktgs.jpg')
INSERT [dbo].[Product] ([productID], [name], [price], [stock], [category], [imageUrl]) VALUES (27, N'findi kem sữa', 45, 2, N'cafe', N'https://res.cloudinary.com/dx0tsobsq/image/upload/v1705313889/eonezdysa2xrux3uijjl.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [username], [email], [password], [name], [address], [phone]) VALUES (1, N'admin', N'admin@gmail.com', N'123', NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [username], [email], [password], [name], [address], [phone]) VALUES (2, N'nhat', N'nhat@gmail.com', N'123', NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [username], [email], [password], [name], [address], [phone]) VALUES (3, N'nhattan', N'hehe@gmail.com', N'123', NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [username], [email], [password], [name], [address], [phone]) VALUES (4, N'tan', N'tan@gmail.com', N'123', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD FOREIGN KEY([cartID])
REFERENCES [dbo].[Cart] ([cartID])
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
