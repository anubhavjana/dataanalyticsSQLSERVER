
SET IDENTITY_INSERT dbo.DimDate1 ON;
;WITH Date_CTE as
(
 SELECT cast('2015-01-01' as date) as CalendarDate,cast('2015-01-01' as date) as Fulldate,MONTH(GETDATE()-864) as TMonth,Year(GETDATE()-864) AS TYear,Day(GETDATE()-864) AS TDay,DATEPART ( ISOWW , getdate()-864 )  AS TWeek,DATENAME(dw, 
  CAST(DATEPART(m, GETDATE()-865) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(d, GETDATE()-865) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(yy, getdate()-865) AS VARCHAR)) AS WeekName,datename(month,getdate()-864) as MonthName,DATEPART ( Q , GETDATE()-864 ) AS TQUARTER
  
 

 UNION ALL

 SELECT dateadd(day , 1, CalendarDate),dateadd(day , 1, CalendarDate),Month(dateadd(day , 1, CalendarDate)),Year(dateadd(day , 1, CalendarDate)),Day(dateadd(day , 1, CalendarDate)),DATEPART(ISOWW, (dateadd(day,1,CalendarDate))),DATENAME(dw, 
  CAST(DATEPART(m,dateadd(day , 1, CalendarDate) ) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(d, dateadd(day , 1, CalendarDate)) AS VARCHAR) 
  + '/' 
  + CAST(DATEPART(yy, dateadd(day , 1, CalendarDate)) AS VARCHAR)),datename(month,dateadd(day , 1, CalendarDate)),DATEPART ( Q ,dateadd(day , 1, CalendarDate)  )
  
 FROM Date_CTE
 WHERE dateadd (day, 1, CalendarDate) <= '2018-12-31'
 )


insert into DimDate1(Date,FullDateUSA,DayOfMonth,Year,DateKey,DayOfWeek,DayName,MonthName,Quarter)
SELECT *
FROM Date_CTE 
OPTION(MAXRECURSION 3000);

select * from DimDate1











 
 
 
