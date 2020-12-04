
-- 1- UPPER (Film isimlerinin hepsi b�y�k harf olsun.)

SELECT 
    UPPER (M.mov_title) uppercase 
FROM movies M

-- 2- LOWER (Y�netmen isimleri k���k harfle olsun.)

SELECT 
    LOWER (D.director_name) lowercase 
FROM directors D

--3- LENGHT (Film isimlerinin uzunluklari)

SELECT
    LENGTH (M.mov_title) uppercase 
FROM movie.movies M

--4- NVL (Dogum tarihi null ise �l�m tarihinde "yasiyor" yazsin ve kisinin isim ve soyismi de gelsin.)

SELECT 
    A.act_name name, 
    A.act_surname surname,
    NVL(TO_CHAR(death_date,'DD/MM/YYYY'), 'Living') Status
FROM
    movie.acts A
    
--5- COUNT (Film tablosunda ka� tane film vardir?)
    
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
    
 --7- CONCAT (Y�netmen tablosundaki isim ve soyisimleri birlestir.)
 
 SELECT 
    CONCAT(CONCAT(D.director_name, ' '), D.director_surname)
 FROM movie.directors D
 
 --8- MIN (Filmler tablosundaki s�resi en kisa film ka� dakikadiir?)
 
 SELECT 
    MIN(M.mov_time) shortest_movie_time
 FROM 
    movie.movies M
 
 --9-  MAX (En gen� oyuncunun dogum tarihi nedir?. 
 
 SELECT 
    MAX(A.act_bdate) youngest_act_bdate
 FROM 
    movie.acts A
 
 --10- EXTRACT (Oyuncular tablosunda yer alan dogum tarihlerini yil seklinde g�steriniz.)
 
 SELECT 
    EXTRACT (YEAR FROM A.act_bdate) 
FROM 
    movie.acts A

--11- REPLACE (Oyuncular tablosunda isminin i�inde a harfi olan isimleri z ile degistir.)

SELECT 
    REPLACE (A.act_name, 'a', 'z')
FROM movie.acts A

--12- LPAD

SELECT 
    LPAD(A.mov_time, 4, '*') 
FROM 
    movie.movies A
   
--13- ROWNUM (2004 yilinda �ekilmis filmleri siralayiniz.)

SELECT 
    ROWNUM,
    M.mov_title
FROM
    movie.movies M
WHERE mov_year = 2004 

--14- DENSE_RANK (�ekilen filmleri s�resine g�re numaralandiriniz.)

SELECT 
    M.mov_title,
    M.mov_time,
    DENSE_RANK() OVER(ORDER BY M.mov_time DESC) longest_movie 
FROM movie.movies M


--15- RANK (Oyuncu tablosundaki dogum tarihlerini yil olarak g�sterip yila g�re numaralandirma yapiniz.

SELECT 
    EXTRACT (YEAR FROM A.act_bdate) yil, 
    RANK() OVER (ORDER BY EXTRACT(YEAR FROM A.act_bdate) DESC)
FROM 
    movie.acts A


    
    




select * from directors

select * from movies

select * from acts
where birth_place is null