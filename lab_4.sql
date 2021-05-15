-- B2
-- 1.	К созданной ранее базе данных, применяя только SQL, добавить таблицу «Supply» (поставки), состоящую из полей: 
-- IDSU – int, Firm – varchar, Address – varchar, Amount – int, Rate,% – int, ArtistName  – varchar, AlbumTitle – varchar. 
-- ----------------------------------------------------------------------
-- Решение:
use lab3;

create table Supply(
IDSU int not null auto_increment primary key, 
Firm varchar(50), 
Address varchar(50), 
Amount int, 
`Rate,%`int, 
ArtistName varchar(50),
 AlbumTitle varchar(50)
);

-- ----------------------------------------------------------------------
-- 2.	Выпольнить запросы:
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (1, "Akvilon", "Bereza", 66, 24, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (2, "Atlant", "Nesvizh", 23, 11, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (3, "Venera", "Myadel'", 6, 14, "Nathan Goshen", " In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (4, "Vesta", "Slavgorod", 27, 18, "Jp Cooper", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (5, "Vulkan", "Zhabinka", 87, 5, "Wiz Khalifa", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (6, "Gerkules", "Pinsk", 42, 12, "Calvin Harris", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (7, "Diana", "Malorita", 55, 8, "Frank Sinatra", "My Way");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (8, "Lyutsina", "Svetlogorsk", 21, 6, "Frank Sinatra", "The Christmas");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (9, "Mars", "Borisov", 58, 21, "Frank Sinatra", "World On A String");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (10, "Merkuriy", "Minsk", 76, 4, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (11, "Minerva", "Skidel'", 22, 14, "Jp Cooper", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (12, "Salyus", "Kalinkovichi", 59, 10, "Jonas Blue", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (13, "Talassiy", "Ivanovo", 94, 7, "Lil Wayne", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (14, "Tellus", "Cherven'", 29, 10, "Nathan Goshen", " In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (15, "Triviya", "Kossovo", 3, 9, "Jp Cooper", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (16, "Favoniy", "Dzerzhinsk", 59, 24, "Wiz Khalifa", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (17, "Feb", "Gomel'", 20, 25, "Calvin Harris", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (18, "Elissa", "Mogilev", 79, 20, "Frank Sinatra", "My Way");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (19, "Yuventa", "Slonim", 76, 12, "Frank Sinatra", "The Christmas");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (20, "Yunona", "Krichev", 59, 22, "Frank Sinatra", "World On A String");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (21, "Yupiter", "Molodechno", 87, 3, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (22, "Diana", "Malorita", 42, 12, "Frank Sinatra", "My Way");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (23, "Lyutsina", "Svetlogorsk", 55, 8, "Jonas Blue", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (24, "Mars", "Borisov", 21, 6, "Lil Wayne", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (25, "Merkuriy", "Minsk", 58, 21, "Nathan Goshen", " In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (26, "Minerva", "Skidel'", 76, 4, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (27, "Triviya", "Kossovo", 22, 14, "Sia", "The Greatest");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (28, "Favoniy", "Dzerzhinsk", 59, 10, "Nathan Goshen", " In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (29, "Feb", "Gomel'", 94, 7, "Jp Cooper", "Runway");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (30, "Elissa", "Mogilev", 29, 10, "Wiz Khalifa", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (31, "Lyutsina", "Svetlogorsk", 3, 9, "Calvin Harris", "In The Lonely Hour");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (32, "Mars", "Borisov", 42, 24, "Frank Sinatra", "My Way");
insert into supply (IDSU, Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values (33, "Merkuriy", "Minsk", 55, 25, "Frank Sinatra", "The Christmas");
-- 3.	Добавить записи в таблицу supply используя многоуровневый insert:
-- 			"Minerva", "Skidel'",	21, 20,	"Frank Sinatra", "World On A String"
-- 			"Triviya", "Kossovo",	58,	12,	"Sia",	"The Greatest"
-- 			"Favoniy", "Dzerzhinsk",	76,	8,	"Sia",	"The Greatest"
-- ----------------------------------------------------------------------
-- Решение:
insert into Supply(Firm, Address, Amount, `Rate,%`, ArtistName, AlbumTitle) values
("Minerva", "Skidel'",	21, 20,	"Frank Sinatra", "World On A String"),
("Triviya", "Kossovo",	58,	12,	"Sia",	"The Greatest"),
("Favoniy", "Dzerzhinsk",	76,	8,	"Sia",	"The Greatest");

-- ----------------------------------------------------------------------
-- 4.	Написать хранимую процедуру для добавления записи в таблицу «Supply».
-- ----------------------------------------------------------------------
-- Решение:

DELIMITER //
create procedure add_Data_(Firm varchar(50), Address varchar(50), Amount int, `Rate,%` int,ArtistName varchar(50), AlbumTitle varchar(50))
begin
insert into Supply(Firm, Address, Amount, `Rate,%`,ArtistName, AlbumTitle) values
(Firm, Address, Amount, `Rate,%`,ArtistName, AlbumTitle);
end //

-- ----------------------------------------------------------------------
-- 5.	Добавить запись, используя хранимую процедуру из задания 4:
-- 			"Feb", "Gomel'",	22,	6,	"Jonas Blue",	"Runway"
-- ----------------------------------------------------------------------
-- Решение:
DELIMITER ;
 CALL add_Data_("Feb", "Gomel'", 22, 6, "Jonas Blue", "Runway");

select *from Supply;
-- ----------------------------------------------------------------------
-- 6.	Вывести название и качество записи трека отсортировав 
-- сначала по качеству, затем по названию (обратный порядок), не включая плохие записи.
-- ----------------------------------------------------------------------
-- Решение:
select quality,songTitle from song
left join song_albumname on song_albumname.idSong=song.idSong
left join albumtitle on song_albumname.idSong=albumtitle.idAlbumTitle
left join song_artistname on song_artistname.idSong=song.idSong
left join artistname on artistname.idArtistName=song_artistname.idArtistName
where quality is not null and  quality !='L'
order by quality asc,SongTitle DESC;
-- ----------------------------------------------------------------------
-- 7.	Вывести название и цену трех самых дешевых альбомов.
-- ----------------------------------------------------------------------
-- Решение:
select  AlbumTitle,price from song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName
where price is not null
order by price
limit 3;
-- ----------------------------------------------------------------------
-- 8.Вывести альбом второй по стоимости после самого дорогого альбома.
-- ----------------------------------------------------------------------
-- Решение:
select * from Song;

select  AlbumTitle,price from song
left join Song_AlbumName on Song_AlbumName.idSong=Song.idSong
left join AlbumTitle on AlbumTitle.idAlbumTitle=Song_AlbumName.idAlbumTitle
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName
where price is not null
order by price desc
limit 1,1;
-- ----------------------------------------------------------------------
-- 9.	Найти альбом, у которого нет исполнителя.
-- ----------------------------------------------------------------------
-- Решение №1:
-- доделать
select AlbumTitle, ArtistName  from albumtitle
left join Song_AlbumName on Song_AlbumName.idAlbumTitle=albumtitle.idAlbumTitle
left join Song on Song.idSong=Song_AlbumName.idSong
left join Song_ArtistName on Song_ArtistName.idSong=Song.idSong
left join ArtistName on Song_ArtistName.idArtistName=ArtistName.idArtistName
where ArtistName is null;
-- Решение №2:
select AlbumTitle, ArtistName from basic
where ArtistName is null;

-- ----------------------------------------------------------------------
-- 11.	Найти треки, у которых название начинается не с букв.
-- ----------------------------------------------------------------------
-- Решение:
select songTitle from song where songTitle not REGEXP "^[a-z]";
-- ----------------------------------------------------------------------
-- 12.	Найти все треки, которые начинаются на гласные буквы.
-- ----------------------------------------------------------------------
-- Решение:
select * from song where songTitle REGEXP "^[aeiouyAEIOUY]";
-- ----------------------------------------------------------------------
-- 13.	Посчитать отпускную цену альбомов по формуле: Price_Shop = Price*(1+ Rate, %/100+w); 
-- где: Price – цена альбома из таблицы Album; 
-- Rate,% – из таблицы «Supply» ; 
-- w=10% при Amount < 50, w=20% при Amount = 50, w=30% при Amount > 50
-- Результат отсортировать сначала по названию в алфавитном порядке, затем по убыванию цены. 
-- ----------------------------------------------------------------------
-- Решение:
select  
albumtitle.albumtitle,
albumtitle.price * ( 1 + supply.`Rate,%` / 100 + case
when supply.Amount<50 then 10
when supply.Amount=50 then 20
when supply.Amount>50 then 30
end) as Price_Shop
from albumtitle
join supply on supply.AlbumTitle=albumtitle.albumtitle
order by albumtitle.albumtitle asc, Price_Shop desc;

-- ----------------------------------------------------------------------
