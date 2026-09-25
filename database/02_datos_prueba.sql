
-- ============================================================
-- INSERCCIÓN DE DATOS EN LA SEMANA 2
-- ============================================================

INSERT INTO public."Parcelas"
    (id_parcela, id_usuario, nombre, tipo_cultivo)
VALUES
    (4, 1, 'Huerto Principal', 'Lechuga'),
    (5, 2, 'Huerto Secundario', 'Maiz'),
    (6, 3, 'Huerto Terceario', 'Pepino'),
    (7, 1, 'Huerto Principal', 'Zanahoria'),
    (8, 2, 'Huerto Secundario', 'Frijol');








-- ============================================================
-- CORRECCIONES REALIZADAS EN LA SEMANA 3
-- ============================================================

-- Corrección de nombres de parcelas repetidos
UPDATE public."Parcelas"
SET nombre = 'Huerto Principal'
WHERE id_parcela = 5;

UPDATE public."Parcelas"
SET nombre = 'Huerto Terciario'
WHERE id_parcela = 7;

UPDATE public."Parcelas"
SET nombre = 'Huerto Principal'
WHERE id_parcela = 6;


-- Corrección de escritura en el nombre de la parcela
UPDATE public."Parcelas"
SET nombre = 'Huerto Terciario'
WHERE id_parcela = 3;


-- Normalización de los correos de los usuarios
UPDATE public."Usuarios"
SET correo = LOWER(correo);
