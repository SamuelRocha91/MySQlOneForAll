SELECT s.name AS 'artista', a.name AS 'album', COUNT(f.user_id) AS 'pessoas_seguidoras'
FROM SpotifyClone.singer AS s  
INNER JOIN SpotifyClone.album AS a
ON a.singer_id = s.singer_id  
INNER JOIN SpotifyClone.followers AS f 
ON a.singer_id = f.singer_id 
group BY a.name
ORDER BY pessoas_seguidoras DESC, s.name, a.name;