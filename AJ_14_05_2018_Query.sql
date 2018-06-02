select * from DimDate1
SELECT DATENAME(DW, GETDATE())
select DATEPART ( ISOWW , getdate() ) 

SELECT (
  DATENAME(dw, 
  CAST(DATEPART(m, GETDATE()) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(d, GETDATE()) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(yy, getdate()) AS VARCHAR))
  )
 

SELECT DATENAME(month, DATEADD(month, 1, CAST('2008-01-01' AS datetime)))
select datename(month,getdate())
select month(getdate())

select * from DimEmployee1


alter table dimdate1
drop constraint PK_dimdate1
ALTER TABLE DIMDATE1
DROP COLUMN MONTHKEY
select TABLE_NAME,COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME like '%IDENTITY%'


SET IDENTITY_INSERT dbo.DimDate1 ON;

SELECT DATEPART ( Q , GETDATE() )
 
 DATEPART ( Q , GETDATE()-864 ) AS TQUARTER
 DATEPART ( Q ,dateadd(day , 1, CalendarDate)  )

 DELETE FROM DIMDATE1
 SELECT * FROM DimDate1




