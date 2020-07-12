--which countries also have a city with the same name as their country name?
SELECT name
FROM countries
-- Set theory clause
	INTERSECT
SELECT name
FROM cities;

--Determine the names of capital cities that are not listed in the cities table.
SELECT capital
FROM countries
-- Set theory clause
	EXCEPT
SELECT name
FROM cities
ORDER BY capital;


--Identify the country codes that are included in either economies or currencies but not in populations
SELECT name, country_code
 FROM  cities AS c1
 WHERE country_code IN
	(SELECT e.code
   	 FROM economies AS e
    -- Get all additional (unique) values of the field from currencies AS c2  
    	UNION
    	SELECT c2.code
    	FROM currencies AS c2
    -- Exclude those appearing in populations AS p
    	EXCEPT
    	SELECT p.country_code
    	FROM populations AS p
	);
