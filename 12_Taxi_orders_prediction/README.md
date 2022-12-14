# Прогнозирование заказов такси (проект закончен)

## Постановка задачи

Компания «Чётенькое такси» собрала исторические данные о заказах такси в аэропортах. Чтобы привлекать больше водителей в период пиковой нагрузки, нужно спрогнозировать количество заказов такси на следующий час. Необходимо построить модель для такого предсказания.

Значение метрики *RMSE* на тестовой выборке должно быть не больше 48.

## Данные

Данные лежат в файле `taxi.csv`. Количество заказов находится в столбце `num_orders`.

## План исследования:


План:

1. Загрузить данные и выполнить их ресемплирование по одному часу.
2. Проанализировать данные.
3. Обучить разные модели с различными гиперпараметрами. Сделать тестовую выборку размером 10% от исходных данных.
4. Проверить данные на тестовой выборке и сделать выводы.

Для исследования использованы библиотеки Pandas, sklearn, catboost, statsmodels, matplotlib

## Итоги исследования 

1. Данные загружены и ресемплированы с шагом в 1 час.
2. Проанализированы тренд и сезонность ряда: наблюдаются растущий тренд и внутрисуточная сезонность. 
3. Созданы признаки, обучены модели, проверено их качество, сопоставлены с констанной и повторяющей предыдущее значение моделями. Лучшее качество cv_RMSE=25.62 у модели CatBoostRegressor (на тестовой выборке 45).
4. Подобраны гиперпараметры модели CatBoostRegressor, лучшее качество достигается при 'n_estimators': 50, 'max_depth': 4, подобраны признаки максимизирующие качество: длина скользящего среднего 24, максимальная задержка - 1 (увеличение задержки не влияет на качество). RMSE модели на тестовой выборке составила 40,5** заказов в час. Визуально модель хорошо описывает основные тенденции, но часть выбросов пропускает.