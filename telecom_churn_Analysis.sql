

-- Total Customers  
SELECT COUNT(*) AS total_customers  
FROM telco_customers;  

-- Churn Customers  
SELECT COUNT(*) AS churn_customers  
FROM telco_customers  
WHERE Churn = 'Yes';  

-- Active Customers  
SELECT COUNT(*) AS active_customers  
FROM telco_customers  
WHERE Churn = 'No';  

-- Churn Rate  
SELECT   
COUNT(CASE WHEN Churn='Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate  
FROM telco_customers;  

-- Customers by Gender  
SELECT gender, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY gender;  

-- Customers by Senior Citizen  
SELECT SeniorCitizen, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY SeniorCitizen;  

-- Customers by Contract  
SELECT Contract, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY Contract  
ORDER BY customers DESC;  

-- Churn by Contract  
SELECT Contract,  
COUNT(*) AS customers,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY Contract;  

-- Customers by Payment Method  
SELECT PaymentMethod, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY PaymentMethod;  

-- Churn by Payment Method  
SELECT PaymentMethod,  
COUNT(*) AS customers,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY PaymentMethod;  

-- Customers by Internet Service  
SELECT InternetService, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY InternetService;  

-- Churn by Internet Service  
SELECT InternetService,  
COUNT(*) AS customers,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY InternetService;  

-- Total Revenue  
SELECT SUM(MonthlyCharges * tenure) AS total_revenue  
FROM telco_customers;  

-- Revenue by Contract  
SELECT Contract,  
SUM(MonthlyCharges * tenure) AS revenue  
FROM telco_customers  
GROUP BY Contract;  

-- Average Monthly Charges  
SELECT AVG(MonthlyCharges) AS avg_monthly_charges  
FROM telco_customers;  

-- Average Tenure  
SELECT AVG(tenure) AS avg_tenure  
FROM telco_customers;  

-- Customers by Tenure Group  
SELECT  
CASE  
WHEN tenure <= 6 THEN '0-6 Months'  
WHEN tenure <= 12 THEN '6-12 Months'  
WHEN tenure <= 24 THEN '1-2 Years'  
WHEN tenure <= 48 THEN '2-4 Years'  
ELSE '4+ Years'  
END AS tenure_group,  
COUNT(*) AS customers  
FROM telco_customers  
GROUP BY tenure_group;  

-- Churn by Tenure Group  
SELECT  
CASE  
WHEN tenure <= 6 THEN '0-6 Months'  
WHEN tenure <= 12 THEN '6-12 Months'  
WHEN tenure <= 24 THEN '1-2 Years'  
WHEN tenure <= 48 THEN '2-4 Years'  
ELSE '4+ Years'  
END AS tenure_group,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY tenure_group;  

-- Customers by Tech Support  
SELECT TechSupport, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY TechSupport;  

-- Churn by Tech Support  
SELECT TechSupport,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY TechSupport;  

-- Customers by Online Security  
SELECT OnlineSecurity, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY OnlineSecurity;  

-- Churn by Online Security  
SELECT OnlineSecurity,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY OnlineSecurity;  

-- Customers by Online Backup  
SELECT OnlineBackup, COUNT(*) AS customers  
FROM telco_customers  
GROUP BY OnlineBackup;  

-- Churn by Online Backup  
SELECT OnlineBackup,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers  
FROM telco_customers  
GROUP BY OnlineBackup;  

-- Revenue by Payment Method  
SELECT PaymentMethod,  
SUM(MonthlyCharges * tenure) AS revenue  
FROM telco_customers  
GROUP BY PaymentMethod;  

-- Average Revenue per Customer  
SELECT AVG(MonthlyCharges * tenure) AS avg_customer_revenue  
FROM telco_customers;  

-- High Revenue Customers  
SELECT customerID,  
MonthlyCharges * tenure AS revenue  
FROM telco_customers  
ORDER BY revenue DESC  
LIMIT 10;  

-- Low Tenure Customers  
SELECT *  
FROM telco_customers  
WHERE tenure < 6;  

-- High Risk Customers  
SELECT *  
FROM telco_customers  
WHERE Contract='Month-to-month'  
AND tenure < 12  
AND Churn='Yes';  

-- Churn Customers Revenue Risk  
SELECT  
SUM(MonthlyCharges * tenure) AS churn_revenue_risk  
FROM telco_customers  
WHERE Churn='Yes';


