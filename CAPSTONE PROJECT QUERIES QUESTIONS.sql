--QUESTION 1
--Top 10 Sales Rep with highest revenue 
SELECT s.name AS Sales_Rep, SUM(o.total_amt_usd) AS Total_Sales
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o 
ON a.id = o.account_id
GROUP BY s.name
ORDER BY Total_Sales DESC
LIMIT 10;

--Thought Process
--Understanding which sales representatives generate the most revenue allows for
--incentive programs and targeted training.

--Insight: 
--Evaluates the performance of individual sales representatives, 
--identifying top performers and areas for improvement in sales training and motivation.
--Disparity among sales reps may indicate training or lead distribution issues.

--Recommendation
--Reward top performers and provide additional training to underperforming reps.


--QUESTION 2
--Top 5 Accounts by Total Revenue
SELECT name, SUM(o.total_amt_usd) AS Total_Revenue 
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.name
ORDER BY Total_Revenue DESC
LIMIT 5;

--Thought Process
--Identifying high-value customers enables personalized marketing, 
--loyalty programs, and relationship management.

--Insight
--Identifies the top revenue-generating accounts, 
--allowing for targeted customer relationship management and potential for upselling/cross-selling.
--Personalized discounts or exclusive offers may further increase retention.

--Recommendation
--Implement targeted promotions and VIP programs for high-spending customers.


--QUESTION 3
-- Average Order Value per Account
SELECT a.name AS Account_Name, AVG(o.total_amt_usd) AS Avg_Order_Value
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.name
ORDER BY Avg_Order_Value;

--Thought Process
--Measuring how many orders an account places on average helps identify purchasing patterns.

--Insights
--Some accounts place significantly more orders than others.
--Identifying high-order and low-order accounts can help target them with re-engagement efforts.
-- indicating potential for larger and more profitable transactions.

--Recommendation
--Encourage low-order accounts to increase their purchase frequency through incentives, 
--bulk discounts, or personalized outreach.


--QUESTION 4
-- Account Growth Over Time
SELECT DATE_TRUNC('year', o.occurred_at) AS Year, 
COUNT(DISTINCT a.id) AS New_Accounts
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY Year
ORDER BY Year;

--Thought Process 
--Tracking the number of new accounts created over time provides 
--insights into business growth and customer acquisition effectiveness.

--Insights
--Steady account growth indicates successful customer acquisition strategies.
--A slowdown in growth may highlight the need for enhanced marketing efforts.

--Recommendation
--Invest in targeted marketing campaigns, referral programs, 
--and improved onboarding experiences to maintain and accelerate account growth.


--QUESTION 5
--Sales Trends Over Time
SELECT DATE_TRUNC('month', o.occurred_at) AS Order_Month, 
SUM(o.total_amt_usd) AS Total_Sales
FROM orders o
GROUP BY Order_Month
ORDER BY Order_Month;

--Thought Process
--Understanding how sales evolve over time helps with forecasting and strategic planning.

--Insights
--Sales may peak during specific periods, highlighting seasonal trends.
--A decline over time could indicate market saturation or competitive pressure.
--and potential areas for improvement in sales forecasting.

--Recommendation
--Develop targeted sales strategies to sustain growth and mitigate downturns.


--QUESTION 6
-- 10 Most Active Customers
SELECT a.name AS Account_Name, 
COUNT(o.account_id) AS Order_Count
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.name
ORDER BY Order_Count DESC
LIMIT 10;

--Thought Process
--Identifying the most frequent buyers helps in loyalty and retention strategies.

--Insights
--A small percentage of customers may contribute to a large portion of transactions.
--Engaging these customers can improve long-term revenue stability.

--Recommendation
--Implement reward programs and exclusive deals to sustain engagem



--QUESTION 7
---which region had the highest and lowest revenue?
SELECT region.name AS region_name, SUM(orders.total_amt_usd) AS total_revenue
FROM region
JOIN sales_reps
ON region.id = sales_reps.region_id
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id
GROUP BY region_name
ORDER BY total_revenue DESC;

--Thought Process
--Understanding regional performance helps in optimizing resource allocation.

--Insights
--The region with the highest revenue indicates strong customer demand and market penetration.
--The region with the lowest revenue may indicate untapped opportunities or operational inefficiencies.

--Recommendation
--Increase investment in high-performing regions to maximize revenue potential while 
--analyzing the challenges in the lowest-performing region to implement strategies for improvement, 
--such as localized marketing, better supply chain management, or targeted promotions.



--QUESTION 8
--Sales Rep Performance by Number of Accounts
SELECT s.name AS Sales_Rep, 
COUNT(DISTINCT a.id) AS Number_of_Accounts
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY Number_of_Accounts DESC;

--Thought Process
--Analyzing how many accounts each sales rep manages helps optimize workloads and efficiency.

--Insights
--Some reps may handle disproportionately large or small account loads.
--Performance may correlate with account distribution.
--Evaluates sales rep performance based on the number of accounts they manage.

--Recommendation 
--Balance account distribution for improved efficiency and productivity.


--QUESTION 9
-- Generate the effectiveness of different marketing channels
SELECT w.channel, COUNT(*) as event_count
FROM web_events w
GROUP BY w.channel
ORDER BY event_count DESC;

--Thought Process
--Measuring ROI on marketing efforts enables budget optimization.

--Insights
--helps identify the most effective marketing channels.
--Certain channels drive more conversions than others.
--Underperforming channels may need reallocation or strategy revision.

--Recommendation
--Increase investment in high-performing channels and revamp underperforming ones.


--QUESTION 10
-- Which product has the highest and lowest sales
SELECT SUM(standard_amt_usd)AS standard_sales,
	   SUM(gloss_amt_usd)AS gloss_sales,
	   SUM(poster_amt_usd)AS poster_sales
FROM orders


--Thought Process
--Identifying best and worst-selling products informs stock and marketing decisions.

--Insights
--Determines the sales contribution of each paper type,
--aiding in inventory management and product development decisions.
--Best sellers may indicate core product strengths.
--Poor sellers may require reevaluation or promotional support.

--Recommendation
--Adjust stock levels and marketing focus accordingly.

