-- -- DimProduct Table Cleaning
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode 
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  , 
  p.[EnglishProductName] AS ProductName, 
  pc.EnglishProductCategoryName AS ProductCategory, 
  ps.EnglishProductSubcategoryName AS SubCategory 
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  , 
  p.[Color] AS ProductColor 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  , 
  p.[Size] AS ProductSize 
  --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  , 
  p.[ProductLine] 
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  , 
  p.[ModelName] AS ProductModelName 
  --,[LargePhoto]
  , 
  p.[EnglishDescription] AS ProductDescription 
  --,[FrenchDescription]
  --,[ChineseDescription]
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  , 
  ISNULL(p.[Status], 'Outdated') AS ProductStatus -- Assuming NULL represents outdated products
FROM 
  [AdventureWorksDW2017].[dbo].[DimProduct] as p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY 
  p.ProductKey ASC
