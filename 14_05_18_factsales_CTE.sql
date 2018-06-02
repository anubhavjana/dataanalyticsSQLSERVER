Declare @extamt money=1000
Declare @Quantity int=10
Declare @Disamt money=70
Declare @SoldAmt money=970
;With SalesCTE(Quantity,ExtendedPriceAmount,DiscountAmount,SoldAmount,ProductKey,CustomerKey,EmployeeKey,OrderDateKey,ShippedDateKey)--,OrderKey)
AS
(
	SELECT 10 Quantity, 1000 ExtendedPriceAmount,70 DiscountAmount,970 SoldAmount,1 ProductKey,1 CustomerKey,1 EmployeeKey,1 OrderDateKey,10 ShippedDateKey--,1 OrderKey
	UNION ALL
	SELECT Quantity + 1 Quantity, ExtendedPriceAmount + CONVERT(INT,RAND()*100) ExtendedAmount,DiscountAmount + CONVERT(INT,RAND()*10),SoldAmount + CONVERT(INT,RAND()*100),ProductKey + 1 ProductKey,CustomerKey + 1 CustomerKey,
	EmployeeKey + 1 EmployeeKey,OrderDateKey + 1 OrderDateKey,ShippedDateKey + 1 ShippedDateKey--,OrderKey + 1 OrderKey
	FROM SalesCTE
	WHERE (QUANTITY BETWEEN 10 AND 99)
	AND (PRODUCTKEY BETWEEN 1 AND 90)
	AND (CUSTOMERKEY BETWEEN 1 AND 90)
	AND (EMPLOYEEKEY BETWEEN 1 AND 90)
	AND (ORDERDATEKEY BETWEEN 1 AND 90)
	AND (SHIPPEDDATEKEY BETWEEN 10 AND 99)
	--AND (ORDERKEY BETWEEN 1 AND 90)
 )
 INSERT INTO FactSales1(Quantity,ExtendedPriceAmount,DiscountAmount,SoldAmount,ProductKey,CustomerKey,EmployeeKey,OrderDateKey,ShippedDateKey)--,orderkey)
 SELECT * FROM SalesCTE
 OPTION(MAXRECURSION 1000);

 select * from FactSales1;
 alter table factsales1
 add constraint Pk_OrderKey primary key(OrderKey)
  


 alter table FactSales1 drop constraint PK_FactSales1;

 alter table FactSales1 drop column OrderID;
 alter table FactSales1 add ProductKey int;

 select * from FactSales1;
 alter  table FactSales1 add ProductKey int;

 insert into FactSales1(ProductKey)
 select ProductKey from DimProduct1; 

 insert into FactSales1(CustomerKey)
 select CustomerKey from DimCustomer1;

 select * from DimProduct1;

 delete from FactSales1;

 alter table factsales1
 drop column orderkey

alter table factsales1
add orderkey int not null  identity; 

select * from DimDate1;

 