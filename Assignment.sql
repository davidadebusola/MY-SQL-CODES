
select Segment, Country, Discount
from [dbo].[Sheet1$]
where Segment = 'Consumer'

select Segment, [Customer ID], [Customer Name], Quantity
from dbo.Sheet1$
where Quantity>=4

/*This is for OR function*/
select Segment, [Customer ID], [Customer Name], Quantity,State
from dbo.Sheet1$
where Quantity>=4 or State = 'California'

--This is for and function
select Segment, [Customer ID], [Customer Name], Quantity,State
from dbo.Sheet1$
where Quantity>=7 and State = 'California'

--This is for the in function
select [Ship Mode], [Customer ID], [Product Name], Quantity
from [dbo].[Sheet1$]
where [Ship Mode] in ('First Class')

--This is for not in
select  [Ship Mode], [Customer Name], [Product Name], Quantity 
from [dbo].[Sheet1$]
where [Ship Mode] not in ('Second Class', 'Standard Class')

--Tis is for between function
select [Ship Mode], [Customer Name], [Product Name], Quantity
from [dbo].[Sheet1$]
where Quantity between 10 and 12 


