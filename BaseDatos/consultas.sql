SELECT * FROM "Riegos";

SELECT * FROM "Alertas";

SELECT * FROM "Riegos"
ORDER BY duracion DESC;

SELECT * FROM "Riegos"
WHERE id_parcela = 1;

SELECT * FROM "Alertas"
WHERE tipo_alerta = 'Humedad baja';

SELECT id_parcela, COUNT(*) AS total_riegos
FROM "Riegos"
GROUP BY id_parcela;

SELECT AVG(duracion) AS promedio_duracion
FROM "Riegos";

SELECT MAX(duracion) AS duracion_maxima
FROM "Riegos";

SELECT MIN(duracion) AS duracion_minima
FROM "Riegos";

SELECT SUM(duracion) AS tiempo_total
FROM "Riegos";

SELECT r.id_riego, r.id_parcela, r.duracion, r.modo
FROM "Riegos" r
INNER JOIN "Parcelas" p
ON r.id_parcela = p.id_parcela;

SELECT a.id_alerta, a.tipo_alerta, a.mensaje
FROM "Alertas" a
INNER JOIN "Parcelas" p
ON a.id_parcela = p.id_parcela;

UPDATE "Alertas"
SET mensaje = 'Se requiere revisar la humedad del suelo'
WHERE id_alerta = 3;

UPDATE "Riegos"
SET duracion = 30
WHERE id_riego = 4;

DELETE FROM "Riegos"
WHERE id_riego = 6;