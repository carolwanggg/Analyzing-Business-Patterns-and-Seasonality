use mavenfuzzyfactory;
SELECT YEAR(website_sessions.created_at) AS yr, 
       MONTH(website_sessions.created_at) AS mo, 
       COUNT(distinct website_sessions.website_session_id) AS sessions,
       COUNT(distinct orders.order_id) AS orders
FROM website_sessions 
LEFT JOIN orders 
ON website_sessions.website_session_id=orders.website_session_id 
WHERE website_sessions.created_at<'2013-01-01'
GROUP BY 1,2;
