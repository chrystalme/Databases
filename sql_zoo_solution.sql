-- Quiz 1
-- No 1
SELECT population FROM world
  WHERE name = 'Germany'

-- No 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- No 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


-- Quiz 2
-- No 1
SELECT name, continent, population FROM world

-- No 2
SELECT name
  FROM world
 WHERE population >= 200000000

-- No 3
SELECT name, gdp/population AS 'per capita GDP' 
FROM world
WHERE population >= 200000000

-- No 4
Select name, population/1000000
from world 
where continent = 'South America'

-- No 5
select name, population
from world
where name in ('France', 'Germany', 'Italy')

-- No 6
select name 
from world 
where name like '%United%'

-- No 7
Select name, population, area
from world
where area > 3000000 or population > 250000000

-- No 8
Select name, population, area
from world
where area > 3000000 
XOR population > 250000000

-- No 9
select name, ROUND(population/1000000, 2) 'Population in Millions', ROUND(GDP/1000000000, 2) 'GDP in Billions'
from world 
where continent = 'South America'

-- No 10
select name, round(gdp/population, -3)
from world
where gdp >= 1000000000000

-- No 11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

-- No 12
 SELECT name, capital
FROM world
where LEFT(name, 1) = LEFT(capital, 1)
xor name = capital

-- No 13
SELECT name
   FROM world
WHERE name LIKE '%a%'
and name like '%e%'
and name like '%i%'
and name like '%o%'
and name like'%u%'
and name not like '% %'

-- Quiz 3
-- No 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--  No 2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- No 3
Select yr, subject
from nobel
where winner = 'Albert Einstein'

-- No 4
Select winner
from nobel
where yr >= 2000 and subject = 'Peace'

-- No 5
select * 
from nobel 
where subject = 'Literature'
and yr between 1980 and 1989

-- no 6



