
-- 1- UPPER (Film isimlerinin hepsi büyük harf olsun.)

SELECT 
    UPPER (M.mov_title) uppercase 
FROM movies M

-- 2- LOWER (Yönetmen isimleri küçük harfle olsun.)

SELECT 
    LOWER (D.director_name) lowercase 
FROM directors D

--3- LENGHT (Film isimlerinin uzunluklari)

SELECT
    LENGTH (M.mov_title) uppercase 
FROM movie.movies M

--4- NVL (Dogum tarihi null ise ölüm tarihinde "yasiyor" yazsin ve kisinin isim ve soyismi de gelsin.)

SELECT 
    A.act_name name, 
    A.act_surname surname,
    NVL(TO_CHAR(death_date,'DD/MM/YYYY'), 'Living') Status
FROM
    movie.acts A
    
--5- COUNT (Film tablosunda kaç tane film vardir?)
    
SELECT 
    COUNT(mov_title) film_sayisi
FROM 
    movie.movies M;

--6- TO_CHAR

SELECT 
    A.act_name name, 
    A.act_surname surname,
    NVL(TO_CHAR(death_date,'DD/MM/YYYY'), 'Living') Status
FROM
    movie.acts A
    
 --7- CONCAT (Yönetmen tablosundaki isim ve soyisimleri birlestir.)
 
 SELECT 
    CONCAT(CONCAT(D.director_name, ' '), D.director_surname)
 FROM movie.directors D
 
 --8- MIN (Filmler tablosundaki süresi en kisa film kaç dakikadiir?)
 
 SELECT 
    MIN(M.mov_time) shortest_movie_time
 FROM 
    movie.movies M
 
 --9-  MAX (En genç oyuncunun dogum tarihi nedir?. 
 
 SELECT 
    MAX(A.act_bdate) youngest_act_bdate
 FROM 
    movie.acts A
 
 --10- EXTRACT (Oyuncular tablosunda yer alan dogum tarihlerini yil seklinde gösteriniz.)
 
 SELECT 
    EXTRACT (YEAR FROM A.act_bdate) 
FROM 
    movie.acts A

--11- REPLACE (Oyuncular tablosunda isminin içinde a harfi olan isimleri z ile degistir.)

SELECT 
    REPLACE (A.act_name, 'a', 'z')
FROM movie.acts A

--12- LPAD

SELECT 
    LPAD(A.mov_time, 4, '*') 
FROM 
    movie.movies A
   
--13- ROWNUM (2004 yilinda çekilmis filmleri siralayiniz.)

SELECT 
    ROWNUM,
    M.mov_title
FROM
    movie.movies M
WHERE mov_year = 2004 

--14- DENSE_RANK (Çekilen filmleri süresine göre numaralandiriniz.)

SELECT 
    M.mov_title,
    M.mov_time,
    DENSE_RANK() OVER(ORDER BY M.mov_time DESC) longest_movie 
FROM movie.movies M


--15- RANK (Oyuncu tablosundaki dogum tarihlerini yil olarak gösterip yila göre numaralandirma yapiniz.

SELECT 
    EXTRACT (YEAR FROM A.act_bdate) yil, 
    RANK() OVER (ORDER BY EXTRACT(YEAR FROM A.act_bdate) DESC)
FROM 
    movie.acts A


    
    




select * from directors

select * from movies

select * from acts
where birth_place is null