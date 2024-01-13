/* KPI's REQUIREMENT */
 /*01- Total_Revenue 817860.05 */
SELECT CAST(SUM(total_price)AS DECIMAL(10,2)) AS Total_Revenue 
FROM pizza_sales;

/*02- Average_Order_Value 38.31 */
SELECT CAST(CAST(SUM(total_price) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_Order_Value 
FROM pizza_sales;

/*03- Total_Pizzas_Sold 49574 */
SELECT SUM(quantity) AS Total_PizzAS_Sold 
FROM pizza_sales;

/*04- Total_Orders 21350 */
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales;

/*05- Average_Pizzas_Per_Order 2.32  */
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS Average_Pizzas_Per_Order
FROM pizza_sales;

########################################################################

 /* CHART REQUIREMENT */

 /*01- Daily_Trend_For_Total_Orders:

Order_Day	Total_Orders
Saturday	3158
Wednesday	3024
Monday		2794
Sunday		2624
Friday		3538
Thursday	3239
Tuesday		2973 
*/
SELECT DATENAME(DW, order_date) AS Order_Day,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
/*02- Hourly_Trend_For_Total_Orders:

Order_Hours	Total_Orders
9			1
10			8
11			1231
12			2520
13			2455
14			1472
15			1468
16			1920
17			2336
18			2399
19			2009
20			1642
21			1198
22			663
23			28
*/
SELECT DATEPART(HOUR, order_time) AS Order_Hours,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);
 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 /*03- Percentage_Of_Sales_By_Pizza_Category:

pizza_category	Total_Sales	PCT_Total_Sales
Classic			220053.10	26.91
Chicken			195919.50	23.96
Veggie			193690.45	23.68
Supreme			208197.00	25.46

 WHERE MONTH(order_date)=1 ## it will apply on both querry and subquerry
*/

SELECT pizza_category,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(SUM(total_price) * 100 /
       (
           SELECT SUM(total_price) FROM pizza_sales 
       ) AS DECIMAL(10,2)) AS PCT_Total_Sales
FROM pizza_sales
GROUP BY pizza_category;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 /*04- Percentage_Of_Sales_By_Pizza_Size:

pizza_size	Total_Sales	PCT_Total_Sales
L			375318.70	45.89
M			249382.25	30.49
S			178076.50	21.77
XL			14076.00	1.72
XXL			1006.60		0.12

 WHERE DATEPART(quarter,order_date)=1 ## it will apply on both querry and subquerry
*/

SELECT pizza_size,
       CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales,
       CAST(SUM(total_price) * 100 /
            (
                SELECT SUM(total_price) FROM pizza_sales
            ) AS DECIMAL(10, 2)) AS PCT_Total_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT_Total_Sales DESC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 /*05- Total_Pizzas_Sold_by_Pizza_Category:

 pizza_category	Total_Quantity_Sold
Classic			14888
Supreme			11987
Veggie			11649
Chicken			11050
*/
SELECT pizza_category,
       SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 /*06- Top_5_Best_Sallers_By_Total_Pizzas_Sold:

pizza_name					Total_Pizzas_Sold
The Classic Deluxe Pizza	2453
The Barbecue Chicken Pizza	2432
The Hawaiian Pizza			2422
The Pepperoni Pizza			2418
The Thai Chicken Pizza		2371
*/
SELECT TOP 5
    pizza_name,
    SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 /*06- Bottom_5_Best_Sallers_By_Total_Pizzas_Sold:

pizza_name					Total_Pizzas_Sold
The Brie Carre Pizza		490
The Mediterranean Pizza		934
The Calabrese Pizza			937
The Spinach Supreme Pizza	950
The Soppressata Pizza		961
*/
SELECT TOP 5
    pizza_name,
    SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold ASC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

/*
NOTE
If you want to apply the Month, Quarter, Week filters to the above queries you can use WHERE clause. Follow some of below examples
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date)

*Here MONTH(order_date) = 1 indicates that the output is for the month of January. MONTH(order_date) = 4 indicates output for Month of April.

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY DATENAME(DW, order_date)

*Here DATEPART(QUARTER, order_date) = 1 indicates that the output is for the Quarter 1. MONTH(order_date) = 3 indicates output for Quarter 3.

*/
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

SELECT * FROM pizza_sales;