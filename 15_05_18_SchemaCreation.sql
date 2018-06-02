--15-05-2018 BY ANUBHAV


CREATE SCHEMA Practice  --CREATING A NEW SCHEMA PRACTICE
GO  
CREATE TABLE Practice.AJ  
(id int NOT NULL,  
Name char(5)  NULL)  

select * from  INFORMATION_SCHEMA.tables
  
select * from Practice.aj

;
;with t(id)  --INSERTING VALUES OF ID WITH CTE
as
(
  select 1 id
  union all
  select id+1 id from t where id<=100
 )
 insert into Practice.AJ(id)
 select * from t
 option(maxrecursion 1000)

 alter table practice.aj
 drop column name

 alter table practice.aj
 add name  varchar(50) null

 select * from Practice.AJ --CHECK THE TABLE
 select * from FactSales1
 SELECT * FROM DimCustomer1

 alter table practice.aj
 drop column name

 alter table practice.aj
 add CUSTOMERNAME NVARCHAR(30) NULL

 --16-05-2018 

 
select * from DimCustomer1

insert into Practice.aj(id,contactname) -- inserting id and name into the staging schema practice
select customerkey,contactname from DimCustomer1

select * from practice.aj   --delete from practice.aj to stop rows from getting added



alter table practice.aj
add id int null

alter table practice.aj
add contactname nvarchar(30) null 

delete from practice.aj



select * from [Sales by Category]


select * from [Order Details]
select * from DimProduct1
SELECT * FROM DimEmployee1
SELECT * FROM [Sales Totals by Amount]
SELECT * FROM Products
SELECT * FROM DimProduct1
