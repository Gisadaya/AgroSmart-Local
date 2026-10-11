-- Consultas de Sensores y Lecturas - AgroSmart Local

-- Sensores activos
SELECT id_sensor, id_parcela, tipo_sensor, estado
FROM public."Sensores"
WHERE estado = 'Activo'
ORDER BY id_sensor;

-- Sensores inactivos
SELECT id_sensor, id_parcela, tipo_sensor, estado
FROM public."Sensores"
WHERE estado = 'Inactivo'
ORDER BY id_sensor;

-- Lecturas con humedad de suelo mayor al 60%
SELECT id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo
FROM public."Lecturas"
WHERE humedad_suelo > 60
ORDER BY humedad_suelo DESC;

-- Lecturas con humedad ambiental baja
SELECT id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo
FROM public."Lecturas"
WHERE humedad_ambiente < 60
ORDER BY humedad_ambiente ASC;

-- Lecturas con temperatura menor a 28 °C
SELECT id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo
FROM public."Lecturas"
WHERE temperatura < 28
ORDER BY temperatura ASC;

-- Cantidad de lecturas realizadas por cada sensor
SELECT id_sensor, COUNT(*) AS cantidad_lecturas
FROM public."Lecturas"
GROUP BY id_sensor
ORDER BY cantidad_lecturas DESC;

-- Lectura con el ID más alto
SELECT id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo
FROM public."Lecturas"
ORDER BY id_lectura DESC
LIMIT 1;

-- Lecturas ordenadas de mayor a menor temperatura
SELECT id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo
FROM public."Lecturas"
ORDER BY temperatura DESC;
