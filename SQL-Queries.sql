/*
------------------------------
SQL Project - DotDash Analysis
------------------------------
*/

-- 1) What are the quarterly trends for order count, sales, and AOV for Macbooks sold in North America across all years? 
    -- Tables: orders, customers, geo_lookup
    -- Columns: quarters per year, COUNT(order id), SUM(usd_price) & AVG(usd_price)
    -- Filter: WHERE product_name LIKE 'Macbook%' AND region = 'NA'
    -- THEN wrap the above in a CTE & take the average to produce 1 final row 

WITH quarterly_trends AS (
SELECT
  DATE_TRUNC(orders.purchase_ts, quarter) AS quarters,
  COUNT(DISTINCT orders.id) AS order_count,
  ROUND(SUM(orders.usd_price), 2) AS total_sales,
  ROUND(AVG(usd_price), 2) AS aov
FROM `core.orders` orders
LEFT JOIN `core.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `core.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE orders.product_name LIKE 'Macbook%' AND geo_lookup.region = 'NA'
GROUP BY 1
ORDER BY 1
)

SELECT
  ROUND(AVG(order_count), 2) AS avg_order_count,
  ROUND(AVG(total_sales), 2) AS avg_sales,
  ROUND(AVG(aov), 2) AS avg_aov
FROM quarterly_trends
;





-- 2) For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 
    -- Use tables order_status, orders, customers & geo_lookup
    -- Return the region with the highest AVG(delivery_ts - ship_ts)
    -- Filter for 1) orders in 2022 on the website OR 2) orders placed on mobile (all years)

SELECT
  region,
  ROUND(AVG(DATE_DIFF(delivery_ts, order_status.purchase_ts, day)), 2) AS avg_time_to_deliver,
FROM `core.order_status` order_status
LEFT JOIN `core.orders` orders
  ON order_status.order_id = orders.id
LEFT JOIN `core.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `core.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE purchase_platform = 'mobile app' OR (purchase_platform = 'website' AND EXTRACT(year from order_status.purchase_ts) = 2022)
GROUP BY 1
ORDER BY 2 DESC; 
-- EMEA has the highest avg time to deliver at 7.54 days. (didn't initally use purchase_ts in date_dif --> used ship_ts)

-- Overall average delivery time
  -- Take an aggregate of an aggregate - put query above in CTE and take the average.
WITH avg_delivery_time AS (
SELECT
  region,
  ROUND(AVG(DATE_DIFF(delivery_ts, order_status.purchase_ts, day)), 2) AS avg_time_to_deliver,
FROM `core.order_status` order_status
LEFT JOIN `core.orders` orders
  ON order_status.order_id = orders.id
LEFT JOIN `core.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `core.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE purchase_platform = 'mobile app' OR (purchase_platform = 'website' AND EXTRACT(year from order_status.purchase_ts) = 2022)
GROUP BY 1
)

SELECT 
  AVG(avg_time_to_deliver) AS avg_delivery_time
FROM avg_delivery_time;





-- 3) Are there certain products that are getting refunded more frequently than others? 
    -- Find the refund rate per product_name (use AVG for rates)
    -- Use the order_status & orders tables

SELECT
  CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS product_name_cleaned,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds,
  ROUND(AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END)*100, 2) AS refund_rate
FROM `core.order_status` order_status
JOIN `core.orders` orders
  ON order_status.order_id = orders.id
GROUP BY 1
Order By 3 DESC;
-- Both Laptops (ThinkPad & Macbook) were refunded at higher rates than other items (11.73% & 11.43%). Compared to the iPhone which has a 7.64% refund rate.





-- 4) Within each region, what is the most popular product?
    -- Join all tables to return region and count of order (total orders of each product = most popular)
    -- Rank the products by count in each region and return the top selling product

WITH reg_product_count AS (
SELECT
  geo_lookup.region AS region,
  CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS product_name_cleaned,
  COUNT(DISTINCT orders.id) AS order_count
FROM `core.orders` orders
LEFT JOIN `core.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `core.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
GROUP BY 1,2
ORDER BY 1, 3 DESC
)

SELECT 
  region,
  product_name_cleaned,
  order_count,
  ROW_NUMBER() OVER(PARTITION BY region ORDER BY order_count DESC) AS row_num
FROM reg_product_count
QUALIFY ROW_NUMBER() OVER(PARTITION BY region ORDER BY order_count DESC) = 1
ORDER BY 1;
-- Across all regions, Apple Airpods are the most popular product based on the volume ordered.





-- 5) Which marketing channel has the highest average signup rate for the loyalty program, and how does this compare to the channel that has the highest number of loyalty program participants? 
    -- Use customers table
    -- Return:
        -- marketing_channel,
        -- Count of loyalty_program participants = SUM(loyalty_program)
        -- Average signup rate for loyalty program = AVG(loyalty_program)

SELECT
  marketing_channel,
  SUM(loyalty_program) AS loyalty_count,
  ROUND(AVG(loyalty_program)*100, 2) AS signup_rate
FROM core.customers
GROUP BY 1
ORDER BY 3 DESC
;
-- Highest # of loyalty participants: Direct channel (23,309) | signup rate: 40.38%
-- Highest avg signup rate: Email channel (7,858) | 58.83% (unknown channel is actually the highest at 78.43% with 40 count)

