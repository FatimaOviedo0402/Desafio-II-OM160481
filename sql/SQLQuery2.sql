SELECT TOP (1000000) [region]
      ,[fecha]
      ,[parks_pct]
      ,[retail_pct]
      ,[grocery_pct]
      ,[transit_pct]
      ,[workplaces_pct]
      ,[residential_pct]
  FROM [MovilityCOVID_SV2020].[dbo].[stg_mobility_sv]
