--18-05-18

select * from dimcustomer1

SELECT * FROM MART.SALES
select distinct * from mart.SALES

DROP TABLE REF.LKP_CUSTOMER_SALES

create table ref.lkp_cust_sales(customerid nchar(5) not null,salesid int not null,orderdate datetime, constraint pk_c_id_sales_id primary key(customerid,salesid))
select * from ref.lkp_cust_sales

select * from ref.DIM_CUSTOMER
alter table ref.lkp_cust_sales
add constraint pk_c_id_sales_id primary key(customerid,salesid)

insert into ref.lkp_cust_sales(customerid,salesid)
select customerid, salesid from ref.DIM_CUSTOMER,mart.SALES

select * from orders
delete from ref.lkp_cust_sales
delete from mart.SALES
select * from mart.sales
select * from ref.DIM_PRODUCT

alter table mart.sales
drop constraint pk_salesid

alter table mart.sales
drop column supplierid

 
 drop table mart.SALES

CREATE TABLE MART.SALES(SALESID INT  NOT NULL,EMPLOYEEID INT NOT NULL,ITEMID INT NOT NULL,UNITPRICE MONEY,QUANTITYPERUNIT NVARCHAR(20),PRIMARY KEY(ITEMID,EMPLOYEEID))

alter table mart.sales
drop  constraint PK__SALES__D27DDC4F76401982
insert into mart.SALES(ITEMID,SALESID,EMPLOYEEID)
select productid,OrderID,employees.EmployeeID from products,Orders,Employees

INSERT INTO MART.SALES(QUANTITYPERUNIT)
SELECT QuanitityPerUnit FROM DimProduct1 P
JOIN  MART.SALES S ON  P.PRODUCTID=S.ITEMID

alter table mart.sales
drop column quantityperunit

alter table ref.dim_product
drop constraint fk_cid
select * from Products

insert into ref.DIM_PRODUCT(PRODUCTID,PRODUCTNAME,SUPPLIERID,QUANTITYPERUNIT,UNITPRICE)
select productid,productname,supplierid,quantityperunit,unitprice from Products
alter table ref.dim_product
drop column categoryid
select * from ref.DIM_PRODUCT

select * from ref.DIM_CUSTOMER

select * from ref.DIM_CATEGORY

select * from ref.lkp_cust_sales

delete from ref.lkp_cust_sales

insert into ref.lkp_cust_sales(customerid,salesid)
select customers.customerid,orderid from Customers,Orders

;with date_cte as
(
  select getdate()-863 as tdate
  union all
  select DATEADD(day,1,tdate) from date_cte
  where tdate<=getdate()+863
  )
  insert into ref.lkp_cust_sales(orderdate,customerid,salesid)
 select tdate,customers.CustomerID,orders.OrderID from date_cte,Customers,Orders
  option(maxrecursion 32527);


select * from ref.lkp_cust_sales
alter table ref.lkp_cust_sales
drop column orderdate

select companyname,contactname,address from ref.DIM_CUSTOMER dc --joining lkp_cust_sales with customers
join ref.lkp_cust_sales lkp on dc.CUSTOMERID=lkp.customerid

select distinct(employeeid),itemid from mart.sales ms   --joining lkp_cust_sales with sales
join ref.lkp_cust_sales lkp on ms.SALESID=lkp.salesid

select distinct(companyname),contactname,address,phone from ref.DIM_SUPPLIER ds --joining supplier with product/item through supplierid
join ref.DIM_PRODUCT dp on ds.SUPPLIERID=dp.SUPPLIERID

select distinct(employeename),employeetitle,birthdate,hiredate,address,city from ref.DIM_EMPLOYEE de
join mart.SALES ms on de.EMPLOYEEID=ms.EMPLOYEEID  --joining employee with sales through employeeid


select distinct(productname),UNITPRICE from ref.DIM_PRODUCT dm --showing productname from sales through itemid
join mart.SALES ms on  dm.itemid=ms.ITEMID
 



select distinct * from mart.SALES
alter table outbound.summary
alter column customerkey int null
alter table outbound.summary
alter column customerid nchar(5) null

