SELECT
    Department,
    COUNT(*) AS Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;

SELECT
    JobRole,
    COUNT(*) AS Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

SELECT
    Department,
    ROUND(AVG(MonthlyIncome),0) AS Avg_Monthly_Income
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),0) AS Avg_Monthly_Income
FROM employee_attrition
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;

SELECT
    OverTime,
    COUNT(*) AS Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY OverTime;

SELECT
    Gender,
    COUNT(*) AS Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY Gender;

SELECT
    MaritalStatus,
    COUNT(*) AS Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
        COUNT(*),2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY MaritalStatus;

SELECT
    Attrition,
    ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM employee_attrition
GROUP BY Attrition;

SELECT
    Attrition,
    ROUND(AVG(Age),2) AS Avg_Age
FROM employee_attrition
GROUP BY Attrition;

SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;

SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome
LIMIT 10;

SELECT
    Department,
    ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Job_Satisfaction DESC;

SELECT
    Department,
    ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLife_Balance
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_WorkLife_Balance DESC;

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    YearsAtCompany
FROM employee_attrition
WHERE YearsAtCompany > 10
ORDER BY YearsAtCompany DESC;

SELECT
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
    WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN 'High'
    ELSE 'Very High'
END AS Salary_Group,
COUNT(*) AS Employees
FROM employee_attrition
GROUP BY Salary_Group;