# 📊 Mobile Recharge Plan Analysis

This SQL-based project analyzes recharge behavior across prepaid telecom plans offered by Jio, Airtel, Vi, and BSNL. Using structured customer and transaction data, it delivers insights into plan popularity, customer segmentation, and churn patterns—ideal for showcasing business-focused analytics skills.

## 📁 Project Files

- `schema.sql` – Table creation for `Customers` and `Recharges`
- `insert.sql` – Over 50 recharge transactions with repeated plan usage and varied customer behavior
- `queries.sql` – Analytical queries covering recharge trends, unique user counts, spending tiers, and churn indicators

## 🎯 Project Objectives

- Identify frequently used recharge plans and their user reach
- Segment customers based on spending patterns
- Detect inactive users and potential churn risks
- Interpret recharge trends using aggregations, filters, and conditional logic

## 🧠 SQL Techniques Demonstrated

- Joins (`INNER JOIN`)
- Aggregations (`GROUP BY`, `SUM`, `COUNT`, `DISTINCT`)
- Filtering (`HAVING`, `NOT IN`, `WHERE`)
- Conditional logic using `CASE`
- Query optimization for readable and insightful outputs

## 💡 Sample Insights

- The ₹239 Jio plan had the highest usage, favored by over 10 customers
- Spending tiers revealed 1 high spender with transactions above ₹1000
- Airtel’s ₹299 plan saw consistent usage across multiple regions
- Inactivity detected for 10 customers with no recharge in the last 20 days

## 🖼️ Screenshot Output Summary

- **Top Spenders**  
  Displays customers ranked by total recharge amount using `SUM(Amount)` grouped by name. Highlights high-value users for targeted promotions.

- **Recharge Spend by Age Group**  
  Categorizes spending based on customer age brackets, showing which age groups are more likely to recharge higher-value plans.

- **Churn Candidates/In Active Customers**  
  Flags customers who haven’t recharged for over 30 days using `DATEDIFF()` logic, useful for identifying potential churn or re-engagement targets.

📍 Built for data analyst portfolio · Powered by SQL Server · Bengaluru
