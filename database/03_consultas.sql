-- ADMINISTRACIÓN Y MANIPULACIÓN DE DATOS DE MI PROYECTO MÓVIL
-- RESPONSABILIDAD: USUARIOS Y PARCELAS

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
-- SEMANA 3: CONSULTAS, RESUMEN Y VALIDACIÓN DE DATOS
-- ============================================================


-- ============================================================
-- 5. CONSULTAS RELACIONADAS ENTRE TABLAS
--    UTILIZANDO INNER JOIN
-- ============================================================

-- ============================================================
-- 5.1 Consulta 1: Parcelas y sensores asociados
-- ============================================================

-- ¿Qué sensores están asociados a cada parcela?
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


-- ============================================================
-- 5.2 Consulta 2: Usuarios y parcelas registradas
-- ============================================================

-- ¿Qué parcelas pertenecen a cada usuario?
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
-- 6. CONSULTAS DE RESUMEN Y AGREGACIÓN
-- ============================================================

-- Las siguientes consultas utilizan funciones de agregación
-- para resumir y analizar la información registrada en la
-- base de datos de AgroSmart Local.


-- ============================================================
-- 6.1 COUNT: Total de parcelas registradas
-- ============================================================

-- ¿Cuántas parcelas están registradas actualmente?
SELECT 
    COUNT(*) AS total_parcelas
FROM public."Parcelas";


-- ============================================================
-- 6.2 SUM: Total de sensores asociados por usuario
-- ============================================================

-- ¿Cuántos sensores están asociados a las parcelas de cada usuario?
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


-- ============================================================
-- 6.3 MAX: Mayor identificador de parcela
-- ============================================================

-- ¿Cuál es el mayor ID de parcela registrado?
SELECT 
    MAX(id_parcela) AS id_parcela_mayor
FROM public."Parcelas";


-- ============================================================
-- 6.4 MIN: Menor identificador de parcela
-- ============================================================

-- ¿Cuál es el menor ID de parcela registrado?
SELECT 
    MIN(id_parcela) AS id_parcela_menor
FROM public."Parcelas";


-- ============================================================
-- 6.5 GROUP BY: Cantidad de parcelas por tipo de cultivo
-- ============================================================

-- ¿Cuántas parcelas existen para cada tipo de cultivo?
SELECT 
    tipo_cultivo,
    COUNT(*) AS cantidad_parcelas
FROM public."Parcelas"
GROUP BY tipo_cultivo
ORDER BY cantidad_parcelas DESC;



-- ============================================================
-- 7. VALIDACIÓN DE LOS DATOS
-- ============================================================


-- ============================================================
-- 7.1 INCONSISTENCIA 1: NOMBRES DE PARCELAS REPETIDOS
-- ============================================================

-- Consulta utilizada para detectar nombres de parcelas
-- repetidos dentro de un mismo usuario.

SELECT 
    id_usuario,
    nombre,
    COUNT(*) AS cantidad
FROM public."Parcelas"
GROUP BY id_usuario, nombre
HAVING COUNT(*) > 1
ORDER BY id_usuario ASC, nombre ASC;


-- ============================================================
-- 7.1.1 COMPROBACIÓN DESPUÉS DE LAS CORRECCIONES
-- ============================================================

-- Después de realizar las correcciones mediante UPDATE,
-- se vuelve a ejecutar la consulta para comprobar que
-- ya no existan nombres de parcelas repetidos dentro
-- del mismo usuario.

SELECT 
    id_usuario,
    nombre,
    COUNT(*) AS cantidad
FROM public."Parcelas"
GROUP BY id_usuario, nombre
HAVING COUNT(*) > 1
ORDER BY id_usuario ASC, nombre ASC;


-- ============================================================
-- 7.2 INCONSISTENCIA 2: ERROR DE ESCRITURA
-- ============================================================

-- Comprobación de los registros afectados por el error
-- de escritura "Huerto Terceario".

SELECT 
    id_parcela,
    id_usuario,
    nombre,
    tipo_cultivo
FROM public."Parcelas"
WHERE id_parcela IN (3, 7)
ORDER BY id_parcela ASC;


-- ============================================================
-- 7.2.1 COMPROBACIÓN DEL NOMBRE CORREGIDO
-- ============================================================

-- Verificación de que los registros afectados muestran
-- correctamente el nombre "Huerto Terciario".

SELECT 
    id_parcela,
    id_usuario,
    nombre,
    tipo_cultivo
FROM public."Parcelas"
WHERE id_parcela IN (3, 7)
  AND nombre = 'Huerto Terciario'
ORDER BY id_parcela ASC;


-- ============================================================
-- 7.3 INCONSISTENCIA 3: FORMATO NO UNIFORME
--     DE LOS CORREOS ELECTRÓNICOS
-- ============================================================

-- Consulta utilizada para revisar los correos registrados
-- después de aplicar la corrección mediante LOWER().

SELECT 
    id_usuario,
    nombre,
    correo
FROM public."Usuarios"
ORDER BY id_usuario ASC;


-- ============================================================
-- 7.3.1 COMPROBACIÓN DEL FORMATO DE LOS CORREOS
-- ============================================================

-- Comprobación de que los correos electrónicos estén
-- registrados completamente en minúsculas.

SELECT 
    id_usuario,
    nombre,
    correo
FROM public."Usuarios"
WHERE correo = LOWER(correo)
ORDER BY id_usuario ASC;
