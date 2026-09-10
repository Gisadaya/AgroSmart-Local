-- ADMINISTRACIÓN Y MANIPULACIÓN DE DATOS DE MI PROYECTO MÓVIL
-- RESPONSABILIDAD: USUARIOS Y PARCELAS

-- =========================================
-- 1. TRES CONSULTAS BÁSICAS UTILIZANDO "SELECT"
-- =========================================

-- SELECT 1: Mostrar todas las parcelas
SELECT *
FROM public."Parcelas";


-- SELECT 2: Buscar parcelas de un cultivo específico
SELECT *
FROM public."Parcelas"
WHERE tipo_cultivo = 'Tomate';


-- SELECT 3: Ordenar las parcelas por nombre
SELECT *
FROM public."Parcelas"
ORDER BY nombre ASC;


-- =========================================
-- 2. DOS MODIFICACIONES UTILIZANDO (UPDATE)
-- =========================================

-- UPDATE 1: Modificar el nombre de una parcela de prueba
UPDATE public."Parcelas"
SET nombre = 'Huerto de Lechuga Grande'
WHERE id_parcela = 4;


-- UPDATE 2: Modificar el tipo de cultivo de una parcela de prueba
UPDATE public."Parcelas"
SET tipo_cultivo = 'Maiz Dulce'
WHERE id_parcela = 5;


-- =========================================
-- 3. UNA ELIMINACIÓN DE UN REGISTRO DE PRUEBA UTILIZANDO (DELETE)
-- =========================================

-- DELETE: Eliminar una parcela de prueba
DELETE FROM public."Parcelas"
WHERE id_parcela = 8;


-- =========================================
-- 4. CINCO CONSULTAS RESPONDIENDO PREGUNTAS REALES QUE PODRÍA NECESITAR EL SISTEMA (ENFOCADO EN LAS TABLAS DE PARCELAS Y USUARIOS)
-- =========================================

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
