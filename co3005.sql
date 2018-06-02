--30.05.2018

select * from ref.INVENTORY

create table ref.inventory_transaction(Productid int,Outdate datetime,Storeid int)

;With INTRAN(Storeid)
as
( 
	select 1 storeid
	union all
	select storeid + convert(int,rand()*10) storeid
	from INTRAN
	where storeid between 1 and 77
	)
	insert into ref.inventory_transaction(Productid,Outdate,Storeid)
	SELECT I.PRODUCTID,I.OUTDATE,IT.STOREID FROM REF.INVENTORY I,INTRAN IT

	OPTION(MAXRECURSION 0)



 SELECT * FROM REF.inventory_transaction
 select * from ref.SALESDETAILS_N
 select * from ref.INVENTORY

 ---customer details with more that 10 visits

 SELECT COUNT(SALESID) AS NUMBEROFVISITS,OS.CUSTOMERID,OS.CONTACTNAME,DC.PHONE,DC.COMPANYNAME,DC.ADDRESS,DC.CITY,DC.COUNTRY
FROM OUTBOUND.summ_n OS
INNER JOIN REF.DIM_CUSTOMER DC ON OS.CUSTOMERID=DC.CUSTOMERID
GROUP BY OS.CUSTOMERID,OS.CONTACTNAME,DC.PHONE,DC.COMPANYNAME,DC.ADDRESS,DC.CITY,DC.COUNTRY
HAVING COUNT(OS.SALESID) > 10
ORDER BY NUMBEROFVISITS DESC

---creating temporary table for initial quantity to sales

create table ref.temp1(Indate datetime, In_quantity FLOAT,Sale_quantity FLOAT)

DELETE FROM REF.temp1
DROP TABLE REF.temp1

insert into ref.temp1
SELECT I.OUTDATE,I.QUANTITY,SD.QUANTITY
FROM REF.INVENTORY I  
JOIN REF.SALESDETAILS_N SD ON SD.PRODUCTID=I.PRODUCTID
WHERE I.PRODUCTID=55
--GROUP BY DATENAME(MONTH,I.OUTDATE),I.QUANTITY,SD.QUANTITY

SELECT * FROM REF.temp1

SELECT ((COUNT(*) * SUM(CONVERT(float,IN_QUANTITY*Sale_quantity))-SUM(CONVERT(float,IN_QUANTITY))*SUM(CONVERT(float,SALE_QUANTITY)))*1.0)
/((SQRT(convert(float,((COUNT(*)*SUM(CONVERT(float,IN_QUANTITY*IN_QUANTITY))-SUM(CONVERT(float,IN_QUANTITY))*SUM(CONVERT(float,IN_QUANTITY))))))
*SQRT(convert(float,((COUNT(*)*SUM(CONVERT(float,SALE_QUANTITY*SALE_QUANTITY))-SUM(CONVERT(float,SALE_QUANTITY))*SUM(CONVERT(float,SALE_QUANTITY)))))))*1.0)
 FROM REF.temp1


 select convert(decimal,((count(*)*(sum(convert(float,in_quantity*sale_quantity))))-(sum(convert(float,in_quantity)))*(sum(convert(float,sale_quantity)))))/
 (sqrt((count(*)*sum(convert(float,in_quantity*in_quantity)))-(sum(convert(float,in_quantity))*sum(convert(float,in_quantity)))*((count(*)*sum(convert(float,sale_quantity*sale_quantity)))-
 ((sum(convert(float,sale_quantity))*sum(convert(float,sale_quantity))))))) from ref.temp1