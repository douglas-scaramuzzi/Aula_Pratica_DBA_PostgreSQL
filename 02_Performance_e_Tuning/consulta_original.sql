-- Consulta DQL original focada em Gênero e Duração, com ordenação por tamanho.
-- Esta consulta foi o alvo da otimização de performance.

SELECT
    t.name AS nome_musica,
    a.title AS nome_album,
    g.name AS genero,
    t.composer AS compositor
FROM
    track t
JOIN
    album a ON t.album_id = a.album_id
JOIN
    genre g ON t.genre_id = g.genre_id
WHERE
    t.milliseconds > 200000 
    AND g.name = 'Rock'
ORDER BY
    t.bytes DESC;
