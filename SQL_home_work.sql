CREATE TABLE IF NOT EXISTS Genre(
	Id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);


INSERT INTO Genre(Genre) 
VALUES('pop'), 
      ('Hip-Hop'),
      ('dance'),
      ('retro'),
      ('rock');

CREATE table if not exists Performers (
	Id SERIAL PRIMARY KEY,
	Performers_name VARCHAR(60) NOT NULL
);
INSERT INTO Performers(Performers_name) 
VALUES('Юрий Шатунов'),
      ('Король и Шут'),
      ('Asti'),
      ('MiyaGi'),
      ('Баста'),
      ('Клава Кока'),
      ('Филипп Киркоров'),
      ('Егор Крид'),
      ('Хабиб');


CREATE table if not exists Genre_Performers (
	     genre_Id INTEGER REFERENCES Genre(id),
	Performers_Id INTEGER REFERENCES Performers(id),
		          CONSTRAINT Genre_Performers_pk 
		          PRIMARY KEY (genre_Id, Performers_Id)
);
INSERT INTO Genre_Performers 
VALUES(1, 1), (1, 3), (1, 6),(1, 7), (1, 8), (1, 9), (2, 4), 
      (2, 5), (2, 8), (3, 1), (3, 3), (3, 5), (3, 8), (3, 9), 
      (4, 1), (4, 7), (5, 2);

CREATE table if not exists Albums (
	     Id SERIAL PRIMARY KEY,
	    album_name VARCHAR(60) PRIMARY key NOT null,
	Yers_of_releas VARCHAR(60) NOT null
);
INSERT INTO Albums(album_name, Yers_of_releas) 
VALUES('Розовый вечер', '1989'),
      ('YAMAKASI', '2020'),
      ('Баста+', '2013'),
      ('Феникс', '2018'),
      ('Грустинка', '2021'),
      ('Холостяк', '2015'),
      ('Мертвый анархист', '2003'),
      ('Не плачь', '1991');

CREATE table if not exists Performers_Albums (
	Performers_Id INTEGER REFERENCES Performers(id),	
	    Albums_Id INTEGER REFERENCES Albums(id),
	        CONSTRAINT Performers_Albums_pk 
	        PRIMARY KEY (Performers_Id, Albums_Id)
);
INSERT INTO Performers_Albums
VALUES(1, 1), (1, 3), (2, 6), (2, 7), (3, 8), (3, 1), 
      (4, 4), (4, 5), (5, 8), (5, 1), (6, 3), (7, 5), 
      (7, 8), (8, 1), (8, 2), (4, 6), (8, 3);

     
CREATE table if not exists Songs (
	id SERIAL PRIMARY KEY,
	 duration TIME        NOT null,
   collection VARCHAR(60) NOT null,
	albums_id INTEGER     NOT null REFERENCES albums(id),
	song_name VARCHAR(60) NOT null
);

INSERT INTO Songs(duration, collection, albums_id, song_name) 
VALUES('03:02:10.00000', 'Сборник1', 1, 'Седая ночь'),
      ('03:02:10.00000', 'Сборник1', 2, 'Прятки'), 
      ('02:02:10.00000', 'Сборник1', 3, 'Игра'), 
      ('02:02:10.00000', 'Сборник2', 3, 'Игра'), 
      ('02:02:10.00000', 'Сборник2', 4, 'Хобби'), 
      ('01:02:10.00000', 'Сборник2', 5, 'Ягодка малинка'), 
      ('01:02:10.00000', 'Сборник3', 5, 'Ягодка малинка'), 
      ('01:02:10.00000', 'Сборник3', 6, 'Сердцеедка'), 
      ('03:02:10.00000', 'Сборник3', 7, 'Странник'), 
      ('03:02:10.00000', 'Сборник4', 7, 'Странник'), 
      ('03:02:10.00000', 'Сборник4', 8, 'Съешь калачь'),
      ('02:02:10.00000', 'Сборник4', 1, 'детство'),
      ('02:02:10.00000', 'Сборник5', 1, 'детство'),
      ('02:02:10.00000', 'Сборник5', 2, 'Искать не буду'),
      ('03:02:10.00000', 'Сборник5', 3, 'Твоя игра'),
      ('03:02:10.00000', 'Сборник6', 3, 'Твоя игра'),
      ('03:02:10.00000', 'Сборник6', 4, 'Истеричка'),
      ('02:02:10.00000', 'Сборник6', 4, 'Девочка танцуй'),
      ('02:02:10.00000', 'Сборник7', 4, 'Девочка танцуй'),
      ('03:02:10.00000', 'Сборник7', 5, 'На четвертом этаже'),
      ('03:02:10.00000', 'Сборник7', 6, 'Холостяк'),
      ('03:02:10.00000', 'Сборник8', 6, 'Холостяк'),
      ('03:02:10.00000', 'Сборник8', 7, 'Цвет настроения синий'),
      ('03:02:10.00000', 'Сборник8', 5, 'На четвертом этаже');
     
     INSERT INTO Songs(duration, song_name) 
VALUES('04:02:10.00000', 'Видели ночь'),
      ('04:02:10.00000', 'Сияй');

     
CREATE table if not exists collections (
	       id SERIAL PRIMARY KEY,
	            year VARCHAR(4) NOT null,
	collections_name VARCHAR(60) NOT null
);

INSERT INTO collections (year, collections_name) 
VALUES('2013', 'Сборник1'),
      ('2014', 'Сборник2'),
      ('2015', 'Сборник3'),
      ('2016', 'Сборник4'),
      ('2017', 'Сборник5'),
      ('2019', 'Сборник7'),
      ('2020', 'Сборник8');

CREATE table if not exists Songs_Collections (
	Collections_Id INTEGER REFERENCES Collections(id),	
	Songs_Id INTEGER REFERENCES Songs(id),	
	CONSTRAINT Songs_Collections_pk PRIMARY KEY (Collections_Id, Songs_Id)
);

INSERT INTO Songs_Collections
VALUES(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), 
      (3, 9), (4, 10), (4, 11), (4, 12), (5, 13), (5, 14), (5, 15), (6, 16), (6, 17), 
      (6, 18), (7, 18), (7, 19), (7, 20), (1, 21), (2, 22), (3, 23);

-- Select-запросы
     
--1. название и год выхода альбомов, вышедших в 2018 году;

select album_name, Yers_of_releas from albums
where Yers_of_releas = '2018'

--2. название и продолжительность самого длительного трека;

select song_name, duration from songs
where duration = (SELECT MAX(duration) FROM songs)

--3. название треков, продолжительность которых не менее 3,5 минуты;

select song_name, duration from songs
where duration >= '03:00'

--4. названия сборников, вышедших в период с 2018 по 2020 год включительно;

select collections_name from collections
where year between '2018' and '2020'

--5. исполнители, чье имя состоит из 1 слова;

SELECT Performers_name FROM Performers
WHERE NOT Performers_name LIKE '% %';

--6. название треков, которые содержат слово "мой"/"my".

select song_name from songs
WHERE song_name like 'На';


--Домашнее задание к лекции «Продвинутая выборка данных»

--1. количество исполнителей в каждом жанре;

select name as genre, count(performers_id) as count_perf
  from genre as g join Genre_Performers as gp on g.id = gp.genre_id
 group by g.name
 order by count_perf asc


--2. количество треков, вошедших в альбомы 2019-2020 годов;

select Yers_of_releas as yers, count(song_name) as count_song
  from albums as a join songs as s on a.id = s.albums_id
 where a.Yers_of_releas between '2019' and '2020'
 group by a.Yers_of_releas
 order by count_song asc

--3. средняя продолжительность треков по каждому альбому;

select album_name, AVG(duration) as duration 
  from albums as a join songs as s on a.id = s.albums_id
 group by a.album_name
 order by duration asc

--4. все исполнители, которые не выпустили альбомы в 2020 году;

 select p.Performers_name as name, a.Yers_of_releas
   from Performers as p join Performers_albums as pa on p.id = pa.Performers_id
                        join albums as a             on pa.albums_id = a.id
  GROUP by p.Performers_name, a.Yers_of_releas
 having p.Performers_name != (select p.Performers_name as name 
                                from Performers as p join Performers_albums as pa on p.id = pa.Performers_id
                                                     join albums as a             on pa.albums_id = a.id
                               group by p.Performers_name, a.Yers_of_releas
                              having a.Yers_of_releas like '2020')

--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

select c.collections_name as name, p.Performers_name 
  from collections as c join Songs_Collections as sc on c.id = sc.Collections_Id
                        join songs as s              on sc.songs_id = s.id
                        join Performers_Albums as pa on s.albums_id = pa.albums_id
                        join Performers as p         on pa.Performers_id = p.id
   where p.Performers_name like 'Asti'
group by c.collections_name, p.Performers_name
                      
--6. название альбомов, в которых присутствуют исполнители более 1 жанра;

select a.album_name as album
  from Albums as a join Performers_Albums as pa on a.id = pa.albums_id 
                   join Performers as p         on pa.Performers_id = p.id 
                   join Genre_Performers as gp  on p.id = gp.Performers_id
                   join Genre as g              on gp.Genre_id = g.id 
GROUP BY a.album_name
HAVING COUNT(distinct g.name) > 1


--7. наименование треков, которые не входят в сборники;

select s.song_name as name 
  from Songs as s join Songs_Collections as sc on s.id = sc.Songs_id
                  join Collections as c        on sc.Collections_id = c.id 
where s.albums_id = null
group by s.song_name
order by s.song_name asc

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких 
--треков может быть несколько);

select p.Performers_name as name, s.duration as duration
  from Performers as p join Performers_Albums as pa on p.id = pa.Performers_id
                       join Albums as a             on pa.Albums_id = a.id 
                       join Songs as s              on a.id = s.albums_id
where duration = (select min(duration) from songs)
group by p.Performers_name, s.duration

--9. название альбомов, содержащих наименьшее количество треков.
 
SELECT a.album_name, COUNT(s.song_name) 
FROM albums as a JOIN Songs as s on s.albums_id = a.id 
GROUP BY a.album_name
HAVING COUNT(s.song_name) = (SELECT COUNT(s.song_name) AS c
                             FROM albums as a JOIN Songs as s on s.albums_id = a.id 
                             GROUP BY a.album_name
                             ORDER BY c LIMIT 1);

