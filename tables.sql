create table trip(
    trip_id INT PRIMARY KEY Identity(1,1),
    [name] varchar(30),
    city varchar(25),
    per_diem decimal(8,2),
    date_first date,
    date_last date
    );
    
insert into trip ([name],city,per_diem,date_first,date_last) 
values
('Баранов П.Е.','Москва',700 , '2020-01-12', '2020-01-17'),
('Абрамова К.А.','Владивосток',450 , '2020-01-14', '2020-01-27'),
('Семенов И.В.','Москва',700 , '2020-01-23', '2020-01-31'),
('Ильиных Г.Р.','Владивосток', 450, '2020-01-12', '2020-02-02'),
('Колесов С.П.','Москва',700 , '2020-02-01', '2020-02-06'),
('Баранов П.Е.','Москва', 700, '2020-02-14', '2020-02-22'),
('Абрамова К.А.','Москва', 700, '2020-02-23', '2020-03-01'),
('Лебедев Т.К.','Москва', 700, '2020-03-03', '2020-03-06'),
('Колесов С.П.','Новосибирск',450 , '2020-02-27', '2020-03-12'),
('Семенов И.В.','Санкт-Петербург',700 , '2020-03-29', '2020-04-05'),
('Абрамова К.А.','Москва',700 , '2020-04-06', '2020-04-14'),
('Баранов П.Е.','Новосибирск',450 , '2020-04-18', '2020-05-04'),
('Лебедев Т.К.','Томск',450 , '2020-05-20', '2020-05-31'),
('Семенов И.В.','Санкт-Петербург',700 , '2020-06-01', '2020-06-03'),
('Абрамова К.А.','Санкт-Петербург', 700, '2020-05-28', '2020-06-04'),
('Федорова А.Ю.','Новосибирск',450 , '2020-05-25', '2020-06-04'),
('Колесов С.П.','Новосибирск', 450, '2020-06-03', '2020-06-12'),
('Федорова А.Ю.','Томск', 450, '2020-06-20', '2020-06-26'),
('Абрамова К.А.','Владивосток', 450, '2020-07-02', '2020-07-13'),
('Баранов П.Е.','Воронеж', 450, '2020-07-19', '2020-07-25');

#Вывести из таблицы trip информацию о командировках тех сотрудников,
#фамилия которых заканчивается на букву «а», в отсортированном по убыванию даты последнего дня командировки виде. 
#В результат включить столбцы name, city, per_diem, date_first, date_last.
select name,city,per_diem,date_first,date_last from trip where name like '%а %' order by date_first desc; 


#Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.
select name from trip where city='Москва' GROUP BY name ORDER BY name;


#Для каждого города посчитать, сколько раз сотрудники в нем были.  Информацию вывести в отсортированном в алфавитном порядке по названию городов.
#Вычисляемый столбец назвать Количество. 
select city, (SELECT count(city)) as Количество from trip group by city  ORDER BY city asc;


#Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.
SELECT city , (SELECT COUNT(city)) As количество FROM trip GROUP BY city  ORDER BY количество DESC  LIMIT 2;


#Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,
#длительность командировки в днях, при этом первый и последний день относится к периоду командировки).
#Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).
select name ,city ,  extract(day from date_last::timestamp - date_first::timestamp)+1 as Длительность from trip
WHERE city not in ('Москва','Санкт-Петербург') ORDER BY Длительность DESC ;


#Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. В результат включить столбцы name, city, date_first, date_last.
SELECT name,city,date_first,date_last FROM trip
WHERE EXTRACT(DAY FROM date_last::TIMESTAMP - date_first::TIMESTAMP) IN (
    SELECT MIN(EXTRACT(DAY FROM date_last::TIMESTAMP-date_first::TIMESTAMP))
    FROM trip );
    
#Вывести информацию о командировках, начало и конец которых относятся к одному месяцу (год может быть любой).
#В результат включить столбцы name, city, date_first, date_last.
#Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника .
SELECT name,city,date_first,date_last FROM trip 
WHERE EXTRACT(MONTH from date_first::TIMESTAMP) = EXTRACT(MONTH from date_last::TIMESTAMP)  ORDER BY city, name ;


#Вывести название месяца и количество командировок для каждого месяца. 
#Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце.
#Информацию вывести сначала в отсортированном по убыванию количества, а потом в алфавитном  порядке по названию месяца виде.
#Название столбцов – Месяц и Количество
SELECT to_char(date_first, 'Month') as Месяц ,(SELECT COUNT(date_first)) as Количество from trip GROUP by Месяц ORDER BY Количество DESC ;



#Вывести сумму суточных (произведение количества дней командировки и размера суточных)
#для командировок, первый день которых пришелся на февраль или март 2020 года. 
#Значение суточных для каждой командировки занесено в столбец per_diem. 
#Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных.
#Последний столбец назвать Сумма. 
#Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников, а затем по убыванию суммы суточных.
SELECT name,city,date_first,
EXTRACT(day from date_last::TIMESTAMP -date_first::TIMESTAMP) * per_diem as Сумма  
from trip WHERE EXTRACT (MONTH from date_first::TIMESTAMP)=2 or EXTRACT(MONTH from date_first::TIMESTAMP)=3 oRDER BY name , Сумма;
