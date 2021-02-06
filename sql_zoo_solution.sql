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

-- No 6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')

-- No 7
select winner 
from nobel
where winner like 'John%'

-- No 8
select yr, subject, winner
from nobel
where yr in (1980) and subject in ('Physics')
or yr in (1984) and subject in ('Chemistry')

-- No 9
select yr, subject, winner
from nobel
where subject not in ('Chemistry', 'Medicine') and yr = 1980

-- No 10
select yr, subject, winner
from nobel
where subject = 'Medicine' and yr < 1910
or subject = 'Literature' and yr >= 2004

-- No 11
select yr, subject, winner
from nobel
where subject not in ('Chemistry', 'Medicine') and yr = 1980

-- No 12
Select * 
from nobel 
where winner = 'EUGENE O''NEILL'

-- No 13
select winner, yr, subject
from nobel
where winner like 'Sir%'

-- No 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner

--  Select in select
-- No 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- No 2
Select name
from world
where continent = 'Europe'
and gdp/population > (select gdp/population from world where name = 'United Kingdom')

-- No 3
Select name, continent
from world
where continent = (select continent from world where name = 'Argentina') or
continent = (select continent from world where name = 'Australia')
order by name

-- No 4
select name 
from world 
where population > (select population from world where name = 'Canada')
and population < (select population from world where name = 'Poland')

-- No 5
select name, concat(round((population/(select population from world where name =  'Germany') * 100), 0), '%') percentage 
from world
where continent = 'Europe' 

-- No 6
select name 
from world
where gdp > (select max(gdp)
from world 
where continent = 'Europe')

-- No 7
SELECT continent, name, area 
FROM world x
  WHERE area =
    (SELECT Max(area) FROM world y
        WHERE y.continent=x.continent)

-- No 8
select continent, name 
from world x
where name <= ALL (select name 
                          from world y
                         WHERE y.continent=x.continent)

-- No 9
select name , continent, population
from world
where continent in (select continent 
                    from world x
                     where 25000000 > ALL (select population 
                              from world y
                                 where x.continent = y.continent))

-- No 10
select name, continent
from world x
where population > ALL (select population*3
                            from world y
                              where x.continent = y.continent
                               and x.name != y.name)

-- SUM AND COUNT
-- No 1
SELECT SUM(population)
FROM world

-- No 2
select distinct(continent)
from world

-- No 3
select sum(gdp)
from world
where continent = 'Africa'

-- No 4
select count(name)
from world
where area >= 1000000

-- No 5
select sum(population)
from world
where name in ('Estonia', 'Latvia', 'Lithuania')

-- No 6
select continent, count(name) no_of_countries
from world
group by continent

-- No 7
select continent , count(name) no_of_countries
from world
where population >= 10000000
group by continent

-- No 8
select continent
from world
group by continent
having sum(population) > 100000000

-- JOIN
-- No 1
SELECT matchid, player 
FROM goal 
  WHERE teamid = 'GER'
  
-- No 
-- No 
-- No 
-- No 
-- No 


