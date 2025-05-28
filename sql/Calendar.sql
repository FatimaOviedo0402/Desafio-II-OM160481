USE MovilityCOVID_SV2020;
GO

IF OBJECT_ID('dbo.Calendar2020','U') IS NOT NULL
  DROP TABLE dbo.Calendar2020;
GO

WITH nums AS (
  SELECT TOP (366)
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
  FROM master..spt_values
)
SELECT
  DATEADD(day, n, '2020-01-01')     AS [Date],
  YEAR   (DATEADD(day, n, '2020-01-01')) AS [Year],
  DATEPART(qq, DATEADD(day, n, '2020-01-01')) AS [Quarter],
  DATENAME(month, DATEADD(day, n, '2020-01-01')) AS [MonthName],
  MONTH  (DATEADD(day, n, '2020-01-01'))       AS [MonthNumber],
  DAY    (DATEADD(day, n, '2020-01-01'))       AS [Day],
  (
    YEAR (DATEADD(day, n, '2020-01-01')) * 10000
    + MONTH(DATEADD(day, n, '2020-01-01')) * 100
    + DAY  (DATEADD(day, n, '2020-01-01'))
  ) AS [DateKey]
INTO dbo.Calendar2020
FROM nums
WHERE n < DATEDIFF(day, '2020-01-01', '2020-12-31') + 1;
GO


SELECT TABLE_SCHEMA, TABLE_NAME
FROM MovilityCOVID_SV2020.INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Calendar2020';
GO

USE MovilityCOVID_SV2020;
GO

SELECT TOP(5000)
  f.mes,
  f.dia,
  f.DateKey,
  c.[Date],
  c.Year,
  c.Quarter,
  c.MonthName,
  c.Day
FROM dbo.stg_mobility_sv AS f
INNER JOIN dbo.Calendar2020 AS c
  ON f.DateKey = c.DateKey
ORDER BY f.DateKey;


USE MovilityCOVID_SV2020;
GO

DROP TABLE IF EXISTS dbo.Calendar2020;
GO

WITH nums AS (
  SELECT TOP(366)
    ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) - 1 AS n
  FROM master..spt_values
)
SELECT
  CAST(DATEADD(day, n, '2020-01-01') AS date)       AS [Date],     
  YEAR   (DATEADD(day, n, '2020-01-01'))            AS [Year],
  DATEPART(qq, DATEADD(day, n, '2020-01-01'))       AS [Quarter],
  DATENAME(month, DATEADD(day, n, '2020-01-01'))    AS [MonthName],
  MONTH  (DATEADD(day, n, '2020-01-01'))            AS [MonthNumber],
  DAY    (DATEADD(day, n, '2020-01-01'))            AS [Day],
  (
    YEAR (DATEADD(day, n, '2020-01-01')) * 10000
    + MONTH(DATEADD(day, n, '2020-01-01')) * 100
    + DAY  (DATEADD(day, n, '2020-01-01'))
  )                                                AS [DateKey]
INTO dbo.Calendar2020
FROM nums
WHERE n <= DATEDIFF(day, '2020-01-01', '2020-12-31');
GO


EXEC sp_help 'dbo.Calendar2020';
