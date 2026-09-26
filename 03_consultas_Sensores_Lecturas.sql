-- ============================================================
-- PROYECTO: AGROSMART LOCAL
-- ARCHIVO: 03_consultas.sql
-- RESPONSABILIDAD: SENSORES Y LECTURAS
-- ============================================================


-- ============================================================
-- 1. CONSULTAS RELACIONADAS ENTRE TABLAS
-- ============================================================

-- 1.1 Mostrar los sensores junto con sus respectivas lecturas
SELECT 
    s.id_sensor,
    s.tipo_sensor,
    s.estado,
    l.id_lectura,
    l.temperatura,
    l.humedad_ambiente,
    l.humedad_suelo
FROM "Sensores" AS s
INNER JOIN "Lecturas" AS l
    ON s.id_sensor = l.id_sensor;


-- 1.2 Mostrar las lecturas de los sensores según la parcela
SELECT 
    s.id_parcelas,
    s.id_sensor,
    s.tipo_sensor,
    l.id_lectura,
    l.temperatura,
    l.humedad_ambiente,
    l.humedad_suelo
FROM "Sensores" AS s
INNER JOIN "Lecturas" AS l
    ON s.id_sensor = l.id_sensor
ORDER BY s.id_parcelas, s.id_sensor;


-- 1.3 Mostrar sensores que tienen registros de humedad del suelo
SELECT 
    s.id_sensor,
    s.tipo_sensor,
    s.estado,
    l.id_lectura,
    l.humedad_suelo
FROM "Sensores" AS s
INNER JOIN "Lecturas" AS l
    ON s.id_sensor = l.id_sensor
WHERE l.humedad_suelo IS NOT NULL;


-- 1.4 Mostrar sensores y sus registros de temperatura y humedad
SELECT 
    s.id_sensor,
    s.tipo_sensor,
    l.id_lectura,
    l.temperatura,
    l.humedad_ambiente,
    l.humedad_suelo
FROM "Sensores" AS s
INNER JOIN "Lecturas" AS l
    ON s.id_sensor = l.id_sensor
WHERE l.temperatura IS NOT NULL
   OR l.humedad_ambiente IS NOT NULL;


-- ============================================================
-- 2. CONSULTAS DE RESUMEN
-- ============================================================

-- 2.1 Contar el total de lecturas registradas
SELECT 
    COUNT(*) AS total_lecturas
FROM "Lecturas";


-- 2.2 Obtener la temperatura promedio registrada
SELECT 
    AVG(temperatura) AS temperatura_promedio
FROM "Lecturas"
WHERE temperatura IS NOT NULL;


-- 2.3 Obtener la humedad promedio del suelo
SELECT 
    AVG(humedad_suelo) AS humedad_suelo_promedio
FROM "Lecturas"
WHERE humedad_suelo IS NOT NULL;


-- 2.4 Obtener la humedad mínima y máxima del suelo por sensor
SELECT 
    id_sensor,
    MIN(humedad_suelo) AS humedad_minima,
    MAX(humedad_suelo) AS humedad_maxima
FROM "Lecturas"
WHERE humedad_suelo IS NOT NULL
GROUP BY id_sensor
ORDER BY id_sensor;


-- 2.5 Contar cuántas lecturas ha registrado cada sensor
SELECT 
    id_sensor,
    COUNT(*) AS total_lecturas
FROM "Lecturas"
GROUP BY id_sensor
ORDER BY id_sensor;


-- ============================================================
-- 3. COMPROBACIÓN DE POSIBLES INCONSISTENCIAS
-- ============================================================

-- 3.1 Buscar lecturas con datos incompletos
SELECT *
FROM "Lecturas"
WHERE temperatura IS NULL
   OR humedad_ambiente IS NULL
   OR humedad_suelo IS NULL;


-- 3.2 Revisar los diferentes estados registrados en los sensores
SELECT 
    estado,
    COUNT(*) AS cantidad
FROM "Sensores"
GROUP BY estado;


-- 3.3 Buscar lecturas asociadas a sensores inexistentes
SELECT l.*
FROM "Lecturas" AS l
LEFT JOIN "Sensores" AS s
    ON l.id_sensor = s.id_sensor
WHERE s.id_sensor IS NULL;


-- ============================================================
-- 4. COMPROBACIÓN DE LAS CORRECCIONES
-- ============================================================

-- 4.1 Comprobar una lectura después de corregir un dato
SELECT *
FROM "Lecturas"
WHERE id_lectura = 1;


-- 4.2 Comprobar que los estados de los sensores estén normalizados
SELECT 
    estado,
    COUNT(*) AS cantidad
FROM "Sensores"
GROUP BY estado;


-- 4.3 Comprobar que todas las lecturas tengan un sensor válido
SELECT l.*
FROM "Lecturas" AS l
LEFT JOIN "Sensores" AS s
    ON l.id_sensor = s.id_sensor
WHERE s.id_sensor IS NULL;


-- ============================================================
-- FIN DEL ARCHIVO 03_consultas.sql
-- ============================================================