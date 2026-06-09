
https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

-- Find countries whose continent coincides with the continent of at least one country with a population > 100 million
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE population > 100000000);


-- Find countries whose area is NOT included in the list of country areas > 1 million km²
SELECT name, area
FROM world
WHERE area NOT IN (SELECT area FROM world WHERE area > 1000000);


-- Find countries for which there is another country on the same continent with a smaller area
SELECT w1.name, w1.continent, w1.area
FROM world w1
WHERE EXISTS (SELECT 1 FROM world w2 
              WHERE w2.continent = w1.continent 
                AND w2.area < w1.area);


-- Task 1: IN with subquery
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE population > 100000000);

-- Task 2: NOT IN
SELECT name, area
FROM world
WHERE area NOT IN (SELECT area FROM world WHERE area > 1000000);

