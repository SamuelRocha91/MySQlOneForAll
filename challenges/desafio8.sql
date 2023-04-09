SELECT  s.name AS 'artista', a.name AS 'album' 
FROM  SpotifyClone.singer AS s 
INNER JOIN SpotifyClone.album AS a ON a.singer_id = s.singer_id
WHERE s.name = "Elis Regina";