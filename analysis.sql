-- Introducing the final project
-- Email from the CEO:
-- Good morning!
-- Now that we've been in market for 3 years, we've generated enough growth to raise a much larger round of venture capital funding.
-- We're close to secure a large round from one of the best West Coast firms.
-- Objectives:
-- tell the story of your company's growth, using trneded performance data
-- use the database to explain how you're been able to product growth, by diving into channels and website optimizations
-- flex your analytical muscles so the VCs know your company is a serious data-driven shop

-- Q1: First, I'd like to show our volume growth. Can you pull overall session and order volume, trended by quarter for the life of the business? Since the most recent quarter is incomplete, you can decide how to handle it

SELECT YEAR(ws.created_at) AS yr, QUARTER(ws.created_at) AS quarter, 
COUNT(DISTINCT ws.website_session_id) AS sessions, COUNT(DISTINCT o.order_id) AS orders,  
COUNT(DISTINCT o.order_id) / COUNT(DISTINCT ws.website_session_id) AS session_to_order_cvr
FROM website_sessions ws LEFT JOIN orders o ON ws.website_session_id = o.website_session_id
GROUP BY 1, 2;

-- based on the results, we can see that our session volume and order volume have been increasing, with increasing session to order conversion rate (.05 more) compared to when we first started.

-- Q2: Next, let's showcase all of our efficiency improvements. I would love to show quarterly figures since we launched, for session-to-order conversion rate, revenue per order, and revenue per session.

SELECT YEAR(ws.created_at) AS yr, QUARTER(ws.created_at) AS quarter,
COUNT(DISTINCT o.order_id) / COUNT(DISTINCT ws.website_session_id) AS session_to_order_cvr,
SUM(price_usd) / COUNT(DISTINCT o.order_id) as revenue_per_order,
SUM(price_usd) / COUNT(DISTINCT ws.website_session_id) AS revenue_per_session
FROM website_sessions ws LEFT JOIN orders o ON ws.website_session_id = o.website_session_id
GROUP BY 1, 2;

-- both revenue per order and revenue per session have increased 2x since when we first launched (1.5 -> 5.3 revenue per session).


-- Q3: I'd like to show how we've grown specific channels. Could you pull a quarterly view of orders from Gsearch nonbrand, Bsearch nonbrand, brand serach overall, organic search, and direct type-in?
-- utm_source = 'gsearch' AND utm_campaign = 'nonbrand' - Gsearch nonbrand
-- utm_source = 'bsearch' AND utm_campaign = 'nonbrand' - Bsearch nonbrand
-- utm_source IN ('gsearch', 'bsearch') AND utm_campaign = 'brand' -  brand serach overall
-- utm_source IS NULL AND http_referer IS NOT NULL - organic search
-- utm_source IS NULL AND http_referer IS NULL - direct type in

SELECT CASE WHEN utm_source = 'gsearch' AND utm_campaign = 'nonbrand' THEN 'gsearch_nonbrand'
			WHEN utm_source = 'bsearch' AND utm_campaign = 'nonbrand' THEN 'bsearch_nonbrand'
            WHEN utm_source IN ('gsearch', 'bsearch') AND utm_campaign = 'brand' THEN 'brand_overall'
            WHEN utm_source IS NULL AND http_referer IS NOT NULL THEN 'organic_search'
            WHEN utm_source IS NULL AND http_referer IS NULL THEN 'direct_type_in'
	ELSE NULL END AS channels,
COUNT(DISTINCT order_id) AS orders
FROM website_sessions ws INNER JOIN orders o ON ws.website_session_id = o.website_session_id
GROUP BY 1
ORDER BY 2 DESC;

-- received the most order from the gserach nonbrand channel


-- Q4: Next, let's show the overall session-to-order voncersion rate trends for those same channels, by quarter. Please also make a note of any periods where we made major improvements or optimizations.

WITH channel_table AS (
	SELECT *,
	CASE WHEN utm_source = 'gsearch' AND utm_campaign = 'nonbrand' THEN 'gsearch_nonbrand'
				WHEN utm_source = 'bsearch' AND utm_campaign = 'nonbrand' THEN 'bsearch_nonbrand'
				WHEN utm_source IN ('gsearch', 'bsearch') AND utm_campaign = 'brand' THEN 'brand_overall'
				WHEN utm_source IS NULL AND http_referer IS NOT NULL THEN 'organic_search'
				WHEN utm_source IS NULL AND http_referer IS NULL THEN 'direct_type_in'
	ELSE NULL END AS channels
	FROM website_sessions
)

-- bsearch started in '2012-03-27'
-- brand campaign started in '2012-03-25'

SELECT YEAR(c.created_at) AS yr, QUARTER(c.created_at) AS quarter,
COUNT(DISTINCT CASE WHEN channels =  'gsearch_nonbrand' THEN order_id ELSE NULL END) / COUNT(DISTINCT CASE WHEN channels =  'gsearch_nonbrand' THEN c.website_session_id ELSE NULL END) AS gsearch_nonbrand_cvr,
COUNT(DISTINCT CASE WHEN channels =  'bsearch_nonbrand' THEN order_id ELSE NULL END)  / COUNT(DISTINCT CASE WHEN channels =  'bsearch_nonbrand' THEN c.website_session_id ELSE NULL END) AS bsearch_nonbrand_cvr,
COUNT(DISTINCT CASE WHEN channels =  'brand_overall' THEN order_id ELSE NULL END) / COUNT(DISTINCT CASE WHEN channels =  'brand_overall' THEN c.website_session_id ELSE NULL END) AS brand_overall_cvr,
COUNT(DISTINCT CASE WHEN channels =  'organic_search' THEN order_id ELSE NULL END) / COUNT(DISTINCT CASE WHEN channels =  'organic_search' THEN c.website_session_id ELSE NULL END) AS organic_search_cvr,
COUNT(DISTINCT CASE WHEN channels =  'direct_type_in' THEN order_id ELSE NULL END) / COUNT(DISTINCT CASE WHEN channels =  'direct_type_in' THEN c.website_session_id ELSE NULL END) AS direct_type_in_cvr
FROM channel_table c LEFT JOIN orders o ON c.website_session_id = o.website_session_id
GROUP BY 1, 2;

-- better session-to-order conversion rate in recent year and quarters, especially for organic search and direct type in
-- the business has begun to depend much less on paid nonbrand and is starting to really build its own brand organic and direct type in traffic, which as better margin

-- Q5: We've come a long way since the days of selling a single product. Let's pull monthly trends for recenue and margin by product, along with total sales and revenue. Note anything you notice about seasonality
-- margine: revenue - cost
-- selling 4 products at the end
-- CREATE A PRODUCT TABLE

WITH product_table AS (
SELECT *, 
CASE WHEN product_id = 1 THEN 'product1' WHEN product_id = 2 THEN 'product2' WHEN product_id = 3 THEN 'product3' WHEN product_id = 4 THEN 'product4' ELSE NULL END AS products
FROM order_items)
SELECT YEAR(created_at) AS yr, MONTH(created_at) AS mo, 
COUNT(DISTINCT CASE WHEN products = 'product1' THEN order_id ELSE NULL END) AS product_1_orders,
COUNT(DISTINCT CASE WHEN products = 'product2' THEN order_id ELSE NULL END) AS product_2_orders,
COUNT(DISTINCT CASE WHEN products = 'product3' THEN order_id ELSE NULL END) AS product_3_orders,
COUNT(DISTINCT CASE WHEN products = 'product4' THEN order_id ELSE NULL END) AS product_4_orders,
SUM(CASE WHEN products = 'product1' THEN price_usd ELSE NULL END) AS product_1_revenue,
SUM(CASE WHEN products = 'product2' THEN price_usd ELSE NULL END) AS product_2_revenue,
SUM(CASE WHEN products = 'product3' THEN price_usd ELSE NULL END) AS product_3_revenue,
SUM(CASE WHEN products = 'product4' THEN price_usd ELSE NULL END) AS product_4_revenue,
SUM(CASE WHEN products = 'product1' THEN price_usd - cogs_usd ELSE NULL END) AS product_1_margin,
SUM(CASE WHEN products = 'product1' THEN price_usd - cogs_usd ELSE NULL END) AS product_2_margin,
SUM(CASE WHEN products = 'product1' THEN price_usd - cogs_usd ELSE NULL END) AS product_3_margin,
SUM(CASE WHEN products = 'product1' THEN price_usd - cogs_usd ELSE NULL END) AS product_4_margin,
SUM(price_usd) AS total_revenue, SUM(price_usd - cogs_usd) AS total_margin
FROM product_table
GROUP BY 1, 2;

-- Nov and Dec are high sale months for our product 1 (mrfuzzy), holiday season
-- Feb for product 2 (love bear) --> Valentine's Day
-- end of the year has better sale for product 3 (birthday bear), same for product 4 (mini bear)


-- Q6: Let's dive deeper into the impact of introducing new products. Please pull monthly sessions to the /products page, and how how the % of those sessions clicking through another page has changed over time,
-- along with a view of how conversion from /products to placing an order has improved
-- first page = '/products'

WITH first_productpage AS (
SELECT created_at, website_session_id, MIN(website_pageview_id) AS first_pageview
FROM website_pageviews
WHERE pageview_url = '/products'
GROUP BY 1, 2
),
repeat_pageviews AS (
SELECT wp.website_session_id, website_pageview_id AS repeat_pageview, first_pageview
FROM website_pageviews wp INNER JOIN first_productpage f ON wp.website_session_id = f.website_session_id AND wp.website_pageview_id > first_pageview
)

SELECT YEAR(f.created_at) AS yr, MONTH(f.created_at) AS mo, 
	COUNT(DISTINCT r.website_session_id ) / COUNT(DISTINCT f.website_session_id) AS ctr,
    COUNT(DISTINCT order_id) / COUNT(DISTINCT f.website_session_id) AS product_to_order_cvr
FROM first_productpage f LEFT JOIN repeat_pageviews r ON f.website_session_id = r.website_session_id
LEFT JOIN orders o ON f.website_session_id = o.website_session_id
GROUP BY 1, 2;

-- click through rate has been improving (0.713 -> 0.856) and products to order conversion rate has been improved by 72%


-- Q7: We made our 4th product available as a primary product on December 05, 2014 (it was previously only a cross-sell item). 
-- Could you please pull sales data since then, and show how well each product cross-sells from one another?
-- primary item: is_primary_item = 1, cross-sell: is_primary_item = 0

SELECT primary_product_id, COUNT(DISTINCT o.order_id) AS total_orders,
SUM(CASE WHEN product_id = 1 THEN 1 ELSE 0 END) AS product1_cross_sell,
SUM(CASE WHEN product_id = 2 THEN 1 ELSE 0 END) AS product2_cross_sell,
SUM(CASE WHEN product_id = 3 THEN 1 ELSE 0 END) AS product3_cross_sell,
SUM(CASE WHEN product_id = 4 THEN 1 ELSE 0 END) AS product4_cross_sell,
SUM(CASE WHEN product_id = 1 THEN 1 ELSE 0 END) / COUNT(DISTINCT o.order_id) AS product1_cross_sell_rt,
SUM(CASE WHEN product_id = 2 THEN 1 ELSE 0 END) / COUNT(DISTINCT o.order_id) AS product2_cross_sell_rt,
SUM(CASE WHEN product_id = 3 THEN 1 ELSE 0 END) / COUNT(DISTINCT o.order_id) AS product3_cross_sell_rt,
SUM(CASE WHEN product_id = 4 THEN 1 ELSE 0 END) / COUNT(DISTINCT o.order_id) AS product4_cross_sell_rt
FROM orders o left join order_items oi ON o.order_id = oi.order_id AND is_primary_item = 0 -- cross-sold used during ON because if during WHERE then it excluded all orders that don't have cross-sell items
WHERE o.created_at >= '2014-12-05'
GROUP BY 1;

-- cross-sell rate is much higher for product 4 with all other products
-- adding product 4 is a good decision


-- Q8: In addition to telling investors about what we've already achieved, let's show them that we still haven plenty of gas in the tank. Based on all the analysis you've done, 
-- could you share some recommendations and opportunities for us going forward?

-- e.g., can add products that are similar to product 4 since it's cross-sold very well with other products and can drive the overall order price higher
