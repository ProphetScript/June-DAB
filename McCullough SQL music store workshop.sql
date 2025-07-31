--Excercise #1
Select 
release_date, song_id , title 
from songs
where release_date >= 2022
order by release_date DESC 


--Excercise #2
SELECT popularity_score, duration_seconds, title, song_id
from songs
where duration_seconds <= 240 
and popularity_score > 80
order by popularity_score asc



--Excercise #3
SELECT artist_name
from artists
where artist_name like "%the%"



--Excercise #4
SELECT sum(duration_seconds)/60 
from songs



--Excercise #5
SELECT price, song_id , purchase_id  FROM purchases
ORDER BY price Desc 
LIMIT 5



--Excercise #6
SELECT 
    s.song_id, 
    s.title, 
    s.popularity_score, 
    p.purchase_date,
    p.purchase_id
FROM 
    songs s
LEFT JOIN 
    purchases p ON s.song_id = p.song_id
WHERE 
    s.popularity_score >= 90;


--Excercise #7
SELECT purchase_date, song_id
from purchases 
where purchase_date between 2023/01/01 and 2023/03/31
order by purchase_date Asc



--Excercise #8
Select popularity_score, title
from songs s 
where popularity_score >= 90
Order by popularity_score desc