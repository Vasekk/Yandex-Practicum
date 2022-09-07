/*
Создать поле с категориями активности фонда
для каждой категории отсортировать по возрастанию 
округленное среднее число инвестиционных раундов
 
*/

WITH cat AS
(SELECT *,
       CASE
           WHEN invested_companies>=100 THEN 'high_activity'
           WHEN invested_companies>=20 THEN 'middle_activity'
           ELSE 'low_activity'
       END AS activity
FROM fund)

SELECT activity,
    ROUND(AVG(investment_rounds))
FROM cat
GROUP BY activity
ORDER BY round

/*
Результат
activity	round
low_activity	2
middle_activity	51
high_activity	252
 */