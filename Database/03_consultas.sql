-- AGROSMART LOCAL - SEMANA 2
-- Integrante 2: Sensores y lecturas
-- Archivo: 03_consultas.sql

-- =========================================================
-- A. 3 CONSULTAS BÁSICAS
-- =========================================================

-- Consulta básica 1: mostrar todos los sensores.
SELECT *
FROM public."Sensores";

-- Consulta básica 2: mostrar todas las lecturas ordenadas por humedad del suelo.
SELECT *
FROM public."Lecturas"
ORDER BY humedad_suelo ASC;

-- Consulta básica 3: mostrar únicamente los sensores activos.
SELECT *
FROM public."Sensores"
WHERE estado = 'Activo'
ORDER BY id_sensor;

-- =========================================================
-- B. 2 MODIFICACIONES (UPDATE)
-- =========================================================

-- UPDATE 1: activar el sensor 8.
UPDATE public."Sensores"
SET estado = 'Activo'
WHERE id_sensor = 8;

-- Comprobar el cambio.
SELECT *
FROM public."Sensores"
WHERE id_sensor = 8;

-- UPDATE 2: corregir la humedad del suelo de la lectura 7.
UPDATE public."Lecturas"
SET humedad_suelo = 45
WHERE id_lectura = 7;

-- Comprobar el cambio.
SELECT *
FROM public."Lecturas"
WHERE id_lectura = 7;

-- =========================================================
-- C. 1 ELIMINACIÓN DE REGISTRO DE PRUEBA (DELETE)
-- =========================================================

-- Eliminar la lectura de prueba 9.
DELETE FROM public."Lecturas"
WHERE id_lectura = 9;

-- Comprobar que ya no existe.
SELECT *
FROM public."Lecturas"
WHERE id_lectura = 9;

-- =========================================================
-- D. 5 CONSULTAS RELACIONADAS CON NECESIDADES DE AGROSMART
-- =========================================================

-- Consulta del proyecto 1:
-- ¿Qué sensores existen, en qué parcela están instalados y cuál es su estado?
SELECT
    s.id_sensor,
    s.tipo_sensor,
    s.estado,
    p.id_parcela,
    p.nombre AS parcela,
    p.tipo_cultivo
FROM public."Sensores" AS s
INNER JOIN public."Parcelas" AS p
    ON s.id_parcela = p.id_parcela
ORDER BY p.id_parcela, s.id_sensor;

-- Consulta del proyecto 2:
-- ¿Qué lecturas se han realizado y a qué sensor/parcela pertenecen?
SELECT
    l.id_lectura,
    l.temperatura,
    l.humedad_ambiente,
    l.humedad_suelo,
    s.tipo_sensor,
    p.nombre AS parcela
FROM public."Lecturas" AS l
INNER JOIN public."Sensores" AS s
    ON l.id_sensor = s.id_sensor
INNER JOIN public."Parcelas" AS p
    ON s.id_parcela = p.id_parcela
ORDER BY l.id_lectura;

-- Consulta del proyecto 3:
-- ¿Qué lecturas presentan humedad del suelo baja?
SELECT
    l.id_lectura,
    l.id_sensor,
    l.humedad_suelo
FROM public."Lecturas" AS l
WHERE l.humedad_suelo < 40
ORDER BY l.humedad_suelo ASC;

-- Consulta del proyecto 4:
-- ¿Qué lecturas presentan temperatura alta?
SELECT
    l.id_lectura,
    l.id_sensor,
    l.temperatura,
    l.humedad_ambiente,
    l.humedad_suelo
FROM public."Lecturas" AS l
WHERE l.temperatura >= 30
ORDER BY l.temperatura DESC;

-- Consulta del proyecto 5:
-- ¿Cuál es el promedio de temperatura y humedad registrado por cada sensor?
SELECT
    s.id_sensor,
    s.tipo_sensor,
    ROUND(AVG(l.temperatura), 2) AS temperatura_promedio,
    ROUND(AVG(l.humedad_ambiente), 2) AS humedad_ambiente_promedio,
    ROUND(AVG(l.humedad_suelo), 2) AS humedad_suelo_promedio
FROM public."Sensores" AS s
INNER JOIN public."Lecturas" AS l
    ON s.id_sensor = l.id_sensor
GROUP BY s.id_sensor, s.tipo_sensor
ORDER BY s.id_sensor;
