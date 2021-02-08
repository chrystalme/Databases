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

-- No 2
SELECT id,stadium,team1,team2
  FROM game
where id = 1012

-- No 3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'GER'

-- No 4
Select team1, team2, player
from game join goal on (id=matchid)
where player LIKE 'Mario%'

-- No 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id 
 WHERE gtime<=10

-- No 6
select mdate, teamname
from game JOIN eteam ON (team1=eteam.id)
where coach = 'Fernando Santos'

-- No 7
select player
from goal join game on game.id = goal.matchid
where stadium = 'National Stadium, Warsaw'

-- No 8
SELECT dISTINCT(player)
  FROM game g JOIN goal go ON go.matchid = g.id 
    WHERE (team1 = teamid and team2='GER') or (team2 = teamid and team1='GER')

-- No 9
SELECT teamname, count(teamid) totalgoals
  FROM eteam JOIN goal ON id=teamid
group by teamname

-- No 10
select stadium, count(teamid)
FROM game JOIN goal ON id=matchid
group by stadium

-- No 11
SELECT matchid,mdate, count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

-- No 12
SELECT matchid,mdate, count(teamid)
  FROM game JOIN goal ON id = matchid 
where teamid = 'GER'
group by matchid,mdate

-- No 13
SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
             team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game g 
 LEFT JOIN goal x
ON g.id = x.matchid
GROUP BY mdate, team1, team2
ORDER BY mdate,matchid, team1, team2

-- MORE JOIN OPERATIONS
-- No 1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- No 2
SELECT yr 
FROM movie
WHERE title = 'Citizen Kane'

-- No 3
SELECT id, title, yr
FROM movie
WHERE title like 'Star Trek%'
ORDER BY yr

-- No 4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- No 5
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- No 6
SELECT name
FROM casting JOIN actor ON actorid = id
WHERE movieid = 11768

-- No 7
SELECT name
FROM actor a 
JOIN casting c 
ON actorid = a.id 
JOIN movie m ON m.id = movieid  
WHERE title = 'Alien'

-- No 8
SELECT title
FROM actor a 
JOIN casting c 
ON actorid = a.id 
JOIN movie m ON m.id = movieid 
WHERE name = 'Harrison Ford'

-- No 9
SELECT title
FROM actor a 
JOIN casting c 
ON actorid = a.id 
JOIN movie m ON m.id = movieid 
WHERE name = 'Harrison Ford' and ord <> 1

-- No 10
SELECT title, name
FROM actor a 
JOIN casting c 
ON actorid = a.id 
JOIN movie m ON m.id = movieid 
WHERE yr = 1962
AND
Ord = 1

-- No 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- No 12
SELECT title, name
FROM movie JOIN casting ON (movieid = movie.id ) join actor on (actorid = actor.id)
WHERE movieid in (SELECT movieid
FROM actor a 
JOIN casting c 
ON actorid = a.id 
JOIN movie m ON m.id = movieid 
WHERE name = 'Julie Andrews')
AND Ord = 1

-- No 13
SELECT name
FROM actor JOIN casting ON id = actorid
GROUP BY name
HAVING sum(ord = 1) >= 15

-- No 14
SELECT title, COUNT(title) Num_Actors FROM movie x
JOIN casting y ON x.id=y.movieid
WHERE yr = 1978 
GROUP BY title
ORDER BY Num_Actors DESC, title;

-- No 15
Select name from actor a join casting c on a.id = actorid
join movie m on m.id = movieid where title in 
(SELECT title
 from movie m join casting c on c.movieid = m.id
join actor a on a.id = c.actorid
 where actorid = (Select id from actor where name = 'Art Garfunkel')) AND name <> 'Art Garfunkel'

-- NULL
-- No 1
Select name
from teacher
where depT IS NULL

-- No 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- No 3
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- No 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- No 5
SELECT name, COALESCE(mobile, '07986 444 2266') mobile
 FROM teacher 

-- No 6
SELECT teacher.name, Coalesce(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- No 7
select count(name), count(mobile)
from teacher

-- No 8
SELECT  dept.name, count(teacher.name) staff
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name

-- No 9
SELECT teacher.name,
         CASE WHEN teacher.dept = 1
                THEN 'Sci'
                WHEN teacher.dept = 2  
                THEN 'Sci'
            ELSE 'Art'
       END  
FROM teacher Left JOIN dept ON dept.id = teacher.dept

-- No 10
SELECT teacher.name,
         CASE WHEN teacher.dept = 1
                THEN 'Sci'
                WHEN teacher.dept = 2  
                THEN 'Sci'
WHEN teacher.dept = 3
THEN 'Art'
            ELSE 'None'
       END  
FROM teacher left JOIN dept ON dept.id = teacher.dept

-- SELF JOIN
-- No 1
select count(id)
from stops
-- No 
-- No 
-- No 


