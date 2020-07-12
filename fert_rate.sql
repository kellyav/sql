--calculate the average fertility rate for each region in 2015.
SELECT 
	region, 
	continent, 
	AVG(fertility_rate) AS avg_fert_rate
FROM populations AS p
INNER JOIN countries AS c
      ON c.code = p.country_code
WHERE year = 2015
GROUP BY region, continent
ORDER BY avg_fert_rate;


--for each country, get the country name, its region, and the fertility rate and unemployment rate for both 2010 and 2015.
SELECT code, name, region, year, fertility_rate
  FROM countries AS c
  -- Join with populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code;

--bigger, more detailed version of the query, inner joined to economies also:
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  FROM countries AS c
  INNER JOIN populations AS p
    ON c.code = p.country_code
  -- Join to economies (as e)
  INNER JOIN economies AS e
    -- Match on country code and year
    ON c.code= e.code AND e.year= p.year;
