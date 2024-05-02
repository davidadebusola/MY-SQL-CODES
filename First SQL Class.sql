SELECT TOP (1000) [Transaction ID]
      ,[Date]
      ,[Customer ID]
      ,[Gender]
      ,[Age]
      ,[Product Category]
      ,[Quantity]
      ,[Price per Unit]
      ,[Total Amount]
  FROM [Data Analysis Class ].[dbo].['retail_sales_dataset - Copy$']

  select*
  from[dbo].['retail_sales_dataset - Copy$']
  where Gender = 'Female'

  -- This is for the or Function
  
  select [Customer ID],Gender,Age,[Price per Unit]
  from[dbo].['retail_sales_dataset - Copy$']
  where Age>=25 or [Price per Unit]>100

  -- This is for the in function
  select [Customer ID],Gender,[Product Category]
  from[dbo].['retail_sales_dataset - Copy$']
  where [Product Category] in ('Beauty', 'Clothing')

   
   select [Customer ID],Gender,[Product Category]
  from[dbo].['retail_sales_dataset - Copy$']
  where [Product Category] not in ('Beauty', 'Clothing')

  -- This is for the not in operator which picks the values not in the column 
  select [Customer ID],Gender, [Product Category]
  from[dbo].['retail_sales_dataset - Copy$']
  where [Product Category] not in ('Beauty', 'Clothing')

  -- This is the between operator and it works for values only
  select [Customer ID], Gender, [Product Category], [Price per Unit]
  from[dbo].['retail_sales_dataset - Copy$']
  where [Price per Unit] between 20 and 50