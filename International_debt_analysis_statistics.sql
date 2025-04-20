-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- num_distinct_countries 
--SELECT *
--FROM international_debt
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

-- highest_debt_country 
SELECT 
	country_name,
	SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;


-- lowest_principal_repayment 
SELECT country_name, indicator_name, MIN(debt) AS lowest_repayment
FROM international_debt
WHERE indicator_code = 'DT.AMT.DLXF.CD'
GROUP BY country_name, indicator_name
ORDER BY lowest_repayment ASC
LIMIT 1;