-- SEGURIDAD DE LA BASE DE DATOS

___________________________________
-- CREACIÓN DEL USUARIO DE TRABAJO
___________________________________

CREATE USER "Usuario_A"
WITH PASSWORD '';


_________________________________

-- ASIGNACIÓN DE PRIVILEGIOS
________________________________

GRANT CONNECT
ON DATABASE "AgroSmart_BD"
TO "Usuario_A";

GRANT USAGE
ON SCHEMA public
TO "Usuario_A";

GRANT SELECT, INSERT, UPDATE
ON ALL TABLES IN SCHEMA public
TO "Usuario_A";

_______________________________

--  REVOCACIÓN DE PRIVILEGIO
_______________________________

REVOKE UPDATE
ON ALL TABLES IN SCHEMA public
FROM "Usuario_A";
