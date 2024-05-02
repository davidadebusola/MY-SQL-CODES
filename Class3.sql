SELECT TOP (1000) [Row ID]
      ,[Order ID]
      ,[Order Date]
      ,[Ship Date]
      ,[Ship Mode]
      ,[Customer ID]
      ,[Customer Name]
      ,[Segment]
      ,[Country]
      ,[City]
      ,[State]
      ,[Postal Code]
      ,[Region]
      ,[Product ID]
      ,[Category]
      ,[Sub-Category]
      ,[Product Name]
      ,[Sales]
      ,[Quantity]
      ,[Discount]
      ,[Profit]
      ,[F22]
      ,[F23]
  FROM [Assignment].[dbo].[Sheet1$]

  select COUNT ([Customer ID])Customer_By_category,Category
  from [dbo].[Sheet1$]
  group by Category

  select Category, COUNT ([Customer ID]) over (partition by category) Customer_By_category
  from [dbo].[Sheet1$]

   select COUNT ([Customer ID])Customer_By_category,[Product Name],Category
  from [dbo].[Sheet1$]
  group by [Product Name],Category
  order by [Product Name] desc

  
  select COUNT ([Customer ID])Customer_By_category,[Product Name]
  from [dbo].[Sheet1$]
  group by [Product Name]
  order by COUNT ([Customer ID]) asc
  
  select [Postal Code], COUNT ([Customer ID]) over (partition by [Postal Code]  ) Customer_in_the_Same_PostalCode
  from [dbo].[Sheet1$]
  order by Customer_in_the_Same_PostalCode asc

  select COUNT ([Customer ID])Customer_in_the_Same_PostalCode, [Postal Code]
  from [dbo].[Sheet1$]
group by [Postal Code]
  having COUNT ([Customer ID]) <=40
  order by  COUNT ([Customer ID]) asc

  select COUNT ([Customer ID])CustomerWithSameProduct, City, [Product Name]
  from [dbo].[Sheet1$]
  group by [Product Name], City
  order by  COUNT ([Customer ID]) asc

  --This is partition the sum of sales per segment by the segment and country
  select [Customer ID], [Customer Name],Country,Segment, sum([Sales]) over (partition by Segment,Country) SumPerSegment
  from [dbo].[Sheet1$]
  order by  SumPerSegment asc

 -- This is to rank the sales by segment, it will skip to the number of the next sales
 select [Customer ID], Segment, Sales,Region,Rank()  over (partition by segment order by sales asc)Rank 
  from [dbo].[Sheet1$]

  --Dense Rank This is to rank the sales by segment, it won't skip to the number of the next sales
  select [Customer ID], Segment, Sales,Region,Dense_Rank()  over (partition by segment order by sales asc)Rank 
  from [dbo].[Sheet1$]

  --Row number 
  select [Customer ID], Segment, Sales,Region,Row_Number()  over (partition by segment order by sales)Rank_
  from [dbo].[Sheet1$]


  


