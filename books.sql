
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

/*
insert INTO author (name_author) values
    ('Булгаков М.А.'),
    ('Достоевский Ф.М.'),
    ('Есенин С.А.'),
    ('Пастернак Б.Л.');
*/
  
  
