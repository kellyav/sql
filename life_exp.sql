--which countries had high average life expectancies (at the country level) in 2015.
SELECT *
  FROM populations
WHERE life_expectancy >
  -- 1.15 * subquery
  1.15 * (SELECT AVG(life_expectancy)
   		FROM populations
   		WHERE year = 2015) AND
  	year = 2015;
    
    
 
--In terms of life expectancy for 2010, determine the names of the lowest five countries and their regions
SELECT c.name AS country, region, p.life_expectancy AS life_exp
FROM countries AS c
  LEFT JOIN populations as p
    -- Match on country code
    ON p.country_code= c.code
WHERE year=2010
ORDER BY life_exp
LIMIT 5;
