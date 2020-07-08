-- world.db

SELECT 'Hello, World';
SELECT 'Hello, World' AS Result;
SELECT * FROM Country;
SELECT * FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy AS "Life Expectancy" FROM Country ORDER BY Name;

-- Selecting Rows
SELECT Name, Continent, Region FROM Country;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe';
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name LIMIT 5;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name LIMIT 5 OFFSET 5;

-- Selecting Columns
SELECT * from Country;
SELECT Name, Continent, Region from Country;
SELECT Name AS Country, Continent, Region from Country;
SELECT Name AS Country, Region, Continent from Country;

-- Counting Rows
SELECT COUNT(*) FROM Country;
SELECT COUNT(*) FROM Country WHERE Population > 1000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000 AND Continent = 'Europe';

SELECT COUNT(*) FROM Country;
SELECT COUNT(LifeExpectancy) FROM Country;


-- Aggregate Data
SELECT COUNT(*) FROM Country;

SELECT Region, COUNT(*)
  FROM Country
  GROUP BY Region;

SELECT Region, COUNT(*) AS Count
  FROM Country
  GROUP BY Region
  ORDER BY Count DESC, Region;

-- Aggregate function
SELECT COUNT(*) FROM Country;
SELECT COUNT(Population) FROM Country;
SELECT AVG(Population) FROM Country;
SELECT Region, AVG(Population) FROM Country GROUP BY Region;
SELECT Region, MIN(Population), MAX(Population) FROM Country GROUP BY Region;
SELECT Region, SUM(Population) FROM Country GROUP BY Region;

-- DISTINCT Aggregates
SELECT COUNT(HeadOfState) FROM Country;
SELECT HeadOfState FROM Country ORDER BY HeadOfState;
SELECT COUNT(DISTINCT HeadOfState) FROM Country;

-- LENGTH
SELECT LENGTH('string');
SELECT Name, LENGTH(Name) AS Len FROM City ORDER BY Len DESC;
