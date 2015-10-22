-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT code, continent, name, population FROM country WHERE region='Southern Europe' ORDER BY population;

code | continent |             name              | population
------+-----------+-------------------------------+------------
 VAT  | Europe    | Holy See (Vatican City State) |       1000
 GIB  | Europe    | Gibraltar                     |      25000
 SMR  | Europe    | San Marino                    |      27000
 AND  | Europe    | Andorra                       |      78000
 MLT  | Europe    | Malta                         |     380200
 SVN  | Europe    | Slovenia                      |    1987800
 MKD  | Europe    | Macedonia                     |    2024000
 ALB  | Europe    | Albania                       |    3401200
 BIH  | Europe    | Bosnia and Herzegovina        |    3972000
 HRV  | Europe    | Croatia                       |    4473000
 PRT  | Europe    | Portugal                      |    9997600
 GRC  | Europe    | Greece                        |   10545700
 YUG  | Europe    | Yugoslavia                    |   10640000
 ESP  | Europe    | Spain                         |   39441700
 ITA  | Europe    | Italy                         |   57680000

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT countrycode, language FROM countrylanguage WHERE countrycode='VAT';

 countrycode | language
-------------+----------
 VAT         | Italian

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.
SELECT countrycode, language, percentage FROM countrylanguage WHERE language= 'Italian' ORDER BY percentage;

 countrycode | language | percentage
-------------+----------+------------
 VAT         | Italian  |          0
 BRA         | Italian  |        0.4
 FRA         | Italian  |        0.4
 USA         | Italian  |        0.6
 DEU         | Italian  |        0.7
 CAN         | Italian  |        1.7
 ARG         | Italian  |        1.7
 AUS         | Italian  |        2.2
 BEL         | Italian  |        2.4
 LIE         | Italian  |        2.5
 LUX         | Italian  |        4.6
 CHE         | Italian  |        7.7
 MCO         | Italian  |       16.1
 ITA         | Italian  |       94.1
 SMR         | Italian  |        100


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

SELECT name, district FROM city WHERE countrycode= 'SMR';

 name    |     district
------------+-------------------
 Serravalle | Serravalle/Dogano
 San Marino | San Marino

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT name, countrycode, district FROM city WHERE name LIKE '%Serra%';

         name         | countrycode |     district
----------------------+-------------+-------------------
 Serra                | BRA         | Espï¿½rito Santo
 Taboï¿½o da Serra    | BRA         | Sï¿½o Paulo
 Itapecerica da Serra | BRA         | Sï¿½o Paulo
 Serravalle           | SMR         | Serravalle/Dogano


SELECT name, continent FROM country WHERE code='BRA';
  name  |   continent
--------+---------------
 Brazil | South America

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!

 SELECT name, continent, capital, code FROM country WHERE code='BRA';

  name  |   continent   | capital | code
--------+---------------+---------+------
 Brazil | South America |     211 | BRA


-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock.

-- Clue #8: Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'llq say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.

 SELECT id, name, countrycode FROM city WHERE population=91084;

  id  |     name     | countrycode
------+--------------+-------------
 4060 | Santa Monica | USA

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.



-- She's in Santa Monica!

table "country"
 code      | name          | continent       |region   | surfacearea |
 indepyear | population     | lifeexpectancy  | gnp     | gnpold |
 localname | governmentform | headofstate     | capital | code2

table "countrylanguage "
 countrycode | language | isofficial | percentage

table "city"
id  | name | countrycode | district | population
