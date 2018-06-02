Select b.OrderID,b.ShipName,a.ContactName,a.Address,a.City,b.EmployeeID,c.FirstName + ' ' + c.LastName EmpName from [dbo].[Customers] a,[dbo].[Orders] b,Employees c
where a.CustomerID = b.CustomerID and b.EmployeeID = c.EmployeeID

--Select * from [dbo].[Orders]

select * from c

insert into outbound.summ
select * from l.customerid,c.contactname,c.companyname,c.address,l.salesid,s.itemid,p.supplierid,p.productname,s.employeeid,e.employeename,p.categoryid,ca.categoryname from ref.lkp_customer_sales l,mart.sales s,ref.dim_product_n p,ref.category ca
where l.customerid=c.customerid and l.salesid=s.salesid and s.employeeid=e.employeeid and p.categoryid=ca.categoryid