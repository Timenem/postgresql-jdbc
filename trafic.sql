CREATE TABLE fine
    (
        fine_id serial
            PRIMARY KEY,
        name varchar(30),
        number_plate varchar(6),
        violation varchar(50),
        sum_fine decimal(8, 2),
        date_violation date,
        date_payment date
    );

INSERT INTO fine (name, number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', NULL, '2020-02-14 ', NULL),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
       ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 20 до 40)', NULL, '2020-01-12', NULL),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', NULL, '2020-02-01', NULL);

CREATE TABLE traffic_violation
    (
        violation_id serial
            PRIMARY KEY,
        violation varchar(50),
        sum_fine decimal(8, 2)
    );

INSERT INTO traffic_violation (violation, sum_fine)
VALUES ('Превышение скорости(от 20 до 40)', 500),
       ('Превышение скорости(от 40 до 60)', 1000),
       ('Проезд на запрещающий сигнал', 1000);





#Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, 
#в соответствии с данными из таблицы traffic_violation.
#При этом суммы заносить только в пустые поля столбца  sum_fine.
UPDATE fine
SET sum_fine=(SELECT sum_fine FROM traffic_violation WHERE traffic_violation.violation=fine.violation)
WHERE sum_fine isNULL;

SELECT * from fine;





#Вывести фамилию, номер машины и нарушение только для тех водителей, 
#которые на одной машине нарушили одно и то же правило   два и более раз. 
#При этом учитывать все нарушения, независимо от того оплачены они или нет. 
#Информацию отсортировать в алфавитном порядке, сначала по фамилии водителя, потом по номеру машины и, наконец, по нарушению.
SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING  COUNT(*) >1  ORDER BY name, number_plate, violation;



#Удалить из таблицы fine информацию о нарушениях, совершенных раньше 1 февраля 2020 года. 
DELETE  from fine WHERE date_violation < '2020-02-01';


#Создать новую таблицу back_payment, куда внести информацию о неоплаченных штрафах 
#(Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа  и  дату нарушения) из таблицы fine.
CREATE TABLE back_payment AS  
SELECT name, number_plate, violation, sum_fine, date_violation FROM fine WHERE date_payment ISNULL;



















