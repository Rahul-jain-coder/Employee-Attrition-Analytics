CREATE VIEW Employee_Summary AS
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    Gender,
    Attrition,
    MonthlyIncome,
    YearsAtCompany,
    JobSatisfaction,
    WorkLifeBalance
FROM employee_attrition;

SELECT * FROM Employee_Summary;

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    RANK() OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Salary_Rank
FROM employee_attrition;

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    DENSE_RANK() OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Salary_Rank
FROM employee_attrition;

SELECT
    EmployeeNumber,
    Department,
    ROW_NUMBER() OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Employee_No
FROM employee_attrition;

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    SUM(MonthlyIncome) OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome
    ) AS Running_Total
FROM employee_attrition;

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    ROUND(
        AVG(MonthlyIncome) OVER(
            PARTITION BY Department
        ),0
    ) AS Department_Average
FROM employee_attrition;

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    ROUND(
        AVG(MonthlyIncome) OVER(PARTITION BY Department),0
    ) AS Department_Average,
    MonthlyIncome -
    ROUND(
        AVG(MonthlyIncome) OVER(PARTITION BY Department),0
    ) AS Difference
FROM employee_attrition;


SELECT
    Department,
    ROUND(AVG(MonthlyIncome),0) AS AvgSalary
FROM employee_attrition
GROUP BY Department
ORDER BY AvgSalary DESC;

SELECT
    JobRole,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AttritionCount
FROM employee_attrition
GROUP BY JobRole
ORDER BY AttritionCount DESC;

SELECT
    OverTime,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AttritionCount,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/
        COUNT(*),2
    ) AttritionRate
FROM employee_attrition
GROUP BY OverTime;

SELECT
    Attrition,
    ROUND(AVG(JobSatisfaction),2) AvgJobSatisfaction
FROM employee_attrition
GROUP BY Attrition;

SELECT
    YearsAtCompany,
    ROUND(AVG(MonthlyIncome),0) AvgSalary
FROM employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

SELECT *
FROM (
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        ROW_NUMBER() OVER(
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS rn
    FROM employee_attrition
) t
WHERE rn <= 5;

SELECT *
FROM (
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        AVG(MonthlyIncome) OVER(
            PARTITION BY Department
        ) AS AvgDeptSalary
    FROM employee_attrition
) t
WHERE MonthlyIncome > AvgDeptSalary;

SELECT
    EmployeeNumber,
    MonthlyIncome,
    NTILE(4) OVER(
        ORDER BY MonthlyIncome
    ) AS SalaryQuartile
FROM employee_attrition;