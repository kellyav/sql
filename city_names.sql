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
