--determine the number of languages spoken for each country, identified by the country's local name!
SELECT local_name, subquery.lang_num
  FROM countries,
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  WHERE countries.code = subquery.code
ORDER BY lang_num DESC;

--identify languages spoken in the Middle East.
SELECT DISTINCT name
  FROM languages
WHERE code IN
  	(SELECT code 
   	FROM countries
   	WHERE region= 'Middle East')
ORDER BY name;



--explore languages potentially and most frequently spoken in the cities of Hyderabad, India and Hyderabad, Pakistan.
SELECT l.name AS language, c.name AS city
FROM cities AS c      
  INNER JOIN languages AS l 
    ON c.country_code = l.code
-- c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';
