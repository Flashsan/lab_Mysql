Create database lab3;
use lab3;

drop table Basic;
drop table song;
drop table song_albumname;
drop table artistname_albumname;
drop table artistname;
drop table albumtitle;

CREATE TABLE Basic (
    SongTitle VARCHAR(35),
    Quality varchar(1),
    Duration INT,
    DateRecord DATE,
    AlbumTitle varchar(35), 
    price decimal (5,2),
    ArtistName varchar(35),
    `e-mail` varchar(35)
    );
insert into Basic (SongTitle, Quality, Duration, DateRecord, AlbumTitle, price, ArtistName, `e-mail`) values 
('Sing Me To Sleep', 'H', 176, '2018-08-29',null, null, 'Alan Walke', 'AlanWalker@mail.com'),
('The Greatest', 'L', 88, '2019-10-24', 'The Greatest', 2.38, 'Sia', null),
('Cheap Thrills', 'M', 115, '2016-07-16', 'The Greatest', 2.38, 'Sia', null),
('Ocean Drive', 'M', 101,	'2015-12-04', null, null, 'Duke Dumont', null),
('No Money', 'M',	126, '2018-05-11', 'In The Lonely Hour', 3.63, null, null),
('Thinking About It', 'L', 170, '2016-01-14', 'Evolution', 1.88, 'Nathan Goshen', null),
('Perfect Strangers', 'L', 189, '2018-09-06', 'Runway', 2.75, 'Jonas Blue', null),
('Perfect Strangers', 'L', 189, '2018-09-06', 'Runway', 2.75, 'Jp Cooper', null),
('Thinking About It', 'M', 179, '2017-10-25','In The Lonely Hour',3.25, 'Alan Walke', 'AlanWalker@mail.com'),
('Thinking About It', 'M', 179, '2017-10-25','In The Lonely Hour',3.25, 'Jp Cooper', null),
('My Way', 'H', 163, '2018-07-26','My Way', 1.63, 'Frank Sinatra', null),	
('My Way', 'H', 157,	'1985-01-11','The Christmas', 3.63, 'Frank Sinatra', null),
('Let It Snow!', 'M', 158, '1984-03-05','World On A String', 3.38, 'Frank Sinatra', null);

-- Выполнить представленные выше запросы. Нормальзвать базу данных. 
-- Создать новые таблицы (названия полей взять из таблицы Basic),
-- заполнить их с помощью запросов из таблицы Basic
select *from Basic;

create table ArtistName(
idArtistName int auto_increment primary key,
ArtistName varchar(35),
`e-mail`varchar(35)
);

create table Song(
idSong int auto_increment primary key,
SongTitle VARCHAR(35),
Quality varchar(1),
Duration int,
DateRecord DATE
);

create table AlbumTitle(
idAlbumTitle int primary key auto_increment ,
AlbumTitle varchar(35),
price decimal (5,2)
);

create table Song_ArtistName(
idSong int ,
idArtistName int ,
primary key(idSong,idArtistName),
foreign key (idSong) REFERENCES Song(idSong)ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (idArtistName) REFERENCES ArtistName(idArtistName) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Song_AlbumName(
idSong int ,
idAlbumTitle int,
primary key(idSong,idAlbumTitle),
foreign key (idSong) REFERENCES Song(idSong)ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (idAlbumTitle) REFERENCES AlbumTitle(idAlbumTitle) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into ArtistName (ArtistName, `e-mail`)
select distinct ArtistName,`e-mail` 
from basic
where ArtistName is not null;

insert into Song (SongTitle, Quality, Duration, DateRecord)
select distinct SongTitle, Quality, Duration, DateRecord 
from basic;

insert into Song_ArtistName(idSong,idArtistName)
select distinct idSong,idArtistName 
from basic
inner join Song on Song.SongTitle=basic.SongTitle
and
Song.Quality=basic.Quality
and
Song.DateRecord=basic.DateRecord
inner join ArtistName on ArtistName.ArtistName=basic.ArtistName
;


insert into AlbumTitle(AlbumTitle,price)
select distinct AlbumTitle, price
from basic
where albumTitle is not null; 


insert into Song_AlbumName(idSong,idAlbumTitle)
select distinct idSong,idAlbumTitle 
from basic
join Song on Song.SongTitle=basic.SongTitle
and
Song.Quality=basic.Quality
and
Song.DateRecord=basic.DateRecord
join AlbumTitle on AlbumTitle.AlbumTitle=basic.AlbumTitle
and AlbumTitle.price=basic.price;

select * from AlbumTitle;
select * from Song;
select * from ArtistName;
select * from Song_AlbumName;
select * from Song_ArtistName;

-- Создать запросы (таблицу basic использовать не допускается):
-- 1. Вывести поля: SongTitle, Quality, Duration, DateRecord, AlbumTitle, 
-- price, ArtistName, [e-mail] из полученных в ходе нормализации таблиц
-- ----------------------------------------------------------------------
-- Решение:SongTitle,Quality,Duration,DateRecord,AlbumTitle,price,ArtistName,`e-mail`
select *from Basic;

select SongTitle,Quality,Duration,DateRecord,AlbumTitle,price,ArtistName,`e-mail`
from Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName;

select SongTitle,Quality,Duration,DateRecord,AlbumTitle,price,ArtistName,Сайт
from Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName;
-- ----------------------------------------------------------------------
-- 2. Добавить новую компазицию - название: "Can't Stop The Feeling", исполнителя: "Jonas Blue", 
-- продолжительностью 253 секунды, качество - "M", в "DateRecord" указать текущию дату.
-- ----------------------------------------------------------------------
-- Решение:song
insert into Song(SongTitle,Quality,Duration,DateRecord)
values ("Can't Stop The Feeling",'M',253,curdate());

insert into Song_ArtistName( idSong,idArtistName)
select idSong,idArtistName from Song, ArtistName
where 
idSong=(select idSong from Song where SongTitle="Can't Stop The Feeling")
and  
idArtistName=(select idArtistName from ArtistName where  ArtistName="Jonas Blue");

-- ----------------------------------------------------------------------
-- 3. Переименовать аудио запасись "Thinking About It" исполнитля "Nathan Goshen" в "Let It Go"
-- ----------------------------------------------------------------------
-- Решение:
update Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName
set SongTitle="Let It Go"
where SongTitle="Thinking About It" 
and
ArtistName="Nathan Goshen";
-- ----------------------------------------------------------------------
-- 4. Удалить колонку "e-mail", создать колонку "Сайт", задав по умолчанию значение «нет»
-- ----------------------------------------------------------------------
-- Решение:
alter table ArtistName
drop column `e-mail`;

alter table ArtistName
add Сайт varchar(50) ;

update ArtistName
set Сайт='нет'
where idArtistName>0;
-- ----------------------------------------------------------------------
-- 5. Вывести все аудио запасиси, отобразив, если имеется, имя исполнится и альбом
-- ----------------------------------------------------------------------
-- Решение:
select SongTitle,ArtistName,AlbumTitle
from Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName
where ArtistName is not null and albumtitle is not null;
-- ----------------------------------------------------------------------
-- 6. Вывести все аудио запасиси, у которых в названии альбома есть «way» 
-- ----------------------------------------------------------------------
-- Решение:
select SongTitle
from Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName 
where AlbumTitle like '%way%' or 'way%' or '%way';

-- ----------------------------------------------------------------------
-- 7. Вывести: название, стоимость альбома и его исполнителя при условии, 
-- что он будет самым дорогим для каждого исполнителя.
-- ----------------------------------------------------------------------
-- Решение:
select AlbumTitle, max(price), ArtistName
from Song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName 
group by artistname;


-- ----------------------------------------------------------------------
-- 8. Удалить запись "Can't Stop The Feeling" исполнителя "Jonas Blue".
-- ----------------------------------------------------------------------
-- Решение:
delete Song from Song 
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName  
where ArtistName= "Jonas Blue"
and 
SongTitle="Can't Stop The Feeling";

-- ----------------------------------------------------------------------