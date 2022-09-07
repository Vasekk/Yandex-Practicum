/*
Отберать данные по месяцам с 2010 по 2013 год, 
когда проходили инвестиционные раунды. 
Сгруппировать данные по номеру месяца вывести поля:
номер месяца, в котором проходили раунды;
количество уникальных названий фондов из США, которые инвестировали в этом месяце;
количество компаний, купленных за этот месяц;
общая сумма сделок по покупкам в этом месяце. 
*/


WITH a AS(
    SELECT EXTRACT(MONTH FROM CAST(a.acquired_at AS TIMESTAMP)) as acq_month,
            COUNT(acquired_company_id),
            SUM(price_amount)
    FROM acquisition AS a
    WHERE EXTRACT(YEAR FROM CAST(a.acquired_at AS TIMESTAMP) ) BETWEEN 2010 and 2013
    GROUP BY acq_month),

b AS (SELECT EXTRACT(MONTH FROM CAST(fr.funded_at AS TIMESTAMP)) as fr_month,
        COUNT(DISTINCT f.name)
FROM funding_round AS fr
LEFT JOIN investment AS i ON fr.id = i.funding_round_id
LEFT JOIN fund AS f ON i.fund_id = f.id
WHERE EXTRACT(YEAR FROM CAST(fr.funded_at AS TIMESTAMP) ) BETWEEN 2010 and 2013
AND f.country_code = 'USA'
GROUP BY fr_month)

SELECT b.fr_month, b.count, a.count, a.sum
FROM a 
JOIN b ON a.acq_month = b.fr_month

/*
Результат
fr_month	count	count	sum
1	815	600	2.71083e+10
2	637	418	4.13903e+10
3	695	458	5.95016e+10
4	718	411	3.03837e+10
5	695	532	8.60122e+10
...
 */