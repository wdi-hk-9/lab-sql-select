-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

select name from country where region = 'Southern Europe' order by population;
//Holy See (Vatican City State) Country Code = VAT

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

select language from countrylanguage where countrycode = 'VAT';
//Italian

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

select * from countrylanguage where language = 'Italian' and isofficial = 't';

 countrycode | language | isofficial | percentage
-------------+----------+------------+------------
 ITA         | Italian  | t          |       94.1
 SMR         | Italian  | t          |        100
 VAT         | Italian  | t          |          0
 CHE         | Italian  | t          |        7.7


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.
 select * from country where code ='SMR';
 -- country = San Marino
 select * from city where countrycode = 'SMR';

   id  |    name    | countrycode |     district      | population
------+------------+-------------+-------------------+------------
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
 3171 | San Marino | SMR         | San Marino        |       2294

-- select city.name, city.countrycode, country.continent from city, country where city.name != country.name;

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

select * from city where name like '%Serra%';
select * from country where code = 'BRA';
-- Brazil

  id  |         name         | countrycode |     district      | population
------+----------------------+-------------+-------------------+------------
  265 | Serra                | BRA         | Espï¿½rito Santo  |     302666
  310 | Taboï¿½o da Serra    | BRA         | Sï¿½o Paulo       |     197550
  370 | Itapecerica da Serra | BRA         | Sï¿½o Paulo       |     126672
 3170 | Serravalle           | SMR         | Serravalle/Dogano |       4802

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

select capital from country where name = 'Brazil';
-- 211
select * from city where id = 211;

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the landing dock.

-- Clue #8: Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.

select * from city where population = 91084;

  id  |     name     | countrycode |  district  | population
------+--------------+-------------+------------+------------
 4060 | Santa Monica | USA         | California |      91084

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.

-- She's in Santa Monica!
