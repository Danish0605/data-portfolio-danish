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

SELECT c.Name, MAX(r.Recharge_Date) AS LastRecharge,
       DATEDIFF(DAY, MAX(r.Recharge_Date), GETDATE()) AS DaysSinceLastRecharge
FROM Customers c
JOIN Recharges r ON c.Customer_ID = r.Customer_ID
GROUP BY c.Name
HAVING DATEDIFF(DAY, MAX(r.Recharge_Date), GETDATE()) > 20;

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

--7.Plan with high recharge count

SELECT Plan_Name, COUNT(*) AS Total_Use
FROM Recharges
GROUP BY Plan_Name
HAVING COUNT(*) > 3
ORDER BY Total_Use DESC;

--8.Spending Tier Classification

SELECT 
  Name,
  SUM(Amount) AS Total_Spend,
  CASE
    WHEN SUM(Amount) >= 1000 THEN 'High Spender'
    WHEN SUM(Amount) BETWEEN 500 AND 999 THEN 'Medium Spender'
    ELSE 'Low Spender'
  END AS Spend_Category
FROM Customers C
JOIN Recharges R ON C.Customer_ID = R.Customer_ID
GROUP BY Name
ORDER BY Total_Spend DESC;
