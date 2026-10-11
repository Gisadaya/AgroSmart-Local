
-- RESPONSABILIDAD: USUARIOS Y PARCELAS

-- ============================================================
-- SEMANA 2: ADMINISTRACIÓN Y MANIPULACIÓN DE DATOS DE MI PROYECTO MÓVIL
-- ============================================================


-- __________________________________________
-- 1. TRES CONSULTAS BÁSICAS UTILIZANDO "SELECT"
-- __________________________________________

-- SELECT 1: Mostrar todas las parcelas
SELECT *
FROM public."Parcelas";


-- SELECT 2: Buscar parcelas de un cultivo específico
SELECT *
FROM public."Parcelas"
WHERE tipo_cultivo = 'Maiz';


-- SELECT 3: Ordenar las parcelas por nombre
SELECT *
FROM public."Parcelas"
ORDER BY nombre ASC;


-- ________________________________________
-- 2. DOS MODIFICACIONES UTILIZANDO (UPDATE)
-- ________________________________________

-- UPDATE 1: Modificar el nombre de una parcela de prueba
UPDATE public."Parcelas"
SET nombre = 'Huerto Secundario'
WHERE id_parcela = 4;


-- UPDATE 2: Modificar el tipo de cultivo de una parcela de prueba
UPDATE public."Parcelas"
SET tipo_cultivo = 'Chile'
WHERE id_parcela = 5;


-- _______________________________________________________________
-- 3. UNA ELIMINACIÓN DE UN REGISTRO DE PRUEBA UTILIZANDO (DELETE)
-- _______________________________________________________________

-- DELETE: Eliminar una parcela de prueba
DELETE FROM public."Parcelas"
WHERE id_parcela = 8;


-- ______________________________________________________________________________________________________________________________
-- 4. CINCO CONSULTAS RESPONDIENDO PREGUNTAS REALES QUE PODRÍA NECESITAR EL SISTEMA (ENFOCADO EN LAS TABLAS DE PARCELAS Y USUARIOS)
-- ______________________________________________________________________________________________________________________________

-- Consulta 1: ¿Qué parcelas están registradas?
SELECT id_parcela, id_usuario, nombre, tipo_cultivo
FROM public."Parcelas"
ORDER BY id_parcela ASC;


-- Consulta 2: ¿Qué parcelas pertenecen a cada usuario?
SELECT 
    u.nombre AS usuario,
    p.nombre AS parcela,
    p.tipo_cultivo
FROM public."Usuarios" u
INNER JOIN public."Parcelas" p
    ON u.id_usuario = p.id_usuario
ORDER BY u.nombre ASC;


-- Consulta 3: ¿Qué parcelas tienen cultivo de Chile?
SELECT id_parcela, nombre, tipo_cultivo
FROM public."Parcelas"
WHERE tipo_cultivo = 'Chile'
ORDER BY nombre ASC;


-- Consulta 4: ¿Cuántas parcelas tiene cada usuario?
SELECT 
    u.nombre AS usuario,
    COUNT(p.id_parcela) AS cantidad_parcelas
FROM public."Usuarios" u
LEFT JOIN public."Parcelas" p
    ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre
ORDER BY cantidad_parcelas DESC;


-- Consulta 5: ¿Qué tipos de cultivo están registrados?
SELECT 
    tipo_cultivo,
    COUNT(id_parcela) AS cantidad_parcelas
FROM public."Parcelas"
GROUP BY tipo_cultivo
ORDER BY cantidad_parcelas DESC;












-- ============================================================
-- SEMANA 3: CONSULTAS, VALIDACIÓN Y CONSOLIDACIÓN DE LA BASE DE DATOS
-- ============================================================


-- ============================================================
-- 1. CONSULTAS RELACIONADAS ENTRE TABLAS
-- UTILIZANDO INNER JOIN
-- ============================================================

-- 1.1 Consulta 1 con INNER JOIN
SELECT
    p.id_parcela,
    p.nombre AS parcela,
    p.tipo_cultivo,
    s.id_sensor,
    s.tipo_sensor,
    s.estado
FROM public."Parcelas" p
INNER JOIN public."Sensores" s
    ON p.id_parcela = s.id_parcela
ORDER BY p.id_parcela ASC;


-- 1.2 Consulta 2 con INNER JOIN
SELECT
    u.nombre AS usuario,
    u.correo,
    p.id_parcela,
    p.nombre AS parcela,
    p.tipo_cultivo
FROM public."Usuarios" u
INNER JOIN public."Parcelas" p
    ON u.id_usuario = p.id_usuario
ORDER BY u.nombre ASC;


-- ============================================================
-- 2. CONSULTAS DE RESUMEN
-- ============================================================

-- 2.1 Uso de COUNT
SELECT COUNT(*) AS total_parcelas
FROM public."Parcelas";


-- 2.2 Uso de SUM
SELECT
    u.nombre AS usuario,
    SUM(
        CASE
            WHEN s.id_sensor IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS total_sensores
FROM public."Usuarios" u
INNER JOIN public."Parcelas" p
    ON u.id_usuario = p.id_usuario
LEFT JOIN public."Sensores" s
    ON p.id_parcela = s.id_parcela
GROUP BY u.id_usuario, u.nombre
ORDER BY total_sensores DESC;


-- 2.3 Uso de MAX
SELECT
    MAX(id_parcela) AS id_parcela_mayor
FROM public."Parcelas";


-- 2.4 Uso de MIN
SELECT
    MIN(id_parcela) AS id_parcela_menor
FROM public."Parcelas";


-- 2.5 Uso de GROUP BY
SELECT
    tipo_cultivo,
    COUNT(*) AS cantidad_parcelas
FROM public."Parcelas"
GROUP BY tipo_cultivo
ORDER BY cantidad_parcelas DESC;


-- ============================================================
-- 3. VALIDACIÓN DE LOS DATOS
-- ============================================================

-- 3.1 Inconsistencia 1: nombres de parcelas repetidos

SELECT
    id_usuario,
    nombre,
    COUNT(*) AS cantidad
FROM public."Parcelas"
GROUP BY id_usuario, nombre
HAVING COUNT(*) > 1
ORDER BY id_usuario ASC, nombre ASC;


-- 3.1.2 Corrección realizada

UPDATE public."Parcelas"
SET nombre = 'Huerto Terceario'
WHERE id_parcela = 7
    AND id_usuario = 1;

UPDATE public."Parcelas"
SET nombre = 'Huerto Principal'
WHERE id_parcela = 5
    AND id_usuario = 2;

UPDATE public."Parcelas"
SET nombre = 'Huerto Principal'
WHERE id_parcela = 6
    AND id_usuario = 3;


-- 3.1.3 Comprobación de la corrección

SELECT
    id_usuario,
    nombre,
    COUNT(*) AS cantidad
FROM public."Parcelas"
GROUP BY id_usuario, nombre
HAVING COUNT(*) > 1
ORDER BY id_usuario ASC, nombre ASC;


-- 3.2 Inconsistencia 2: error de escritura en el nombre de una parcela

UPDATE public."Parcelas"
SET nombre = 'Huerto Terciario'
WHERE id_parcela IN (3, 7);


-- 3.2.3 Comprobación de la corrección

SELECT *
FROM public."Parcelas"
ORDER BY id_parcela ASC;


-- 3.3 Inconsistencia 3: formato no uniforme de los correos electrónicos

UPDATE public."Usuarios"
SET correo = LOWER(correo);


-- 3.3.3 Comprobación de la corrección

SELECT id_usuario, nombre, correo
FROM public."Usuarios"
ORDER BY id_usuario ASC;
