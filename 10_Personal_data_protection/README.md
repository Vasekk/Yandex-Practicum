# Защита персональных данных клиентов (проект закончен)

## Постановка задачи

Нужно защитить данные клиентов страховой компании «Хоть потоп». Для этого необходимо разработь и обосновать такой метод преобразования данных, чтобы по ним было сложно восстановить персональную информацию.
Защита данных не должна ухудшать качество моделей машинного обучения. Подбирать лучшую модель не требуется.

## Данные

Данные хранятся в файле insurance.csv и содержат персональную информацию:
- Пол
- Возраст
- Зарплата 
- Члены семьи
- Страховые выплаты

## План исследования:

1. Загрузка данных
2. Алгоритм преобразования и его обоснование
3. Проверка алгоритма
4. Общий вывод

Для исследования использованы библиотеки Pandas, sklearn, numpy.

## Итоги исследования 

1. Загружены данные клиентов страховой компании "Хоть потоп"
2. Предложен и обоснован алгоритм защиты персональных данных. 
- Доказано, что качество линейной регрессии при умножении признаков 𝑋  на обратимую матрицу не меняется, а также существование связи между параметрами моделей линейной регрессии, обученных на исходных и искаженных данных.
- Описаны основные этапы защиты данных с применением алгоритма преобразования матриц.
4. Реализован алгоритм преобразования данных и экспериментально показано, что качество модели не меняется.
