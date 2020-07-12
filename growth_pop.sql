--determine the percentage increase from one year to the next:
SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
-- calculate growth_perc, 
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
FROM populations AS p1
-- Join to itself 
  INNER JOIN populations AS p2
-- Match on country code
    ON p1.country_code = p2.country_code
        -- and year (with calculation)
        AND p1.year = p2.year - 5;
-- note: growth_perc calculates the percentage population growth from 2010 to 2015 for each country



-- the relationship between the size of a country in terms of surface area and in terms of population:
SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
INTO pop_plus       
FROM populations
WHERE year = 2015;

SELECT name, continent, geosize_group, popsize_group
FROM countries_plus AS c
  INNER JOIN pop_plus as p
    -- Match on country code
    ON c.code= p.country_code  
ORDER BY geosize_group;

   
    
    
/* determining the top 10 capital cities in Europe and the Americas 
in terms of a calculated percentage using city_proper_pop and metroarea_pop in cities. */
SELECT 
	name, 
	country_code, 
	city_proper_pop, 
	metroarea_pop,  
-- Calculate city_perc
       city_proper_pop/ metroarea_pop * 100 AS city_perc
FROM cities
WHERE name IN
    (SELECT capital
     FROM countries
     WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
        AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;
