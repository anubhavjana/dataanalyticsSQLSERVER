USE [DemoDB]
GO
/****** Object:  Table [dbo].[DimCustomer1]    Script Date: 10-05-2018 15:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer1](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[customerkey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDate1]    Script Date: 10-05-2018 15:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate1](
	[Date] [date] NOT NULL,
	[FullDateUSA] [date] NOT NULL,
	[DayOfWeek] [int] NULL,
	[DayName] [nvarchar](50) NULL,
	[DayOfMonth] [int] NULL,
	[DayOfYear] [int] NULL,
	[MonthName] [nvarchar](50) NULL,
	[Quarter] [int] NULL,
	[Year] [int] NULL,
	[IsWeekDay] [nvarchar](50) NULL,
	[MonthKey] [date] NOT NULL,
	[DateKey] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DimDate1] PRIMARY KEY CLUSTERED 
(
	[MonthKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimEmployee1]    Script Date: 10-05-2018 15:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee1](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](10) NOT NULL,
	[EmployeeTitle] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [ntext] NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimProduct1]    Script Date: 10-05-2018 15:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct1](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SuppilerID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuanitityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Disconitinued] [bit] NOT NULL,
	[ProductKey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales1]    Script Date: 10-05-2018 15:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales1](
	[ProductKey] [int] NOT NULL,
	[CustomerKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[OrderDateKey] [int] NULL,
	[ShippedDateKey] [int] NULL,
	[OrderID] [int] NULL,
	[Quantity] [decimal](18, 0) NULL,
	[ExtendedPriceAmount] [decimal](18, 0) NULL,
	[DiscountAmount] [decimal](18, 0) NULL,
	[SoldAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_FactSales1] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
