select * from outbound.summ

insert into outbound.summ
select l.customerid,c.contactname,c.companyname,c.address,l.salesid,s.itemid,p.supplierid,p.productname,s.employeeid,e.employeename,p.categoryid,ca.categoryname from ref.LKP_CUST_SALES l,ref.DIM_CUSTOMER c,MART.SALES s,ref.DIM_product_n p,ref.DIM_EMPLOYEE e,ref.DIM_CATEGORY ca
where l.customerid=c.customerid and l.salesid=s.salesid and s.employeeid=e.employeeid and p.categoryid=ca.categoryid


Select * from MART.SALES

insert into OUTBOUND.summ
select * 