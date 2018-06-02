--creating a MART SCHEMA(16-05-18)

CREATE SCHEMA MART  
GO 
CREATE TABLE MART.SALES 
(SALESID int CONSTRAINT pk_salesid primary key NOT NULL,  
Productname nvarchar(40)  NULL,QuantityPerUnit nvarchar(20),UnitPrice money,CategoryName NVARCHAR(50) ,CategoryId INT NOT NULL)   

select * from mart.SALES --ADDING PRIMARY KEY CONSTRAINT TO SALESID
alter table mart.sales
add constraint pk_salesid PRIMARY KEY(SALESID)

alter table mart.sales
drop column categoryid

alter table mart.sales
add categoryid int  null

insert into mart.SALES(salesid,productname,QuantityPerUnit,UnitPrice)
select productid,productname,quantityperunit,unitprice from Products


select * from mart.SALES
alter table mart.sales
drop  pk_salesid
alter table mart.sales
drop column salesid

alter table mart.sales
add salesid int NOT NULL IDENTITY



select * from mart.SALES

delete from mart.sales

insert into mart.SALES(salesid,productname,QuantityPerUnit,UnitPrice)
select productid,productname,quantityperunit,unitprice from Products




alter table mart.category
drop constraint pk_cid


 --GETTING DISTINCT VALUES

SELECT * FROM MART.SALES

ALTER TABLE MART.SALES
DROP COLUMN CATEGORYID

select * from Products
select * from Suppliers

drop table mart.category



