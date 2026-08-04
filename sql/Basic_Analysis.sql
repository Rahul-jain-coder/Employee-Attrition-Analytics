SELECT COUNT(*) AS Total_Employees
FROM employee_attrition;

SELECT COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition = 'Yes';

SELECT
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM employee_attrition;

SELECT ROUND(AVG(Age),2) AS Average_Age
FROM employee_attrition;

SELECT ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Income
FROM employee_attrition;

SELECT
    Gender,
    COUNT(*) AS Employees
FROM employee_attrition
GROUP BY Gender;

SELECT
    Department,
    COUNT(*) AS Employees
FROM employee_attrition
GROUP BY Department
ORDER BY Employees DESC;

SELECT
    JobRole,
    COUNT(*) AS Employees
FROM employee_attrition
GROUP BY JobRole
ORDER BY Employees DESC;

SELECT
    MaritalStatus,
    COUNT(*) AS Employees
FROM employee_attrition
GROUP BY MaritalStatus;

SELECT
    OverTime,
    COUNT(*) AS Employees
FROM employee_attrition
GROUP BY OverTime;