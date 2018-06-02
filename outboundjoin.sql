Select b.OrderID,b.ShipName,a.ContactName,a.Address,a.City,b.EmployeeID,c.FirstName + ' ' + c.LastName EmpName from [dbo].[Customers] a,[dbo].[Orders] b,Employees c
where a.CustomerID = b.CustomerID and b.EmployeeID = c.EmployeeID

--Select * from [dbo].[Orders]

select * from c