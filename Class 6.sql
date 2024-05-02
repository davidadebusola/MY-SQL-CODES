SELECT *
  FROM [Data Analysis Class ].[dbo].[olist_order_payments_dataset#cs$]

  --orders paid for twice 
  select order_id, COUNT(*)Duplicates 
  from [dbo].[olist_order_payments_dataset#cs$]
  group by order_id
  having count(*) >1

  --To see the payments sequential that is more than 1
  select  payment_type,payment_sequential
  from [dbo].[olist_order_payments_dataset#cs$]
  where payment_sequential >1
  order by payment_sequential desc

  /*Joining the tables to check the order that was not paid*/  
  select *
  from [dbo].[olist_orders_dataset#csv$] as OT
  left join [dbo].[olist_order_payments_dataset#cs$] as PT
  on OT.order_id = PT.order_id
  where order_status = 'Delivered' and PT.order_id is Null

  --To know the count of orders that was invoiced and paid
  select OT.order_status, COUNT(OT.order_id) as Count_
  from [dbo].[olist_orders_dataset#csv$] OT
  inner join [dbo].[olist_order_payments_dataset#cs$] PT
  on OT.order_id=PT.order_id
  where OT.order_status = 'invoiced'
  group by OT.order_status

  --To know the count of orders that was invoiced and not paid
  select OT.order_status, count(OT.order_id) as Count
  from [dbo].[olist_orders_dataset#csv$] OT
  left join [dbo].[olist_order_payments_dataset#cs$] PT
  on OT.order_id=PT.order_id
  where OT.order_status = 'Delivered' and PT.payment_sequential is null
  group by OT.order_status

  --To see the count of all the status that was paid 
  select OT.order_status, COUNT(OT.order_id) over (partition by OT.order_status)
  from [dbo].[olist_orders_dataset#csv$] OT
  full join [dbo].[olist_order_payments_dataset#cs$] PT
  on OT.order_id = PT.order_id
  

  --To see the count of all the status that was not paid
  select OT.order_status, COUNT(OT.order_id) count
  from [dbo].[olist_orders_dataset#csv$] OT
  full join [dbo].[olist_order_payments_dataset#cs$] PT
  on OT.order_id = PT.order_id
  where PT.order_id is null
  group by OT.order_status

  select OT.order_status,count(OT.order_id) over (partition by OT.order_status),pt.payment_type 
  from [dbo].[olist_orders_dataset#csv$] OT
  full join [dbo].[olist_order_payments_dataset#cs$] PT
  on OT.order_id = PT.order_id
  where  OT.order_status = 'Delivered' and  PT.payment_type is null
  

  select OT.order_id,PD.payment_type,OT.order_status,
  case
  when OT.order_status = 'invoiced' and PD.payment_type = 'credit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'boleto' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'debit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'voucher' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'not_defined' then 'Invoiced_Paid'
  else 'invoice not paid'
  End as Invoice_Status
  from [dbo].[olist_order_payments_dataset#cs$]PD
  full join [dbo].[olist_orders_dataset#csv$]OT
  on OT.order_id = PD.order_id
  

  --This is to check the status with the payment type that was paid and not paid 
  with Invoice_Table as (
  select OT.order_id,PD.payment_type as Payment,OT.order_status as status,
  case
  when OT.order_status = 'invoiced' and PD.payment_type = 'credit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'boleto' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'debit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'voucher' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'not_defined' then 'Invoiced_Paid'
  else 'invoice not paid'
  End as Invoice_Status
  from [dbo].[olist_order_payments_dataset#cs$]PD
  full join [dbo].[olist_orders_dataset#csv$]OT
  on OT.order_id = PD.order_id
  )
  select  Invoice_Status,Payment,status
  from Invoice_Table
  where Invoice_Status = 'Invoiced_Paid' 
 
 --This is to check the status with the payment type that was paid and not paid
  with Invoice_Table as (
  select OT.order_id,PD.payment_type as Payment,OT.order_status as status,
  case
  when OT.order_status = 'invoiced' and PD.payment_type = 'credit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'boleto' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'debit_card' then 'Invoiced_Paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'voucher' then 'invoiced_paid'
  when OT.order_status = 'invoiced' and PD.payment_type = 'not_defined' then 'Invoiced_Paid'
  else 'invoice not paid'
  End as Invoice_Status
  from [dbo].[olist_order_payments_dataset#cs$]PD
  full join [dbo].[olist_orders_dataset#csv$]OT
  on OT.order_id = PD.order_id
  )
  select  Invoice_Status,Payment,status
  from Invoice_Table
  where status = 'invoiced'





  
  
  
 -- Assignment 
  --Count how many times each payment types was used

  select payment_type,payment_sequential, COUNT(*) Duplicates 
  from [dbo].[olist_order_payments_dataset#cs$]
  group by payment_type, payment_sequential
  having count(*) >1
 
 
  select payment_type, COUNT(*) Duplicates 
  from [dbo].[olist_order_payments_dataset#cs$]
  group by payment_type
  having count(*) >1

 
  