SELECT s.name AS 'cancao', COUNT(h.song_id) AS 'reproducoes' 
FROM SpotifyClone.song AS s INNER JOIN SpotifyClone.historic AS h ON s.song_id = h.song_id 
GROUP BY h.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;