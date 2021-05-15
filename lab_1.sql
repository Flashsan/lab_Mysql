-- 1. создать базу данных.
CREATE DATABASE laboratornya_one;
SHOW DATABASES;
USE laboratornya_one;

-- 2. создать таблицы:

-- manuf : таблица, хранящая названия фирм 
-- 		ГДЕ:
-- IDM : код фирмы (первичный ключ)
-- Name: название фирмы
-- city: город, где находится фирма

CREATE TABLE manuf(
IDM INT NOT NULL,
Name VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
PRIMARY KEY(IDM)
);

-- cpu : таблица, хранящая названия и характеристики процессоров
-- 		ГДЕ:
-- IDС :  код модели процессора (первичный ключ)
-- IDM: код фирмы производителя процессора
-- Name:  название модели процессора
-- clock: частота работы процессора с точностью до одной десятой

CREATE TABLE cpu(
IDC INT NOT NULL,
IDM INT ,
Name VARCHAR(50) NOT NULL,
clock DECIMAL NOT NULL,
PRIMARY KEY (IDC)
);


-- hdisk : таблица, хранящая названия и характеристики дисков
-- 		ГДЕ:
-- IDD: код модели диска (первичный ключ)
-- IDM: код фирмы производителя диска
-- Name: название модели диска
-- type: тип диска 
-- size: размер диска

CREATE TABLE hdisk(
IDD INT NOT NULL,
IDM INT NOT NULL,
Name VARCHAR(50) NOT NULL,
type VARCHAR(50) NOT NULL,
size FLOAT NOT NULL,
PRIMARY KEY (IDD)
);

-- nb : таблица, хранящая комплектацию ноутбука
-- 		ГДЕ:
-- IDN: код модели (первичный ключ)
-- IDM: код фирмы производителя ноутбука
-- name: название модели ноутбука
-- IDC: код модели процессора 
-- IDD: код модели диска


CREATE TABLE nb(
IDN INT NOT NULL,
IDM INT NOT NULL,
name VARCHAR(50) NOT NULL,
IDC INT NOT NULL,
IDD INT NOT NULL,
PRIMARY KEY(IDN)
);

-- Phone : таблица, хранящая телефон менеджера 
-- 		ГДЕ:
-- IDP: табельный номер сотрудники (первичный ключ)
-- IDM: код фирмы на которой работает сотрудник 
-- Number: номер телефона
-- NameManager: имя менеджера

CREATE TABLE Phone(
IDP INT NOT NULL,
IDM INT NOT NULL,
Number VARCHAR(20) NOT NULL,
NameManager VARCHAR(30) NOT NULL,
PRIMARY KEY (IDP)
);

-- 3. Выполнить запросы:

insert into manuf values 
(1, 'Intel', 'Santa Clara'), 
(2, 'AMD', 'Santa Clara'), 
(3, 'WD', 'San Jose'), 
(4, 'seagete', 'Cupertino'), 
(5, 'Asus', 'Taipei'), 
(6, 'Dell','Round Rock');

SELECT *FROM manuf;

insert into CPU values 
(1, 1, 'i5', 3.2),
(2, 1, 'i7', 4.7),
(3, 2, 'Ryzen 5', 3.2),
(4, 2, 'Ryzen 7', 4.7),
(5, null, 'Power9', 3.5);

SELECT *FROM CPU;

insert into hdisk values 
(1, 3, 'Green', 'hdd', 1000),
(2, 3, 'Black', 'ssd', 256),
(3, 1, '6000p', 'ssd', 256),
(4, 1, 'Optane', 'ssd', 16);

SELECT *FROM hdisk;

insert into nb values 
(1, 5, 'Zenbook', 2, 2),
(2, 6, 'XPS', 2, 2),
(3, 9, 'Pavilion', 2, 2),
(4, 6, 'Inspiron', 3, 4),
(5, 5, 'Vivobook', 1, 1),
(6, 6, 'XPS', 4, 1);

SELECT *FROM nb;


-- 4. Заполнить таблицу Phone произвольными данными.
INSERT INTO Phone VALUES
(1,2,'1234','Веня'),
(2,1,'2345','Alex'),
(3,3,'3456','Pavel'),
(4,4,'4567','Roma'),
(5,6,'5678','Yulia'),
(6,5,'6789','Rita');

SELECT *FROM Phone;

-- 5. Написать запросы чтобы вывести данные: 

-- ++
-- 5.1	Название фирмы и модель диска (Список не должен содержать значений NULL)
-- ----------------------------------------------------------------------
-- Решение: 
SELECT *FROM manuf;
SELECT *FROM hdisk;
SELECT manuf.Name, hdisk.Name FROM manuf, hdisk WHERE  hdisk.IDM= manuf.IDM AND hdisk.Name IS NOT NULL;

-- ++
-- 5.2	Модель процессора и, если есть информация в БД, название фирмы;
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM cpu;
SELECT *FROM manuf;

SELECT cpu.Name, manuf.Name FROM cpu LEFT JOIN manuf ON cpu.IDM=manuf.IDM;

-- ++
-- ----------------------------------------------------------------------
-- 5.3	Название фирмы, которая производить несколько типов товара;
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM nb;
SELECT *FROM manuf;
SELECT *FROM cpu;
SELECT *FROM hdisk;

SELECT DISTINCT manuf.Name FROM manuf,nb,hdisk,cpu
WHERE
cpu.IDM=hdisk.IDM=nb.IDM=manuf.IDM OR hdisk.IDM!=nb.IDM=cpu.IDM=manuf.IDM;



-- ++
-- ----------------------------------------------------------------------
-- 5.4	Модели ноутбуков без информации в базе данных о фирме изготовителе;
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM nb;
SELECT *FROM manuf;
SELECT nb.name FROM nb 
LEFT JOIN manuf ON nb.IDM=manuf.IDM WHERE manuf.Name IS NULL;


-- +++
-- ----------------------------------------------------------------------
-- 5.5	Модель ноутбука и название производителя ноутбука, название модели процессора, название модели диска.
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM manuf;
SELECT *FROM nb;
SELECT *FROM cpu;
SELECT *FROM hdisk;

SELECT nb.name AS modelNootebook, manuf.Name AS ManufNoteBook, 
cpu.Name AS modelCPU, hdisk.Name As modelDisk
FROM nb 
LEFT JOIN manuf ON manuf.IDM=nb.IDM   
LEFT  JOIN cpu ON cpu.IDC=nb.IDC 
LEFT  JOIN hdisk ON hdisk.IDD=nb.IDC;



-- ----------------------------------------------------------------------
-- 5.6	Модель ноутбука, фирму производителя ноутбука, а также для этой модели: 
-- 				модель и название фирмы производителя процессора,
-- 				модель и название фирмы производителя диска.
-- ----------------------------------------------------------------------
-- Решение:
SELECT *FROM manuf;
SELECT *FROM nb;
SELECT *FROM cpu;
SELECT *FROM hdisk;

SELECT Notebook.name,manufNotebook.name,
cpu.Name,manufCPU.Name,
hdisk.Name,manufDisk.Name
FROM nb AS Notebook
LEFT JOIN manuf AS manufNotebook ON Notebook.IDM=manufNotebook.IDM 
LEFT JOIN cpu ON Notebook.IDC=cpu.IDC  
LEFT JOIN manuf AS manufCPU ON manufCPU.IDM=cpu.IDM
LEFT JOIN hdisk ON Notebook.IDD=hdisk.IDD  
LEFT JOIN manuf AS manufDisk ON manufDisk.IDM=hdisk.IDM;


-- +++
-- ----------------------------------------------------------------------
-- 5.7	 Абсолютно все названия фирмы и все модели процессоров 
-- ----------------------------------------------------------------------
-- Решение:
(SELECT manuf.Name as name_one, cpu.Name as name_two  FROM manuf 
LEFT JOIN cpu ON cpu.IDM=manuf.IDM)
UNION
(SELECT manuf.Name as name_one, cpu.Name as name_two FROM cpu 
LEFT JOIN manuf ON cpu.IDM=manuf.IDM);
