select * from Customers;
select * from Recharges;

--1.Most Popular Recharge Plans

SELECT Plan_Name, COUNT(*) AS Total_Recharges
FROM Recharges
GROUP BY Plan_Name

--2.City-Wise Recharge Distribution

SELECT C.City, COUNT(R.Recharge_ID) AS Total_Recharges
FROM Customers C
INNER JOIN Recharges R ON C.Customer_ID = R.Customer_ID
GROUP BY C.City
ORDER BY Total_Recharges DESC;

--3.Top Spending Customers

SELECT C.NAME, SUM(R.AMOUNT) AS TOP_SPENDERS FROM Customers C
INNER JOIN Recharges R ON C.Customer_ID = R.Customer_ID
GROUP BY C.Name
ORDER BY TOP_SPENDERS DESC;

--4.In Active Customers 

SELECT Name
FROM Customers
WHERE Customer_ID NOT IN (
    SELECT Customer_ID FROM Recharges WHERE Recharge_Date >= '2025-06-01'
);

--5.Recharge Spent By Age Group

SELECT 
  CASE
    WHEN Age < 25 THEN 'Below 25'
    WHEN Age BETWEEN 25 AND 30 THEN '25–30'
    ELSE 'Above 30'
  END AS Age_Group,
  AVG(Amount) AS Avg_Spend
FROM Customers C
JOIN Recharges R ON C.Customer_ID = R.Customer_ID
GROUP BY 
  CASE
    WHEN Age < 25 THEN 'Below 25'
    WHEN Age BETWEEN 25 AND 30 THEN '25–30'
    ELSE 'Above 30'
  END;

--6.Unique customers by Plan

SELECT 
  C.Name,
  R.Plan_Name,
  COUNT(DISTINCT R.Customer_ID) AS Unique_Users
FROM Recharges R
JOIN Customers C ON R.Customer_ID = C.Customer_ID
GROUP BY C.Name, R.Plan_Name
ORDER BY Unique_Users DESC;
