%%sql

/* people database

lets get a feel for the database */


-- see the database
SELECT * from people;


-- the database itself:
SELECT COUNT(*) FROM people


--count the number of non-missing values in the people column
SELECT COUNT(*) FROM people

--Get the names of people who are still alive
SELECT name
FROM people
WHERE deathdate IS NULL;

--Get the names of all people whose names begin with 'B'.
SELECT name
FROM people
WHERE name LIKE 'B%';

--Get the names of people whose names have 'r' as the second letter.
SELECT name
FROM people
WHERE name LIKE '_r%';

--Get the names of people whose names don't start with A
SELECT name
FROM people
WHERE name NOT LIKE 'A%';

-- percentage of people who are no longer alive
SELECT COUNT(deathdate)*100.0 /COUNT(*) AS percentage_dead
FROM people;


