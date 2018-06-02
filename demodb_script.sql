USE [DemoDB]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 10-05-2018 10:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[CompanyName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[CustomerCountry] [varchar](50) NULL,
	[CustomerRegion] [varchar](50) NULL,
	[CustomerCity] [varchar](50) NULL,
	[CustomerPostalCode] [int] NULL,
	[CustomerAddress] [varchar](50) NULL,
	[CustomerPhone] [int] NULL,
	[CustomerFax] [int] NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 10-05-2018 10:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [date] NOT NULL,
	[Date] [date] NULL,
	[FullDateUSA] [date] NULL,
	[DayOfWeek] [int] NULL,
	[DayName] [varchar](50) NULL,
	[DayOfMonth] [int] NULL,
	[DayOfYear] [int] NULL,
	[WeekOfYear] [int] NULL,
	[MonthName] [varchar](50) NULL,
	[MonthOfYear] [varchar](50) NULL,
	[Quarter] [int] NULL,
	[QuarterName] [varchar](50) NULL,
	[Year] [int] NULL,
	[IsWeekday] [char](10) NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 10-05-2018 10:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[EmployeeName] [varchar](50) NULL,
	[EmployeeTitle] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Country] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[HomePhone] [int] NULL,
	[Photo] [varchar](50) NULL,
	[PhotoPath] [varchar](50) NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 10-05-2018 10:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[Discontinued] [varchar](50) NULL,
	[SupplierName] [varchar](50) NULL,
	[CategoryName] [varchar](50) NULL,
	[UnitsInStock] [int] NULL,
	[UnitsOnOrder] [int] NULL,
	[UnitPrice] [int] NULL,
	[QuantityPerUnit] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 10-05-2018 10:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[ProductKey] [int] NOT NULL,
	[CustomerKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[OrderDateKey] [date] NULL,
	[ShippedDateKey] [date] NULL,
	[OrderID] [int] NULL,
	[Quantity] [decimal](18, 0) NULL,
	[ExtendedPriceAmount] [decimal](18, 0) NULL,
	[DiscountAmount] [decimal](18, 0) NULL,
	[SoldAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_FactSales] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[FactSales] ([ProductKey])
GO
ALTER TABLE [dbo].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_FactSales]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCustomer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCustomer]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate1] FOREIGN KEY([ShippedDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate1]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimEmployee] FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimEmployee]
GO
