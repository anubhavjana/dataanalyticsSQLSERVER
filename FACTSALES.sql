Declare @extamt money=1000
Declare @Quantity int=10
Declare @Disamt money=70
Declare @SoldAmt money=970
;With SalesCTE(Quantity,ExtendedAmount,DiscountAmount,SoldAmount)
AS
(
	SELECT 10 Quantity, 1000 ExtendedAmount,70 DiscountAmount,970 SoldAmount
	UNION ALL
	SELECT Quantity + 1 Quantity, ExtendedAmount + CONVERT(INT,RAND()*100) ExtendedAmount,DiscountAmount + CONVERT(INT,RAND()*10),SoldAmount + CONVERT(INT,RAND()*100)
	FROM SalesCTE
	WHERE QUANTITY BETWEEN 10 AND 99
 )
 INSERT INTO FactSales1(Quantity,ExtendedAmount,DiscountAmount,SoldAmount)
 SELECT * FROM SalesCTE
 OPTION(MAXRECURSION 100)


