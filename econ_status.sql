
--determine the average gross domestic product (GDP) per capita by region in 2010.
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries as c
  LEFT JOIN economies AS e
    -- Match on code fields
    ON c.code = e.code
WHERE year=2010
GROUP BY region
ORDER BY avg_gdp DESC;



--identify the currencies used in Oceanian countries!
SELECT code, continent, name
  FROM countries
  WHERE continent= 'Oceania'
  	-- And code not in
  	AND code NOT IN 
  	-- Subquery
  	(SELECT code
  	 FROM currencies);



--for each of the six continents listed in 2015, you'll identify which country had the maximum inflation rate (and how high it was)
SELECT name, continent, inflation_rate
FROM countries
INNER JOIN economies
-- Match on code
	ON countries.code= economies.code
WHERE year = 2015
--  inflation rate subquery (aliased as subquery)
     AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code= economies.code
             WHERE year = 2015) AS subquery
        GROUP BY continent);

--2015 economic data for countries that do not have  gov_form of 'Constitutional Monarchy' or 'Republic' in their gov_form.
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 AND code NOT  IN
  	(SELECT code
  	 FROM countries
  	 WHERE (gov_form = 'Constitutional Monarchy' 
		OR gov_form LIKE '%Republic%'))
ORDER BY inflation_rate ;


--get the country names and other 2015 data in the economies table and the countries table for Central American countries with an official language.
SELECT DISTINCT name, total_investment, imports
FROM countries AS c
LEFT JOIN economies AS e
 -- Match on code
      ON (c.code = e.code
-- and code in Subquery
        AND c.code IN (
          	SELECT  l.code
          	FROM languages AS l
          	WHERE official= 'true'
       		 ) )
  WHERE region = 'Central America' AND year = 2015
ORDER BY name;
