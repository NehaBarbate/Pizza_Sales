SHOW databases;

CREATE DATABASE pizza;

USE pizza; 

CREATE TABLE sales(
pizza_id INT,
order_id INT,	
pizza_name_id varchar(50),
quantity INT,
order_date date,
order_time time,
unit_price float4,
total_price float4,
pizza_size varchar(50),
pizza_category varchar(50),
pizza_ingredients varchar(150),
pizza_name varchar(150)
);

SELECT * FROM sales;

SELECT SUM(total_price) AS Total_Revenue FROM sales;

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM sales;

SELECT SUM(quantity) / COUNT(distinct order_id) FROM sales;

SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(distinct order_id)  AS DECIMAL (10,2))  FROM sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(distinct order_id)  AS DECIMAL (10,2))  AS DECIMAL (10,2)) FROM sales;


SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM sales
GROUP BY DAYNAME(order_date);



SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY MONTHNAME(order_date);

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from sales) AS DECIMAL(10,2)) AS PCT
FROM sales
GROUP BY pizza_category;


SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;


SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;


SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;


SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;


SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from sales) AS DECIMAL(10,2)) AS PCT
FROM sales
GROUP BY pizza_size;



































































