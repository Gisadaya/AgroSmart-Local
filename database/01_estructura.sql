--ESTRUCTURA DE LA BASE DE DATOS AGROSMART

____________________________________________

-- 1. CREACIÓN DE LA BASE DE DATOS
_____________________________________________

CREATE DATABASE "AgroSmart_BD";


-- 2. TABLA USUARIOS

CREATE TABLE public."Usuarios" (
    id_usuario INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    contraseña VARCHAR(100)
);



-- 3. TABLA PARCELAS

CREATE TABLE public."Parcelas" (
    id_parcela INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    nombre VARCHAR(100),
    tipo_cultivo VARCHAR(100)
);



-- 4. TABLA SENSORES

CREATE TABLE public."Sensores" (
    id_sensor INTEGER PRIMARY KEY,
    id_parcela INTEGER NOT NULL,
    tipo_sensor VARCHAR(100),
    estado VARCHAR(50)
);



-- 5. TABLA LECTURAS

CREATE TABLE public."Lecturas" (
    id_lectura INTEGER PRIMARY KEY,
    id_sensor INTEGER NOT NULL,
    temperatura INTEGER,
    humedad_ambiente INTEGER,
    humedad_suelo INTEGER
);



-- 6. TABLA RIEGOS

CREATE TABLE public."Riegos" (
    id_riego INTEGER PRIMARY KEY,
    id_parcela INTEGER NOT NULL,
    duracion INTEGER,
    fecha_hora TIMESTAMP
);



-- 7. TABLA ALERTAS


CREATE TABLE public."Alertas" (
    id_alerta INTEGER PRIMARY KEY,
    id_sensor INTEGER NOT NULL,
    tipo_alerta VARCHAR(100),
    mensaje VARCHAR(255),
    fecha_hora TIMESTAMP
);


_____________________________

-- 8. CLAVES FORÁNEAS
____________________________

ALTER TABLE public."Parcelas"
ADD CONSTRAINT fk_parcelas_usuarios
FOREIGN KEY (id_usuario)
REFERENCES public."Usuarios"(id_usuario);


ALTER TABLE public."Sensores"
ADD CONSTRAINT fk_sensores_parcelas
FOREIGN KEY (id_parcela)
REFERENCES public."Parcelas"(id_parcela);


ALTER TABLE public."Lecturas"
ADD CONSTRAINT fk_lecturas_sensores
FOREIGN KEY (id_sensor)
REFERENCES public."Sensores"(id_sensor);


ALTER TABLE public."Riegos"
ADD CONSTRAINT fk_riegos_parcelas
FOREIGN KEY (id_parcela)
REFERENCES public."Parcelas"(id_parcela);


ALTER TABLE public."Alertas"
ADD CONSTRAINT fk_alertas_sensores
FOREIGN KEY (id_sensor)
REFERENCES public."Sensores"(id_sensor);


_______________________________________

-- 9. INSERCIÓN DE DATOS EN CADA TABLA
________________________________________

INSERT INTO public."Usuarios"
(id_usuario, nombre, correo, contraseña)
VALUES
(1, 'Gissel Diaz', 'Giss@gmail.com', '1234');
(2, 'Leonardo Funez', 'Leo@gmail.com', '2345');
(3, 'Valeria Arias', 'Valeria@gmail.com', '3456');



INSERT INTO public."Parcelas"
(id_parcela, id_usuario, nombre, tipo_cultivo)
VALUES
(1, 1, 'Huerto Principal', 'Chile');
(2, 2, 'Huerto Secundario', 'Tomate');
(2, 2, 'Huerto Terceario', 'Pepino');


INSERT INTO public."Sensores"
(id_sensor, id_parcela, tipo_sensor, estado)
VALUES
(1, 1, 'DHT11', 'Activo');
(2, 1, 'YL-69', 'Activo');


INSERT INTO public."Lecturas"
(id_lectura, id_sensor, temperatura, humedad_ambiente, humedad_suelo)
VALUES
(1, 1, 28, 65, 70);
(2, 1, 30, 60, 55);
(3, 2, 27, 62, 40);
(4, 2, 29, 68, 75);


INSERT INTO public."Riegos"
(id_riego, id_parcela, duracion, fecha_hora)
VALUES
(1, 1, 15, '2026-09-03 10:00:00');
(2, 1, 30, '2026-09-03 11:00:00');
(3, 2, 15, '2026-09-03 12:00:00');


INSERT INTO public."Alertas"
(id_alerta, id_sensor, tipo_alerta, mensaje, fecha_hora)
VALUES
(1, 1, 'Humedad baja', 'La humedad del suelo es baja', '2026-09-03 10:05:00');
(2, 2, 'Humedad normal', 'Los niveles de humedad son normales', '2026-09-03 10:05:00');
