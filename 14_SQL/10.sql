/*
Вывести 10 стран с наибольшим средним числом компаний, получивших инвестиции за 2010-2012 г.
Исключить страны, у которых минимальное число проинвестированных компаний, равно 0
*/

SELECT country_code,
MIN(invested_companies),
MAX(invested_companies),
AVG(invested_companies)
FROM fund
WHERE EXTRACT(YEAR FROM CAST(founded_at as TIMESTAMP)) BETWEEN 2010 and 2012
GROUP BY country_code
HAVING MIN(invested_companies) > 0
ORDER BY AVG(invested_companies) DESC
LIMIT 10

/*
Результат
country_code	min	max	avg
BGR	25	35	30
CHL	29	29	29
UKR	8	10	9
LTU	5	5	5
IRL	4	5	4.5
KEN	3	3	3
LBN	3	3	3
MUS	3	3	3
JPN	1	6	2.83333
HKG	2	3	2.66667
 */