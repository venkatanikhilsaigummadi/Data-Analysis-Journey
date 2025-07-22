CONCEPTS
- INNER JOIN ONLY RETURNS THE MATCHING ROWS IN BOTH TABLES.
- ROUND() -> ROUNDING TO NEAREST NUMBER -> 4.6 - 5 AND 4.4 - 4
- ROUND DOWN MEANS -> FLOOR()
- ROUND UP MEANS -> CEIL()
- CASE CAN BE USED ANY WHERE, LIKE SELECT, ORDER BY ETC
- USE BETWEEN INSTEAD OF > AND <


1. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


SELECT SUM(CITY.POPULATION)
FROM CITY JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';

2. Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- RETRIEVING CITIES FROM AFRICAN CONTINENT
SELECT C.NAME
FROM CITY C JOIN COUNTRY CO
ON C.COUNTRYCODE = CO.CODE
WHERE CO.CONTINENT = 'AFRICA';

3. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- AVG CITY POPULATION IN EACH CONTINENT.
SELECT CO.CONTINENT, FLOOR(AVG(C.POPULATION)) AS AVG_POPULATION
FROM COUNTRY CO JOIN CITY C
ON C.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT;

4. You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

Grades contains the following data: GRADE, MIN_MARK, MAX_MARK

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

SELECT CASE
        WHEN G.GRADE <8 THEN NULL
        ELSE S.NAME
        END AS NAME, G.GRADE AS GRADE, S.MARKS AS MARK
FROM STUDENTS S JOIN GRADES G 
ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY G.GRADE DESC, S.NAME, S.MARKS;

