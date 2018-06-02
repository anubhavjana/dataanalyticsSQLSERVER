--TABLE DESC: TRANSFER PRODUCTS INTO DIMPRODUCT1
insert into DimProduct1
select * from Products

select * from DimProduct1

Alter table Dimproduct1
add ProductKey INT NOT NULL IDENTITY

