 SELECT MAX(s.song_id) AS 'cancoes', MAX(si.singer_id) AS 'artistas', MAX(al.album_id) AS 'albuns' FROM SpotifyClone.song AS s INNER JOIN SpotifyClone.singer AS si INNER JOIN SpotifyClone.album AS al;