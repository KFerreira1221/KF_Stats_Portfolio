SELECT [Depression_Rate]
      ,[of_Internet_Users]
      ,[Alcohol_consumption_in_liters]
      ,[GDP_by_trillions_in_USD]
      ,[Avg_of_working_hours_annualy]
      ,[Unemployment_rate]
      ,[Life_expectancy]
      ,[Median_age]
      ,[Health_security_index]
      ,[Tertiary_school_enrollment]
      ,[Avg_Temperate_in_Celsius]
      ,[Region]
      ,[Development_Status]
      ,[Political_System]
  FROM [Portfolio].[dbo].[FIUProject]
order by 1,2

SELECT 
    MIN(Depression_Rate) AS Min_Depression_Rate,
    MAX(Depression_Rate) AS Max_Depression_Rate,
    AVG(Depression_Rate) AS Avg_Depression_Rate,
    STDEV(Depression_Rate) AS Std_Dev_Depression_Rate,
    MIN(of_Internet_Users) AS Min_of_Internet_Users,
    MAX(of_Internet_Users) AS Max_of_Internet_Users,
    AVG(of_Internet_Users) AS Avg_of_Internet_Users,
    STDEV(of_Internet_Users) AS Std_Dev_of_Internet_Users,
    MIN(Alcohol_consumption_in_liters) AS Min_Alcohol_Consumption,
    MAX(Alcohol_consumption_in_liters) AS Max_Alcohol_Consumption,
    AVG(Alcohol_consumption_in_liters) AS Avg_Alcohol_Consumption,
    STDEV(Alcohol_consumption_in_liters) AS Std_Dev_Alcohol_Consumption,
    MIN(GDP_by_trillions_in_USD) AS Min_GDP,
    MAX(GDP_by_trillions_in_USD) AS Max_GDP,
    AVG(GDP_by_trillions_in_USD) AS Avg_GDP,
    STDEV(GDP_by_trillions_in_USD) AS Std_Dev_GDP,
    MIN(Avg_of_working_hours_annualy) AS Min_Avg_Working_Hours,
    MAX(Avg_of_working_hours_annualy) AS Max_Avg_Working_Hours,
    AVG(Avg_of_working_hours_annualy) AS Avg_Avg_Working_Hours,
    STDEV(Avg_of_working_hours_annualy) AS Std_Dev_Avg_Working_Hours,
    MIN(Unemployment_rate) AS Min_Unemployment_Rate,
    MAX(Unemployment_rate) AS Max_Unemployment_Rate,
    AVG(Unemployment_rate) AS Avg_Unemployment_Rate,
    STDEV(Unemployment_rate) AS Std_Dev_Unemployment_Rate,
    MIN(Life_expectancy) AS Min_Life_Expectancy,
    MAX(Life_expectancy) AS Max_Life_Expectancy,
    AVG(Life_expectancy) AS Avg_Life_Expectancy,
    STDEV(Life_expectancy) AS Std_Dev_Life_Expectancy,
    MIN(Median_age) AS Min_Median_Age,
    MAX(Median_age) AS Max_Median_Age,
    AVG(Median_age) AS Avg_Median_Age,
    STDEV(Median_age) AS Std_Dev_Median_Age,
    MIN(Health_security_index) AS Min_Health_Security_Index,
    MAX(Health_security_index) AS Max_Health_Security_Index,
    AVG(Health_security_index) AS Avg_Health_Security_Index,
    STDEV(Health_security_index) AS Std_Dev_Health_Security_Index,
    MIN(Tertiary_school_enrollment) AS Min_Tertiary_Enrollment,
    MAX(Tertiary_school_enrollment) AS Max_Tertiary_Enrollment,
    AVG(Tertiary_school_enrollment) AS Avg_Tertiary_Enrollment,
    STDEV(Tertiary_school_enrollment) AS Std_Dev_Tertiary_Enrollment,
    MIN(Avg_Temperate_in_Celsius) AS Min_Avg_Temperature,
    MAX(Avg_Temperate_in_Celsius) AS Max_Avg_Temperature,
    AVG(Avg_Temperate_in_Celsius) AS Avg_Avg_Temperature,
    STDEV(Avg_Temperate_in_Celsius) AS Std_Dev_Avg_Temperature
FROM [Portfolio].[dbo].[FIUProject];

SELECT 
    'Depression_Rate' AS Column_Name,
    COUNT(*) - COUNT(Depression_Rate) AS Missing_Values
FROM 
    [Portfolio].[dbo].[FIUProject]
UNION ALL
SELECT 
    'of_Internet_Users' AS Column_Name,
    COUNT(*) - COUNT(of_Internet_Users) AS Missing_Values
FROM 
    [Portfolio].[dbo].[FIUProject]
UNION ALL
SELECT 
    'Alcohol_consumption_in_liters' AS Column_Name,
    COUNT(*) - COUNT(Alcohol_consumption_in_liters) AS Missing_Values
FROM 
    [Portfolio].[dbo].[FIUProject]