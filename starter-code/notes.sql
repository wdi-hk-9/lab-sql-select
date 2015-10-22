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


carmen=# SELECT code, continent, name, population FROM country WHERE region='South America' ORDER BY name;
 code |   continent   |       name       | population
------+---------------+------------------+------------
 ARG  | South America | Argentina        |   37032000
 BOL  | South America | Bolivia          |    8329000
 BRA  | South America | Brazil           |  170115000
 CHL  | South America | Chile            |   15211000
 COL  | South America | Colombia         |   42321000
 ECU  | South America | Ecuador          |   12646000
 FLK  | South America | Falkland Islands |       2000
 GUF  | South America | French Guiana    |     181000
 GUY  | South America | Guyana           |     861000
 PRY  | South America | Paraguay         |    5496000
 PER  | South America | Peru             |   25662000
 SUR  | South America | Suriname         |     417000
 URY  | South America | Uruguay          |    3337000
 VEN  | South America | Venezuela        |   24170000
(14 rows)