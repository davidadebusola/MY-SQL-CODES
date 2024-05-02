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

select COUNT([Customer ID])Column_ID, [Product Category], Quantity
from [dbo].['retail_sales_dataset - Copy$']
group by [Product Category], Quantity
having COUNT ([Customer ID])>90

select SUM([Price per Unit])Prices, Age
from [dbo].['retail_sales_dataset - Copy$']
group by Age
having Age>20
order by Prices desc 

select [Customer ID],Gender, count ([Quantity]) over (Partition by Gender)max_per_quantity 
from [dbo].['retail_sales_dataset - Copy$']

select max ([Quantity])maxperunit, Gender
from [dbo].['retail_sales_dataset - Copy$']
group by gender

/* Assignment
Try other codes and practice*/

