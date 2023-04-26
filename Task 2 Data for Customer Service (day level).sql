use mavenfuzzyfactory;

SELECT hr, 
	    ROUND(AVG(CASE WHEN wkday=0 then website_sessions else null end),1) AS mon,
      ROUND(AVG(CASE WHEN wkday=1 then website_sessions else null end),1) AS tue,
      ROUND(AVG(CASE WHEN wkday=2 then website_sessions else null end),1) AS wed,
      ROUND(AVG(CASE WHEN wkday=3 then website_sessions else null end),1) AS thu,
      ROUND(AVG(CASE WHEN wkday=4 then website_sessions else null end),1) AS frk,
      ROUND(AVG(CASE WHEN wkday=5 then website_sessions else null end),1) AS sat,
      ROUND(AVG(CASE WHEN wkday=6 then website_sessions else null end),1) AS sun
FROM(
SELECT DATE(created_at) AS created_date, 
       WEEKDAY(created_at) AS wkday,hour(created_at) AS hr,
       COUNT(distinct website_session_id) AS website_sessions
FROM website_sessions
WHERE created_at BETWEEN '2012-09-15' AND '2012-11-15'
GROUP BY 1,2,3) daily_hourly_sessions
GROUP BY hr
