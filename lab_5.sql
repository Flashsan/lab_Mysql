-- B3

-- ??? Таблица "Supply" требует исправлений (по какой причине?).

/* 1. Создать таблицу "Firm" с полями: 
	IDF – первичный ключ, целочисленное, авто инкремент; 
	FirmName – текстовое поле;
	Address – текстовое поле; 
	Rate – числовое поле с хранением двух знаков после запятой. */
-- ----------------------------------------------------------------------
-- Решение:
use lab3;

create table Firm(
IDF int primary key auto_increment,
FirstName varchar(40),
Address varchar(40),
Rate decimal(3,2)
);

-- ----------------------------------------------------------------------
/* 2. Теперь ее нужно заполнить соответствующими данными из таблицы "Supply". 
Cтавка “Rate” будет считаться: находим среднее значение “Rate,%”  
для каждой фирмы и если оно будет до 10, то новое значение – 0,1; 
				   если от 10 до 20 – 0,2; 
				   если от 20 до 30 – 0,3; 
				   в остальных случаях – 0,4. */
-- ----------------------------------------------------------------------
-- Решение:
insert into Firm (FirstName,Address, Rate)
select distinct Firm,Address,
If(avg(`Rate,%`)<10, 0.1 , if(avg(`Rate,%`)>=10 and avg(`Rate,%`)<20 , 0.2, if(avg(`Rate,%`)>=20 and avg(`Rate,%`)<30, 0.3, 0.4) ) ) as Rate
from supply
group by Firm;

select * from Firm;
-- ----------------------------------------------------------------------
/* 3. После того как данные были перенесены в новую таблицу, можно удалить ненужные колонки “Address”, “Rate,%”.*/
-- ----------------------------------------------------------------------
-- Решение:
alter table supply 
drop column Address;
alter table supply 
drop column `Rate,%`;

select * from supply;
-- ----------------------------------------------------------------------
/* 4. Для хранения текущего количества альбомов от каждого поставщика создадим таблицу “Store” с полями: 
IDST – первичный ключ, целочисленное, авто инкремент; 
IDFi – целочисленное (хранит код фирмы); 
IDAl – целочисленное (хранит код альбома); 
Amount – целочисленное (хранит количество альбомов).*/
-- ----------------------------------------------------------------------
-- Решение:
create table Store(
IDST int primary key auto_increment,
IDFi int,/*(хранит код фирмы)*/
IDAl int,/*(хранит код альбома)*/
Amount int/*(хранит количество альбомов)*/
);

select * from Store;
-- ----------------------------------------------------------------------
/* 5. Заполнить таблицу “Store”, данные для заполнения брать из таблицы “Supply”. */
-- ----------------------------------------------------------------------
-- Решение №1 (использовать view/cursor):
create view store_view AS
select IDSU,idAlbumTitle,Amount from Supply
left join AlbumTitle on albumtitle.AlbumTitle=supply.AlbumTitle;

select * from store_view;


begin
declare in_IDST int;
declare in_IDFi int;
declare in_IDAL int;
declare in_Amount int;

declare done integer default 0;

declare inputStore cursor for select
Store.IDST,Store.IDFi,Store.IDAL,Store.Amount from  Store;
declare continue handler for sqlstate '02000' set done=1;
open inputStore;

fetch  inputStore into in_IDST,in_IDFi,in_IDAL,in_Amount;
close inputStore;
end;



-- Решение №2 (не использовать view/cursor):
insert into Store (IDFi,IDAl, Amount)
select IDSU,idAlbumTitle,Amount from Supply
left join AlbumTitle on albumtitle.AlbumTitle=supply.AlbumTitle;
select *from Store;
-- ----------------------------------------------------------------------
/* 6. Создадим таблицу “Purchases”, в ней будем хранить: 
IDP – первичный ключ, целочисленное, авто инкремент; 
IDST – целочисленное (хранит код альбома от конкретного поставщика); 
Amount – целочисленное (хранит количество приобретённых альбомов); 
PriceP – числовое поле с двумя знаками после запятой (стоимость альбома); 
DateP – хранит дату (день, месяц, год) покупки. */
-- ----------------------------------------------------------------------
-- Решение:
create table Purchases(
IDP int primary key auto_increment,/**/
IDST int,/*целочисленное (хранит код альбома от конкретного поставщика)*/
Amount int,/*целочисленное (хранит количество приобретённых альбомов);*/
PriceP decimal(3,2),/*числовое поле с двумя знаками после запятой (стоимость альбома);*/
DateP date/**/
);

-- ----------------------------------------------------------------------
/* 7. Создадим процедуру для одновременного добавления информации о покупке в таблицу "Purchases" 
и редактирования актуального числа альбомов в таблице “Store”.
 Неплохо бы учесть, что продать то, чего нет – невозможно.  
 PriceP считаем как:  Price * (1 + firm.Rate + 0.18)*/
-- ----------------------------------------------------------------------
-- Решение №1:
-- IDST – целочисленное (хранит код альбома от конкретного поставщика); 
-- Amount – целочисленное (хранит количество приобретённых альбомов); 
-- PriceP – числовое поле с двумя знаками после запятой (стоимость альбома); 
 -- DateP – хранит дату (день, месяц, год) покупки. */

DELIMITER //
create procedure addDataIntoPurchses(IN input_IDST int,IN input_Amount int)
begin
declare input_PriceP decimal(3,2);
declare input_DateP date;
declare input_Rate int;
declare input_Price decimal(3,2);

set input_DateP=curdate();

select Amount from Supply
left join Firm on Supply.Firm=Firm.FirstName
left join AlbumTitle on Supply.AlbumTitle=AlbumTitle.AlbumTitle;

if(input_Amount>=0) then
set input_PriceP=input_Price*(1+input_Rate+0.18);
insert into purchases(IDST,Amount,PriceP,DateP) 
values (input_IDST,input_Amount,input_PriceP,input_DateP);
update Store set Store.Amount=Store.Amount-input_Amount
where store.idst=inputIDST;
else leave st;
end if;
end;
 //
DELIMITER ;

-- Решение №2:


-- ----------------------------------------------------------------------
/* 8. Добавить несколько записей о покупках.*/
-- ----------------------------------------------------------------------
-- Решение:
 CALL addDataIntoPurchses(1,5);
-- ----------------------------------------------------------------------
/* 9. Вывести название фирмы, название купленного альбома, количество и стоимость покупки, 
одновременно вывести общий итог и итог по фирме-поставщике.  */
-- ----------------------------------------------------------------------
-- Решение:


-- ----------------------------------------------------------------------
/* 10. С применением курсора посчитать число альбомов, которые имеют несколько фирм-поставщиков.*/
-- ----------------------------------------------------------------------
-- Решение:


-- ----------------------------------------------------------------------
/* 11. Вывести название треков, исполнителей и название альбомов, 
которые были куплены в этом месяце, также вывести название фирмы, стоимость альбома и цену, дату покупки.*/
-- ----------------------------------------------------------------------
-- Решение:


-- ----------------------------------------------------------------------
/*  12* Продолжить исправление таблицы “Supply”. Теперь нужно заменить 
название фирмы на код фирмы, а название альбома и автора заменить на код альбома.*/
-- ----------------------------------------------------------------------
-- Решение:
select * from Supply
left join Firm on Firm.FirstName=Supply.Firm
left join AlbumTitle on Supply.AlbumTitle=AlbumTitle.AlbumTitle
left join ArtistName on Supply.ArtistName=ArtistName.ArtistName;
select distinct * from Firm; 


-- ----------------------------------------------------------------------
/*  13 Добавить constraint foreign key для таблиц: “Supply”, “Firm”, “Purchases”, “Store”.*/
-- ----------------------------------------------------------------------
-- Решение:
alter table Supply
add constraint  foreign key references ; 

alter table Firm
add constraint  foreign key references ;

alter table Purchses
add constraint  foreign key references ;

alter table Store
add constraint  foreign key references ;
-- ----------------------------------------------------------------------