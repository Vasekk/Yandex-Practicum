/*
Посчитать среднее количество учебных заведений, 
которое окончили сотрудники закрытых компаний, 
для которых первый раунд финансирования оказался последним.
*/

--Список id закрытых компаний с единственным раундом
WITH cn AS (SELECT DISTINCT c.id
FROM funding_round AS fr
LEFT JOIN company AS c ON fr.company_id = c.id
WHERE fr.is_first_round = 1
    AND fr.is_last_round = 1
    AND c.status = 'closed'),

--количество оконченных учебных заведений для каждого сотрудника
            qwe AS (
SELECT p.id, 
COUNT(ed.instituition)
FROM people AS p
INNER JOIN cn ON p.company_id = cn.id
INNER JOIN education as ed ON p.id = ed.person_id
GROUP BY p.id)

SELECT AVG(qwe.count)
FROM qwe

/*
Результат
avg
1.41509
 */