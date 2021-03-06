-- Выполнить запросы:
create database Lab2;
use Lab2;

create table Seance (id int, filmName varchar(500), duration int, price double, idCinema int);
create table Cinemas (id int, title varchar(500), address varchar(500));
insert Cinemas values(1, 'Belarus', 'Romanovskaya Sloboda 28');
insert Cinemas values(2, '3D kino v Zamke', 'Melezha 1');
insert Cinemas values(3, 'Silver Screen Galileo', 'Bobruiskaya 6');
insert Cinemas values(4, 'Silver Screen Arena City', 'Pobediteley square 84');
insert Cinemas values(5, 'Victory', 'Internationalnaya 20');
insert Cinemas values(6, 'Aurora', 'Pritickogo 23');
insert Cinemas values(7, 'October', 'Nezalezhnosti square 73');
insert Cinemas values(8, 'Moskow', 'Pobediteley square 13');
insert Cinemas values(9, 'Pioneer', 'Engelsa 20');
insert Cinemas values(10, 'Central Cinema', 'Nezalezhnosti square 13');
insert Seance values(1, 'Inception', 148, 12, 1);
insert Seance values(2, 'The First Purge', 112, 6.5, 8);
insert Seance values(3, 'Shrek 2 Forever', 93, 6, 4);
insert Seance values(4, 'Zombieland: Double Tap', 99, 7, 7);
insert Seance values(5, 'WALL-E', 98, 7.6, 7);
insert Seance values(6, 'Saw', 103, 15, 2);
insert Seance values(7, 'Deadpool', 109, 7.2, 3);
insert Seance values(8, 'The Blair Witch', 105, 8.8, 4);
insert Seance values(9, 'Insidious', 102, 15, 5);
insert Seance values(10, 'The Dark Knight', 152, 20, 4);
insert Seance values(11, 'Deadpool', 109, 9.6, 7);
insert Seance values(12, 'Green Mile', 189, 14.7, 8);
insert Seance values(13, 'WALL-E', 98, 5.6, 9);
insert Seance values(14, 'Blade 2', 117, 12.2, 1);
insert Seance values(15, 'Inception', 102, 13.9, 4);
insert Seance values(16, 'Blade 2', 117, 9.6, 2);
insert Seance values(17, 'Blade Runner 2049', 164, 14.4, 6);
insert Seance values(18, 'Shrek 2 Forever', 93, 9, 8);
insert Seance values(19, 'Green Mile', 189, 8.5, 6);
insert Seance values(20, 'Insidious', 180, 4.6, 2);
insert Seance values(21, 'Chappie', 120, 17.6, 5);
insert Seance values(22, 'The Dark Knight', 152, 3.3, 9);
insert Seance values(23, 'Inception', 148, 11, 7);
insert Seance values(24, 'Blade Runner 2049', 164, 15, 8);
insert Seance values(25, 'Martian', 151, 17.1, 3);

-- ----------------------------------------------------------------------
-- 1.	Создать первичные ключи для таблиц «Seance» и «Cinemas».
-- ----------------------------------------------------------------------
-- Решение:
ALTER TABLE Seance
ADD PRIMARY KEY (id); 

ALTER TABLE Cinemas
ADD PRIMARY KEY (id);
-- ----------------------------------------------------------------------
-- 2.	Создать в таблице «Seance» поле «hallCount».
-- ----------------------------------------------------------------------
-- Решение:
ALTER TABLE Seance
ADD hallCount int;
-- ----------------------------------------------------------------------
-- 3.	Создать в таблице «Seance» поле «date_session», которое по умолчанию заполняется текущей датой.
-- ----------------------------------------------------------------------
-- Решение:
ALTER TABLE Seance
ADD date_session  TIMESTAMP DEFAULT current_timestamp;
-- ----------------------------------------------------------------------
-- 4.	Установить для поля «idCinema» таблицы «Seance» вторичный ключ с ссылкой на поле «Id» таблицы «Cinemas».
-- ----------------------------------------------------------------------
-- Решение:
ALTER TABLE Seance
ADD FOREIGN KEY (idCinema) REFERENCES Cinemas(Id);
-- ----------------------------------------------------------------------
-- 5.	Перемеиновать поле «hallCount» в  «CountHall» таблицы «Seance».
-- ----------------------------------------------------------------------
-- Решение:
SHOW CREATE TABLE Seance;
ALTER TABLE Seance
CHANGE hallCount CountHall int;
-- ---------------------------------------------------------------------
-- 6.	Удалить поле «CountHall»  из таблицы «Cinemas». может быть Seance?
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM Seance;
ALTER TABLE Seance
DROP COLUMN CountHall;
-- -------------------------------------------------------------------
-- 7.	Посчитать количество фильмов и суммарную стоимость для каждого «Cinemas».
-- ----------------------------------------------------------------------
-- Решение:
SELECT *,
(SELECT COUNT(idCinema) FROM Seance WHERE Seance.idCinema=Cinemas.id) as countFilmCinemas, 
(SELECT SUM(price) FROM Seance WHERE Seance.idCinema=Cinemas.id ) as sumCinemas
FROM Cinemas;

-- ----------------------------------------------------------------------
-- 8.	Найти три самых продолжительных фильма.
-- ----------------------------------------------------------------------
-- Решение:
SELECT  filmName,MAX(duration) 
FROM Seance
GROUP BY filmName
ORDER BY duration desc
limit 3;

-- ----------------------------------------------------------------------
-- 9.	Посчитать среднюю стоимость фильма.
-- ----------------------------------------------------------------------
-- Решение:
select avg(price) from Seance;


-- ----------------------------------------------------------------------
-- 10.	Вывести кинотеатр и название фильма отсортировав с начала по названию кинотеатра, затем по названию фильма в обратном порядке.
-- ----------------------------------------------------------------------
-- Решение:
select title,filmName
from Cinemas
left join Seance on Seance.idCinema=Cinemas.id
order by  title asc, filmName desc;

-- --------------------------- -------------------------------------------
-- 11.	Вывести самый дешевый фильм для каждого кинотеатра.
-- ----------------------------------------------------------------------
-- Решение:
select *from Cinemas
left join Seance on Seance.idCinema=Cinemas.id
where Cinemas.id=3;

select Cinemas.id,Cinemas.title, Seance.filmName, min(Seance.price)
from Cinemas
left join Seance on Seance.idCinema=Cinemas.id
group by title
order by id,price;



-- ----------------------------------------------------------------------
-- 12.	Вывести второй по продолжительности фильм.
-- ----------------------------------------------------------------------
-- Решение:
SELECT  filmName,duration
FROM Seance
GROUP BY filmName
ORDER BY duration desc
limit 1,1;


