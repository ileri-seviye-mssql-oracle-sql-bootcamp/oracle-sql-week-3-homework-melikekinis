
--1- türü drama olan filmlerde oynamis oyuncular?

SELECT DISTINCT 
    A.act_name name, A.act_surname surname
FROM 
    acts A
INNER JOIN brdg_mov_act B 
    ON A.act_id = B.act_id
INNER JOIN brdg_gen_mov C 
    ON B.mov_id = C.mov_id
INNER JOIN genres G 
    ON C.gen_id = G.gen_id
WHERE G.gen_title = 'Drama';

--2- Fatih Akin'in yönetmenligini yapmis oldugu filmlerden en uzun olani?


SELECT A.mov_title film_adi
FROM (
SELECT 
    M.mov_title,
    M.mov_time,
    DENSE_RANK() OVER(ORDER BY M.mov_time DESC) longest_movie 
FROM movie.movies M
INNER JOIN movie.directors D 
    ON M.director_id = D.director_id 
WHERE D.director_id = ( 
                        SELECT 
                            director_id 
                        FROM 
                            movie.directors D
                        WHERE D.director_name = 'Fatih'
                            AND D.director_surname = 'Akin'
                       )
)A
WHERE A.longest_movie = 1


--3- 2000 senesi çekilmis olan filmlerden kaç tanesi zeki demirkubuz'a aittir?

SELECT COUNT(*)
FROM 
    movie.movies M
INNER JOIN movie.directors D ON M.director_id = D.director_id
WHERE M.mov_year > 2000 
    AND D.director_name = 'Zeki'
    AND D.director_surname = 'Demirkubuz'
    
 
--4- 1960 yilindan sonra dogmus oyunculardan kimler 2000 sonrasi çekilmis filmlerde oynamistir?

SELECT 
    A.act_name,
    A.act_surname
FROM movie.acts A 
INNER JOIN movie.brdg_mov_act BM 
    ON A.act_id = BM.act_id
INNER JOIN movie.movies M
    ON BM.mov_id = M.mov_id
WHERE EXTRACT(YEAR FROM A.act_bdate) > 1960
    AND M.mov_year > 2000
