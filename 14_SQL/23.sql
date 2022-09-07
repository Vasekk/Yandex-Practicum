/*
Cводная таблица со средней суммой инвестиций для стран, 
в которых есть стартапы, зарегистрированные в 2011-2013 годах,  
Данные за каждый год должны быть в отдельном поле. 
Сортировка по среднему значению инвестиций за 2011 год от большего к меньшему.
 */


WITH a AS( 
    SELECT 
    c.country_code,
    AVG(c.funding_total) AS sum_11
FROM company AS c
WHERE EXTRACT(YEAR FROM CAST(c.founded_at AS TIMESTAMP)) = 2011
GROUP BY c.country_code),

aa AS( 
    SELECT 
    c.country_code,
    AVG(c.funding_total) AS sum_12
FROM company AS c
WHERE EXTRACT(YEAR FROM CAST(c.founded_at AS TIMESTAMP)) = 2012
GROUP BY c.country_code),

aaa AS( 
    SELECT 
    c.country_code,
    AVG(c.funding_total) AS sum_13
FROM company AS c
WHERE EXTRACT(YEAR FROM CAST(c.founded_at AS TIMESTAMP)) = 2013
GROUP BY c.country_code)

SELECT a.country_code, a.sum_11, aa.sum_12, aaa.sum_13
FROM a 
JOIN aa ON a.country_code = aa.country_code
JOIN aaa ON a.country_code = aaa.country_code
ORDER BY a.sum_11 DESC

/*
Результат
country_code	sum_11	sum_12	sum_13
PER	4e+06	41000	25000
USA	2.24396e+06	1.20671e+06	1.09336e+06
HKG	2.18078e+06	226227	0
PHL	1.75e+06	4218.75	2500
ARE	1.718e+06	197222	35333.3
JPN	1.66431e+06	674720	50000
...
 */