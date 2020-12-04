--1- Yönetmen ve oyuncular tablosundaki isim ve soyisimleri tek deger alacak sekilde gösteriniz.


SELECT 
    D.director_name name, D.director_surname surname
FROM 
    movie.directors D
UNION
SELECT 
    A.act_name name, A.act_surname surname
FROM 
    movie.acts A
    
--2- Yönetmen tablosundaki isim ve soyisimlerin oyuncular tablosundaki isim ve soyisimlerden farki.

SELECT 
    D.director_name name, D.director_surname surname
FROM 
    movie.directors D
MINUS
SELECT 
    A.act_name name, A.act_surname surname
FROM 
    movie.acts A
    
 --3- Yönetmen tablosundaki isim ve soyisimlerle oyuncular tablosundaki isim ve soyisimlerden ayni olan var mi?

SELECT 
    D.director_name name, D.director_surname surname
FROM 
    movie.directors D
INTERSECT
SELECT 
    A.act_name name, A.act_surname surname
FROM 
    movie.acts A
    
--4- Yönetmen ve oyuncular tablosundaki tüm isim ve soyisimleri tek bir tabloda gösteriniz.


SELECT 
    D.director_name name, D.director_surname surname
FROM 
    movie.directors D
UNION ALL
SELECT 
    A.act_name name, A.act_surname surname
FROM 
    movie.acts A

    

    
    


