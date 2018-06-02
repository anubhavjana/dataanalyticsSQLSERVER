--18-05-18

select * from OUTBOUND.summary

sp_rename
'ref.dim_product.productid','itemid','column';
select * from ref.DIM_PRODUCT

insert into outbound.summary(customerid,companyname,contactname,contacttitle,addresscust,city,region,postalcode,country,phone,fax,customerkey,employeeid,employeename,employeetitle,title,birthdate,hiredate,empaddress,empcity,empregion,empcountry,productid,productname,supplierid,quantityperunit,unitprice,suppcompanyname,suppcontactname,suppaddress,suppcity,suppregion,suppcountry,suppphone)
select ref.dim_customer.customerid, ref.dim_customer.companyname, ref.dim_customer.contactname, ref.dim_customer.contacttitle, ref.dim_customer.address, ref.dim_customer.city, ref.dim_customer.region, ref.dim_customer.postalcode, ref.dim_customer.country, ref.dim_customer.phone, ref.dim_customer.fax, ref.dim_customer.customerkey,ref.dim_employee.employeeid,ref.dim_employee.employeename,ref.dim_employee.employeetitle,ref.dim_employee.title,ref.dim_employee.birthdate,ref.dim_employee.hiredate,ref.dim_employee.address,ref.dim_employee.city,ref.dim_employee.region,ref.dim_employee.country,ref.dim_product.itemid,ref.dim_product.productname,ref.dim_product.supplierid,ref.dim_product.quantityperunit,ref.dim_product.unitprice,ref.dim_supplier.companyname,ref.dim_supplier.contactname,ref.dim_supplier.address,ref.dim_supplier.city,ref.dim_supplier.region,ref.dim_supplier.country,ref.dim_supplier.phone 
from ref.dim_customer,ref.dim_employee,ref.dim_product,ref.dim_supplier


select * from outbound.summary
select * from ref
select * from mart.sales
select * from ref
Select * from [REF].[LKP_CUST_SALES]