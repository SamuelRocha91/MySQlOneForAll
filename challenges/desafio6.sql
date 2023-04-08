SELECT CAST(MAX(p.plane_value) AS DECIMAL(10,2))  AS "faturamento_maximo", 
CAST(MIN(p.plane_value) AS DECIMAL(10,2)) AS "faturamento_minimo",
CAST(AVG(p.plane_value) AS DECIMAL(10,2)) AS "faturamento_medio",
CAST(SUM(p.plane_value) AS DECIMAL(10,2)) AS "faturamento_total"
FROM SpotifyClone.plan AS p INNER JOIN SpotifyClone.users AS u ON p.plan_id = u.plan_id ;