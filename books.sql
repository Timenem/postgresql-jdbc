
CREATE TABLE author (
    author_id INTEGER PRIMARY KEY UNIQUE,
    name_author VARCHAR(50)
    );
CREATE TABLE genre (
    genre_id INTEGER PRIMARY KEY,
    name_genre VARCHAR(30)
    );
CREATE TABLE book (
    book_id INTEGER PRIMARY KEY , 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    genre_id INT, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
    );
    
    

CREATE TABLE book (
    book_id INTEGER PRIMARY KEY , 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    genre_id INT, 
    price DECIMAL(8,2), 
    amount INT,
    #удаляет строки из зависимой таблицы  
    FOREIGN KEY (author_id) REFERENCES author (author_id) on DELETE CASCADE,
    #устанавливает значение null 
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) on DELETE SET NULL
);



#Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
SELECT title, name_genre, price
FROM 
    genre INNER JOIN book
    ON genre.genre_id = book.genre_id
WHERE book.amount >= 8
ORDER BY price DESC;

#JOIN

/*
Оператор внешнего соединения LEFT OUTER JOIN  (можно использовать LEFT JOIN) соединяет две таблицы. 
Порядок таблиц для оператора важен, поскольку оператор не является симметричным.
select ... from table1 left join talbe2 on table1.id = table2.id...;

Результат запроса формируется так:
    в результат включается внутреннее соединение (INNER JOIN) первой и второй таблицы в соответствии с условием;
    затем в результат добавляются те записи первой таблицы, которые не вошли во внутреннее соединение на шаге 1, 
    для таких записей соответствующие поля второй таблицы заполняются значениями NULL.
Соединение RIGHT JOIN действует аналогично, только в пункте 2 первая таблица меняется на вторую и наоборот.
*/

Вывести все жанры, которые не представлены в книгах на складе.
SELECT name_genre
FROM genre LEFT JOIN book
ON genre.genre_id = book.genre_id
WHERE title IS NULL;

create table citi (
    city_id int not null , 
    name_city varchar(50)
);



Оператор перекрёстного соединения, или декартова произведения CROSS JOIN (в запросе вместо ключевых слов можно поставить запятую между таблицами) 
соединяет две таблицы. Порядок таблиц для оператора неважен, поскольку оператор является симметричным. Его структура:
select ... from table1 CROSS table2 ORDER BY table1.row;
SELECT
    name_city,
    name_author,
    date('2020-01-01'::date + trunc(random() * 365) * '1 day'::interval) AS Дата
FROM city CROSS JOIN author ORDER BY name_city , Дата DESC;



/*
insert INTO author (name_author) values
    ('Булгаков М.А.'),
    ('Достоевский Ф.М.'),
    ('Есенин С.А.'),
    ('Пастернак Б.Л.');
*/
  
  
