------ DSA PROJECT------


Create DATABASE KULGAR_Db

select * from [dbo].[KMS Sql Case Study]

---1
 Which product category had the highest sales?
select product_category, sum([sales]) as [Total sales]
from [dbo].[KMS Sql Case Study]
group by product_category
order by [Total sales] desc


---2
What are the Top 3 and Bottom 3 regions in terms of sales?
select top 3 region, SUM (sales) as [total sales]
      from [dbo].[KMS Sql Case Study]
group by region
order by [total sales] desc


---3
What were the total sales of appliances in Ontario?
select product_sub_category, SUM(sales) as [total sales]
      from [dbo].[KMS Sql Case Study]
where Region = 'ontario'
group by Product_Sub_Category

----4
Advise the management of KMS on what to do to increase the revenue from the bottom
10 customers
select top 10 customer_name,  sales
       from [dbo].[KMS Sql Case Study]
order by  sales asc


-----5
KMS incurred the most shipping cost using which shipping method?
select Ship_Mode,  SUM ([Shipping_Cost])  AS [Total_Shipping_Cost]
       FROM [dbo].[KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY [Total_Shipping_Cost] DESC


------ 6
 Who are the most valuable customers, and what products or services do they typically
purchase?
select Customer_segment, product_sub_category, Product_Category, Customer_name, sum([sales]) as [Total Sales]
from [dbo].[KMS Sql Case Study]
Group by Customer_segment, product_sub_category,Product_Category, Customer_name
Order by [Total sales] desc 



-----7
Which small business customer had the highest sales?
Select top 1 *
From [KMS Sql Case Study]
where Customer_Segment = 'SMALL BUSINESS'
ORDER BY Sales DESC

------8
Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1 *
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'CORPORATE'
ORDER BY Order_Quantity DESC

-----9
Which consumer customer was the most profitable one
SELECT TOP 1 *
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'CONSUMER'
ORDER BY PROFIT DESC

----- 10 
 Which customer returned items, and what segment do they belong to?
   Select customer_name, customer_segment
   from [dbo].[KMS Sql Case Study]
   join [dbo].[Order_Status]
   on [dbo].[KMS Sql Case Study] . order_id = [dbo].[Order_Status] . order_id


	-----11

Select order_priority, sales, order_quantity, ship_mode, Shipping_cost,
COUNT (*) AS [total order]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Order_Priority, sales, Order_Quantity, Ship_Mode, Shipping_Cost
ORDER BY Order_Priority, [total order] ASC